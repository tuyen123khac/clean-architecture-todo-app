abstract class InvizaMobileNetworkUrls {
  // ************* Authentications *************
  static const String auth = '/auth';
  static const String login = '$auth/login';
  static const String signup = '$auth/signup';
  static const String refreshToken = '$auth/refresh';

  // ************* Measurements *************
  static const String measurements = '/measurements';
  static const String submitMeasurements = measurements;
  static const String getGpsMeasurements = '$measurements/gps';

  // ************* Patients *************
  static const String patients = '/patients';
  static const String getMe = '$patients/me';

  // ************* Files *************
  static const String files = '/files';
  static const String filesUpload = '$files/upload';
  static const String filesConfirmUpload = '$files/confirm-file-upload';

  static bool requireAuthentication(String url) {
    return ![
      signup,
      login,
      refreshToken, // Refresh token uses expired access token, handled manually in repository
    ].contains(url);
  }
}
