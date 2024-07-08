import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_dark_mode/view_models/setting_view_model.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: (context),
                  builder: (BuildContext context) {
                    return themeModal();
                  });
            },
            child: Container(
              margin: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '테마',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  Text(
                    Provider.of<SettingViewModel>(context).getThemeName(),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // 테마 선택 모달
  Widget themeModal() {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Ink(
              height: 168,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(children: [
                // 라이트 모드 버튼
                InkWell(
                  onTap: () {
                    Provider.of<SettingViewModel>(context, listen: false)
                        .changeTheme(ThemeMode.light);
                    Navigator.pop(context);
                  },
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Container(
                    height: 56,
                    alignment: Alignment.center,
                    child: Text(
                      '라이트 모드',
                      style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                  ),
                ),
                Divider(
                  height: 0,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),

                // 다크 모드 버튼
                InkWell(
                  onTap: () {
                    Provider.of<SettingViewModel>(context, listen: false)
                        .changeTheme(ThemeMode.dark);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 56,
                    alignment: Alignment.center,
                    child: Text(
                      '다크 모드',
                      style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                  ),
                ),
                Divider(
                  height: 0,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),

                // 시스템 설정 버튼
                InkWell(
                  onTap: () {
                    Provider.of<SettingViewModel>(context, listen: false)
                        .changeTheme(ThemeMode.system);
                    Navigator.pop(context);
                  },
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(10)),
                  child: Container(
                    height: 56,
                    alignment: Alignment.center,
                    child: Text(
                      '시스템 설정',
                      style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(height: 8),

          // 취소 버튼
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Ink(
              height: 56,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  height: 56,
                  alignment: Alignment.center,
                  child: Text(
                    '취소',
                    style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
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
