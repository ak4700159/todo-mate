import 'dart:ui';

class Goal {
  Goal(
      {required this.description,
      required this.isPremium,
      required this.id,
      required this.name,
      required this.email,
      required this.profilePicture,
      required this.password});

  Goal.from(Map<String, dynamic> jsonData)
      : id = jsonData["user_id"],
        email = jsonData["email"],
        profilePicture = jsonData["profile_pictures"],
        name = jsonData["name"],
        isPremium = jsonData["is_premium"],
        password = jsonData["password"],
        description = jsonData["description"];

  Map<String, dynamic> toJson() => {
        "user_id": id,
        "name": name,
        "password": password,
        "email": email,
        "profile_pictures": profilePicture,
        "is_premium": isPremium,
        "description": description,
      };

  String id;
  String name;
  String email;
  String password;
  String description;
  Image profilePicture;
  bool isPremium = false;
}
