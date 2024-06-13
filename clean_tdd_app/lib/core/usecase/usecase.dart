import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class Usecase<Type,Params>{

   Future<Either<Failure, Type>> call(Params param);

}


class Params<T>{
  final T data;

  Params({required this.data});
}

class NoParams{
  NoParams();
}


//common usecase 