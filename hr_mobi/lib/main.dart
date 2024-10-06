import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hr_mobi/repository/staff/staff_repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'main_router.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  final httpClientConfig = BaseOptions(
    baseUrl: dotenv.env['BASE_API_URL'] ?? '',
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
      debugShowCheckedModeBanner: false,
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
