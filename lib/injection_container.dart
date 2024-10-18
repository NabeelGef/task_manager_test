import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task_manager/feature/auth/login/domain/usecases/login_usecase.dart';
import 'package:task_manager/feature/auth/login/presentation/bloc/login_bloc.dart';
import 'core/cubit_public/check_internet_cubit.dart';
import 'core/cubit_public/drop_down_cubit.dart';
import 'core/cubit_public/navigator_bottom_cubit.dart';
import 'core/network/network_info.dart';
import 'feature/auth/login/data/datasource/LoginRemoteDataSource.dart';
import 'feature/auth/login/data/repositories/login_repo.dart';
import 'feature/auth/login/domain/repositories/login_repositories.dart';


final sl = GetIt.instance;
Future<void> init() async {

  sl.registerFactory(() => DropDownCubit());
//Feature - home =========================================

  //Bloc : ====================>
  // Feature - Login
  //Bloc : ====================>
  sl.registerLazySingleton(() => LoginCubit(loginUseCase: sl()));
  //UseCase : =================>
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  //DataSource :===============>
  // Feature - Login
  //Bloc : ====================>
  //UseCase : =================>
  //DataSource :===============>
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl());

  //Repository:================>
  sl.registerLazySingleton<LoginRepositories>(() => LoginRepositoriesImpl(
        loginRemoteDataSourceImpl: sl(),
        networkInfo: sl(),
      ));
  //=================================================

//Core : ====================>
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerFactory(() => NavigatorBottomCubit());
  sl.registerFactory(() => CheckInternetCubit());

//External : ================>
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
