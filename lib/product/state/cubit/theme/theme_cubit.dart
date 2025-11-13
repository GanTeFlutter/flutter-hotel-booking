import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(_loadInitialTheme());

  static bool _loadInitialTheme() {
    return locator.sharedprefsService.getBool('themeMode');
  }

  bool get isDarkMode => state;

  void toggleTheme() {
    final newTheme = !state;
    emit(newTheme);
    _cacheThemeMode(newTheme);
  }

  Future<void> _cacheThemeMode(bool themeMode) async {
    await locator.sharedprefsService.setBool(
      key: 'themeMode',
      value: themeMode,
    );
  }
}
// context.read<ThemeCubit>().toggleTheme();
