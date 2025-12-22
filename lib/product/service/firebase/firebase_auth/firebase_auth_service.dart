import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hotel_booking/product/enum/firebase_collections.dart';
import 'package:gen/gen.dart';
import 'package:uuid/uuid.dart';

// Firebase Authentication Servisi - Tüm kimlik doğrulama ve kullanıcı yönetimi işlemlerini yönetir
class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const Uuid _uuid = Uuid();

  // Geçici benzersiz kullanıcı ID'si oluşturur
  String generateTempUserId() => _uuid.v4();

  // Auth state değişikliklerini dinler
  Stream<UserModel?> get authStateChanges {
    return _auth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) return null;
      return getUserById(firebaseUser.uid);
    });
  }

  // Mevcut kullanıcıyı getirir
  Future<UserModel?> get currentUser async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser == null) return null;
    return getUserById(firebaseUser.uid);
  }

  // Firestore'dan kullanıcı bilgilerini çeker
  Future<UserModel> getUserById(String uid) async {
    try {
      final doc = await _firestore
          .collection(FirestoreCollection.users.name)
          .doc(uid)
          .get();

      if (!doc.exists) {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'Kullanıcı bulunamadı',
        );
      }
      return UserModel.fromJson({...doc.data()!, 'id': doc.id});
    } catch (e) {
      if (e is FirebaseAuthException) rethrow;
      throw FirebaseAuthException(
        code: 'firestore-error',
        message: 'Kullanıcı bilgileri alınamadı',
      );
    }
  }

  // Email ve şifre ile yeni kullanıcı kaydı oluşturur
  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = UserModel(
        id: userCredential.user!.uid,
        fullName: fullName,
        email: email,
      );

      await _firestore
          .collection(FirestoreCollection.users.name)
          .doc(user.id)
          .set({
            ...user.toJson(),
            'createdAt': FieldValue.serverTimestamp(),
          });

      return user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: _handleAuthException(e),
      );
    }
  }

  // Email ve şifre ile giriş yapar
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return await getUserById(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: _handleAuthException(e),
      );
    }
  }

  // Misafir olarak giriş yapar
  Future<UserModel> signInAnonymously() async {
    try {
      final userCredential = await _auth.signInAnonymously();

      final user = UserModel(
        id: userCredential.user!.uid,
        fullName: 'Misafir Kullanıcı',
        isGuest: true,
      );

      await _firestore
          .collection(FirestoreCollection.users.name)
          .doc(user.id)
          .set({
            ...user.toJson(),
            'isGuest': true,
            'createdAt': FieldValue.serverTimestamp(),
          });

      return user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: _handleAuthException(e),
      );
    }
  }

  // Kullanıcı çıkışı yapar
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: _handleAuthException(e),
      );
    }
  }

  // Misafir hesabı normal hesaba dönüştürür
  Future<UserModel> convertGuestToRegular({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final currentUser = _auth.currentUser;

      if (currentUser == null || !currentUser.isAnonymous) {
        throw FirebaseAuthException(
          code: 'invalid-guest-session',
          message: 'Geçerli bir misafir oturum bulunamadı',
        );
      }

      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      final userCredential = await currentUser.linkWithCredential(credential);

      await _firestore
          .collection(FirestoreCollection.users.name)
          .doc(currentUser.uid)
          .set({
            'fullName': fullName,
            'email': email,
            'isGuest': false,
            'updatedAt': FieldValue.serverTimestamp(),
          }, SetOptions(merge: true));

      return await getUserById(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: _handleAuthException(e),
      );
    }
  }

  // Kullanıcı profil bilgilerini günceller
  Future<void> updateProfile(UserModel user) async {
    try {
      await _firestore
          .collection(FirestoreCollection.users.name)
          .doc(user.id)
          .update({
            ...user.toJson(),
            'updatedAt': FieldValue.serverTimestamp(),
          });
    } on Exception catch (e) {
      throw FirebaseAuthException(
        code: 'update-failed',
        message: 'Profil güncellenemedi',
      );
    }
  }

  // Şifre sıfırlama e-postası gönderir
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      // Güvenlik: Kullanıcının var olup olmadığını açığa çıkarma
      if (e.code != 'user-not-found') {
        throw FirebaseAuthException(
          code: e.code,
          message: _handleAuthException(e),
        );
      }
    }
  }

  // Şifreyi sıfırlar veya değiştirir (oturum durumuna göre)
  Future<bool> resetPassword({
    String? email,
    String? newPassword,
  }) async {
    try {
      final user = _auth.currentUser;

      // Kullanıcı giriş yapmış ve şifre değiştirmek istiyor
      if (user != null && newPassword != null) {
        await user.updatePassword(newPassword);
        return true;
      }

      // Kullanıcı giriş yapmamış, sıfırlama e-postası gönder
      if (user == null && email != null) {
        await _auth.sendPasswordResetEmail(email: email);
        return true;
      }

      throw FirebaseAuthException(
        code: 'invalid-params',
        message: user != null ? 'Yeni şifre gerekli.' : 'E-posta gerekli.',
      );
    } on FirebaseAuthException catch (e) {
      // Güvenlik: Kullanıcının var olup olmadığını açığa çıkarma
      if (e.code == 'user-not-found') return true;

      throw FirebaseAuthException(
        code: e.code,
        message: _handleAuthException(e),
      );
    }
  }

  // Kullanıcı hesabını ve tüm verilerini siler
  Future<void> deleteAccount() async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        throw FirebaseAuthException(
          code: 'no-user',
          message: 'Kullanıcı oturumu bulunamadı',
        );
      }

      // Firestore'dan kullanıcı verilerini sil
      await _firestore
          .collection(FirestoreCollection.users.name)
          .doc(user.uid)
          .delete();

      // Firebase Auth hesabını sil
      await user.delete();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: _handleAuthException(e),
      );
    }
  }

  // Firebase Auth hatalarını kullanıcı dostu mesajlara çevirir
  String _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return 'Şifre çok zayıf. En az 6 karakter olmalıdır.';
      case 'email-already-in-use':
        return 'Bu email adresi zaten kullanımda.';
      case 'invalid-email':
        return 'Geçersiz email adresi.';
      case 'user-not-found':
        return 'Kullanıcı bulunamadı.';
      case 'wrong-password':
        return 'Hatalı şifre.';
      case 'network-request-failed':
        return 'İnternet bağlantınızı kontrol edin.';
      case 'requires-recent-login':
        return 'Bu işlem için yeniden giriş yapmanız gerekiyor.';
      case 'credential-already-in-use':
        return 'Bu email adresi başka bir hesapta kullanılıyor.';
      case 'invalid-guest-session':
        return 'Geçerli bir misafir oturum bulunamadı.';
      case 'firestore-error':
        return 'Veritabanı hatası oluştu.';
      case 'update-failed':
        return 'Profil güncellenemedi.';
      case 'no-user':
        return 'Kullanıcı oturumu bulunamadı.';
      case 'invalid-params':
        return e.message ?? 'Geçersiz parametreler.';
      default:
        return e.message ?? 'Bir hata oluştu';
    }
  }
}
