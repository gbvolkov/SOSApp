import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chats_record.g.dart';

abstract class ChatsRecord implements Built<ChatsRecord, ChatsRecordBuilder> {
  static Serializer<ChatsRecord> get serializer => _$chatsRecordSerializer;

  DocumentReference? get initiator;

  BuiltList<DocumentReference>? get participants;

  String? get chatMessage;

  String? get chatImage;

  int? get chatMoodIdx;

  BuiltList<DocumentReference>? get messages;

  int? get status;

  @BuiltValueField(wireName: 'started_at')
  DateTime? get startedAt;

  @BuiltValueField(wireName: 'stopped_at')
  DateTime? get stoppedAt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChatsRecordBuilder builder) => builder
    ..participants = ListBuilder()
    ..chatMessage = ''
    ..chatImage = ''
    ..chatMoodIdx = 0
    ..messages = ListBuilder()
    ..status = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChatsRecord._();
  factory ChatsRecord([void Function(ChatsRecordBuilder) updates]) =
      _$ChatsRecord;

  static ChatsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChatsRecordData({
  DocumentReference? initiator,
  String? chatMessage,
  String? chatImage,
  int? chatMoodIdx,
  int? status,
  DateTime? startedAt,
  DateTime? stoppedAt,
}) {
  final firestoreData = serializers.toFirestore(
    ChatsRecord.serializer,
    ChatsRecord(
      (c) => c
        ..initiator = initiator
        ..participants = null
        ..chatMessage = chatMessage
        ..chatImage = chatImage
        ..chatMoodIdx = chatMoodIdx
        ..messages = null
        ..status = status
        ..startedAt = startedAt
        ..stoppedAt = stoppedAt,
    ),
  );

  return firestoreData;
}
