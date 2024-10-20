import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task_manager/feature/auth/login/domain/usecases/login_usecase.dart';
import 'package:task_manager/feature/auth/login/presentation/bloc/login_bloc.dart';
import 'package:task_manager/feature/task/data/repositories/task_repositories_impl.dart';
import 'package:task_manager/feature/task/domain/usecases/deleteTaskUseCase.dart';
import 'package:task_manager/feature/task/domain/usecases/editTaskUseCase.dart';
import 'package:task_manager/feature/task/domain/usecases/getAllTasks.dart';
import 'package:task_manager/feature/task/presentation/bloc/addTaskBloc/add_task_cubit.dart';
import 'package:task_manager/feature/task/presentation/bloc/deleteTaskBloc/delete_task_cubit.dart';
import 'package:task_manager/feature/task/presentation/bloc/editTaskBloc/edit_task_cubit.dart';
import 'package:task_manager/feature/task/presentation/bloc/viewTaskBloc/get_all_task_cubit.dart';
import 'core/cubit_public/check_internet_cubit.dart';
import 'core/cubit_public/drop_down_cubit.dart';
import 'core/cubit_public/navigator_bottom_cubit.dart';
import 'core/network/network_info.dart';
import 'feature/auth/login/data/datasource/LoginRemoteDataSource.dart';
import 'feature/auth/login/data/repositories/login_repo.dart';
import 'feature/auth/login/domain/repositories/login_repositories.dart';
import 'feature/task/data/datasource/task_local_data_source.dart';
import 'feature/task/data/datasource/task_remote_data_source.dart';
import 'feature/task/domain/repositories/task_repositories.dart';
import 'feature/task/domain/usecases/addTaskUseCase.dart';


final sl = GetIt.instance;
Future<void> init() async {

  sl.registerFactory(() => DropDownCubit());
//Feature - home =========================================

  //Bloc : ====================>
  // Feature - Login
  //Bloc : ====================>
  sl.registerLazySingleton(() => LoginCubit(loginUseCase: sl()));
  sl.registerLazySingleton(() => GetAllTaskCubit(getAllTasks: sl()));
  sl.registerLazySingleton(() => AddTaskCubit(addTaskUseCase: sl()));
  sl.registerLazySingleton(() => DeleteTaskCubit(deleteTaskUseCase: sl()));
  sl.registerLazySingleton(() => EditTaskCubit(editTaskUseCase: sl()));

  //UseCase : =================>
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => AddTaskUseCase(sl()));
  sl.registerLazySingleton(() => EditTaskUseCase(sl()));
  sl.registerLazySingleton(() => DeleteTaskUseCase(sl()));

  sl.registerLazySingleton(() => GetAllTasks(sl()));

  //DataSource :===============>
  // Feature - Login
  //Bloc : ====================>
  //UseCase : =================>
  //DataSource :===============>
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl());
  sl.registerLazySingleton<TaskRemoteDataSource>(
      () => TaskRemoteDataSourceImpl());
 sl.registerLazySingleton<TaskLocalDataSource>(
      () => TaskLocalDataSourceImpl());

  //Repository:================>
  sl.registerLazySingleton<LoginRepositories>(() => LoginRepositoriesImpl(
        loginRemoteDataSourceImpl: sl(),
        networkInfo: sl(),
      ));
  sl.registerLazySingleton<TaskRepo>(() => TaskRepositoriesImpl(
        taskRemoteDataSource: sl(),
        taskLocalDataSource: sl(),
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
