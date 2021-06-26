import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'to_do_list_record.g.dart';

abstract class ToDoListRecord
    implements Built<ToDoListRecord, ToDoListRecordBuilder> {
  static Serializer<ToDoListRecord> get serializer =>
      _$toDoListRecordSerializer;

  @nullable
  DateTime get toDoDate;

  @nullable
  String get toDoName;

  @nullable
  String get toDoDescription;

  @nullable
  bool get toDoState;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ToDoListRecordBuilder builder) => builder
    ..toDoName = ''
    ..toDoDescription = ''
    ..toDoState = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ToDoList');

  static Stream<ToDoListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ToDoListRecord._();
  factory ToDoListRecord([void Function(ToDoListRecordBuilder) updates]) =
      _$ToDoListRecord;

  static ToDoListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createToDoListRecordData({
  DateTime toDoDate,
  String toDoName,
  String toDoDescription,
  bool toDoState,
}) =>
    serializers.toFirestore(
        ToDoListRecord.serializer,
        ToDoListRecord((t) => t
          ..toDoDate = toDoDate
          ..toDoName = toDoName
          ..toDoDescription = toDoDescription
          ..toDoState = toDoState));

ToDoListRecord get dummyToDoListRecord {
  final builder = ToDoListRecordBuilder()
    ..toDoDate = dummyTimestamp
    ..toDoName = dummyString
    ..toDoDescription = dummyString
    ..toDoState = dummyBoolean;
  return builder.build();
}

List<ToDoListRecord> createDummyToDoListRecord({int count}) =>
    List.generate(count, (_) => dummyToDoListRecord);
