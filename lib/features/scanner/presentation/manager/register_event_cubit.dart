import 'package:cis_logistics_app/features/scanner/data/repositories/register_event_repository.dart';
import 'package:cis_logistics_app/features/scanner/presentation/manager/register_event_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterEventCubit extends Cubit<RegisterEventStates> {
  RegisterEventCubit(this._registerEventRepository)
    : super(const RegisterEventStates.initial());

  final RegisterEventRepository _registerEventRepository;

  Future<void> registerEvent(String qrCode) async {
    if (state == RegisterEventStates.loading()) return;

    emit(const RegisterEventStates.loading());

    try {
      final response = await _registerEventRepository.registerEvent(qrCode);

      response.when(
        onSuccess: (data) => emit(RegisterEventStates.success(data)),
        onFailure: (error) => emit(RegisterEventStates.failure(error)),
      );
    } catch (e) {
      emit(RegisterEventStates.failure(e.toString()));
    }
  }

  void reset() => emit(const RegisterEventStates.initial());
}
