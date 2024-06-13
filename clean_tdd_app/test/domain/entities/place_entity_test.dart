

import 'package:flutter_test/flutter_test.dart';

import '../../mocks/migrated_mocks.dart';

void main(){

test('will test our place entity fields', (){   //Entity Test - Only check the Fields(datatypes).
 
 expect(mockPlaceEntity.name, 'placeName');
 expect(mockPlaceEntity.address, 'placeAddress');
 expect(mockPlaceEntity.type, 'hotel');
 
});


}