import 'package:recall_dart/model/car_color.dart';

import 'car.dart';

class CarSelection {
  CarSelection(this.pickedIndex, List<Car> cars)
      : cars = cars.map((car) {
          car.color = CarColor.blue;
          return car;
        }).toList();

  int? pickedIndex;
  List<Car> cars;
}
