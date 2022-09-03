import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListTile extends StatelessWidget {
  const ShimmerListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: false,
      onChanged: (bool? value) {},
      title: _buildRectangularShimmer(16),
      subtitle: _buildRectangularShimmer(12),
      secondary: const Icon(
        Icons.star_outline,
        color: Colors.blueAccent,
      ),
      controlAffinity: ListTileControlAffinity.leading,
      checkboxShape: const CircleBorder(),
    );
  }

  Widget _buildRectangularShimmer(double height) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 750),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[200]!,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
      ),
    );
  }
}
