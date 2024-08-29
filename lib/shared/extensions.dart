import 'dart:ui';

extension HexColor on Color {
  String get toHex => '#'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension ColorExtension on String {
  Color get color {
    final buffer = StringBuffer();
    String hexString = toUpperCase();
    switch (hexString.length) {
      case 6:
        buffer.write('FF$hexString');
      case 7:
        buffer.write(hexString.replaceFirst('#', 'FF'));
      case 8:
        buffer.write(hexString);
      case 9:
        buffer.write(hexString.replaceFirst('#', ''));
    }
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
