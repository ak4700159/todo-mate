import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomate/model/todos.dart';

class PeedScreen extends StatelessWidget {
  const PeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<Todos>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  todos.getData("");
                },
                child: const Text('투두 가져오기'),
              ),
              TextButton(
                onPressed: () {
                  todos.getData("");
                },
                child: const Text('투두 추가하기'),
              ),
              TextButton(
                onPressed: () {
                  todos.getData("");
                },
                child: const Text('투두 하나씩 빼기'),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              color: const Color(0xAAD1DAFA),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  subtitle: Text(
                    '빈문자열',
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 10,
                  color: Colors.black,
                );
              },
              // 수정할 필요있음
              itemCount: todos.todos.length,
            ),
          ),
        ],
      ),
    );
  }
}
