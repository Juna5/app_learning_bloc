import 'package:app_learning_bloc/pages/home/bloc/home_page_events.dart';
import 'package:app_learning_bloc/pages/home/bloc/home_page_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBlocs extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBlocs() : super(const HomePageStates()) {
    on<HomePageDots>(_homePageDots);
  }

  void _homePageDots(HomePageDots events, Emitter<HomePageStates> emit) {
    emit(state.copyWith(index: events.index));
  }
}
