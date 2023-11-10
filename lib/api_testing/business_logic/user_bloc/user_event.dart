part of 'user_bloc.dart';

class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class RetrieveAllUsers extends UserEvent {}

class RetrieveUser extends UserEvent {
  final int userId;

  const RetrieveUser({required this.userId});
}
