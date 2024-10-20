import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/core/storage/storage_handler.dart';
import 'package:task_manager/feature/auth/login/presentation/pages/login_page.dart';

import '../../feature/task/presentation/pages/tasks_page.dart';

// GoRouter configuration
class AppRouter {
  static String loginScreen =
      StorageHandler().userId == null ? "/" : "/login";
  static String tasksScreen =
      StorageHandler().userId != null ? "/" : "/task";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: loginScreen,
        pageBuilder: (context, state) => customTransitionPage(
          key: state.pageKey,
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: tasksScreen,
        pageBuilder: (context, state) => customTransitionPage(
          key: state.pageKey,
          child: const TasksPage(),
        ),
      ),
    ],
  );
}

CustomTransitionPage customTransitionPage(
    {required ValueKey<String> key, required Widget child}) {
  return CustomTransitionPage(
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        child: child,
      );
    },
  );
}

// FadeTransition(
//         opacity: Tween<double>(begin: 0, end: 1).animate(animation),
//         child: child,
//       );

// SlideTransition(
//         position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
//             .animate(animation),
//         // opacity: Tween<double>(begin: 0, end: 1).animate(animation),
//         child: child,
//       );

// ScaleTransition(
//   scale: Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: animation, curve: Curves.easeInBack)),

//   child: child,
// );
