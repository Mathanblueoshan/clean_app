import 'package:clean_tdd_app/features/places/data/datasources/place_datasource.dart';
import 'package:clean_tdd_app/features/places/data/repoImpl/place_repoimpl.dart';
import 'package:clean_tdd_app/features/places/domain/repositories/place_repo.dart';
import 'package:clean_tdd_app/features/places/domain/usecases/getplaces_usecase.dart';
import 'package:clean_tdd_app/features/places/presentation/blocs/place_bloc/place_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;


void init(){
 //bloc
getIt.registerFactory(() => PlaceBloc(getPlacesUseCase: getIt()));

 //use cases
getIt.registerFactory(() => GetPlacesUseCase(placesRepo: getIt()));

 //repositories
getIt.registerFactory<PlacesRepo>(() => PlacesRepoImpl(placesDataSources: getIt()));

 //data sources
getIt.registerFactory<PlacesDataSources>(() => PlacesDataSourcesImpl(dio: getIt()));

 //Dio service
getIt.registerFactory(() => Dio());
}