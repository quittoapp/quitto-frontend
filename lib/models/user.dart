class User {
  late int id;
  late String email;
  late String fullName;
  late String photoUrl;
  late bool hasFinishedRegistration;
  late String fcmToken;
  late int cigarettesPerDay;
  late int timezoneOffset;
  late TimeWindow? timeWindow;
  late List<SmokingPermissions> smokingPermissions;

  User(
      {required this.id,
      required this.email,
      required this.fullName,
      required this.photoUrl,
      required this.hasFinishedRegistration,
      required this.fcmToken,
      required this.cigarettesPerDay,
      required this.timezoneOffset,
      required this.timeWindow,
      required this.smokingPermissions});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullName = json['fullName'];
    photoUrl = json['photoUrl'];
    hasFinishedRegistration = json['hasFinishedRegistration'];
    fcmToken = json['fcmToken'];
    cigarettesPerDay = json['cigarettesPerDay'];
    timezoneOffset = json['timezoneOffset'];
    timeWindow = json['timeWindow'] != null
        ? new TimeWindow.fromJson(json['timeWindow'])
        : null;
    if (json['smokingPermissions'] != null) {
      smokingPermissions = [];
      json['smokingPermissions'].forEach((v) {
        smokingPermissions.add(new SmokingPermissions.fromJson(v));
      });
    }
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
    if (this.timeWindow != null) {
      data['timeWindow'] = this.timeWindow?.toJson();
    }
    if (this.smokingPermissions != null) {
      data['smokingPermissions'] =
          this.smokingPermissions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TimeWindow {
  late String from;
  late String to;

  TimeWindow({required this.from, required this.to});

  TimeWindow.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}

class SmokingPermissions {
  late String date;
  late int id;

  SmokingPermissions({required this.date, required this.id});

  SmokingPermissions.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['id'] = this.id;
    return data;
  }
}
