import 'package:flutter/cupertino.dart';

class PeedScreen extends StatelessWidget {
  const PeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        color: const Color(0xAAD1DAFA),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '피드 화면',
          ),
        ],
      ),
    );
  }
}
