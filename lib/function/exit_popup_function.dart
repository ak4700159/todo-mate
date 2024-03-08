import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

showExitPopup(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(Icons.exit_to_app),
          shape: Border.all(width: 1),
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          content: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '나가시겠습니까?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                '취소',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text(
                '종료',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        );
      });
}
