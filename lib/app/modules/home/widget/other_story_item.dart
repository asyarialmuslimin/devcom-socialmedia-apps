import 'package:flutter/material.dart';

class OtherStoryItem extends StatelessWidget {
  final String imagePath;
  final String userName;
  const OtherStoryItem(
      {super.key, required this.imagePath, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 55,
            height: 55,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            userName,
            style: TextStyle(fontSize: 9),
          ),
        ],
      ),
    );
  }
}
