import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  String? get password;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get uid;

  String? get bio;

  String? get department;

  @BuiltValueField(wireName: 'Skills')
  String? get skills;

  String? get domain;

  String? get college;

  @BuiltValueField(wireName: 'Following')
  BuiltList<DocumentReference>? get following;

  @BuiltValueField(wireName: 'Follower_list_ref')
  BuiltList<DocumentReference>? get followerListRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..password = ''
    ..photoUrl = ''
    ..phoneNumber = ''
    ..uid = ''
    ..bio = ''
    ..department = ''
    ..skills = ''
    ..domain = ''
    ..college = ''
    ..following = ListBuilder()
    ..followerListRef = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => UsersRecord(
        (c) => c
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..email = snapshot.data['email']
          ..displayName = snapshot.data['display_name']
          ..password = snapshot.data['password']
          ..photoUrl = snapshot.data['photo_url']
          ..phoneNumber = snapshot.data['phone_number']
          ..uid = snapshot.data['uid']
          ..bio = snapshot.data['bio']
          ..department = snapshot.data['department']
          ..skills = snapshot.data['Skills']
          ..domain = snapshot.data['domain']
          ..college = snapshot.data['college']
          ..following = safeGet(() =>
              ListBuilder(snapshot.data['Following'].map((s) => toRef(s))))
          ..followerListRef = safeGet(() => ListBuilder(
              snapshot.data['Follower_list_ref'].map((s) => toRef(s))))
          ..ffRef = UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  DateTime? createdTime,
  String? email,
  String? displayName,
  String? password,
  String? photoUrl,
  String? phoneNumber,
  String? uid,
  String? bio,
  String? department,
  String? skills,
  String? domain,
  String? college,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..createdTime = createdTime
        ..email = email
        ..displayName = displayName
        ..password = password
        ..photoUrl = photoUrl
        ..phoneNumber = phoneNumber
        ..uid = uid
        ..bio = bio
        ..department = department
        ..skills = skills
        ..domain = domain
        ..college = college
        ..following = null
        ..followerListRef = null,
    ),
  );

  return firestoreData;
}
