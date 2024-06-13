import 'package:clean_tdd_app/core/errors/failure.dart';
import 'package:clean_tdd_app/features/places/data/models/place_model.dart';
import 'package:clean_tdd_app/features/places/domain/entities/place_entity.dart';

final mockPlaceEntity =
    Place(
      name: "placeName", 
      address: "placeAddress", 
      type: "hotel"
      );


final List<Place> mockListofPlaces = [
  Place(name: "GKM park", address: "21,chennai, tamilnadu", type:'park'),
];

final mockFailure = Failure(message: "Server Failure");


final mockListofPlaceModel = [
const PlaceModel(name: "Le Tiers-Lieu de Bègles", address: "1 Place du 14 Juillet, 33130 Bègles", type:"coworking, coop"),
const PlaceModel(name: "Saint Seurin", address: "3, Place Lucien Victor Meunier", type:"brasserie"),
];