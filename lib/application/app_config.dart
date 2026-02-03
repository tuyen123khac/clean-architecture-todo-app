/// App configuration. Controls mock vs real API and other env flags.
class AppConfig {
  static AppEnvironment env = AppEnvironment.dev;

  bool get isDev => env == AppEnvironment.dev;
  bool get isMock => isDev;

  static AppEnv get appEnv => switch (env) {
    AppEnvironment.dev => AppEnv(endpoint: 'http://localhost:3000'),
    AppEnvironment.staging => AppEnv(
      endpoint: 'https://staging.api.example.com',
    ),
    AppEnvironment.production => AppEnv(endpoint: 'https://api.example.com'),
  };
}

enum AppEnvironment { dev, staging, production }

class AppEnv {
  final String endpoint;

  const AppEnv({required this.endpoint});
}
