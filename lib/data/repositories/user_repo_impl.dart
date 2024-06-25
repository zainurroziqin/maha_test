import 'package:dartz/dartz.dart';
import 'package:maha_test/data/datasources/user_datasources.dart';
import 'package:maha_test/domain/failures/failures.dart';
import 'package:maha_test/domain/model/user_entity.dart';
import 'package:maha_test/domain/repositories/user_repo.dart';

class UserRepoImpl implements UserRepo{
  final UserRemoteDataSource userRemoteDataSource;
  const UserRepoImpl({required this.userRemoteDataSource}); 

  @override
  Future<Either<Failures, List<UserEntity>>> getUserFromDatasource() async{
    try{
      final result = await userRemoteDataSource.getUserFromApi();
      return right(result);
    }on ServerFailure catch(_){
      return left(ServerFailure());
    }catch(e){
      return left(GeneralFailure());
    }
  }
}