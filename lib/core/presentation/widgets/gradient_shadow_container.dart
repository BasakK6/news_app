import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/resources/values_manager.dart';

class GradientShadowContainer extends StatelessWidget {
  const GradientShadowContainer({Key? key, this.height, required this.child})
      : super(key: key);

  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height:
          height ?? MediaQuery.sizeOf(context).height * kDefaultHeightFactor,
      decoration: BoxDecoration(
        gradient: buildGradient(),
      ),
      child: child,
    );
  }

  LinearGradient buildGradient() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [
        0.1,
        0.6,
      ],
      colors: [Colors.transparent, Colors.black54],
    );
  }
}
