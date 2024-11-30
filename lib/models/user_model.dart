class UserModel {
  String? name;
  String? email;
  String? $id;
  String? $createdAt;
  String? $updatedAt;

  UserModel({
    this.name,
    this.email,
    this.$id,
    this.$createdAt,
    this.$updatedAt,
  });

  factory UserModel.fromJson(Map<String?, dynamic> json) => UserModel(
    name: json["name"], 
    email: json["email"], 
    $id: json["\$id"], 
    $createdAt: json["\$createdA"], 
    $updatedAt: json["\$updatedAt"]
  );

  Map<String?, dynamic> toJson() => {
    "name": name,
    "email": email,
    "\$id": $id,
    "\$createdAt": $createdAt,
    "\$updatedAt": $updatedAt
  };
}