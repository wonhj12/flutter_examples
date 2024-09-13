import 'package:flutter/material.dart';
import 'package:mvvm_go_router/view_models/nickname_view_model.dart';
import 'package:provider/provider.dart';

class NicknameView extends StatelessWidget {
  const NicknameView({super.key});

  @override
  Widget build(BuildContext context) {
    NicknameViewModel nicknameViewModel = context.watch<NicknameViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nickname'),
        leading: IconButton(
          onPressed: nicknameViewModel.onPressedBackBtn,
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Center(child: Text(nicknameViewModel.userModel.nickName ?? '-')),
    );
  }
}
