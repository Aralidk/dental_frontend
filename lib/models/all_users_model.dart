class AllUsers {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? department;
  String? role;
  bool? enabled;
  String? username;
  List<Authorities>? authorities;
  bool? accountNonExpired;
  bool? accountNonLocked;
  bool? credentialsNonExpired;

  AllUsers(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.department,
        this.role,
        this.enabled,
        this.username,
        this.authorities,
        this.accountNonExpired,
        this.accountNonLocked,
        this.credentialsNonExpired});

  AllUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    department = json['department'];
    role = json['role'];
    enabled = json['enabled'];
    username = json['username'];
    if (json['authorities'] != null) {
      authorities = [];
      json['authorities'].forEach((v) {
        authorities!.add(Authorities.fromJson(v));
      });
    }
    accountNonExpired = json['accountNonExpired'];
    accountNonLocked = json['accountNonLocked'];
    credentialsNonExpired = json['credentialsNonExpired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['department'] = department;
    data['role'] = role;
    data['enabled'] = enabled;
    data['username'] = username;
    if (authorities != null) {
      data['authorities'] = authorities!.map((v) => v.toJson()).toList();
    }
    data['accountNonExpired'] = accountNonExpired;
    data['accountNonLocked'] = accountNonLocked;
    data['credentialsNonExpired'] = credentialsNonExpired;
    return data;
  }
}

class Authorities {
  String? authority;

  Authorities({this.authority});

  Authorities.fromJson(Map<String, dynamic> json) {
    authority = json['authority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authority'] = authority;
    return data;
  }
}
