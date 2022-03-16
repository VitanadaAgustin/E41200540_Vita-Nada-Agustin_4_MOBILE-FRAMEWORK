import 'bangun_datar.dart';
import 'lingkaran.dart';
import 'persegi.dart';
import 'segitiga.dart';

void main(List<String> args) {
  bangun_datar b = bangun_datar();
  lingkaran c = lingkaran();
  segitiga d = segitiga();
  persegi e = persegi();

  print(c.keliling());
  print(c.luas());

  print(d.keliling());
  print(d.luas());

  print(e.keliling());
  print(e.luas());
}
