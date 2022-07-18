import 'dart:convert';
import 'dart:typed_data';

import 'package:color/color.dart' as clr;
import 'package:googleapis/vision/v1.dart';
import 'package:image/image.dart' as img;

class VisionImage extends Image {
  VisionImage(this.encodedBytes)
      : _decodedBytes = img.decodeImage(encodedBytes),
        super(content: base64Encode(encodedBytes));

  factory VisionImage.fromDecodedImage(img.Image image) =>
      VisionImage(Uint8List.fromList(img.encodeJpg(image).toList()));

  final Uint8List encodedBytes;

  img.Image? _decodedBytes;

  int get height => _decodedBytes!.height;

  int get width => _decodedBytes!.width;

  void drawLine(int x1, int y1, int x2, int y2, clr.Color color,
      {bool antialias = false, num thickness = 1}) {
    img.drawLine(
        _decodedBytes!,
        x1,
        y1,
        x2,
        y2,
        img.getColor(color.toRgbColor().r as int, color.toRgbColor().g as int,
            color.toRgbColor().b as int));
  }

  void drawString(int x, int y, String text,
      {clr.Color color = const clr.Color.rgb(0, 0, 0)}) {
    img.drawString(_decodedBytes!, img.arial_14, x, y, text,
        color: img.getColor(color.toRgbColor().r as int,
            color.toRgbColor().g as int, color.toRgbColor().b as int));
  }

  VisionImage copyCrop(int x, int y, int w, int h) =>
      VisionImage.fromDecodedImage(img.copyCrop(_decodedBytes!, x, y, w, h));

  String get toBase64Image => base64Encode(img.encodeJpg(_decodedBytes!));
}
