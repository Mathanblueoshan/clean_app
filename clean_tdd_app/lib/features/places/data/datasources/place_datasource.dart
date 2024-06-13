import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../models/place_model.dart';

abstract class PlacesDataSources {
   Future<Either<Failure,List<PlaceModel>>> getAllPlaces(); 
}


class PlacesDataSourcesImpl implements PlacesDataSources{

//  final Dio dio = Dio();
final Dio dio;

  PlacesDataSourcesImpl({required this.dio});
  
  @override
  Future<Either<Failure, List<PlaceModel>>> getAllPlaces() async {

    final response = await dio.get("https://mocki.io/v1/7c537d05-367f-4733-b463-9124131af29b");
    

    if(response.statusCode == 200){
     
   //final data = (response.data as List<dynamic>).map((e) => PlaceModel.fromJson(e)).toList();
   //print(data);
      return Right((response.data as List<dynamic>).map((e) => PlaceModel.fromJson(e)).toList());
    }else{

      return Left(Failure(message: "Server Failure"));
    }

    
  }
  
}