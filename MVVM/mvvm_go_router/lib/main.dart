import 'package:flutter/material.dart';
import 'package:mvvm_go_router/config/app_router.dart';
import 'package:mvvm_go_router/models/user_model.dart';

void main() {
  runApp(const MainApp());
}

// Models
UserModel userModel = UserModel();

// Router
final _router = AppRouter.getRouter(userModel);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
