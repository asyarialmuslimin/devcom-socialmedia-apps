import 'package:flutter/material.dart';

class DemoWidget extends StatefulWidget {
  const DemoWidget({super.key});

  @override
  State<DemoWidget> createState() => _DemoWidgetState();
}

class _DemoWidgetState extends State<DemoWidget> {
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
              value: isRemember,
              onChanged: (isChecked) {
                if (isChecked != null) {
                  setState(() {
                    isRemember = isChecked;
                  });
                }
              }),
          SizedBox(
            width: 8,
          ),
          Text("Remember Me"),
        ],
      ),
    );
  }
}
