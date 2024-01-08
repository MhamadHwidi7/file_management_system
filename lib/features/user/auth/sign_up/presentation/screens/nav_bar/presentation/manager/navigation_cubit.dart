import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'navigation_state.dart';
part 'navigation_cubit.freezed.dart';

@injectable
class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState.initial());
  void updatePage(int index) {
    emit(NavigationState.navigateToIndex(index));
  }
}
