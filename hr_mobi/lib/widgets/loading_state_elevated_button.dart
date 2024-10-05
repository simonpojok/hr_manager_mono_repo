import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingStateElevatedButton extends StatelessWidget {
  const LoadingStateElevatedButton({
    super.key,
    this.onTapped,
    this.backgroundColor,
    this.isLoading = false,
    required this.label,
  });

  final VoidCallback? onTapped;
  final bool isLoading;
  final String label;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: backgroundColor ?? Colors.blue,
          foregroundColor: Colors.white,
        ),
        onPressed: isLoading ? null : onTapped,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              const LoadingIndicator(
                indicatorType: Indicator.ballScale,
                colors: [Colors.blue],
                strokeWidth: 2,
                pathBackgroundColor: Colors.black,
              ),
            if (!isLoading) Text(label),
          ],
        ),
      ),
    );
  }
}
