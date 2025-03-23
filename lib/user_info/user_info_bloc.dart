import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/services/service_locator.dart';
import '../core/services/shared_prefs_service.dart';
import '../core/utils/storage_keys.dart';
import '../features/auth/data/model/user_model.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc() : super(const UserInfoState()) {
    on<GetUserDataEvent>(_onGetUserEvent);
    on<RemoveUserDataEvent>(_onRemoveUserDataEvent);
  }

  _onGetUserEvent(GetUserDataEvent event, Emitter<UserInfoState> emit) async {
    final data =
        await getIt<SharedPrefServices>().getString(StorageKeys.userData);
    if (data != null) {
      emit(UserInfoState(user: UserModel.fromJson(jsonDecode(data))));
    }
  }

  _onRemoveUserDataEvent(
      RemoveUserDataEvent event, Emitter<UserInfoState> emit) {
    emit(const UserInfoState(user: null));
  }
}
