class UserData {
  final String name;
  final String email;
  final String phoneNumber;
  final String gender;
  String? password;

  UserData({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    this.password,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'password': password,
    };
  }

  UserData copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? gender,
    String? password,
  }) {
    return UserData(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      password: password ?? this.password,
    );
  }
}
