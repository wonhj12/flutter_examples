import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_go_router/models/user_model.dart';

class HomeViewModel with ChangeNotifier {
  UserModel userModel;
  BuildContext context;
  HomeViewModel({required this.userModel, required this.context}) {
    // 닉네임 초기화
    resetNickname();
  }

  /// 닉네임을 랜덤하게 변경하는 함수
  ///
  /// 0 ~ 99 사이 랜덤한 숫자 생성 후 `닉네임 00` 형식으로 닉네임 지정
  void resetNickname() {
    int num = Random().nextInt(100);
    userModel.nickName = '닉네임 $num';

    notifyListeners();
  }

  /// Nickname View로 이동하는 함수
  void onPressedNicknameBtn() {
    context.go('/home/nickname');
  }
}
