/// Store all images path of the app, include SVG, PNG, JSON
class AppImages {
  //****************************  SVG ****************************//

  //****************************  PNG ****************************//
  static String appIcon = ImagesPath.getPath('app_icon.png');

  //****************************  JSON ****************************//
  static String appLoading = ImagesPath.getPath('app_loading.json');
}

extension ImagesPath on AppImages {
  static String getPath(String name) {
    if (name.contains('.svg')) {
      return 'assets/svg/$name';
    }
    if (name.contains('.png')) {
      return 'assets/png/$name';
    }
    if (name.contains('.json')) {
      return 'assets/json/$name';
    }
    return 'assets/svg/$name';
  }
}
