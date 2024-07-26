class SocialMediaAuthModel {
  final String? name;
  final String email;

  SocialMediaAuthModel({
    required this.email,
     this.name,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonMap = {
      'email': email,
      if (name != null) 'name': name,
    };
    return jsonMap;
  }
}
