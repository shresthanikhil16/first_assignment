import 'package:flutter/material.dart';
import 'dart:math';

class AreaOfCircleScreen extends StatelessWidget {
  final TextEditingController radiusController = TextEditingController();

  AreaOfCircleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area of Circle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: radiusController,
              decoration: const InputDecoration(labelText: 'Radius'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double radius = double.parse(radiusController.text);
                double area = pi * pow(radius, 2);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Area of Circle'),
                    content: Text('Area: ${area.toStringAsFixed(2)}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Calculate Area'),
            ),
          ],
        ),
      ),
    );
  }
}
