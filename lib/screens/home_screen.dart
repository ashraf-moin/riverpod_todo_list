import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_list/data/todo_model.dart';
import 'package:riverpod_todo_list/providers/todo_provider.dart';
import 'package:riverpod_todo_list/utils/utils.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_todo_list/widgets/display_white_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/show_dialog.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DisplayWhiteText(
                        text: "Aug 7,2023",
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      const Gap(20),
                      DisplayWhiteText(
                        text: "My Todo List",
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Incomplete Task
                  Container(
                    height: deviceSize.height * 0.3,
                    width: deviceSize.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colors.primaryContainer,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(todoList[index].title),
                        );
                      },
                    ),
                  ),
                  const Gap(20),
                  // Completed Task
                  Text(
                    "Completed",
                    style: context.textTheme.headlineMedium,
                  ),
                  const Gap(20),
                  Container(
                    height: deviceSize.height * 0.25,
                    width: deviceSize.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colors.primaryContainer,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: 8,
                      itemBuilder: (ctx, index) {
                        return const Text("Completed task");
                      },
                    ),
                  ),
                  const Gap(20),
                  ElevatedButton(
                    onPressed: () {
                      DialogUtils.showAddTodoDialog(context, ref);

                    },

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DisplayWhiteText(
                        text: "Enter New Task",
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
