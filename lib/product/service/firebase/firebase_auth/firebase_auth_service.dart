// ignore_for_file: avoid_redundant_argument_values

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hotel_booking/product/enum/firebase_collections.dart';
import 'package:gen/gen.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🔥 Auth state stream - AuthBloc bunu dinler
  Stream<UserModel?> get authStateChanges {
    return _auth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) return null;
      return getUserById(firebaseUser.uid);
    });
  }

  // 🔥 Mevcut kullanıcıyı al
  Future<UserModel?> get currentUser async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser == null) return null;
    return getUserById(firebaseUser.uid);
  }

  /// Kullanıcı kaydı oluşturur
  Future<UserModel> createUser({
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
        photoUrl: null,
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
        email: null,
        photoUrl: null,
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
