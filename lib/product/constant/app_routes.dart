import 'package:meta/meta.dart';

/*
@immutable  Flutter'a der ki: "Bu class'taki değerler hiç değişmeyecek"
Başka class'ların bu class'ı extend etmesini engeller
AppRoutes._(); "Bu Class'tan Instance Oluşturma"

Anlam: "Bu sadece sabit değerleri tutan bir utility class'tır. Değiştirilemez, türetilemez, instance'ı oluşturulamaz. Sadece AppRoutes.homeView şeklinde kullan!"
*/

@immutable
final class AppRoutes {
  const AppRoutes._();
  static const String homeView = 'HomeView';
  static const String versionUpdateView = 'VersionUpdateView';
}
