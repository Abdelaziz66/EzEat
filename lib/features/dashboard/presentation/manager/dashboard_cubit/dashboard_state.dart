part of 'dashboard_cubit.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}


class TabBarState extends DashboardState{}

class GetDashBoardDataLoadingState extends DashboardState{}
class GetDashBoardDataSuccessState extends DashboardState{
  final List<FoodEntity> food;

  GetDashBoardDataSuccessState(this.food);
}
class GetDashBoardDataErrorState extends DashboardState{
  final String errMessage;

  GetDashBoardDataErrorState(this.errMessage);
}

