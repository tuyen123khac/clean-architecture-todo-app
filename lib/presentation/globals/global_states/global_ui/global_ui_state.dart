import '../../../l10n/locale_enum.dart';

enum ReloadState { none }

class GlobalUiState {
  LocaleEnum currentLocale;

  GlobalUiState({this.currentLocale = LocaleEnum.en});

  GlobalUiState copyWith({LocaleEnum? currentLocale}) {
    return GlobalUiState(currentLocale: currentLocale ?? this.currentLocale);
  }
}
