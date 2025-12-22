# 🏨 Flutter Hotel Booking

Modern ve kullanıcı dostu bir otel rezervasyon uygulaması. Firebase backend altyapısı, harita entegrasyonu ve gelişmiş state management ile geliştirilmiştir.

## 📱 Uygulama Önizlemesi

[Instagram'da İzle](https://www.instagram.com/p/DSYR6cdDP1l/)

## ✨ Özellikler

- 🔐 **Firebase Authentication** - Email/şifre ve misafir girişi
- 🗺️ **Google Maps Entegrasyonu** - Otel konumları ve navigasyon
- 🔔 **Push Bildirimleri** - Firebase Cloud Messaging
- 📊 **Analytics** - Kullanıcı davranış analizi
- 💾 **Offline Destek** - Hydrated BLoC ile state persistence
- 🎨 **Modern UI** - Material Design 3 ve özel animasyonlar
- 📍 **Konum Servisleri** - Otomatik konum tespiti ve geocoding
- 🌍 **Çoklu Dil Desteği** - i18n hazır yapı

## 🏗️ Mimari

Proje, modüler ve ölçeklenebilir bir mimari ile yapılandırılmıştır:

```
flutter_hotel_booking/
├── lib/
│   ├── feature/          # Özellik bazlı modüller
│   ├── product/          # Paylaşılan servisler, utils
│   └── main.dart
└── module/
    ├── gen/              # Asset & Model generator
    ├── common/           # Ortak utilities
    └── widgets/          # Yeniden kullanılabilir widget'lar
```

## 📦 Kullanılan Paketler

### State Management
- **flutter_bloc** (^9.1.1) - BLoC pattern ile state yönetimi
- **hydrated_bloc** (^10.1.1) - State persistence, offline çalışma
- **bloc_concurrency** (^0.3.0) - Concurrent event yönetimi
- **provider** (^6.1.5) - Dependency injection ve state sharing

### Dependency Injection
- **get_it** (^8.2.0) - Service locator pattern

### Navigation
- **go_router** (^16.2.4) - Declarative routing, deep linking

### Firebase
- **firebase_core** (^4.2.1) - Firebase temel SDK
- **firebase_auth** (^6.1.2) - Kullanıcı kimlik doğrulama
- **cloud_firestore** (^6.1.0) - NoSQL veritabanı
- **firebase_remote_config** (^6.1.1) - Uzaktan yapılandırma
- **firebase_messaging** (^16.0.4) - Push bildirimleri
- **firebase_analytics** (^12.0.4) - Kullanıcı analitikleri

### Networking
- **http** (^1.6.0) - HTTP istekleri

### Local Storage
- **shared_preferences** (^2.5.3) - Key-value storage
- **path_provider** (^2.1.5) - Dosya sistemi path'leri

### UI Components
- **cupertino_icons** (^1.0.8) - iOS style iconlar
- **lottie** (^3.3.2) - JSON animasyonlar
- **shimmer** (^3.0.0) - Loading placeholder animasyonları
- **google_fonts** (^6.3.2) - Google Fonts entegrasyonu
- **smooth_page_indicator** (^1.2.1) - Sayfa göstergeleri
- **pinput** (^6.0.0) - OTP/PIN input widget'ı
- **cached_network_image** (^3.4.1) - Görsel cache'leme

### Maps & Location
- **google_maps_flutter** (^2.14.0) - Google Maps widget'ı
- **geolocator** (14.0.1) - Konum servisleri
- **geocoding** (^4.0.0) - Adres ↔ koordinat dönüşümü

### Code Generation
- **freezed** (^3.2.3) - Immutable model generator
- **json_serializable** (^6.10.0) - JSON serialization
- **build_runner** (^2.9.0) - Code generation runner

### Utilities
- **uuid** (^4.5.2) - Benzersiz ID oluşturma
- **logger** (^2.6.1) - Gelişmiş logging
- **url_launcher** (^6.3.2) - URL/link açma
- **share_plus** (^12.0.1) - İçerik paylaşma
- **package_info_plus** (^9.0.0) - App version bilgileri
- **permission_handler** (^12.0.1) - İzin yönetimi
- **equatable** (^2.0.7) - Value equality

### App Configuration
- **flutter_launcher_icons** (^0.14.4) - App icon generator
- **flutter_native_splash** (^2.4.7) - Splash screen generator

## 🚀 Kurulum

### Gereksinimler
- Flutter SDK (>=3.9.2)
- Dart SDK (>=3.9.2)
- Firebase projesi
- Google Maps API key

### Adımlar

1. **Projeyi klonlayın**
```bash
git clone https://github.com/yourusername/flutter_hotel_booking.git
cd flutter_hotel_booking
```

2. **Bağımlılıkları yükleyin**
```bash
flutter pub get
cd module/gen && flutter pub get
cd ../common && flutter pub get
cd ../widgets && flutter pub get
cd ../..
```

3. **Firebase yapılandırması**
- Firebase Console'dan `google-services.json` (Android) ve `GoogleService-Info.plist` (iOS) dosyalarını indirin
- İlgili klasörlere yerleştirin

4. **Environment variables**
```bash
# module/gen/lib/.env dosyası oluşturun
GOOGLE_MAPS_API_KEY=your_api_key_here
```

5. **Code generation**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

6. **Uygulamayı çalıştırın**
```bash
flutter run
```

## 🛠️ Geliştirme

### Code Generation
```bash
# Watch mode (otomatik regenerate)
flutter pub run build_runner watch --delete-conflicting-outputs

# One-time build
flutter pub run build_runner build --delete-conflicting-outputs
```

### App Icon Güncelleme
```bash
flutter pub run flutter_launcher_icons
```

### Splash Screen Güncelleme
```bash
flutter pub run flutter_native_splash:create
```

## 📱 Platform Desteği

- ✅ Android
- ✅ iOS

## 🧪 Test

```bash
flutter test
```

## 📝 Versiyon Geçmişi

### v1.0.8+9 (Mevcut)
- Firebase entegrasyonu
- Google Maps desteği
- Push bildirimleri
- Offline çalışma
- Misafir girişi

## 🎓 Öğrenilenler

Bu proje, bir Flutter uygulamasının nasıl büyüyebileceğini ve karmaşıklaşabileceğini gösteren gerçek bir örnektir. Geliştirme sürecinde:

- ✅ Modüler mimari önemini öğrendim
- ✅ State management karmaşıklığını anladım
- ✅ Firebase best practices deneyimi kazandım
- ⚠️ Erken refactoring yapmanın önemini kavradım
- ⚠️ Aşırı abstraction'dan kaçınmayı öğrendim

## 🔮 Gelecek İyileştirmeler

- [ ] Test coverage artırılacak
- [ ] Daha modüler mimari


## 👨‍💻 Geliştirici

Bir öğrenme projesi olarak geliştirilmiştir. Geri bildirimleriniz için teşekkürler!

