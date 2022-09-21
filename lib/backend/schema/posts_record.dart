import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

  @BuiltValueField(wireName: 'Title')
  String? get title;

  String? get content;

  DocumentReference? get users;

  String? get image;

  DocumentReference? get profilepic;

  String? get diaplayname;

  String? get department;

  String? get userprofilepic;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PostsRecordBuilder builder) => builder
    ..title = ''
    ..content = ''
    ..image = ''
    ..diaplayname = ''
    ..department = ''
    ..userprofilepic = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PostsRecord._();
  factory PostsRecord([void Function(PostsRecordBuilder) updates]) =
      _$PostsRecord;

  static PostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPostsRecordData({
  String? title,
  String? content,
  DocumentReference? users,
  String? image,
  DocumentReference? profilepic,
  String? diaplayname,
  String? department,
  String? userprofilepic,
}) {
  final firestoreData = serializers.toFirestore(
    PostsRecord.serializer,
    PostsRecord(
      (p) => p
        ..title = title
        ..content = content
        ..users = users
        ..image = image
        ..profilepic = profilepic
        ..diaplayname = diaplayname
        ..department = department
        ..userprofilepic = userprofilepic,
    ),
  );

  return firestoreData;
}
