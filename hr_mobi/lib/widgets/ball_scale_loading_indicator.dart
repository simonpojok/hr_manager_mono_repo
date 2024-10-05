import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart' as loading_indicator;

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: loading_indicator.LoadingIndicator(
        indicatorType: loading_indicator.Indicator.ballScale,
        colors: [Colors.blue.withOpacity(0.6)],
        strokeWidth: 2,
        pathBackgroundColor: Colors.black,
      ),
    );
  }
}
