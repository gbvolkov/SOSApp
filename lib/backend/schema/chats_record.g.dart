// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatsRecord> _$chatsRecordSerializer = new _$ChatsRecordSerializer();

class _$ChatsRecordSerializer implements StructuredSerializer<ChatsRecord> {
  @override
  final Iterable<Type> types = const [ChatsRecord, _$ChatsRecord];
  @override
  final String wireName = 'ChatsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChatsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.initiator;
    if (value != null) {
      result
        ..add('initiator')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.participants;
    if (value != null) {
      result
        ..add('participants')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.chatMessage;
    if (value != null) {
      result
        ..add('chatMessage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.chatImage;
    if (value != null) {
      result
        ..add('chatImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.chatMoodIdx;
    if (value != null) {
      result
        ..add('chatMoodIdx')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.messages;
    if (value != null) {
      result
        ..add('messages')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.startedAt;
    if (value != null) {
      result
        ..add('started_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.stoppedAt;
    if (value != null) {
      result
        ..add('stopped_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  ChatsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'initiator':
          result.initiator = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'participants':
          result.participants.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'chatMessage':
          result.chatMessage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'chatImage':
          result.chatImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'chatMoodIdx':
          result.chatMoodIdx = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'messages':
          result.messages.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'started_at':
          result.startedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'stopped_at':
          result.stoppedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$ChatsRecord extends ChatsRecord {
  @override
  final DocumentReference<Object?>? initiator;
  @override
  final BuiltList<DocumentReference<Object?>>? participants;
  @override
  final String? chatMessage;
  @override
  final String? chatImage;
  @override
  final int? chatMoodIdx;
  @override
  final BuiltList<DocumentReference<Object?>>? messages;
  @override
  final int? status;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? stoppedAt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChatsRecord([void Function(ChatsRecordBuilder)? updates]) =>
      (new ChatsRecordBuilder()..update(updates))._build();

  _$ChatsRecord._(
      {this.initiator,
      this.participants,
      this.chatMessage,
      this.chatImage,
      this.chatMoodIdx,
      this.messages,
      this.status,
      this.startedAt,
      this.stoppedAt,
      this.ffRef})
      : super._();

  @override
  ChatsRecord rebuild(void Function(ChatsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatsRecordBuilder toBuilder() => new ChatsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatsRecord &&
        initiator == other.initiator &&
        participants == other.participants &&
        chatMessage == other.chatMessage &&
        chatImage == other.chatImage &&
        chatMoodIdx == other.chatMoodIdx &&
        messages == other.messages &&
        status == other.status &&
        startedAt == other.startedAt &&
        stoppedAt == other.stoppedAt &&
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
                                    $jc($jc(0, initiator.hashCode),
                                        participants.hashCode),
                                    chatMessage.hashCode),
                                chatImage.hashCode),
                            chatMoodIdx.hashCode),
                        messages.hashCode),
                    status.hashCode),
                startedAt.hashCode),
            stoppedAt.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatsRecord')
          ..add('initiator', initiator)
          ..add('participants', participants)
          ..add('chatMessage', chatMessage)
          ..add('chatImage', chatImage)
          ..add('chatMoodIdx', chatMoodIdx)
          ..add('messages', messages)
          ..add('status', status)
          ..add('startedAt', startedAt)
          ..add('stoppedAt', stoppedAt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChatsRecordBuilder implements Builder<ChatsRecord, ChatsRecordBuilder> {
  _$ChatsRecord? _$v;

  DocumentReference<Object?>? _initiator;
  DocumentReference<Object?>? get initiator => _$this._initiator;
  set initiator(DocumentReference<Object?>? initiator) =>
      _$this._initiator = initiator;

  ListBuilder<DocumentReference<Object?>>? _participants;
  ListBuilder<DocumentReference<Object?>> get participants =>
      _$this._participants ??= new ListBuilder<DocumentReference<Object?>>();
  set participants(ListBuilder<DocumentReference<Object?>>? participants) =>
      _$this._participants = participants;

  String? _chatMessage;
  String? get chatMessage => _$this._chatMessage;
  set chatMessage(String? chatMessage) => _$this._chatMessage = chatMessage;

  String? _chatImage;
  String? get chatImage => _$this._chatImage;
  set chatImage(String? chatImage) => _$this._chatImage = chatImage;

  int? _chatMoodIdx;
  int? get chatMoodIdx => _$this._chatMoodIdx;
  set chatMoodIdx(int? chatMoodIdx) => _$this._chatMoodIdx = chatMoodIdx;

  ListBuilder<DocumentReference<Object?>>? _messages;
  ListBuilder<DocumentReference<Object?>> get messages =>
      _$this._messages ??= new ListBuilder<DocumentReference<Object?>>();
  set messages(ListBuilder<DocumentReference<Object?>>? messages) =>
      _$this._messages = messages;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  DateTime? _startedAt;
  DateTime? get startedAt => _$this._startedAt;
  set startedAt(DateTime? startedAt) => _$this._startedAt = startedAt;

  DateTime? _stoppedAt;
  DateTime? get stoppedAt => _$this._stoppedAt;
  set stoppedAt(DateTime? stoppedAt) => _$this._stoppedAt = stoppedAt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChatsRecordBuilder() {
    ChatsRecord._initializeBuilder(this);
  }

  ChatsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _initiator = $v.initiator;
      _participants = $v.participants?.toBuilder();
      _chatMessage = $v.chatMessage;
      _chatImage = $v.chatImage;
      _chatMoodIdx = $v.chatMoodIdx;
      _messages = $v.messages?.toBuilder();
      _status = $v.status;
      _startedAt = $v.startedAt;
      _stoppedAt = $v.stoppedAt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatsRecord;
  }

  @override
  void update(void Function(ChatsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatsRecord build() => _build();

  _$ChatsRecord _build() {
    _$ChatsRecord _$result;
    try {
      _$result = _$v ??
          new _$ChatsRecord._(
              initiator: initiator,
              participants: _participants?.build(),
              chatMessage: chatMessage,
              chatImage: chatImage,
              chatMoodIdx: chatMoodIdx,
              messages: _messages?.build(),
              status: status,
              startedAt: startedAt,
              stoppedAt: stoppedAt,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'participants';
        _participants?.build();

        _$failedField = 'messages';
        _messages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ChatsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
