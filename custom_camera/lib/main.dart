import 'package:custom_camera/view_models/home_view_model.dart';
import 'package:custom_camera/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
          child: const HomeView(),
        ),
      ),
    );
  }
}

// flutter pub add camera
// flutter pub add path_provider
// flutter pub add provider

// ios/Runner/Info.plist
// <key>NSCameraUsageDescription</key>
// <string>Camera usage</string>
// <key>NSMicrophoneUsageDescription</key>
// <string>Microphone usage for video recording</string>

// android/app/build.gradle
// minSdk = 21

// android/app/src/main/AndroidManifest.xml
// <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
// <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
// <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
// <uses-feature android:name="android.hardware.camera" android:required="true"/>
// android:requestLegacyExternalStorage="true"
// android:preserveLegacyExternalStorage="true"