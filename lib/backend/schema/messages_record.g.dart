// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MessagesRecord> _$messagesRecordSerializer =
    new _$MessagesRecordSerializer();

class _$MessagesRecordSerializer
    implements StructuredSerializer<MessagesRecord> {
  @override
  final Iterable<Type> types = const [MessagesRecord, _$MessagesRecord];
  @override
  final String wireName = 'MessagesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MessagesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.messageBody;
    if (value != null) {
      result
        ..add('messageBody')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.created;
    if (value != null) {
      result
        ..add('created')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.moodIdx;
    if (value != null) {
      result
        ..add('moodIdx')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.updated;
    if (value != null) {
      result
        ..add('updated')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.sender;
    if (value != null) {
      result
        ..add('sender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.recipients;
    if (value != null) {
      result
        ..add('recipients')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.responses;
    if (value != null) {
      result
        ..add('responses')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.chat;
    if (value != null) {
      result
        ..add('chat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  MessagesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MessagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'messageBody':
          result.messageBody = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created':
          result.created = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'moodIdx':
          result.moodIdx = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'updated':
          result.updated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'sender':
          result.sender = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'recipients':
          result.recipients.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'responses':
          result.responses.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'chat':
          result.chat = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$MessagesRecord extends MessagesRecord {
  @override
  final String? messageBody;
  @override
  final DateTime? created;
  @override
  final int? moodIdx;
  @override
  final DateTime? updated;
  @override
  final int? status;
  @override
  final DocumentReference<Object?>? sender;
  @override
  final BuiltList<DocumentReference<Object?>>? recipients;
  @override
  final String? image;
  @override
  final BuiltList<DocumentReference<Object?>>? responses;
  @override
  final DocumentReference<Object?>? chat;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MessagesRecord([void Function(MessagesRecordBuilder)? updates]) =>
      (new MessagesRecordBuilder()..update(updates))._build();

  _$MessagesRecord._(
      {this.messageBody,
      this.created,
      this.moodIdx,
      this.updated,
      this.status,
      this.sender,
      this.recipients,
      this.image,
      this.responses,
      this.chat,
      this.ffRef})
      : super._();

  @override
  MessagesRecord rebuild(void Function(MessagesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessagesRecordBuilder toBuilder() =>
      new MessagesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessagesRecord &&
        messageBody == other.messageBody &&
        created == other.created &&
        moodIdx == other.moodIdx &&
        updated == other.updated &&
        status == other.status &&
        sender == other.sender &&
        recipients == other.recipients &&
        image == other.image &&
        responses == other.responses &&
        chat == other.chat &&
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
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, messageBody.hashCode),
                                            created.hashCode),
                                        moodIdx.hashCode),
                                    updated.hashCode),
                                status.hashCode),
                            sender.hashCode),
                        recipients.hashCode),
                    image.hashCode),
                responses.hashCode),
            chat.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MessagesRecord')
          ..add('messageBody', messageBody)
          ..add('created', created)
          ..add('moodIdx', moodIdx)
          ..add('updated', updated)
          ..add('status', status)
          ..add('sender', sender)
          ..add('recipients', recipients)
          ..add('image', image)
          ..add('responses', responses)
          ..add('chat', chat)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MessagesRecordBuilder
    implements Builder<MessagesRecord, MessagesRecordBuilder> {
  _$MessagesRecord? _$v;

  String? _messageBody;
  String? get messageBody => _$this._messageBody;
  set messageBody(String? messageBody) => _$this._messageBody = messageBody;

  DateTime? _created;
  DateTime? get created => _$this._created;
  set created(DateTime? created) => _$this._created = created;

  int? _moodIdx;
  int? get moodIdx => _$this._moodIdx;
  set moodIdx(int? moodIdx) => _$this._moodIdx = moodIdx;

  DateTime? _updated;
  DateTime? get updated => _$this._updated;
  set updated(DateTime? updated) => _$this._updated = updated;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  DocumentReference<Object?>? _sender;
  DocumentReference<Object?>? get sender => _$this._sender;
  set sender(DocumentReference<Object?>? sender) => _$this._sender = sender;

  ListBuilder<DocumentReference<Object?>>? _recipients;
  ListBuilder<DocumentReference<Object?>> get recipients =>
      _$this._recipients ??= new ListBuilder<DocumentReference<Object?>>();
  set recipients(ListBuilder<DocumentReference<Object?>>? recipients) =>
      _$this._recipients = recipients;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  ListBuilder<DocumentReference<Object?>>? _responses;
  ListBuilder<DocumentReference<Object?>> get responses =>
      _$this._responses ??= new ListBuilder<DocumentReference<Object?>>();
  set responses(ListBuilder<DocumentReference<Object?>>? responses) =>
      _$this._responses = responses;

  DocumentReference<Object?>? _chat;
  DocumentReference<Object?>? get chat => _$this._chat;
  set chat(DocumentReference<Object?>? chat) => _$this._chat = chat;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MessagesRecordBuilder() {
    MessagesRecord._initializeBuilder(this);
  }

  MessagesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _messageBody = $v.messageBody;
      _created = $v.created;
      _moodIdx = $v.moodIdx;
      _updated = $v.updated;
      _status = $v.status;
      _sender = $v.sender;
      _recipients = $v.recipients?.toBuilder();
      _image = $v.image;
      _responses = $v.responses?.toBuilder();
      _chat = $v.chat;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessagesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessagesRecord;
  }

  @override
  void update(void Function(MessagesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MessagesRecord build() => _build();

  _$MessagesRecord _build() {
    _$MessagesRecord _$result;
    try {
      _$result = _$v ??
          new _$MessagesRecord._(
              messageBody: messageBody,
              created: created,
              moodIdx: moodIdx,
              updated: updated,
              status: status,
              sender: sender,
              recipients: _recipients?.build(),
              image: image,
              responses: _responses?.build(),
              chat: chat,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'recipients';
        _recipients?.build();

        _$failedField = 'responses';
        _responses?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MessagesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
