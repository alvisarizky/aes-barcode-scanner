// ignore_for_file: unused_field

abstract class Environment {
  static bool isProduction = false;
}

abstract class Secret {
  static const secretKey = 'rahasia';
  static const secretIv = 'iv_rahasia';
}

abstract class AssetImages {
  static const _basePath = 'assets/images';

  static const logoBone = '$_basePath/logo_bone.png';
  static const logoSulsel = '$_basePath/logo_sulsel.png';
  static const backgroundImage = '$_basePath/background_image.jpg';
}
