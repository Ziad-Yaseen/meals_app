import 'package:flutter/material.dart';
import 'package:meals_app/features/home/widgets/appbar_image.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Column(children: [AppbarImage()]));
  }
}
