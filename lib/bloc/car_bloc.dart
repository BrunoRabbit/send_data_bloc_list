import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:send_data_bloc_list/data/data.dart';
import 'package:send_data_bloc_list/model/car.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  CarBloc() : super(CarState(listCar: listCar)) {
    on<ChangeCarNameEvent>((event, emit) {
      var newList = state.listCar;

      newList[newList.indexOf(event.car)] = Car(
        id: event.car.id,
        name: event.newName,
      );

      emit(state.copyWith(listCar: newList));
    });
  }
}
