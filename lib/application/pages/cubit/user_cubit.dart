import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maha_test/domain/model/user_entity.dart';
import 'package:maha_test/domain/usecases/user_usecase.dart';
import 'package:maha_test/utils/failure_message.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userUsecases) : super(UserInitial());
  final UserUsecases userUsecases;

  void userRequest() async {
    emit(UserStateLoading());
    final failureOrSuccess = await userUsecases.getUser();
    failureOrSuccess.fold(
        (failure) => emit(UserStateError(
            message: FailureMessage.mapFailureToMessage(failure))),
        (success) => emit(UserStateLoaded(listUser: success)));
  }
}
