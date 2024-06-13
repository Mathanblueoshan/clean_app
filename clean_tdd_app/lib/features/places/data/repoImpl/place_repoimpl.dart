import 'package:clean_tdd_app/core/errors/failure.dart';
import 'package:clean_tdd_app/features/places/data/datasources/place_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/place_repo.dart';
import '../models/place_model.dart';

class PlacesRepoImpl implements PlacesRepo { //impl repo

  final PlacesDataSources placesDataSources; //get datasource class

  PlacesRepoImpl({required this.placesDataSources});  

  @override
Future<Either<Failure, List<PlaceModel>>> getPlaces() {

  return placesDataSources.getAllPlaces();

   

 
  }
  
}