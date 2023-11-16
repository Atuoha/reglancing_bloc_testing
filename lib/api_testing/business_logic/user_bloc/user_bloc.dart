import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:re_glance_bloc_testing/api_testing/constants/enum/processing_status.dart';
import '../../models/user.dart';
import '../../repository/user_repo.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserState.initial()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<RetrieveAllUsers>(retrieveUsers);

    on<RetrieveUser>(retrieveUser);
  }

  Future<void> retrieveUsers(
      RetrieveAllUsers event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: ProcessingStatus.waiting));

    final List<User>? users = await userRepository.retrieveUsers();
    try {
      emit(state.copyWith(
        users: users,
        status: ProcessingStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProcessingStatus.error,
      ));
    }
  }

  Future<void> retrieveUser(RetrieveUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: ProcessingStatus.waiting));
    final User? user = await userRepository.retrieveUser(id: event.userId);
    try {
      emit(state.copyWith(
        user: user,
        status: ProcessingStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProcessingStatus.error,
      ));
    }
  }
}
