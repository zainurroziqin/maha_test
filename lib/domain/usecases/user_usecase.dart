import 'package:dartz/dartz.dart';
import 'package:maha_test/domain/failures/failures.dart';
import 'package:maha_test/domain/model/user_entity.dart';
import 'package:maha_test/domain/repositories/user_repo.dart';

class UserUsecases{
  final UserRepo userRepo;
  const UserUsecases({required this.userRepo});

  Future<Either<Failures, List<UserEntity>>> getUser()async{
    return userRepo.getUserFromDatasource();
  }
}