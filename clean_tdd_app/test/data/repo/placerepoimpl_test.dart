import 'package:clean_tdd_app/features/places/data/datasources/place_datasource.dart';
import 'package:clean_tdd_app/features/places/data/repoImpl/place_repoimpl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/migrated_mocks.dart';
import 'placerepoimpl_test.mocks.dart';

@GenerateMocks([PlacesDataSources])
void main(){

final MockPlacesDataSources mockPlacesDataSources = MockPlacesDataSources();

void setUpSuccessForGetPlaces(){
  when(mockPlacesDataSources.getAllPlaces()).thenAnswer((realInvocation) async => Right(mockListofPlaceModel));
}

void setUpFailureForGetPlaces(){
  when(mockPlacesDataSources.getAllPlaces()).thenAnswer((realInvocation) async => Left(mockFailure));
}
group("PlaceRepoImpl Test", () { 


test("While calling getAllPlaces we should get List of PlaceModels", () async {

setUpSuccessForGetPlaces();

final PlacesRepoImpl placesRepoImpl = PlacesRepoImpl(placesDataSources: mockPlacesDataSources);

final result = await placesRepoImpl.getPlaces();


expect(result.fold((l) => l, (r) => r), mockListofPlaceModel);


});

test("While calling getAllPlaces we should get Failure message", () async {

setUpFailureForGetPlaces();

final PlacesRepoImpl placesRepoImpl = PlacesRepoImpl(placesDataSources: mockPlacesDataSources);

final result = await placesRepoImpl.getPlaces();


expect(result.fold((l) => l, (r) => r), mockFailure);


});
  
});
}