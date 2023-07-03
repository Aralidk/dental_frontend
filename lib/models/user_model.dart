class UserModel {
  int? id;
  String? token;
  String? role;
  String? firstName;
  String? email;
  String? lastName;
  String? department;
  UserModel(
      {this.token,
      this.role,
      this.firstName,
      this.lastName,
      this.email,
      this.department, this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    department = json['department'];
    role = json['role'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['department'] = department;
    data['role'] = role;
    data['id'] = id;
    return data;
  }
}
