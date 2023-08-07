import 'package:ffms_flutter/data/model/todo_bean.dart';
import 'package:ffms_flutter/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(AddTodoPage());

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  var todoName = TextEditingController();
  var todoDate = TextEditingController();
  var todoContent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Add Todo',
        theme: ThemeData(
          scaffoldBackgroundColor: activityBg,
          colorScheme: ColorScheme.fromSeed(seedColor: colorPrimary),
          useMaterial3: true,
        ),
        home: Scaffold(
            appBar: AppBar(
              notificationPredicate: (notification) => false,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 18,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              centerTitle: true,
              title: const Text(
                '新增待办事项',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: Column(
              children: [
                // 表单
                _buildTodoForm(),
                // 提交按钮
                _buildSubmitButton(context),
              ],
            )));
  }

  /// 构建待办事项表单
  Widget _buildTodoForm() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("事项名称", style: TextStyle(fontSize: 14)),
              Expanded(
                child: TextField(
                    controller: todoName,
                    textAlign: TextAlign.end,
                    cursorColor: Colors.grey,
                    style: const TextStyle(fontSize: 14),
                    decoration: const InputDecoration(
                      isCollapsed: true,
                      hintText: '请输入事项名称',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                      border: InputBorder.none,
                    )),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Divider(height: 1, color: colorDivider),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("日期", style: TextStyle(fontSize: 14)),
              Expanded(
                child: TextField(
                    controller: todoDate,
                    textAlign: TextAlign.end,
                    cursorColor: Colors.grey,
                    style: const TextStyle(fontSize: 14),
                    decoration: const InputDecoration(
                      isCollapsed: true,
                      hintText: '请选择日期',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                      border: InputBorder.none,
                    )),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Divider(height: 1, color: colorDivider),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("事项内容", style: TextStyle(fontSize: 14)),
              const SizedBox(height: 10),
              _buildTodoContent(),
            ],
          ),
        ],
      ),
    );
  }

  /// 构建待办事项内容
  Widget _buildTodoContent() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 120,
      decoration: BoxDecoration(
        color: colorWhiteF7F7FC,
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
          controller: todoContent,
          textAlign: TextAlign.start,
          cursorColor: Colors.grey,
          style: const TextStyle(fontSize: 14),
          maxLines: null,
          decoration: const InputDecoration(
            // If [isCollapsed] is true then [contentPadding] is [EdgeInsets.zero].
            isCollapsed: true,
            hintText: '请输入事项名称',
            hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.normal),
            border: InputBorder.none,
          )),
    );
  }

  /// 构建提交按钮
  Widget _buildSubmitButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          // 取消点击效果
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        onPressed: () {
          if (todoName.text.isEmpty) {
            Fluttertoast.showToast(msg: '请输入事项名称');
            return;
          }
          if (todoDate.text.isEmpty) {
            Fluttertoast.showToast(msg: '请选择日期');
            return;
          }
          if (todoContent.text.isEmpty) {
            Fluttertoast.showToast(msg: '请输入事项内容');
            return;
          }

          Fluttertoast.showToast(msg: '提交成功');
          TodoBean result = TodoBean(
              title: todoName.text,
              date: todoDate.text,
              description: todoContent.text);
          Navigator.pop(context, result);
        },
        child: const Text(
          '提交',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
