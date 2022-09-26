// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phonetic_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhoneticAdapter extends TypeAdapter<Phonetic> {
  @override
  final int typeId = 1;

  @override
  Phonetic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Phonetic(
      text: fields[0] as String?,
      audio: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Phonetic obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.audio);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneticAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}