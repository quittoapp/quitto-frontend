class User {
  late int id;
  late String email;
  late String fullName;
  late String photoUrl;
  late bool hasFinishedRegistration;
  String? fcmToken;
  int? cigarettesPerDay;
  int? timezoneOffset;

  User(
      {required this.id,
      required this.email,
      required this.fullName,
      required this.photoUrl,
      required this.hasFinishedRegistration,
      this.fcmToken,
      this.cigarettesPerDay,
      this.timezoneOffset});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullName = json['fullName'];
    photoUrl = json['photoUrl'];
    hasFinishedRegistration = json['hasFinishedRegistration'];
    fcmToken = json['fcmToken'];
    cigarettesPerDay = json['cigarettesPerDay'];
    timezoneOffset = json['timezoneOffset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['photoUrl'] = this.photoUrl;
    data['hasFinishedRegistration'] = this.hasFinishedRegistration;
    data['fcmToken'] = this.fcmToken;
    data['cigarettesPerDay'] = this.cigarettesPerDay;
    data['timezoneOffset'] = this.timezoneOffset;
    return data;
  }
}
