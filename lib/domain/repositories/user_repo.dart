import 'package:dartz/dartz.dart';
import 'package:maha_test/domain/failures/failures.dart';
import 'package:maha_test/domain/model/user_entity.dart';

abstract class UserRepo{
  Future<Either<Failures, List<UserEntity>>> getUserFromDatasource();
}