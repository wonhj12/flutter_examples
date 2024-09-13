import 'package:flutter/material.dart';
import 'package:mvvm_go_router/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 닉네임 텍스트
            Text(homeViewModel.userModel.nickName ?? '-'),
            const SizedBox(height: 64),

            // 닉네임 변경 버튼
            ElevatedButton(
              onPressed: homeViewModel.resetNickname,
              child: const Text('닉네임 변경하기'),
            ),
            const SizedBox(height: 16),

            // Nickname View 이동 버튼
            ElevatedButton(
              onPressed: homeViewModel.onPressedNicknameBtn,
              child: const Text('페이지 이동'),
            )
          ],
        ),
      ),
    );
  }
}
