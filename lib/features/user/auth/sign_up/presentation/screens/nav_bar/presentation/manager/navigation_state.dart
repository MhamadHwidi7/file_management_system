part of 'navigation_cubit.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.initial() = _Initial;
  const factory NavigationState.navigateToIndex(int index) = _NavigateToIndex;
}
