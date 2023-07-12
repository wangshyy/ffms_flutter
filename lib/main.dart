import 'package:ffms_flutter/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

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
  int _currentIndex = 0;

  // 页面列表
  List<Widget> pages = [
    HomePage(),
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
      bottomNavigationBar: BottomNavigationBar(
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
      ),
      body: pages[_currentIndex],
    );
  }
}

/// 首页
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<String> _imageUrl = [
    "assets/images/home1.jpg",
    "assets/images/home2.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          notificationPredicate: (notification) => false,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            "首页",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              // 轮播图
              Container(
                clipBehavior: Clip.antiAlias,
                width: MediaQuery.of(context).size.width,
                // 宽度铺满
                height: 180,
                margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      _imageUrl[index],
                      fit: BoxFit.cover,
                    );
                  },
                  itemCount: _imageUrl.length,
                  pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          color: colorWhite99,
                          activeColor: colorBlack99,
                          size: 4,
                          activeSize: 6)),
                  autoplay: true,
                  autoplayDelay: 5000,
                  duration: 800,
                ),
              ),
              // 本月预算
              Container(
                width: MediaQuery.of(context).size.width,
                // 宽度铺满
                height: 180,
                margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "本月预算",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: SizedBox(
                          height: 20,
                          child: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.all(0),
                            iconSize: 14,
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: colorGrey707070,
                            ),
                            onPressed: () {
                              _showModalBottomSheet(context);
                            },
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 1,
                      color: colorDivider,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircularProgressIndicator(
                          value: 0.5,
                          backgroundColor: colorPrimary,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(colorPrimary),
                        ),
                        Column(
                          children: [
                            Text(
                              "预算金额",
                              style: TextStyle(
                                  fontSize: 12, color: colorGrey707070),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "¥ 10000.00",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // 待办事项
              Container(
                width: MediaQuery.of(context).size.width,
                // 宽度铺满
                margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "待办事项",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: SizedBox(
                          height: 20,
                          child: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.all(0),
                            iconSize: 14,
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: colorGrey707070,
                            ),
                            onPressed: () {
                              print("点击了待办事项");
                            },
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 1,
                      color: colorDivider,
                    )
                  ],
                ),
              )
            ],
          ),
        ))
      ],
    );
  }
}

/// 数据统计
class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        "data",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

/// 收入/支出
class IOPage extends StatelessWidget {
  const IOPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        "io",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

/// 我的
class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        "mine",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

/// 预算设置弹窗
_showModalBottomSheet(BuildContext context) {
  List<String> list = [
    "500",
    "1000",
    "1500",
    "2000",
    "2500",
    "500",
    "1000",
    "1500",
    "2000",
    "2500"
  ];
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          padding: const EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: Column(
            children: [
              const Text(
                "预算设置",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 1,
                color: colorDivider,
              ),
              Expanded(
                  child: ListView(
                      children: list.map((e) {
                return TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                    // 取消点击效果
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    print(e);
                    // 底部弹窗消失
                    Navigator.pop(context);
                  },
                  child: Text(e,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black)),
                );
              }).toList()))
            ],
          ),
        );
      });
}
