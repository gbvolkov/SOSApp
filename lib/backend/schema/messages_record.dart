import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'messages_record.g.dart';

abstract class MessagesRecord
    implements Built<MessagesRecord, MessagesRecordBuilder> {
  static Serializer<MessagesRecord> get serializer =>
      _$messagesRecordSerializer;

  String? get messageBody;

  DateTime? get created;

  int? get moodIdx;

  DateTime? get updated;

  int? get status;

  DocumentReference? get sender;

  BuiltList<DocumentReference>? get recipients;

  String? get image;

  BuiltList<DocumentReference>? get responses;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MessagesRecordBuilder builder) => builder
    ..messageBody = ''
    ..moodIdx = 0
    ..status = 0
    ..recipients = ListBuilder()
    ..image = ''
    ..responses = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MessagesRecord._();
  factory MessagesRecord([void Function(MessagesRecordBuilder) updates]) =
      _$MessagesRecord;

  static MessagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMessagesRecordData({
  String? messageBody,
  DateTime? created,
  int? moodIdx,
  DateTime? updated,
  int? status,
  DocumentReference? sender,
  String? image,
}) {
  final firestoreData = serializers.toFirestore(
    MessagesRecord.serializer,
    MessagesRecord(
      (m) => m
        ..messageBody = messageBody
        ..created = created
        ..moodIdx = moodIdx
        ..updated = updated
        ..status = status
        ..sender = sender
        ..recipients = null
        ..image = image
        ..responses = null,
    ),
  );

  return firestoreData;
}
