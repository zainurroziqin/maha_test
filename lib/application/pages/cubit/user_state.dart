part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}
final class UserStateLoading extends UserState{}
final class UserStateLoaded extends UserState{
  final List<UserEntity> listUser;
  const UserStateLoaded({required this.listUser});
}
final class UserStateError extends UserState{
  final String message;
  const UserStateError({required this.message});
}
