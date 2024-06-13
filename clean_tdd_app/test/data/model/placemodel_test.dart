

import 'package:clean_tdd_app/features/places/data/models/place_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/json_mocks.dart';

void main(){

  group("PlaceModel test", () { 


    test("EmployeesModel should return json when using EmployeesModelFromJsonMethod", () {
      final placeModel = PlaceModel.fromJson(mockPlaceJson);

      expect(placeModel.name,'JJ hotel');
      expect(placeModel.address,'chennai');
      expect(placeModel.type,'hotel');
    });



    
    test("EmployeesModel should create a json when we use EmployeesModelToJsonMethod", () {
      final placeModel = PlaceModel.fromJson(mockPlaceJson);

      final resultModel = placeModel.toJson();

      expect(resultModel['name'], mockPlaceJson['name']);
      expect(resultModel['address'], mockPlaceJson['address']);
      expect(resultModel['type'], mockPlaceJson['type']);
    });

    

  });
}