
import 'package:clean_tdd_app/core/errors/failure.dart';
import 'package:clean_tdd_app/features/places/data/datasources/place_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/json_mocks.dart';
import '../../mocks/migrated_mocks.dart';
import 'datasource_test.mocks.dart';

@GenerateMocks([Dio])  //flutter packages pub run build_runner build --delete-conflicting-outputs
void main(){

group("datasoures test", () { 

  
final MockDio mockDio = MockDio();

final PlacesDataSourcesImpl placesDataSourcesImpl = PlacesDataSourcesImpl(dio: mockDio);

void setUpForDioGet(Response response){
  when(mockDio.get(any)).thenAnswer((realInvocation) async => response);
}

test('While calling getAllplaces we should get  Place object response', ()async{

setUpForDioGet(mockResponse);

final result = await placesDataSourcesImpl.getAllPlaces();

expect(result.fold((l) => l, (r) => r), mockListofPlaceModel);

});


test('While calling getAllplaces we should get Failure ', ()async{

setUpForDioGet(mockFailureResponse);

final result = await placesDataSourcesImpl.getAllPlaces();

expect(result.fold((l) => l, (r) => r), Failure(message: "Server Failure"));

});

});

}