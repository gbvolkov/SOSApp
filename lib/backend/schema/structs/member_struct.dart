import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'member_struct.g.dart';

abstract class MemberStruct
    implements Built<MemberStruct, MemberStructBuilder> {
  static Serializer<MemberStruct> get serializer => _$memberStructSerializer;

  DocumentReference? get member;

  int? get status;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(MemberStructBuilder builder) => builder
    ..status = 0
    ..firestoreUtilData = FirestoreUtilData();

  MemberStruct._();
  factory MemberStruct([void Function(MemberStructBuilder) updates]) =
      _$MemberStruct;
}

MemberStruct createMemberStruct({
  DocumentReference? member,
  int? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool delete = false,
}) =>
    MemberStruct(
      (m) => m
        ..member = member
        ..status = status
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

MemberStruct? updateMemberStruct(
  MemberStruct? member, {
  bool clearUnsetFields = true,
}) =>
    member != null
        ? (member.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addMemberStructData(
  Map<String, dynamic> firestoreData,
  MemberStruct? member,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (member == null) {
    return;
  }
  if (member.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (forFieldValue && member.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = {};
  }
  final memberData = getMemberFirestoreData(member, forFieldValue);
  final nestedData = memberData.map((k, v) => MapEntry('$fieldName.$k', v));
  firestoreData.addAll(nestedData);
  return;
}

Map<String, dynamic> getMemberFirestoreData(
  MemberStruct? member, [
  bool forFieldValue = false,
]) {
  if (member == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(MemberStruct.serializer, member);

  // Add any Firestore field values
  member.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMemberListFirestoreData(
  List<MemberStruct>? members,
) =>
    members?.map((m) => getMemberFirestoreData(m, true)).toList() ?? [];
