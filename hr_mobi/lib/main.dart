import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_mobi/repository/staff/staff_repository.dart';
import 'package:hr_mobi/screens/staffs_screen/staffs_screen_route.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'main_router.dart';

void main() {
  final httpClientConfig = BaseOptions(
    baseUrl: 'http://10.0.2.2:8000',
    // connectTimeout: const Duration(seconds: 5),
    // receiveTimeout: const Duration(seconds: 3),
  );

  final httpClient = Dio(httpClientConfig);
  httpClient.interceptors.add(PrettyDioLogger());

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Dio>(create: (context) => httpClient),
        RepositoryProvider<StaffRepository>(
          create: (context) => StaffRepository(
            dio: context.read(),
          ),
        ),
      ],
      child: const HRMobiApp(),
    ),
  );
}

class HRMobiApp extends StatelessWidget {
  const HRMobiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: mainRouter,
      title: 'HR Mobis',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
    );
  }
}
