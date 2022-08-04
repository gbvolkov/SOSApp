// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MemberStruct> _$memberStructSerializer =
    new _$MemberStructSerializer();

class _$MemberStructSerializer implements StructuredSerializer<MemberStruct> {
  @override
  final Iterable<Type> types = const [MemberStruct, _$MemberStruct];
  @override
  final String wireName = 'MemberStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, MemberStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.member;
    if (value != null) {
      result
        ..add('member')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  MemberStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MemberStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'member':
          result.member = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$MemberStruct extends MemberStruct {
  @override
  final DocumentReference<Object?>? member;
  @override
  final int? status;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$MemberStruct([void Function(MemberStructBuilder)? updates]) =>
      (new MemberStructBuilder()..update(updates))._build();

  _$MemberStruct._({this.member, this.status, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'MemberStruct', 'firestoreUtilData');
  }

  @override
  MemberStruct rebuild(void Function(MemberStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MemberStructBuilder toBuilder() => new MemberStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MemberStruct &&
        member == other.member &&
        status == other.status &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, member.hashCode), status.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MemberStruct')
          ..add('member', member)
          ..add('status', status)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class MemberStructBuilder
    implements Builder<MemberStruct, MemberStructBuilder> {
  _$MemberStruct? _$v;

  DocumentReference<Object?>? _member;
  DocumentReference<Object?>? get member => _$this._member;
  set member(DocumentReference<Object?>? member) => _$this._member = member;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  MemberStructBuilder() {
    MemberStruct._initializeBuilder(this);
  }

  MemberStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _member = $v.member;
      _status = $v.status;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MemberStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MemberStruct;
  }

  @override
  void update(void Function(MemberStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MemberStruct build() => _build();

  _$MemberStruct _build() {
    final _$result = _$v ??
        new _$MemberStruct._(
            member: member,
            status: status,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'MemberStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
