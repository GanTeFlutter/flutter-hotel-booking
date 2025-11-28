import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/product/enum/theme_mode.dart';
import 'package:flutter_hotel_booking/product/service/services/sesvice_shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._prefsService) : super(ThemeMode.light) {
    _loadTheme();
  }

  final SharedPreferencesService _prefsService;

  bool get isDarkMode => state == ThemeMode.dark;

  Future<void> _loadTheme() async {
    final mode = _prefsService.themeMode;
    emit(mode);
  }

  Future<void> toggleTheme() async {
    final newMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    emit(newMode);
    await _prefsService.setThemeMode(newMode);
  }
}
