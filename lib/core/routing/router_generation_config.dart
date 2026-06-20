import 'package:go_router/go_router.dart';
import 'package:meals_app/core/routing/app_routes.dart';
import 'package:meals_app/core/services/onboarding_services.dart';
import 'package:meals_app/features/home/screens/home.dart';
import 'package:meals_app/features/onboarding/screens/onboarding.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: OnboardingServices.isFIrstTime() ? AppRoutes.onboarding : AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        builder: (context, state) => const Onboarding(),
      ),

      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => const Home(),
      ),
    ],
  );
}
