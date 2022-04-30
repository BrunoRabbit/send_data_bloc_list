part of 'car_bloc.dart';

class CarState {
  final List<Car> listCar;

  CarState({
    required this.listCar,
  });

  CarState copyWith({
    List<Car>? listCar,
  }) {
    return CarState(
      listCar: listCar ?? this.listCar,
    );
  }
}
