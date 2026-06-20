import 'package:flutter/material.dart';
import 'package:meals_app/app.dart';
import 'package:meals_app/core/services/onboarding_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OnboardingServices.initSharedPrefs();
  runApp(const MealsApp());
}
