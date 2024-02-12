/// Auth user entity
class UserEntity {
  final String id;
  final String email;
  final String phone;
  final String token;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? emailConfirmedAt;
  final DateTime? phoneConfirmedAt;
  final DateTime? lastSignInAt;

  UserEntity(
      {required this.id,
      required this.email,
      required this.phone,
      required this.token,
      required this.createdAt,
      required this.updatedAt,
      required this.emailConfirmedAt,
      required this.phoneConfirmedAt,
      required this.lastSignInAt});
}
