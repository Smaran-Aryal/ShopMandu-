import 'package:flutter/material.dart';

class SafeNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit fit;

  const SafeNetworkImage({super.key, required this.url, this.fit = BoxFit.cover});

  Widget _errorBox() => Container(
    color: Colors.grey.shade200,
    child: const Center(
      child: Icon(Icons.image_not_supported_outlined, color: Colors.grey),
    ),
  );

  @override
  Widget build(BuildContext context) {

    if (!url.startsWith('http')) {
      return Image.asset(
        url,
        fit: fit,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stack) => _errorBox(),
      );
    }

    return Image.network(
      url,
      fit: fit,
      width: double.infinity,
      height: double.infinity,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const Center(child: CircularProgressIndicator(strokeWidth: 2));
      },
      errorBuilder: (context, error, stack) => _errorBox(),
    );
  }
}