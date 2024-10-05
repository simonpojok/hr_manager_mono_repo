import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension ContextExtensionPath on BuildContext {
  String get currentPath {
    final initialPath = GoRouterState.of(this).uri.path;

    return initialPath.length == 1 && initialPath[0] == "/" ? '' : initialPath;
  }
}
