class UserModel {
  String name;
  String firstName;
  String email;
  String password;
  String image;
  String registeredDate;

  UserModel({
    required this.name,
    required this.firstName,
    required this.email,
    required this.password,
    required this.image,
    required this.registeredDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      firstName: json['firstName'],
      email: json['email'],
      password: json['password'],
      image: json['image'],
      registeredDate: json['registeredDate'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['firstName'] = firstName;
    data['email'] = email;
    data['password'] = password;
    data['image'] = image;
    data['registeredDate'] = registeredDate;
    return data;
  }
}
