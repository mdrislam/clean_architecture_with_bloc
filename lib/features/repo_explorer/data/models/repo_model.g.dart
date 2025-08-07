// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepoModelAdapter extends TypeAdapter<RepoModel> {
  @override
  final int typeId = 0;

  @override
  RepoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RepoModel(
      id: fields[0] as int,
      name: fields[1] as String,
      fullName: fields[2] as String,
      description: fields[3] as String?,
      stars: fields[4] as int,
      forks: fields[5] as int,
      ownerName: fields[6] as String,
      ownerAvatarUrl: fields[7] as String,
      htmlUrl: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RepoModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.stars)
      ..writeByte(5)
      ..write(obj.forks)
      ..writeByte(6)
      ..write(obj.ownerName)
      ..writeByte(7)
      ..write(obj.ownerAvatarUrl)
      ..writeByte(8)
      ..write(obj.htmlUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
