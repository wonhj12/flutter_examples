import 'dart:io';

import 'package:custom_camera/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('홈'), centerTitle: true),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // 촬영한 이미지가 있는지 확인
            SizedBox(
              width: 300,
              height: 400,
              child: context.watch<HomeViewModel>().imgPath != null
                  ? Image.file(
                      File(context.read<HomeViewModel>().imgPath!),
                      fit: BoxFit.cover,
                    )
                  : Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                      ),
                      child: const Icon(Icons.camera_alt,
                          size: 48, color: Colors.grey),
                    ),
            ),
            const SizedBox(height: 16),

            // 사진 촬영 버튼
            SizedBox(
              width: 300,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  context.read<HomeViewModel>().openCamera(context);
                },
                child: const Text(
                  '사진 촬영',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
