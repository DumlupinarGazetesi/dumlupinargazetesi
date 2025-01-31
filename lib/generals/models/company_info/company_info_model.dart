import 'package:dumlupinargazetesi/generals/models/status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_info_model.g.dart';

@JsonSerializable()
class InfoResponse extends Status {
  @JsonKey(name: "data", readValue: _readValue)
  final Info info;

  InfoResponse({required this.info, required super.error});

  factory InfoResponse.fromJson(Map<String, dynamic> json) => _$InfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$InfoResponseToJson(this);
}

Object? _readValue(json, field) => json['data']['info'];

@JsonSerializable()
class Info {
  final String domain;
  final String title;
  final String timezone;
  final String province;
  final Contact contact;
  final Social social;
  final Api api;
  final Advert advert;
  final Settings settings;
  final Images images;
  final List<Staff> staff;

  Info({
    required this.domain,
    required this.title,
    required this.timezone,
    required this.province,
    required this.contact,
    required this.social,
    required this.api,
    required this.advert,
    required this.settings,
    required this.images,
    required this.staff,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class Contact {
  final String phone;
  final String whatsapp;
  final String email;
  @JsonKey(name: "phone_prefix")
  final String phonePrefix;

  Contact({
    required this.phone,
    required this.whatsapp,
    required this.email,
    required this.phonePrefix,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}

@JsonSerializable()
class Social {
  final String facebook;
  final String twitter;
  final String instagram;
  final String youtube;

  Social({
    required this.facebook,
    required this.twitter,
    required this.instagram,
    required this.youtube,
  });

  factory Social.fromJson(Map<String, dynamic> json) => _$SocialFromJson(json);
  Map<String, dynamic> toJson() => _$SocialToJson(this);
}

@JsonSerializable()
class Api {
  final String analytics;
  final OneSignal onesignal;

  Api({required this.analytics, required this.onesignal});

  factory Api.fromJson(Map<String, dynamic> json) => _$ApiFromJson(json);
  Map<String, dynamic> toJson() => _$ApiToJson(this);
}

@JsonSerializable()
class OneSignal {
  @JsonKey(name: "app_id")
  final String appId;
  @JsonKey(name: "apiKey")
  final String apiKey;
  @JsonKey(name: "auth_key")
  final String authKey;

  OneSignal({required this.appId, required this.apiKey, required this.authKey});

  factory OneSignal.fromJson(Map<String, dynamic> json) => _$OneSignalFromJson(json);
  Map<String, dynamic> toJson() => _$OneSignalToJson(this);
}

@JsonSerializable()
class Advert {
  final String name;
  final String email;
  final String phone;

  Advert({required this.name, required this.email, required this.phone});

  factory Advert.fromJson(Map<String, dynamic> json) => _$AdvertFromJson(json);
  Map<String, dynamic> toJson() => _$AdvertToJson(this);
}

@JsonSerializable()
class Settings {
  final bool show_hits;
  final String show_all_comments;
  final Sections sections;

  Settings({required this.show_hits, required this.show_all_comments, required this.sections});

  factory Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}

@JsonSerializable()
class Sections {
  final int cover;
  @JsonKey(name: "top_cover")
  final int topCover;
  final int featured;

  Sections({required this.cover, required this.topCover, required this.featured});

  factory Sections.fromJson(Map<String, dynamic> json) => _$SectionsFromJson(json);
  Map<String, dynamic> toJson() => _$SectionsToJson(this);
}

@JsonSerializable()
class Images {
  final String logo;

  Images({required this.logo});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class Staff {
  final String position;
  final String name;

  Staff({required this.position, required this.name});

  factory Staff.fromJson(Map<String, dynamic> json) => _$StaffFromJson(json);
  Map<String, dynamic> toJson() => _$StaffToJson(this);
}
