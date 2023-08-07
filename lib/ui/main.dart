import 'package:ffms_flutter/style/colors.dart';
import 'package:flutter/material.dart';

import 'data/data_page.dart';
import 'home/home_page.dart';
import 'io/io_page.dart';
import 'mine/mine_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 背景色
        scaffoldBackgroundColor: activityBg,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 当前页面索引
  int _currentIndex = 0;

  // 页面列表
  List<Widget> pages = [
    const HomePage(),
    const DataPage(),
    const IOPage(),
    const MinePage()
  ];

  // 底部导航item列表
  List<BottomNavigationBarItem> bottomNavigationBarItem = [
    const BottomNavigationBarItem(
        activeIcon: Image(
            width: 24,
            height: 24,
            image: AssetImage("assets/images/icon_home_select.png")),
        icon: Image(
          width: 24,
          height: 24,
          image: AssetImage("assets/images/icon_home_unselected.png"),
        ),
        label: "首页"),
    const BottomNavigationBarItem(
        activeIcon: Image(
            width: 24,
            height: 24,
            image: AssetImage("assets/images/icon_data_statistics_select.png")),
        icon: Image(
          width: 24,
          height: 24,
          image:
              AssetImage("assets/images/icon_data_statistics_unselected.png"),
        ),
        label: "数据统计"),
    const BottomNavigationBarItem(
        activeIcon: Image(
            width: 24,
            height: 24,
            image:
                AssetImage("assets/images/icon_income_expenditure_select.png")),
        icon: Image(
          width: 24,
          height: 24,
          image: AssetImage(
              "assets/images/icon_income_expenditure_unselected.png"),
        ),
        label: "收入/支出"),
    const BottomNavigationBarItem(
        activeIcon: Image(
            width: 24,
            height: 24,
            image: AssetImage("assets/images/icon_mine_select.png")),
        icon: Image(
          width: 24,
          height: 24,
          image: AssetImage("assets/images/icon_mine_unselected.png"),
        ),
        label: "我的"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 底部导航栏
      bottomNavigationBar: _bottomNavigationBar(),
      body: pages[_currentIndex],
    );
  }

  /// 底部导航栏
  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      items: bottomNavigationBarItem,
      selectedFontSize: 12,
      unselectedFontSize: 10,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      // 设置选中时的文字颜色
      selectedItemColor: colorPrimary,
      // 设置未选中时的文字颜色
      unselectedItemColor: colorGrey515151,
      onTap: (index) {
        // 点击时改变_currentIndex，如何触发刷新页面
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
