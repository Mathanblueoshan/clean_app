
import '../../../domain/entities/place_entity.dart';

abstract class  PlaceBlocState {}

class PlaceBlocInitialState extends PlaceBlocState{}
class PlaceBlocLoadingState extends PlaceBlocState{}
class PlaceBlocLoadedState extends PlaceBlocState {
  final List<Place> places;
  PlaceBlocLoadedState( this.places,);
}

class PlaceBlocErrorState extends PlaceBlocState{
  final String message;

  PlaceBlocErrorState(this.message);
}
