import 'package:fitness/features/app_sections/presentation/view_model/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationInitial());

  void changeIndex(int index) {
    emit(NavigationChanged(index));
  }
}