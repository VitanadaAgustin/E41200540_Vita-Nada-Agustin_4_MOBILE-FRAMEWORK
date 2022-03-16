class bangun_datar {
  late int bangunDatar;

  int get bangundatar => bangunDatar;
  set bangundatar(int value) {
    if (value < 0) {
      value *= -1;
    }
    bangunDatar = value;
  }
}
