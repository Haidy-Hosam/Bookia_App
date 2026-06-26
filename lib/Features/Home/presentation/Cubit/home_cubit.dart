import 'package:bookia_app/Features/Home/data/Model/best_seller_response/best_seller_response.dart';
import 'package:bookia_app/Features/Home/data/Model/best_seller_response/datum.dart';
import 'package:bookia_app/Features/Home/data/Model/slider_response/slider.dart';
import 'package:bookia_app/Features/Home/data/Model/slider_response/slider_response.dart';
import 'package:bookia_app/Features/Home/data/repository/homerepo.dart';
import 'package:bookia_app/Features/Home/presentation/Cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeinitState());

  List<Slider> sliders = [];
  List<Datum> products = [];

  Future<void> loadInitData() async {
    emit(HomeLoadingState());

    var results = await Future.wait([
      HomeRepo.getslider(),
      HomeRepo.getbestseller(),
    ]);

    var slider_response = results[0] as SliderResponse?;
    var bestseller_response = results[1] as BestSellerResponse?;

    if (slider_response != null && bestseller_response != null) {
      products = bestseller_response.data ?? [];
      sliders = slider_response.data?.sliders ?? [];
      emit(HomeSuccessState());
    } else {
      emit(HomeErrorState("Something went wrong, Please try again"));
    }
  }
}
