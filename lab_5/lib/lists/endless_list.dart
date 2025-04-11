import 'package:flutter/material.dart';

class InfiniteList extends StatefulWidget {
  const InfiniteList({super.key});

  @override
  State<InfiniteList> createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  final List<String> items = [];
  int counter = 0;
  int batchSize = 10; // строки на подгрузку

  @override
  Widget build(BuildContext context) {
    // генерация новых строк при каждом построении
    while (items.length < counter + batchSize) {
      items.add('Строка ${items.length}');
    }
    counter = items.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Список элементов',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index >= items.length) {
            // обновление состояния
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) setState(() {});
            });
            return const SizedBox();
          }
          return Column(
            children: [ListTile(title: Text(items[index])), Divider()],
          );
        },
      ),
    );
  }
}
