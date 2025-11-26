import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hotel_booking/product/enum/firebase_collections.dart';
import 'package:gen/gen.dart';
import 'package:uuid/uuid.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const Uuid _uuid = Uuid();

  String generateTempUserId() {
    return _uuid.v4();
  }

  /// Auth state değişikliklerini dinler
  Stream<UserModel?> get authStateChanges {
    return _auth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) return null;
      return getUserById(firebaseUser.uid);
    });
  }

  /// Mevcut kullanıcıyı getirir
  Future<UserModel?> get currentUser async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser == null) return null;
    return getUserById(firebaseUser.uid);
  }

  ///Yeni Kullanıcı kaydı oluşturur
  Future<UserModel> authSignUpRequested({
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

  /// Email ile giriş
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

  /// Misafir girişi
  Future<UserModel> signInAnonymously() async {
    try {
      final userCredential = await _auth.signInAnonymously();

      final user = UserModel(
        id: userCredential.user!.uid,
        fullName: 'Misafir Kullanıcı',
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

  /// Çıkış
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// Firestore'dan kullanıcı bilgilerini çek
  Future<UserModel> getUserById(String uid) async {
    final doc = await _firestore
        .collection(FirestoreCollection.users.name)
        .doc(uid)
        .get();
    if (!doc.exists) {
      throw Exception('Kullanıcı bulunamadı');
    }
    return UserModel.fromJson({...doc.data()!, 'id': doc.id});
  }

  /// Profil güncelle
  Future<void> updateProfile(UserModel user) async {
    await _firestore.collection('users').doc(user.id).update({
      ...user.toJson(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> sifreSifirla(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code != 'user-not-found') {
        throw FirebaseAuthException(
          code: e.code,
          message: _handleAuthException(e),
        );
      }
    }
  }

  /// Şifre sıfırlama/değiştirme
  /// - Oturum açıksa: Direkt şifreyi günceller
  /// - Oturum kapalıysa: E-posta ile sıfırlama linki gönderir
  Future<bool> resetPassword({
    String? email,
    String? newPassword,
  }) async {
    try {
      final user = _auth.currentUser;

      if (user != null && newPassword != null) {
        await user.updatePassword(newPassword);
        return true;
      }

      if (user == null && email != null) {
        await _auth.sendPasswordResetEmail(email: email);
        return true;
      }

      throw FirebaseAuthException(
        code: 'invalid-params',
        message: user != null ? 'Yeni şifre gerekli.' : 'E-posta gerekli.',
      );
    } on FirebaseAuthException catch (e) {
      // Güvenlik: user-not-found olsa bile başarılı gibi davran
      if (e.code == 'user-not-found') return true;

      throw FirebaseAuthException(
        code: e.code,
        message: _handleAuthException(e),
      );
    }
  }


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
      default:
        return e.message ?? 'Bir hata oluştu';
    }
  }
}
