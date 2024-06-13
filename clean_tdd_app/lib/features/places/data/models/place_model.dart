import 'package:clean_tdd_app/features/places/domain/entities/place_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

@freezed
class PlaceModel extends Place with _$PlaceModel{

 const factory PlaceModel({
  required String name,
  required String address,
  required String type,
  }) = _PlaceModel;

factory PlaceModel.fromJson(Map<String,dynamic> json) => _$PlaceModelFromJson(json);

}