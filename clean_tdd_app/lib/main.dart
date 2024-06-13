import 'package:clean_tdd_app/features/places/presentation/blocs/place_bloc/place_event.dart';
import 'package:clean_tdd_app/features/places/presentation/pages/list_page.dart';
import 'package:clean_tdd_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/places/presentation/blocs/place_bloc/place_bloc.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => getIt<PlaceBloc>()..add(GetAllPagesEvent()),
        child: const ListPage(),
        ),
    );
  }
}
