import 'package:flutter/material.dart';

import 'list_items_not_found.dart';

class ListViewUtils {
  static Widget separatedWithEmptyView<T>({
    required IndexedWidgetBuilder separatorBuilder,
    required Function(BuildContext, T) itemBuilder,
    required List<T> items,
  }) {
    return switch (items.isEmpty) {
      true => const Center(
          child: ListItemsNotFound(),
        ),
      false => ListView.separated(
          itemCount: items.length,
          itemBuilder: (context, index) => itemBuilder(context, items[index]),
          separatorBuilder: separatorBuilder,
        )
    };
  }
}
