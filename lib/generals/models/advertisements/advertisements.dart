import 'package:dumlupinargazetesi/generals/models/advertisements/advertisement.dart';
import 'package:dumlupinargazetesi/generals/models/status_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'advertisements.g.dart';

@JsonSerializable()
class Advertisements extends Status {
  @JsonKey(name: "data")
  final Data? data;

  Advertisements({
    required super.error,
    this.data,
  });

  factory Advertisements.fromJson(Map<String, dynamic> json) => _$AdvertisementsFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertisementsToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "channel")
  final Channel? channel;
  @JsonKey(name: "adverts")
  final List<Advertisement>? adverts;

  Data({
    this.channel,
    this.adverts,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}



@JsonSerializable()
class Channel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "tag")
  final String? tag;

  Channel({
    this.id,
    this.tag,
  });

  factory Channel.fromJson(Map<String, dynamic> json) => _$ChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}
