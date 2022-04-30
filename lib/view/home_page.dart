import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_data_bloc_list/bloc/car_bloc.dart';
import 'package:send_data_bloc_list/routes/routes.dart';
import 'package:send_data_bloc_list/styles/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CarBloc _carBloc;

  @override
  void initState() {
    _carBloc = BlocProvider.of<CarBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: BlocBuilder<CarBloc, CarState>(
        bloc: _carBloc,
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: SizedBox(
                width: 200,
                child: ListView.builder(
                  itemCount: state.listCar.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 75,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            RoutesPath.itemPage,
                            arguments: state.listCar[index],
                          );
                        },
                        child: Card(
                          elevation: 2,
                          color: color,
                          child: Column(
                            children: [
                              Text(
                                state.listCar[index].name,
                                style: textStyle,
                              ),
                              Text(
                                state.listCar[index].id.toString(),
                                style: textStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
