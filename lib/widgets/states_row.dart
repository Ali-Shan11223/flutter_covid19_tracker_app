

import 'package:flutter/material.dart';

class StatesRow extends StatelessWidget {
  final dynamic title;
  final dynamic value;
  const StatesRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}