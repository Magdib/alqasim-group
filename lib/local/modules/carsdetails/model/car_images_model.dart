import 'package:hive/hive.dart';

part 'car_images_model.g.dart';

@HiveType(typeId: 1)
class CarImagesModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String carName;
  @HiveField(2)
  final List<String> images;

  CarImagesModel({
    required this.id,
    required this.carName,
    required this.images,
  });
}
