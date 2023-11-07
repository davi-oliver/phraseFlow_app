class ModelUser {
  String? email;
  String? name;
  String? password;
  String? country;
  String? sex;
  String? birthDate;
  String? createdAt;
  String? updatedAt;

  ModelUser(
      {this.email,
      this.name,
      this.password,
      this.country,
      this.sex,
      this.birthDate,
      this.createdAt,
      this.updatedAt});

  ModelUser.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    password = json['password'];
    country = json['country'];
    sex = json['sex'];
    birthDate = json['birthDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['password'] = this.password;
    data['country'] = this.country;
    data['sex'] = this.sex;
    data['birthDate'] = this.birthDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
