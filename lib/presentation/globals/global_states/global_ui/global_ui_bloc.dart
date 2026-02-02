import 'dart:async';
import 'dart:ui';

import '../../../base_bloc/base_cubit.dart';
import '../../../l10n/locale_enum.dart';
import 'global_ui_state.dart';
import 'reload_param.dart';

/// GlobalUiBloc is a global state management class that manages UI-related state.
/// It handles locale, tabs, and global UI change notifications.
class GlobalUiBloc extends BaseCubit<GlobalUiState> {
  GlobalUiBloc({required Locale locale}) : super(GlobalUiState());

  final _reloadStream = StreamController<ReloadParam>.broadcast();

  static LocaleEnum currentLocaleStatic = LocaleEnum.en;

  @override
  Future<void> close() {
    _reloadStream.close();
    return super.close();
  }

  //************************ GLOBAL CHANGES ****************************** */
  // Using to notify cross all the app

  Stream<ReloadParam> listenGlobalChanges() {
    return _reloadStream.stream;
  }

  void notifyGlobalChanges(ReloadParam param) {
    return _reloadStream.add(param);
  }

  //************************ LOCALE MANAGEMENT ****************************** */

  void changeLocaleData(LocaleEnum locale) {
    currentLocaleStatic = locale;
    // SharedPref.setCurrentLocale(locale.name);
    emit(state.copyWith(currentLocale: locale));
  }
}
