import 'package:flutter/material.dart';

class ArithmeticScreen extends StatefulWidget {
  const ArithmeticScreen({super.key});

  @override
  _ArithmeticScreenState createState() => _ArithmeticScreenState();
}

class _ArithmeticScreenState extends State<ArithmeticScreen> {
  // Controllers for input fields
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();

  String result = "";

  // Function to perform operations
  void performOperation(String operation) {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;

    setState(() {
      switch (operation) {
        case 'Add':
          result = (num1 + num2).toStringAsFixed(2);
          break;
        case 'Subtract':
          result = (num1 - num2).toStringAsFixed(2);
          break;
        case 'Multiply':
          result = (num1 * num2).toStringAsFixed(2);
          break;
        case 'Divide':
          if (num2 != 0) {
            result = (num1 / num2).toStringAsFixed(2);
          } else {
            result = "Cannot divide by zero";
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arithmetic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First number input
            TextField(
              controller: num1Controller,
              decoration: const InputDecoration(
                labelText: 'Enter first number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            // Second number input
            TextField(
              controller: num2Controller,
              decoration: const InputDecoration(
                labelText: 'Enter second number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            // Result display
            Text(
              'Result: $result',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Row with buttons for arithmetic operations
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => performOperation('Add'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA7D2E5), // Button color
                  ),
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () => performOperation('Subtract'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA7D2E5), // Button color
                  ),
                  child: const Text('Subtract'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => performOperation('Multiply'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA7D2E5), // Button color
                  ),
                  child: const Text('Multiply'),
                ),
                ElevatedButton(
                  onPressed: () => performOperation('Divide'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA7D2E5), // Button color
                  ),
                  child: const Text('Divide'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
