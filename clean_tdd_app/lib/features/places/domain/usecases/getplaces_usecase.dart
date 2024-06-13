import 'package:clean_tdd_app/core/errors/failure.dart';
import 'package:clean_tdd_app/core/usecase/usecase.dart';
import 'package:clean_tdd_app/features/places/domain/entities/place_entity.dart';
import 'package:clean_tdd_app/features/places/domain/repositories/place_repo.dart';
import 'package:dartz/dartz.dart';

class GetPlacesUseCase implements Usecase<List<Place>,NoParams>{   // implement common usecase

final PlacesRepo placesRepo;

  GetPlacesUseCase({required this.placesRepo});   //get repo

  @override                                                //put async-await
  Future<Either<Failure, List<Place>>> call(NoParams param) async {   //override the common usecase call function
    return await placesRepo.getPlaces();  //return repo method
  }
  
}