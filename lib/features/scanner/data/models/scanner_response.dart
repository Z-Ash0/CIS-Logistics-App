import 'package:json_annotation/json_annotation.dart';
part 'scanner_response.g.dart';

@JsonSerializable()
class ScannerResponse {
  final String message;
  ScannerResponse({required this.message});

  factory ScannerResponse.fromJson(Map<String, dynamic> json) =>
      _$ScannerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ScannerResponseToJson(this);
}
