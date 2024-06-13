import 'package:dio/dio.dart';

Map<String,dynamic> mockPlaceJson = {
 
"name": "JJ hotel",
"address": "chennai",
"type": "hotel",

};


final Response mockResponse = Response(
  data:[
{
"name": "Le Tiers-Lieu de Bègles",
"lat": 44.8075735,
"lon": -0.5489797,
"address": "1 Place du 14 Juillet, 33130 Bègles",
"url": "https://fr-fr.facebook.com/TiersLieuBegles/",
"openHours": "Monday to Friday",
"type": "coworking, coop",
"power": {
"available": true
},
"wifi": {
"available": true
},
},
{
"name": "Saint Seurin",
"lat": 44.8437174,
"lon": -0.5868276,
"address": "3, Place Lucien Victor Meunier",
"url": "http://restaurant-saint-seurin.com",
"openHours": "Monday to Saturday - 10:00am to 2:00am",
"type": "brasserie",
"power": {
"available": true
},
"wifi": {
"available": true
}
},
  ],
statusCode: 200,
requestOptions: RequestOptions(path:"https://mocki.io/v1/7c537d05-367f-4733-b463-9124131af29b"),
);



final Response mockFailureResponse = Response(
  data:[{}],
statusCode: 400,
requestOptions: RequestOptions(path:"https://mocki.io/v1/7c537d05-367f-4733-b463-9124131af29b"),
);