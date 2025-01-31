// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoResponse _$InfoResponseFromJson(Map<String, dynamic> json) => InfoResponse(
      info: Info.fromJson(_readValue(json, 'data') as Map<String, dynamic>),
      error: json['error'] as bool,
    );

Map<String, dynamic> _$InfoResponseToJson(InfoResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.info,
    };

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      domain: json['domain'] as String,
      title: json['title'] as String,
      timezone: json['timezone'] as String,
      province: json['province'] as String,
      contact: Contact.fromJson(json['contact'] as Map<String, dynamic>),
      social: Social.fromJson(json['social'] as Map<String, dynamic>),
      api: Api.fromJson(json['api'] as Map<String, dynamic>),
      advert: Advert.fromJson(json['advert'] as Map<String, dynamic>),
      settings: Settings.fromJson(json['settings'] as Map<String, dynamic>),
      images: Images.fromJson(json['images'] as Map<String, dynamic>),
      staff: (json['staff'] as List<dynamic>)
          .map((e) => Staff.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'domain': instance.domain,
      'title': instance.title,
      'timezone': instance.timezone,
      'province': instance.province,
      'contact': instance.contact,
      'social': instance.social,
      'api': instance.api,
      'advert': instance.advert,
      'settings': instance.settings,
      'images': instance.images,
      'staff': instance.staff,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      phone: json['phone'] as String,
      whatsapp: json['whatsapp'] as String,
      email: json['email'] as String,
      phonePrefix: json['phone_prefix'] as String,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'email': instance.email,
      'phone_prefix': instance.phonePrefix,
    };

Social _$SocialFromJson(Map<String, dynamic> json) => Social(
      facebook: json['facebook'] as String,
      twitter: json['twitter'] as String,
      instagram: json['instagram'] as String,
      youtube: json['youtube'] as String,
    );

Map<String, dynamic> _$SocialToJson(Social instance) => <String, dynamic>{
      'facebook': instance.facebook,
      'twitter': instance.twitter,
      'instagram': instance.instagram,
      'youtube': instance.youtube,
    };

Api _$ApiFromJson(Map<String, dynamic> json) => Api(
      analytics: json['analytics'] as String,
      onesignal: OneSignal.fromJson(json['onesignal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiToJson(Api instance) => <String, dynamic>{
      'analytics': instance.analytics,
      'onesignal': instance.onesignal,
    };

OneSignal _$OneSignalFromJson(Map<String, dynamic> json) => OneSignal(
      appId: json['app_id'] as String,
      apiKey: json['apiKey'] as String,
      authKey: json['auth_key'] as String,
    );

Map<String, dynamic> _$OneSignalToJson(OneSignal instance) => <String, dynamic>{
      'app_id': instance.appId,
      'apiKey': instance.apiKey,
      'auth_key': instance.authKey,
    };

Advert _$AdvertFromJson(Map<String, dynamic> json) => Advert(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$AdvertToJson(Advert instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
    };

Settings _$SettingsFromJson(Map<String, dynamic> json) => Settings(
      show_hits: json['show_hits'] as bool,
      show_all_comments: json['show_all_comments'] as String,
      sections: Sections.fromJson(json['sections'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'show_hits': instance.show_hits,
      'show_all_comments': instance.show_all_comments,
      'sections': instance.sections,
    };

Sections _$SectionsFromJson(Map<String, dynamic> json) => Sections(
      cover: (json['cover'] as num).toInt(),
      topCover: (json['top_cover'] as num).toInt(),
      featured: (json['featured'] as num).toInt(),
    );

Map<String, dynamic> _$SectionsToJson(Sections instance) => <String, dynamic>{
      'cover': instance.cover,
      'top_cover': instance.topCover,
      'featured': instance.featured,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      logo: json['logo'] as String,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'logo': instance.logo,
    };

Staff _$StaffFromJson(Map<String, dynamic> json) => Staff(
      position: json['position'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$StaffToJson(Staff instance) => <String, dynamic>{
      'position': instance.position,
      'name': instance.name,
    };
