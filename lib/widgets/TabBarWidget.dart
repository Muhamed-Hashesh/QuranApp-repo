import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          // Content for the first tab
          GridView.count(
            crossAxisCount: 3,
            children: [
              // Add your tab content here
            ],
          ),
          // Content for the second tab
          GridView.count(
            crossAxisCount: 3,
            children: [
              // Add your tab content here
            ],
          ),
          // Content for the third tab
          Text("3")
        ],
      ),
    );
  }
}
