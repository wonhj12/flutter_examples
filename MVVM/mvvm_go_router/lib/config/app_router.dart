import 'package:go_router/go_router.dart';
import 'package:mvvm_go_router/models/user_model.dart';
import 'package:mvvm_go_router/view_models/home_view_model.dart';
import 'package:mvvm_go_router/view_models/nickname_view_model.dart';
import 'package:mvvm_go_router/views/home_view.dart';
import 'package:mvvm_go_router/views/nickname_view.dart';
import 'package:provider/provider.dart';

class AppRouter {
  final UserModel userModel;
  AppRouter({required this.userModel});

  static GoRouter getRouter(UserModel userModel) {
    return GoRouter(
      initialLocation: '/home',
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => ChangeNotifierProvider(
            create: (context) =>
                HomeViewModel(userModel: userModel, context: context),
            child: const HomeView(),
          ),
          routes: [
            GoRoute(
              path: 'nickname',
              builder: (context, state) => ChangeNotifierProvider(
                create: (context) =>
                    NicknameViewModel(userModel: userModel, context: context),
                child: const NicknameView(),
              ),
            )
          ],
        )
      ],
    );
  }
}
