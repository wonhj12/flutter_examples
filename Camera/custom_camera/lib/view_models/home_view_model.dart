import 'package:custom_camera/view_models/camera_view_model.dart';
import 'package:custom_camera/views/camera_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeViewModel with ChangeNotifier {
  String? imgPath;

  void openCamera(BuildContext context) async {
    String? tempImg = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => CameraViewModel(),
          child: const CameraView(),
        ),
      ),
    );

    if (tempImg != null) {
      imgPath = tempImg;
    } else {
      debugPrint('Image path error');
    }

    notifyListeners();
  }
}
