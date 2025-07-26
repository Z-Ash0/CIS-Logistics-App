import 'package:cis_logistics_app/core/newtorking/api_constants.dart';

enum UserRole { member, head }

extension UserRoleExtension on UserRole {
  String get endpoint {
    switch (this) {
      case UserRole.member:
        return EndPoints.member;
      case UserRole.head:
        return EndPoints.head;
    }
  }

  String get displayName {
    switch (this) {
      case UserRole.member:
        return 'Member';
      case UserRole.head:
        return 'Head';
    }
  }
}
