import 'package:flutter/material.dart';
import 'package:meals_app/features/add/widgets/back_button.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Meal'),
        leading: const Row(children: [Spacer(), CustomBackButton()]),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Meal Name'),
            Text('Image Url'),
            Text('Rate'),
            Text('Minimum Expected Time'),
            Text('Maximum Expected Time'),
            Text('Description'),
          ],
        ),
      ),
    );
  }
}
