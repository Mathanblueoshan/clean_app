

import 'package:clean_tdd_app/core/usecase/usecase.dart';
import 'package:clean_tdd_app/features/places/domain/repositories/place_repo.dart';
import 'package:clean_tdd_app/features/places/domain/usecases/getplaces_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/migrated_mocks.dart';
import 'getplace_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PlacesRepo>()])   // this line replaced because fixed some errors @GenerateMocks([PlacesRepo]) .

// use this cmd:  flutter packages pub run build_runner build --delete-conflicting-outputs
void main(){

  final mockPlaceRepo = MockPlacesRepo();

  void setUpSuccessForGetPlaces(){
    when(mockPlaceRepo.getPlaces()).thenAnswer((realInvocation) async => Right(mockListofPlaces));
  }

   void setUpFailureForGetPlaces(){
    when(mockPlaceRepo.getPlaces()).thenAnswer((realInvocation) async => Left(mockFailure));
  }

group("GetPlaceUsecase test", () {

    test('While calling the getPlaceUsecase we  should get List of places', () async{
      
      setUpSuccessForGetPlaces();

      final GetPlacesUseCase getPlacesUseCase = GetPlacesUseCase(placesRepo: mockPlaceRepo);

      final result = await getPlacesUseCase(NoParams());

      expect(result.fold((l) => l, (r) => r), mockListofPlaces);
  });


  test("while calling the getplaceUsecase we should get Failure message", () async{

    setUpFailureForGetPlaces();

    final GetPlacesUseCase getPlacesUseCase = GetPlacesUseCase(placesRepo: mockPlaceRepo);

    final result= await getPlacesUseCase(NoParams());

    expect(result.fold((l) => l, (r) => r), mockFailure);

  });
 });
}