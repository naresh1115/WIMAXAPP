// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostsRecord> _$postsRecordSerializer = new _$PostsRecordSerializer();

class _$PostsRecordSerializer implements StructuredSerializer<PostsRecord> {
  @override
  final Iterable<Type> types = const [PostsRecord, _$PostsRecord];
  @override
  final String wireName = 'PostsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('Title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.content;
    if (value != null) {
      result
        ..add('content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.profilepic;
    if (value != null) {
      result
        ..add('profilepic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.diaplayname;
    if (value != null) {
      result
        ..add('diaplayname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.department;
    if (value != null) {
      result
        ..add('department')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userprofilepic;
    if (value != null) {
      result
        ..add('userprofilepic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  PostsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'users':
          result.users = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'profilepic':
          result.profilepic = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'diaplayname':
          result.diaplayname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'department':
          result.department = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userprofilepic':
          result.userprofilepic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$PostsRecord extends PostsRecord {
  @override
  final String? title;
  @override
  final String? content;
  @override
  final DocumentReference<Object?>? users;
  @override
  final String? image;
  @override
  final DocumentReference<Object?>? profilepic;
  @override
  final String? diaplayname;
  @override
  final String? department;
  @override
  final String? userprofilepic;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PostsRecord([void Function(PostsRecordBuilder)? updates]) =>
      (new PostsRecordBuilder()..update(updates))._build();

  _$PostsRecord._(
      {this.title,
      this.content,
      this.users,
      this.image,
      this.profilepic,
      this.diaplayname,
      this.department,
      this.userprofilepic,
      this.ffRef})
      : super._();

  @override
  PostsRecord rebuild(void Function(PostsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostsRecordBuilder toBuilder() => new PostsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostsRecord &&
        title == other.title &&
        content == other.content &&
        users == other.users &&
        image == other.image &&
        profilepic == other.profilepic &&
        diaplayname == other.diaplayname &&
        department == other.department &&
        userprofilepic == other.userprofilepic &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, title.hashCode), content.hashCode),
                                users.hashCode),
                            image.hashCode),
                        profilepic.hashCode),
                    diaplayname.hashCode),
                department.hashCode),
            userprofilepic.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostsRecord')
          ..add('title', title)
          ..add('content', content)
          ..add('users', users)
          ..add('image', image)
          ..add('profilepic', profilepic)
          ..add('diaplayname', diaplayname)
          ..add('department', department)
          ..add('userprofilepic', userprofilepic)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PostsRecordBuilder implements Builder<PostsRecord, PostsRecordBuilder> {
  _$PostsRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  DocumentReference<Object?>? _users;
  DocumentReference<Object?>? get users => _$this._users;
  set users(DocumentReference<Object?>? users) => _$this._users = users;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  DocumentReference<Object?>? _profilepic;
  DocumentReference<Object?>? get profilepic => _$this._profilepic;
  set profilepic(DocumentReference<Object?>? profilepic) =>
      _$this._profilepic = profilepic;

  String? _diaplayname;
  String? get diaplayname => _$this._diaplayname;
  set diaplayname(String? diaplayname) => _$this._diaplayname = diaplayname;

  String? _department;
  String? get department => _$this._department;
  set department(String? department) => _$this._department = department;

  String? _userprofilepic;
  String? get userprofilepic => _$this._userprofilepic;
  set userprofilepic(String? userprofilepic) =>
      _$this._userprofilepic = userprofilepic;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PostsRecordBuilder() {
    PostsRecord._initializeBuilder(this);
  }

  PostsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _content = $v.content;
      _users = $v.users;
      _image = $v.image;
      _profilepic = $v.profilepic;
      _diaplayname = $v.diaplayname;
      _department = $v.department;
      _userprofilepic = $v.userprofilepic;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostsRecord;
  }

  @override
  void update(void Function(PostsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostsRecord build() => _build();

  _$PostsRecord _build() {
    final _$result = _$v ??
        new _$PostsRecord._(
            title: title,
            content: content,
            users: users,
            image: image,
            profilepic: profilepic,
            diaplayname: diaplayname,
            department: department,
            userprofilepic: userprofilepic,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
