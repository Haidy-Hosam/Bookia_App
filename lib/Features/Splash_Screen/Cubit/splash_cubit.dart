// class SplashCubit extends Cubit<SplashState> {
//   SplashCubit() : super(SplashInitialState());

//   Future<void> getInitData() async {
//     if (SharedPref.getToken().isEmpty) {
//       emit(SplashErrorState());
//       return;
//     }
//     var data = await ProfileRepo.getProfile();
//     if (data != null) {
//       emit(SplashSuccessState());
//     } else {
//       emit(SplashErrorState());
//     }
//   }
// }