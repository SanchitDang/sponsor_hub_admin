class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? type;
  final String? profilePic;
  final String? age;
  final String? location;
  final String? followers;
  final String? views;
  final String? socialMediaLink;
  final String? about;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.type,
    required this.profilePic,
    required this.age,
    required this.location,
    required this.followers,
    required this.views,
    required this.socialMediaLink,
    required this.about,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'type': type,
      'profilePic': profilePic,
      "age": age,
      "location": location,
      "followers": followers,
      "views": views,
      "socialMediaLink": socialMediaLink,
      "about": about,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['uid'],
      name: map['fullName'],
      email: map['email'],
      type: map['type'],
      profilePic: map['profilePic'],
      age: map['age'],
      location: map['location'],
      followers: map['followers'],
      views: map['views'],
      socialMediaLink: map['socialMediaLink'],
      about: map['about'],
    );
  }
}
