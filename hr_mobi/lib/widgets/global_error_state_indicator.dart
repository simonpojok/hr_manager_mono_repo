import 'package:flutter/material.dart';

class GlobalErrorStateIndicator extends StatelessWidget {
  const GlobalErrorStateIndicator({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        children: [
          Text(
            message,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
          ),
          const SizedBox(height: 10),
          Image.asset(
            "assets/icons/ic_warning.png",
            height: 100,
          ),
        ],
      ),
    );
  }
}
