import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_data_bloc_list/bloc/car_bloc.dart';
import 'package:send_data_bloc_list/routes/routes.dart';
import 'package:send_data_bloc_list/view/home_page.dart';

void application() {
  runApp(
    const Application(),
  );
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late CarBloc carBloc;

  @override
  void initState() {
    carBloc = CarBloc();
    super.initState();
  }

  @override
  void dispose() {
    carBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => carBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: ThemeData(
          primaryColor: Colors.purple,
        ),
        routes: AppRoutes.path,
      ),
    );
  }
}
