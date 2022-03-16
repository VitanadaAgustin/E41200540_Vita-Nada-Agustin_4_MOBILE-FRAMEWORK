import 'bangun_datar.dart';

class segitiga extends bangun_datar {
  late double alas = 3;
  late double tinggi = 4;
  late double miring = 5;

  double luas() => 0.5 * (alas * tinggi);
  double keliling() => alas + tinggi + miring;
}
