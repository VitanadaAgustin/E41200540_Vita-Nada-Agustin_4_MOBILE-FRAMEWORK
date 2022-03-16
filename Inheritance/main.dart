import 'dart:io';

import 'armor_titan.dart';
import 'attack_titan.dart';
import 'beast_titan.dart';
import 'human.dart';

main(List<String> args) async {
  armor_titan a = armor_titan();
  attack_titan b = attack_titan();
  beast_titan c = beast_titan();
  human d = human();

  a.powerPoint = 5;
  b.powerPoint = 10;
  c.powerPoint = 3;
  d.powerPoint = -2;

  print("armor_titan PP: " + a.powerPoint.toString());
  print("attack_titan PP: " + b.powerPoint.toString());
  print("beast_titan PP: " + c.powerPoint.toString());
  print("human PP: " + d.powerPoint.toString());
  print(a.terjang());
  print(b.punch());
  print(c.lempar());
  print(d.killAlltitan());
}
