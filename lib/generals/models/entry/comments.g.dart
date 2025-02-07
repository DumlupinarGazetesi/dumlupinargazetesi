// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comments _$CommentsFromJson(Map<String, dynamic> json) => Comments(
      error: json['error'] as bool,
      comments: (readValue(json, 'comments') as List<dynamic>?)
          ?.map(Comment.fromJson)
          .toList(),
    );

Map<String, dynamic> _$CommentsToJson(Comments instance) => <String, dynamic>{
      'error': instance.error,
      'comments': instance.comments,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: (json['id'] as num).toInt(),
      anonymName: json['anonym_name'] as String?,
      anonymEmail: json['anonym_email'] as String?,
      userName: json['user_name'] as String?,
      userEmail: json['user_email'] as String?,
      answerTo: json['answer_to'] as String?,
      subject: json['subject'] as String?,
      body: json['body'] as String?,
      likes: (json['likes'] as num?)?.toInt() ?? 0,
      dislikes: (json['dislikes'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'anonym_name': instance.anonymName,
      'anonym_email': instance.anonymEmail,
      'user_name': instance.userName,
      'user_email': instance.userEmail,
      'answer_to': instance.answerTo,
      'subject': instance.subject,
      'body': instance.body,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'createdAt': instance.createdAt,
    };
