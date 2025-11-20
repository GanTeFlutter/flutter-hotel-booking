import 'package:flutter/services.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';
import 'package:url_launcher/url_launcher.dart';

/// URL Launcher işlemlerini yöneten servis sınıfı
/// Email, telefon, SMS ve web URL'lerini açmak için kullanılır
///
/// Tüm fonksiyonlar başarı durumunda true, hata durumunda false döner
/// Hatalar otomatik olarak loglanır
class UrlLauncherService {
  /// Email uygulamasını açar
  ///
  /// [email] - Alıcı email adresi
  /// [subject] - (Opsiyonel) Email konusu
  /// [body] - (Opsiyonel) Email içeriği
  ///
  /// Returns true başarılı, false başarısız
  Future<bool> launchEmail({
    required String email,
    String? subject,
    String? body,
  }) async {
    try {
      locator.loggerService.d('Email açılıyor: $email');

      final emailEncoded = Uri.encodeComponent(email);
      final subjectEncoded = subject != null
          ? Uri.encodeComponent(subject)
          : '';
      final bodyEncoded = body != null ? Uri.encodeComponent(body) : '';

      var mailUrl = 'mailto:$emailEncoded';
      if (subject != null || body != null) {
        mailUrl += '?';
        if (subject != null) mailUrl += 'subject=$subjectEncoded';
        if (subject != null && body != null) mailUrl += '&';
        if (body != null) mailUrl += 'body=$bodyEncoded';
      }

      final mail = Uri.parse(mailUrl);
      final result = await launchUrl(mail);

      if (result) {
        locator.loggerService.i('Email başarıyla açıldı');
      } else {
        locator.loggerService.w('Email açılamadı');
      }

      return result;
    } on PlatformException catch (e, stackTrace) {
      locator.loggerService.e(
        'Email açma hatası (Platform)',
        error: e,
        stackTrace: stackTrace,
      );
      return false;
    } on Exception catch (e, stackTrace) {
      locator.loggerService.e(
        'Email açma hatası',
        error: e,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  /// Telefon uygulamasını belirtilen numara ile açar
  ///
  /// [phoneNumber] - Aranacak telefon numarası (örn: +905551234567)
  ///
  /// Returns true başarılı, false başarısız
  Future<bool> launchCall({required String phoneNumber}) async {
    try {
      locator.loggerService.d('Telefon araması başlatılıyor: $phoneNumber');
      final urlParsed = Uri.parse('tel:$phoneNumber');
      if (await canLaunchUrl(urlParsed)) {
        final result = await launchUrl(urlParsed);
        if (result) {
          locator.loggerService.i('Telefon uygulaması başarıyla açıldı');
        } else {
          locator.loggerService.w('Telefon uygulaması açılamadı');
        }
        return result;
      }
      locator.loggerService.w('Telefon araması desteklenmiyor');
      return false;
    } on Exception catch (e, stackTrace) {
      locator.loggerService.e(
        'Telefon arama hatası',
        error: e,
        stackTrace: stackTrace,
      );
      return false;
    }
  }


  /// Web sitesini uygulama içi tarayıcıda açar
  ///
  /// [url] - Açılacak web sitesi URL'i
  ///
  /// Returns true başarılı, false başarısız
  Future<bool> launchUrlInApp({required String url}) async {
    try {
      locator.loggerService.d('Web sitesi açılıyor (uygulama içi): $url');

      final urlParsed = Uri.parse(url);
      if (await canLaunchUrl(urlParsed)) {
        final result = await launchUrl(
          urlParsed,
          mode: LaunchMode.inAppWebView,
        );

        if (result) {
          locator.loggerService.i('Web sitesi başarıyla açıldı (uygulama içi)');
        } else {
          locator.loggerService.w('Web sitesi açılamadı (uygulama içi)');
        }

        return result;
      }

      locator.loggerService.w('URL desteklenmiyor: $url');
      return false;
    } on Exception catch (e, stackTrace) {
      locator.loggerService.e(
        'Web sitesi açma hatası (uygulama içi)',
        error: e,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  /// Web sitesini harici tarayıcıda açar
  ///
  /// [url] - Açılacak web sitesi URL'i
  ///
  /// Returns true başarılı, false başarısız
  Future<bool> launchUrlInBrowser({required String url}) async {
    try {
      locator.loggerService.d('Web sitesi açılıyor (harici tarayıcı): $url');

      final urlParsed = Uri.parse(url);
      if (await canLaunchUrl(urlParsed)) {
        final result = await launchUrl(
          urlParsed,
          mode: LaunchMode.externalApplication,
        );

        if (result) {
          locator.loggerService.i(
            'Web sitesi başarıyla açıldı (harici tarayıcı)',
          );
        } else {
          locator.loggerService.w('Web sitesi açılamadı (harici tarayıcı)');
        }

        return result;
      }

      locator.loggerService.w('URL desteklenmiyor: $url');
      return false;
    } on Exception catch (e, stackTrace) {
      locator.loggerService.e(
        'Web sitesi açma hatası (harici tarayıcı)',
        error: e,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  /// WhatsApp uygulamasını belirtilen numara ile açar
  ///
  /// [phoneNumber] - WhatsApp numarası (ülke kodu ile, + olmadan: 905551234567)
  /// [message] - (Opsiyonel) Önceden yazılmış mesaj
  ///
  /// Returns true başarılı, false başarısız
  Future<bool> launchWhatsApp({
    required String phoneNumber,
    String? message,
  }) async {
    try {
      locator.loggerService.d('WhatsApp açılıyor: $phoneNumber');

      var whatsappUrl = 'https://wa.me/$phoneNumber';
      if (message != null) {
        final messageEncoded = Uri.encodeComponent(message);
        whatsappUrl += '?text=$messageEncoded';
      }

      final urlParsed = Uri.parse(whatsappUrl);
      if (await canLaunchUrl(urlParsed)) {
        final result = await launchUrl(
          urlParsed,
          mode: LaunchMode.externalApplication,
        );

        if (result) {
          locator.loggerService.i('WhatsApp başarıyla açıldı');
        } else {
          locator.loggerService.w('WhatsApp açılamadı');
        }

        return result;
      }

      locator.loggerService.w('WhatsApp desteklenmiyor veya yüklü değil');
      return false;
    } on Exception catch (e, stackTrace) {
      locator.loggerService.e(
        'WhatsApp açma hatası',
        error: e,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  /// Harita uygulamasını belirtilen konum ile açar
  ///
  /// [latitude] - Enlem
  /// [longitude] - Boylam
  /// [label] - (Opsiyonel) Konum etiketi
  ///
  /// Returns true başarılı, false başarısız
  Future<bool> launchMaps({
    required double latitude,
    required double longitude,
    String? label,
  }) async {
    try {
      locator.loggerService.d('Harita açılıyor: $latitude, $longitude');

      final mapsUrl = label != null
          ? 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude&query_place_id=$label'
          : 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

      final urlParsed = Uri.parse(mapsUrl);
      if (await canLaunchUrl(urlParsed)) {
        final result = await launchUrl(
          urlParsed,
          mode: LaunchMode.externalApplication,
        );

        if (result) {
          locator.loggerService.i('Harita başarıyla açıldı');
        } else {
          locator.loggerService.w('Harita açılamadı');
        }

        return result;
      }

      locator.loggerService.w('Harita özelliği desteklenmiyor');
      return false;
    } on Exception catch (e, stackTrace) {
      locator.loggerService.e(
        'Harita açma hatası',
        error: e,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  /// Belirtilen URL'in açılıp açılamayacağını kontrol eder
  ///
  /// [url] - Kontrol edilecek URL
  ///
  /// Returns URL açılabilirse true, aksi halde false
  Future<bool> canLaunch(String url) async {
    try {
      locator.loggerService.d('URL kontrolü: $url');

      final urlParsed = Uri.parse(url);
      final result = await canLaunchUrl(urlParsed);

      if (result) {
        locator.loggerService.i('URL açılabilir: $url');
      } else {
        locator.loggerService.w('URL açılamaz: $url');
      }

      return result;
    } on Exception catch (e, stackTrace) {
      locator.loggerService.e(
        'URL kontrol hatası',
        error: e,
        stackTrace: stackTrace,
      );
      return false;
    }
  }
}


/*

hangisini kullancaksan o kısmı eklemen yeterli 

android\app\src\main\AndroidManifest.xml  altina ekle
    <queries>
    <!-- SMS desteği kontrol ediyorsan -->
    <intent>
        <action android:name="android.intent.action.VIEW" />
        <data android:scheme="sms" />
    </intent>
    <!-- Telefon desteği kontrol ediyorsan -->
    <intent>
        <action android:name="android.intent.action.VIEW" />
        <data android:scheme="tel" />
    </intent>
    
    <!-- Email desteği kontrol ediyorsan -->
    <intent>
        <action android:name="android.intent.action.VIEW" />
        <data android:scheme="mailto" />
    </intent>
    
    <!-- HTTPS URL'leri açıyorsan -->
    <intent>
        <action android:name="android.intent.action.VIEW" />
        <data android:scheme="https" />
    </intent>
    
    <!-- HTTP URL'leri açıyorsan -->
    <intent>
        <action android:name="android.intent.action.VIEW" />
        <data android:scheme="http" />
    </intent>
    
    <!-- Uygulama içi tarayıcı kullanıyorsan (LaunchMode.inAppBrowserView) -->
    <intent>
        <action android:name="android.support.customtabs.action.CustomTabsService" />
    </intent>


ios\Runner\Info.plist  altina ekle


	<array>
     	<string>sms</string>
 	    <string>tel</string>
 	    <string>mailto</string>
	    <string>https</string>
*/ 
