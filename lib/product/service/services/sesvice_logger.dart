import 'package:logger/logger.dart';

/// Uygulama genelinde loglama işlemlerini yöneten servis
///
/// [Logger] paketini kullanarak farklı seviyelerde log kaydı tutar.
/// GetIt ile singleton olarak kaydedilir ve tüm uygulama boyunca kullanılır.
///
/// Kullanım:
/// ```dart
/// locator.loggerService.d('Debug mesajı');
/// locator.loggerService.e('Hata', error: e, stackTrace: stackTrace);
/// ```
class LoggerService {
  /// Logger instance'ı
  ///
  /// [PrettyPrinter] ile formatlanmış çıktı sağlar:
  /// - errorMethodCount: Hata durumunda gösterilecek metod sayısı
  /// - lineLength: Maksimum satır uzunluğu
  /// - dateTimeFormat: Zaman damgası formatı
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      errorMethodCount: 5,
      lineLength: 80,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  /// Debug seviyesi log
  ///
  /// Geliştirme aşamasında detaylı bilgi için kullanılır.
  /// Production'da gösterilmez.
  ///
  /// Örnek: `loggerService.d('Kullanıcı giriş yaptı: $userId')`
  void d(String message) => _logger.d(message);

  /// Info seviyesi log
  ///
  /// Genel bilgilendirme mesajları için kullanılır.
  ///
  /// Örnek: `loggerService.i('Uygulama başlatıldı')`
  void i(String message) => _logger.i(message);

  /// Warning seviyesi log
  ///
  /// Potansiyel sorunlar için uyarı mesajları.
  ///
  /// Örnek: `loggerService.w('API yanıt süresi yavaş: ${duration}ms')`
  void w(String message) => _logger.w(message);

  /// Error seviyesi log
  ///
  /// Hata durumlarını kaydetmek için kullanılır.
  /// Opsiyonel olarak hata nesnesi ve stack trace eklenebilir.
  ///
  /// [message]: Hata açıklaması
  /// [error]: Hata nesnesi (opsiyonel)
  /// [stackTrace]: Stack trace bilgisi (opsiyonel)
  ///
  /// Örnek:
  /// ```dart
  /// try {
  ///   await riskyOperation();
  /// } catch (e, stackTrace) {
  ///   loggerService.e('İşlem başarısız', error: e, stackTrace: stackTrace);
  /// }
  /// ```
  void e(String message, {dynamic error, StackTrace? stackTrace}) =>
      _logger.e(message, error: error, stackTrace: stackTrace);

  /// Fatal seviyesi log
  ///
  /// Kritik hatalar için kullanılır. Uygulamanın çökmesine neden olabilecek
  /// durumlar için kullanılmalıdır.
  ///
  /// [message]: Hata açıklaması
  /// [error]: Hata nesnesi (opsiyonel)
  /// [stackTrace]: Stack trace bilgisi (opsiyonel)
  ///
  /// Örnek:
  /// ```dart
  /// loggerService.f('Firebase başlatılamadı', error: e, stackTrace: stackTrace);
  /// ```
  void f(String message, {dynamic error, StackTrace? stackTrace}) =>
      _logger.f(message, error: error, stackTrace: stackTrace);
}
