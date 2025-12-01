class UserData {
  // Page 1 fields
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  
  // Page 2 fields
  final int age;
  final String gender;
  final String country;
  final String? bio;

  UserData({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.age,
    required this.gender,
    required this.country,
    this.bio,
  });

  // Create a copy with updated fields
  UserData copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? password,
    int? age,
    String? gender,
    String? country,
    String? bio,
  }) {
    return UserData(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      bio: bio ?? this.bio,
    );
  }
}