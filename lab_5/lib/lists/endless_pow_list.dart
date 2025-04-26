import 'package:flutter/material.dart';
import 'dart:math';

class InfiniteListPow extends StatefulWidget {
  const InfiniteListPow({super.key});

  @override
  State<InfiniteListPow> createState() => _PowerOfTwoListState();
}

class _PowerOfTwoListState extends State<InfiniteListPow> {
  int currentPower = 0;
  int batchSize = 10;

  // функция для степени двойки
  String powFunc(int exp) {
    final result = pow(2, exp);
    return '2 ^ $exp = $result';
  }

  @override
  Widget build(BuildContext context) {
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
        itemCount: currentPower + batchSize + 1,
        itemBuilder: (context, index) {
          if (index >= currentPower + batchSize) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) setState(() => currentPower += batchSize);
            });
            return const SizedBox();
          }

          return Column(
            children: [
              ListTile(title: Text(powFunc(index))),
              const Divider(height: 1),
            ],
          );
        },
      ),
    );
  }
}
