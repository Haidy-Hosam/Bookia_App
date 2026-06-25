import 'package:bookia_app/core/routes/routes.dart';
import 'package:bookia_app/features/home/presentation/pages/home_page.dart';
import 'package:bookia_app/features/splash/presentation/pages/splash_screen.dart';
import 'package:bookia_app/features/authentication/presentation/pages/create_new_password_screen.dart';
import 'package:bookia_app/features/authentication/presentation/pages/forget_password_screen.dart';
import 'package:bookia_app/features/authentication/presentation/pages/otp_verification_screen.dart';
import 'package:bookia_app/features/authentication/presentation/pages/password_changed_screen.dart';
import 'package:bookia_app/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:bookia_app/features/authentication/presentation/pages/login_screen.dart';
import 'package:bookia_app/features/authentication/presentation/pages/register_screen.dart';
import 'package:bookia_app/features/main_layout/presentation/pages/main_layout_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static final routes = GoRouter(
    initialLocation: Routes.splash,
    // ========================================================================================== //
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const Splashscreen(),
      ),
      // ========================================================================================== //
      GoRoute(
        path: Routes.register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const RegisterScreen(),
        ),
      ),
      // ========================================================================================== //
      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const LoginScreen(),
        ),
      ),
      // ========================================================================================== //
      GoRoute(path: Routes.home, builder: (context, state) => const HomePage()),
      // ========================================================================================== //
      GoRoute(
        path: Routes.otpVerification,
        builder: (context, state) => const OtpVerificationScreen(),
      ),
      // ========================================================================================== //
      GoRoute(
        path: Routes.mainApp,
        builder: (context, state) => const MainAppScreen(),
      ),
      // ========================================================================================== //
      GoRoute(
        path: Routes.createPassword,
        builder: (context, state) => const CreatenewpasswordScreeen(),
      ),
      // ========================================================================================== //
      GoRoute(
        path: Routes.forgetPassword,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      // ========================================================================================== //
      GoRoute(
        path: Routes.passwordChanged,
        builder: (context, state) => const PasswordChangedScreen(),
      ),
      //       ShellRoute(
      //   builder: (context, state, child) {
      //     return MainLayout(
      //       child: child,
      //     );
      //   },
      //   routes: [
      //     ...
      //   ],
      // )
    ],
  );
}
