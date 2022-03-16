import 'lingkaran.dart';

void main(List<String> args) {
  Lingkaran bulat;
  double luasLingkaran;

  bulat = new Lingkaran();
  bulat.setPi(3.14);
  bulat.setJari(7.0);

  luasLingkaran = bulat.luas();
  print(luasLingkaran);
}
