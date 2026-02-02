/// App configuration. Controls mock vs real API and other env flags.
class AppConfig {
  final AppEnvironment env;

  const AppConfig({required this.env});

  bool get isDev => env == AppEnvironment.dev;
  bool get isMock => isDev;
}

enum AppEnvironment {
  dev,
  staging,
  production,
}
