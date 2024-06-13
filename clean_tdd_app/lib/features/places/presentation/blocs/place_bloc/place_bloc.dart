
import 'package:bloc/bloc.dart';
import 'package:clean_tdd_app/core/usecase/usecase.dart';
import 'package:clean_tdd_app/features/places/domain/usecases/getplaces_usecase.dart';
import 'package:clean_tdd_app/features/places/presentation/blocs/place_bloc/place_event.dart';
import 'package:clean_tdd_app/features/places/presentation/blocs/place_bloc/place_state.dart';




class PlaceBloc extends Bloc<PlaceBlocEvent,PlaceBlocState>{
  
  final GetPlacesUseCase getPlacesUseCase;

  PlaceBloc({required this.getPlacesUseCase}):super(PlaceBlocInitialState()){
    on<GetAllPagesEvent>((event, emit) async{
      
      emit(PlaceBlocLoadingState());

      final failureOrPlaces = await getPlacesUseCase(NoParams());

      failureOrPlaces.fold(
        (failure) => emit(PlaceBlocErrorState(failure.toString())),
       (places) => emit(PlaceBlocLoadedState(places)));
    });
  }
  
}