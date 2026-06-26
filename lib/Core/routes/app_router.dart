import 'package:bookia_app/Core/routes/routes.dart';
import 'package:bookia_app/Features/Home/presentation/home_page.dart';
import 'package:bookia_app/Features/Splash_Screen/splashscreen.dart';
import 'package:bookia_app/Features/authentication/presentation/Create%20new%20password/createnasswordScreen.dart';
import 'package:bookia_app/Features/authentication/presentation/Forget%20Password/forget_pass_screen.dart';
import 'package:bookia_app/Features/authentication/presentation/OTP%20Verification/otp_verification.dart';
import 'package:bookia_app/Features/authentication/presentation/PasswordChangedScreen/pass_changed_screen.dart';
import 'package:bookia_app/Features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:bookia_app/Features/authentication/presentation/login/page/login_screen.dart';
import 'package:bookia_app/Features/authentication/presentation/register/registerScreen.dart';
import 'package:bookia_app/main_screen.dart';
import 'package:bookia_app/Features/profile/presentation/edit_profile_screen.dart';
import 'package:bookia_app/Features/order/presentation/place_order_screen.dart';
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
        path: Routes.forgetPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const ForgetPasswordScreen(),
        ),
      ),
      // ========================================================================================== //
      GoRoute(
        path: Routes.otpVerification,
        builder: (context, state) => const OTP_Verification(),
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
        path: Routes.passwordChanged,
        builder: (context, state) => const PasswordChangedScreen(),
      ),
      // ========================================================================================== //
      GoRoute(
        path: Routes.editProfile,
        builder: (context, state) => const EditProfileScreen(),
      ),
      // ========================================================================================== //
      GoRoute(
        path: Routes.placeOrder,
        builder: (context, state) => const PlaceOrderScreen(),
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
