# flutter-hotel-booking
flutter-hotel-booking

nda oldugu icin readme karisik duzenleyecegim



# Firebase Remote Config
 
flutter pub add firebase_remote_config

https://pub.dev/packages/firebase_remote_config/install 

https://firebase.google.com/docs/remote-config/get-started?platform=flutter&hl=tr 



önce prjemizi firebase bağlıyoruz 

Firebase kurulumunu yaptıktan sonra aşşağıdaki gibi gerkli kodları ekliyoruz 

[app_initialize.dart] eklendi

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const RemoteConfigApp());
}

import 'package:firebase_remote_config/firebase_remote_config.dart';
importu görmez ise elle ekleyin bazen görmeyebiliyor


Remote Config'i ayarlama kapsamında Google Analytics için Firebase SDK'sını uygulamanıza eklemeniz gerekir:
flutter pub add firebase_analytics


### version karşılaştırmaası 
 
firebase kısmında remute confige girilen iki paremetre  (min_version / latest_version)

🟢 min_version = 1.0.2 → FORCE UPDATE

Kullanıcının uygulama versiyonu 1.0.2’nin altındaysa (1.0.1, 1.0.0 vs)
Uygulamayı kullanmasına izin verilmez
Mutlaka güncellemesi gerekir
Force Update ekranı açılır
Kritik hatalı sürümleri tamamen kapatmak.

🔵 latest_version = 1.0.5 → SOFT / ÖNERİLEN UPDATE

Kullanıcı 1.0.2 ile 1.0.5 arası bir sürümde ise
Güncelleme önerisi gösterilir (soft update)
Ama uygulamayı kullanabilir

splash viewin bağlı olduğu [version_comparetor_cubit.dart] kontrolleri yapiliyor 
ve hangi bildirimin gonderilecegi belirleniyor ayrica bir dinleyici başlatılıyor [_remoteConfig.onConfigUpdated.listen]
bu sayade firebase üzerinden versiyon güncellendiği an kullanıcı neredee olursa olsun ona bildirim gönderebiliyoruz.


