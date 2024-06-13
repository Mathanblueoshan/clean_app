import 'package:clean_tdd_app/core/errors/failure.dart';
import 'package:clean_tdd_app/features/places/domain/entities/place_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PlacesRepo {  //abstract*

 Future<Either<Failure,List<Place>>> getPlaces();   //just declare the methods

}