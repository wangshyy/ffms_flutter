import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../data/model/todo_bean.dart';
import '../../style/colors.dart';

/// 首页
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<String> _imageUrl = [
    "assets/images/home1.jpg",
    "assets/images/home2.jpg"
  ];

  List<TodoBean> _todoList = [
    TodoBean(
        id: 1,
        title: "测试标题1",
        description: "测试描述1",
        date: "2021-10-01 12:00:00"),
    TodoBean(
        id: 2,
        title: "测试标题2",
        description: "测试描述2",
        date: "2021-10-02 12:00:00"),
    TodoBean(
        id: 1,
        title: "测试标题1",
        description: "测试描述1",
        date: "2021-10-01 12:00:00"),
    TodoBean(
        id: 2,
        title: "测试标题2",
        description: "测试描述2",
        date: "2021-10-02 12:00:00"),
    TodoBean(
        id: 1,
        title: "测试标题1",
        description: "测试描述1",
        date: "2021-10-01 12:00:00"),
    TodoBean(
        id: 2,
        title: "测试标题2",
        description: "测试描述2",
        date: "2021-10-02 12:00:00"),
    TodoBean(
        id: 1,
        title: "测试标题1",
        description: "测试描述1",
        date: "2021-10-01 12:00:00"),
    TodoBean(
        id: 2,
        title: "测试标题2",
        description: "测试描述2",
        date: "2021-10-02 12:00:00"),
    TodoBean(
        id: 1,
        title: "测试标题1",
        description: "测试描述1",
        date: "2021-10-01 12:00:00"),
    TodoBean(
        id: 2,
        title: "测试标题2",
        description: "测试描述2",
        date: "2021-10-02 12:00:00"),
  ];

  var percent = 0.3;
  // 本月消费
  double consume = 1000.0;
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
                  _buildBannerView(),
                  // 本月预算
                  _buildBudgetView(),
                  // 待办事项
                  _buildTodoView(),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ))
      ],
    );
  }

  /// 轮播图
  Widget _buildBannerView() {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: MediaQuery.of(context).size.width,
      // 宽度铺满
      height: 160,
      margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
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
    );
  }

  /// 本月预算
  Widget _buildBudgetView() {
    return Container(
      // 宽度铺满
      width: MediaQuery.of(context).size.width,
      height: 180,
      margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "本月预算",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
          const SizedBox(
            height: 16,
          ),
          Expanded(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    // 预算进度条
                    child: _buildCircleProgress(),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "剩余预算：",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              Text(
                                "¥ 10000.00",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Divider(
                            height: 1,
                            color: colorDivider,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "总预算：",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "¥ 10000.00",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "支出：",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "¥ 10000.00",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      )),
                ],
              ))
        ],
      ),
    );
  }

  /// 本月预算进度条
  Widget _buildCircleProgress() {
    return CircularPercentIndicator(
      radius: 56,
      lineWidth: 14,
      percent: percent,
      animation: true,
      animationDuration: 500,
      center: Text(
        "剩余：${(percent * 100).truncate()}%",
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      progressColor: colorPrimary,
      backgroundColor: colorDivider,
    );
  }

  /// 预算设置弹窗
  _showModalBottomSheet(BuildContext context) {
    List<int> list = [500, 1000, 1500, 2000, 2500, 500, 1000, 1500, 2000, 2500];
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
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
                          return _buildBudgetItemView(e);
                        }).toList()))
              ],
            ),
          );
        });
  }

  /// 本月预算item view
  Widget _buildBudgetItemView(int e) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
        // 取消点击效果
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: () {
        // 计算当月预算
        setState(() {
          percent = consume / e.toDouble();
        });
        // 底部弹窗消失
        Navigator.pop(context);
      },
      child: Text(e.toString(),
          style: const TextStyle(fontSize: 14, color: Colors.black)),
    );
  }

  /// 待办事项
  Widget _buildTodoView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      // 宽度铺满
      margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 10,
              ),
              const Text(
                "待办事项",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                  )),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: const Divider(
              height: 1,
              color: colorDivider,
            ),
          ),
          Column(
            children: _todoList.map((e) {
              return _buildTodoItemView(e);
            }).toList(),
          )
        ],
      ),
    );
  }

  /// 待办事项ListView item
  Widget _buildTodoItemView(TodoBean e) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Container(
                width: 9,
                height: 18,
                decoration: const BoxDecoration(
                    color: colorPrimary,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(9),
                        bottomRight: Radius.circular(9))),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.title.toString(),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    e.description.toString(),
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              ),
              Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      e.date.toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  )),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        if (_todoList.indexOf(e) != _todoList.length - 1)
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: const Divider(
              height: 1,
              color: colorDivider,
            ),
          )
      ],
    );
  }
}