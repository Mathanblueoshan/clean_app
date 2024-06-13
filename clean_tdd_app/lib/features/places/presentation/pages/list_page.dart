import 'package:clean_tdd_app/features/places/presentation/blocs/place_bloc/place_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/place_bloc/place_state.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigoAccent,
          title: const Text("CLEAN TDD APP",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        ),

        body:BlocBuilder<PlaceBloc, PlaceBlocState>(
          builder: (context, state) {
            if(state is PlaceBlocLoadingState){
              return const Center(child: CircularProgressIndicator(),);
            }else if(state is PlaceBlocErrorState){
              return Center(child: Text(state.message),);
            }else if(state is PlaceBlocLoadedState){
              return ListView.builder(
                itemCount: state.places.length,
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      border: const Border.symmetric(vertical: BorderSide(width: 3,color: Colors.indigo))
                    ),
                    child: Column(

                      children: [
                        ListTile(
                          title: Text(state.places[index].name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo),),
                          subtitle: Text(state.places[index].address,style: const TextStyle(fontSize: 18,color: Colors.grey),),
                        ),


                          Padding(
                            padding: const EdgeInsets.only(left: 20,bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text("type :",style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),),
                                 Text(state.places[index].type,style: const TextStyle(fontSize: 14,color: Colors.grey),),
                              ],
                            ),
                          ),

                      ],
                    ),
                  ),
                );
              },);
            }
            return Container();
          },
        ) ,
      );
  }
}