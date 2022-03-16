import 'employee.dart';

void main(List<String> args) {
  employee e = employee();
  e.id = "E41200540";
  e.name = "Vita Nada Agustin";
  e.departemen = "Teknik Informatika";

  print("NIM : " + e.id);
  print("NAMA : " + e.name);
  print("PRODI : " + e.departemen);
}
