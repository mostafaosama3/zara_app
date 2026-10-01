import 'package:flutter/material.dart';

/// Displays an image path without requiring callers to know its source type.
class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.path,
    this.fit,
    this.width,
    this.height,
    this.errorBuilder,
  });

  final String path;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final ImageErrorWidgetBuilder? errorBuilder;

  @override
  Widget build(BuildContext context) {
    final isRemote = path.startsWith('https://') || path.startsWith('http://');
    final ImageProvider provider = isRemote
        ? NetworkImage(path)
        : AssetImage(path);

    return Image(
      image: provider,
      fit: fit,
      width: width,
      height: height,
      errorBuilder: errorBuilder,
    );
  }
}
