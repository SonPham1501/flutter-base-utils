// ignore_for_file: file_names
import 'dart:ui';

import 'package:base_extends/Extends/ColorExtends.dart';

class ResourceUtil {
  static const _pathResource = "assets/";

  static image(String name) {
    if (name.contains(".")) {
      return "${_pathResource}images/$name";
    }
    return "${_pathResource}images/$name.png";
  }

  static icon(String name) {
    if (name.contains(".")) {
      return "${_pathResource}icons/$name";
    }
    return "${_pathResource}icons/$name.svg";
  }

  static logo(String name) {
    if (name.contains(".")) {
      return "${_pathResource}logo/$name";
    }
    return "${_pathResource}logo/$name.svg";
  }

  static imageHome(String name) {
    if (name.contains(".")) {
      return "${_pathResource}images/Home/$name";
    }
    return "${_pathResource}images/Home/$name.png";
  }

  static imageComingSoon(String name) {
    if (name.contains(".")) {
      return "${_pathResource}images/ComingSoon/$name";
    }
    return "${_pathResource}images/ComingSoon/$name.png";
  }

  static imageWeather(String name) {
    if (name.contains(".")) {
      return "${_pathResource}images/Weather/$name";
    }
    return "${_pathResource}images/Weather/$name.png";
  }

  static Color hexToColor(String code) {
    //return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    return ColorExtends(code);
  }

  static gif(String name) {
    if (name.contains(".")) {
      return "${_pathResource}gif/$name";
    }
    return "${_pathResource}gif/$name.png";
  }

  static iconHome(String name) {
    if (name.contains(".")) {
      return "${_pathResource}icons/Home/$name";
    }
    return "${_pathResource}icons/Home/$name.png";
  }

  static iconLogin(String name) {
    if (name.contains(".")) {
      return "${_pathResource}icons/Login/$name";
    }
    return "${_pathResource}icons/Login/$name.png";
  }
}
