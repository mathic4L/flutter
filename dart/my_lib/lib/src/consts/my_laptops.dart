import 'package:flutter/material.dart';

final macAir = MyLaptop(cpu: powerfulCpu, company: appleCompany, model: 'air', price: 1000,);
final lenovoYoga = MyLaptop(cpu: powerfulCpu, company: lenovoCompany, model: 'yoga', price: 700,);
final msiModern = MyLaptop(cpu: mediumCpu, company: msiCompany, model: 'modern', price: 500,);
final dexpAtlas = MyLaptop(cpu: mediocreCpu, company: dexpCompany, model: 'atlas', price: 300);
final gigabyteG7 = MyLaptop(cpu: powerfulCpu, company: gigabyteCompany, model: 'g7', price: 800);

const monsterCpu =  Cpu(coreCount: 16, hz: 4500);
const powerfulCpu = Cpu(coreCount: 8, hz: 4000);
const mediumCpu =  Cpu(coreCount: 8, hz: 3500);
const mediocreCpu = Cpu(coreCount: 4, hz: 4000);

const appleCompany = 'apple';
const lenovoCompany = 'lenovo';
const gigabyteCompany = 'gigabyte';
const msiCompany = 'msi';
const huaweiCompany = 'huawei';
const dexpCompany = 'dexp';


class MyLaptop {
  MyLaptop({required this.cpu, required this.company,
    required this.model,
    required this.price,
  });

  final String company;
  final String model;
  final Cpu cpu;
  int price;

  String get name => '$company $model';

  @override
  String toString() {
    return 'MyLaptop{company: $company, model: $model, cpu: $cpu, price: $price}';
  }
}

class Cpu {
  const Cpu({required this.coreCount, required this.hz});

  final int coreCount;
  final int hz;

  @override
  String toString() {
    return 'Cpu{coreCount: $coreCount, hz: $hz}';
  }
}
