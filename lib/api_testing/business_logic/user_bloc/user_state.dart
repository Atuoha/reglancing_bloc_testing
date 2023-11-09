part of 'user_bloc.dart';

class UserState extends Equatable {
  final List<User> users;
  final User user;
  final ProcessingStatus status;

  const UserState({
    required this.users,
    required this.user,
    required this.status,
  });

  factory UserState.initial() => UserState(
        users: const [],
        user: User.initial(),
        status: ProcessingStatus.initial,
      );

  @override
  List<Object> get props => [
        users,
        user,
        status,
      ];

  UserState copyWith({
    List<User>? users,
    User? user,
    ProcessingStatus? status,
  }) {
    return UserState(
      users: users ?? this.users,
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }
}
