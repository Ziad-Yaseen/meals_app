import 'package:flutter/material.dart';
import 'package:meals_app/app.dart';
import 'package:meals_app/core/services/onboarding_services.dart';
import 'package:meals_app/features/home/data/db/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DBHelper dbHelper = DBHelper.instance;
  await OnboardingServices.initSharedPrefs();
  runApp(const MealsApp());
}
