class Laptop {
  const Laptop(this.brand, this.model, this.cpu);

  final String brand;
  final String model;
  final Cpu cpu;
}

class Cpu {
  const Cpu(this.brand, this.model);

  final String brand;
  final String model;
}

class OemConfig {
  OemConfig(this.units);

  List<({String brand, String model})> units;
}