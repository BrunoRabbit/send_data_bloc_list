part of 'car_bloc.dart';

@immutable
abstract class CarEvent {}

class ChangeCarNameEvent extends CarEvent {
  final Car car;
  final String newName;

  ChangeCarNameEvent({
    required this.car,
    required this.newName,
  });
}
