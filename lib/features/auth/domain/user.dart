import 'package:equatable/equatable.dart';

final class User extends Equatable {
  const User({
    required this.id,
    required this.email,
    this.firstName = '',
    this.lastName = '',
    this.avatar,
    this.bio,
    this.status,
    this.role,
    this.emailVerified = false,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    if (id == null) {
      throw const FormatException('User response is missing an id');
    }

    return .new(
      id: id.toString(),
      email: json['email'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      avatar: json['avatar'] as String?,
      bio: json['bio'] as String?,
      status: json['status'] as String?,
      role: json['role'] as String?,
      emailVerified: json['email_verified'] as bool? ?? false,
    );
  }

  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String? avatar;
  final String? bio;
  final String? status;
  final String? role;
  final bool emailVerified;

  String get displayName {
    final fullName = '$firstName $lastName'.trim();
    if (fullName.isNotEmpty) return fullName;
    return email;
  }

  @override
  List<Object?> get props => [
    id,
    email,
    firstName,
    lastName,
    avatar,
    bio,
    status,
    role,
    emailVerified,
  ];

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'first_name': firstName,
    'last_name': lastName,
    'avatar': avatar,
    'bio': bio,
    'status': status,
    'role': role,
    'email_verified': emailVerified,
  };
}
