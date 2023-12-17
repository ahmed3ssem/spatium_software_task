import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spatium_software_task/core/api/app_interceptor.dart';
import 'package:spatium_software_task/core/api/dio_consumer.dart';
import 'package:spatium_software_task/core/network/network_info.dart';
import 'package:spatium_software_task/feature/numeric/presentation/cubit/numeric_cubit.dart';
import 'core/api/api_consumer.dart';

final sl = GetIt.instance;

Future<void> init() async{

  //Blocs
  sl.registerFactory(() => NumericCubit());

  //UseCase
  //sl.registerLazySingleton(() => LoginUseCase(loginRepository: sl()));

  //Repository
  //sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(loginRemoteDataSource: sl() , networkInfo: sl()));


  //DataSource
  //sl.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl(consumer: sl()));


  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));


  //External
  final sharedPreference = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreference);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => AppInterceptor());
  sl.registerLazySingleton(() => Dio());
}