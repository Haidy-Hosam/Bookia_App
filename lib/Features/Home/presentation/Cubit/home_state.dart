class HomeState {}

class HomeinitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState(this.message);
}
