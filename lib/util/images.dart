// ignore_for_file: unused_element

class Images {
  static String get instagramLogoDark => 'dark'.png;
  static String get instagramLogoLight => 'llight'.png;
}

extension on String {
  String get png => 'assets/image/$this.png';
  String get jpg => 'assets/image/$this.jpg';
  String get json => 'assets/json/$this.json';
}
