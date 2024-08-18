// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginModelAdapter extends TypeAdapter<LoginModel> {
  @override
  final int typeId = 2;

  @override
  LoginModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginModel(
      id: fields[0] as int,
      name: fields[1] as String,
      username: fields[2] as String,
      email: fields[3] as String,
      image: fields[4] as String,
      status: fields[5] as bool,
      provider: fields[6] as String,
      providerId: fields[7] as String,
      phone: fields[8] as String,
      country: fields[9] as String,
      city: fields[10] as String,
      state: fields[11] as String,
      zipCode: fields[12] as String,
      address: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LoginModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.provider)
      ..writeByte(7)
      ..write(obj.providerId)
      ..writeByte(8)
      ..write(obj.phone)
      ..writeByte(9)
      ..write(obj.country)
      ..writeByte(10)
      ..write(obj.city)
      ..writeByte(11)
      ..write(obj.state)
      ..writeByte(12)
      ..write(obj.zipCode)
      ..writeByte(13)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
