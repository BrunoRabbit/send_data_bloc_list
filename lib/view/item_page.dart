import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_data_bloc_list/bloc/car_bloc.dart';
import 'package:send_data_bloc_list/model/car.dart';
import 'package:send_data_bloc_list/styles/text_styles.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  late CarBloc _carBloc;

  @override
  void initState() {
    _carBloc = BlocProvider.of<CarBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final Car car = ModalRoute.of(context)?.settings.arguments as Car;

    return BlocBuilder<CarBloc, CarState>(
      bloc: _carBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            centerTitle: true,
            title: Text(state.listCar[car.id].name),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Submit for change name',
                style: textCarsInfo,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: controller,
                  onEditingComplete: () {
                    _carBloc.add(
                      ChangeCarNameEvent(car: car, newName: controller.text),
                    );
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Car name: ' + state.listCar[car.id].name,
                style: textCarsInfo,
              ),
              const SizedBox(height: 10),
              Text(
                'Car id: ' + car.id.toString(),
                style: textCarsInfo,
              ),
            ],
          )),
        );
      },
    );
  }
}
