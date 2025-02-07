import 'package:dumlupinargazetesi/generals/models/models.dart';
import 'package:json_annotation/json_annotation.dart';
part 'comments.g.dart';

readValue(json, field) => json['data'][field];

@JsonSerializable()
class Comments extends Status {
  @JsonKey(name: 'comments', readValue: readValue)
  final List<Comment>? comments;

  Comments({required super.error, this.comments});


  factory Comments.fromJson(json) => _$CommentsFromJson(json);
}

@JsonSerializable()
class Comment {
  final int id;
  @JsonKey(name: "anonym_name")
  final String? anonymName;
  @JsonKey(name: "anonym_email")
  final String? anonymEmail;
  @JsonKey(name: "user_name")
  final String? userName;
  @JsonKey(name: "user_email")
  final String? userEmail;
  @JsonKey(name: "answer_to")
  final String? answerTo;
  final String? subject;
  final String? body;
  final int likes;
  final int dislikes;
  final String? createdAt;

  Comment({
    required this.id,
    this.anonymName,
    this.anonymEmail,
    this.userName,
    this.userEmail,
    this.answerTo,
    this.subject,
    this.body,
    this.likes = 0,
    this.dislikes = 0,
    this.createdAt,
  });

  factory Comment.fromJson(json) => _$CommentFromJson(json);

}
