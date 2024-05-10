class ToDoModel {
  final String name;
  final String email;

  ToDoModel({required this.name, required this.email});
  factory ToDoModel.fromJson(Map<String, dynamic> json) =>
      ToDoModel(name: json["name"], email: json["email"]);

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
    };
  }
}
