import 'package:flutter/material.dart';

class YourStoryWidget extends StatelessWidget {
  const YourStoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        children: [
          SizedBox(
            width: 55,
            height: 55,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/story1.png",
                  width: 55,
                  height: 55,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      color: Color(
                        0xff758ECE,
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "Your Story",
            style: TextStyle(fontSize: 9),
          ),
        ],
      ),
    );
  }
}