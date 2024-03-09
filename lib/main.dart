import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_todo_list/data/controllers/list_notifier.dart';
import 'package:flutter_todo_list/data/list_of_tasks.dart';
import 'package:flutter_todo_list/data/task.dart';
import 'package:flutter_todo_list/view/edit_task_page.dart';
import 'package:flutter_todo_list/widgets/dismiss_backgroud.dart';
import 'package:flutter_todo_list/widgets/my_list_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      title: 'Localizations Sample App',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: FirstWidget(
        listNotifier: ListNotifier(listOfTask),
      ),
    );
  }
}

class FirstWidget extends StatelessWidget {
  const FirstWidget({super.key, required this.listNotifier});

  final ListNotifier listNotifier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ValueListenableBuilder<List<Task>>(
              valueListenable: listNotifier,
              builder: (context, value, child) {
                return Column(
                  children: [
                    Expanded(
                      child: value.isNotEmpty
                          ? ListView.builder(
                              itemCount: listOfTask.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Dismissible(
                                      secondaryBackground:
                                          const DismissBackground(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                      ),
                                      background: const DismissBackground(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                      ),
                                      onDismissed: (direction) =>
                                          listNotifier.removeTask(value[index]),
                                      key: ValueKey(value[index]),
                                      child: MyListTile(
                                        task: listOfTask[index],
                                        listNotifier: listNotifier,
                                      ),
                                    ),
                                  ))
                          : const Center(
                              child: Text(
                                "Add new Task",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                    ),
                    ColoredBox(
                      color: Colors.indigo.shade200,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'Done Task : ${listNotifier.listOfDownTask.length}')
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: listNotifier.listOfDownTask.length,
                            itemBuilder: (context, index) {
                              return MyListTile(
                                disableOnTap: true,
                                task: listNotifier.listOfDownTask[index],
                                listNotifier: listNotifier,
                              );
                            }))
                  ],
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditTaskPage(
                listNotifier: listNotifier,
              ),
            ));
          },
        ));
  }
}
