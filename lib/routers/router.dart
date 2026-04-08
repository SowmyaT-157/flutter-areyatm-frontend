import 'package:arey_atm/screens/add_reminder.dart';
import 'package:arey_atm/screens/home_screen.dart';
import 'package:arey_atm/screens/signIn_screen.dart';
import 'package:arey_atm/screens/signUp_screen.dart';
import 'package:go_router/go_router.dart';
export './router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/register',
    routes: [
      GoRoute(path: '/register', builder: (context, state) => SignUp()),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => SignIn(),
      ),
      GoRoute(
        path: '/homePage',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/addReminder',
        name: 'reminder screen',
        builder: (context, state) => const AddReminder(),
      ),
    ],
  );
}
