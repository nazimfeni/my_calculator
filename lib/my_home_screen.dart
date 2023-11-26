import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  String? validateNumeric(String? value) {
    final RegExp numericRegex = RegExp(r'^[0-9.]+$');

    if (value == null || value.isEmpty || !numericRegex.hasMatch(value)) {
      return 'Numeric value required';
    }

    return null;
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController number1TEController = TextEditingController();
  TextEditingController number2TEController = TextEditingController();
  TextEditingController outputTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: number1TEController,
                decoration: const InputDecoration(
                  labelText: 'Number1',
                  border: OutlineInputBorder(),
                ),
                validator: validateNumeric,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: number2TEController,
                decoration: const InputDecoration(
                  labelText: 'Number2',
                  border: OutlineInputBorder(),
                ),
                validator: validateNumeric,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: outputTEController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Result',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      performCalculation('+');
                    }
                      },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add),
                      ],
                    ),
                  ),
                  ElevatedButton(

                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        performCalculation('-');
                      }
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.remove),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        performCalculation('*');
                      }
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          IconData(0x00D7,
                              fontFamily:
                                  'MaterialIcons'), // Unicode for the multiplication symbol (×)
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        performCalculation('/');
                      }
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          IconData(0x00F7,
                              fontFamily:
                                  'MaterialIcons'), // Unicode for the division symbol (÷)
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    number1TEController.dispose();
    number2TEController.dispose();
    outputTEController.dispose();
    super.dispose();
  }

  void performCalculation(String operator) {
    double num1 = double.tryParse(number1TEController.text) ?? 0.0;
    double num2 = double.tryParse(number2TEController.text) ?? 0.0;

    double result = 0.0;

    switch (operator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        if (num2 != 0) {
          result = num1 / num2;
        } else {
          // Handle division by zero error if needed
          // For example: result = double.infinity; or throw an exception
        }
        break;
      // You can add more cases for other operations as needed
      default:
        // Handle unsupported operations
        break;
    }

    outputTEController.text = result.toStringAsFixed(2);
  }
}
