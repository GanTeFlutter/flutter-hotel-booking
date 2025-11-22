import 'package:uuid/uuid.dart';

class FirebaseFirestoreService {
  static const Uuid _uuid = Uuid();

  /// Geçici kullanıcı ID'si oluşturur
  ///
  /// Email doğrulama gibi işlemler için kullanılır.
  /// Gerçek Firebase Auth UID'si oluşturulmadan önce geçici ID sağlar.
  String generateTempUserId() {
    return _uuid.v4();
  }


}
