import 'package:get_it/get_it.dart';
import 'package:maha_test/application/pages/cubit/user_cubit.dart';
import 'package:maha_test/data/datasources/user_datasources.dart';
import 'package:maha_test/data/repositories/user_repo_impl.dart';
import 'package:maha_test/domain/repositories/user_repo.dart';
import 'package:maha_test/domain/usecases/user_usecase.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I;

Future<void> init()async{
  //Aplication Layer
  sl.registerFactory(() => UserCubit(sl()));

  //Domain Layer
  sl.registerFactory(() => UserUsecases(userRepo: sl()));

  //Data Layer
  sl.registerFactory<UserRepo>(() => UserRepoImpl(userRemoteDataSource: sl()));
  sl.registerFactory<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(client: sl()));

  //External
  sl.registerFactory(() => http.Client());
}