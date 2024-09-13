import 'package:camera/camera.dart';
import 'package:custom_camera/view_models/camera_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          context.watch<CameraViewModel>().isLoaded
              ? Positioned.fill(
                  child: CameraPreview(
                      context.watch<CameraViewModel>().controller),
                )
              : const Center(child: CircularProgressIndicator()),

          // 상단 메뉴 버튼
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 플래시 토글 버튼
                    IconButton(
                      onPressed: () {
                        context.read<CameraViewModel>().toggleFlash();
                      },
                      icon: Icon(
                        context.read<CameraViewModel>().isFlashOn
                            ? Icons.flash_on_outlined
                            : Icons.flash_off_outlined,
                        size: 24,
                        color: Colors.black,
                      ),
                    ),

                    // 카메라 전환 버튼
                    IconButton(
                      onPressed: () {
                        context.read<CameraViewModel>().changeCameraDirection();
                      },
                      icon: const Icon(
                        Icons.cameraswitch_outlined,
                        size: 24,
                        color: Colors.black,
                      ),
                    ),

                    // 닫기 버튼
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 24,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 하단 촬영 버튼
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(bottom: 64),
                child: GestureDetector(
                  onTap: () {
                    // 사진 촬영 함수 호출
                    context.read<CameraViewModel>().takePicture(context);
                  },
                  child: Icon(
                    Icons.circle,
                    size: 64,
                    color: context.read<CameraViewModel>().canTakePicture
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
