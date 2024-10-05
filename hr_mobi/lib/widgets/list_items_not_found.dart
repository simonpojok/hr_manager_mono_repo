import 'package:flutter/material.dart';

class ListItemsNotFound extends StatelessWidget {
  const ListItemsNotFound({super.key, this.description});

  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.grey,
          child: Image.asset('assets/icons/ic_empty_box.png'),
        ),
        const SizedBox(height: 20),
        Text(
          description ?? 'No Results Found',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 18,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
        )
      ],
    );
  }
}
