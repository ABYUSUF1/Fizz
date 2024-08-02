import 'package:connection_notifier/connection_notifier.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fizz/core/api/dio_consumer.dart';
import 'package:fizz/feature/home/data/repo/home_repo_imple.dart';
import 'package:fizz/feature/home/presentation/view_models/get_collection_cubit/get_collection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'feature/home/presentation/view_models/get_products_cubit/get_products_cubit.dart';
import 'feature/home/presentation/views/home_view.dart';
import 'feature/splash/views/splash_view.dart';
import 'firebase_options.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

/* // TODO:
    1. get the color from jitter website
    2. put it in indicator circle progress
    3. check website responsive
    4. start auth pages ............ 
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FizzApp());
}

class FizzApp extends StatelessWidget {
  const FizzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetCollectionCubit(
              HomeRepoImple(dioConsumer: DioConsumer(dio: Dio())))
            ..getCollection(),
        ),
        BlocProvider(
          create: (context) => GetProductsCubit(
              HomeRepoImple(dioConsumer: DioConsumer(dio: Dio())))
            ..getProducts(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'SpaceMono'),
        home: const HomeView(),
      ),
    );
  }
}
