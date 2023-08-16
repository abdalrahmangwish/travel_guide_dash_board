import 'package:flutter_travel_guide_dashborad/feature/add_places/presentation/blocs/activity_cubit/activity_cubit.dart';
import 'package:flutter_travel_guide_dashborad/feature/home_page/presentation/blocs/main_bloc/main_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton(() => ActivityCubit());
  sl.registerLazySingleton(() => MainCubit());
}
