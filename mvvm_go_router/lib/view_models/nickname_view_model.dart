import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_go_router/models/user_model.dart';

class NicknameViewModel with ChangeNotifier {
  UserModel userModel;
  BuildContext context;
  NicknameViewModel({required this.userModel, required this.context});

  /// 뒤로 가기 버튼 클릭
  void onPressedBackBtn() {
    context.pop();
  }
}
