class Computer {
  Computer(this.price, this.cpu, this.ramAmount, this.storageAmount);

  final int price;
  final Cpu cpu;
  final int ramAmount;
  final int storageAmount;
}

enum Cpu { intel, amd, arm }
