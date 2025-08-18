import 'package:cis_logistics_app/features/scanner/data/models/scanner_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_event_states.freezed.dart';

@Freezed()
class RegisterEventStates with _$RegisterEventStates {
  const factory RegisterEventStates.initial() = _Initial;
  const factory RegisterEventStates.loading() = _Loading;
  const factory RegisterEventStates.success(ScannerResponse response) =
      _Success;
  const factory RegisterEventStates.failure(String message) = _Failure;
}
