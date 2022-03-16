class Lingkaran {
  late double pi;
  late double jari;

  void setPi(double value) {
    if (value < 0) {
      value *= -1;
    }
    pi = value;
  }

  double getPi() {
    return pi;
  }

  void setJari(double value) {
    if (value < 0) {
      value *= -1;
    }
    jari = value;
  }

  double getJari() {
    return jari;
  }

  double luas() {
    return this.jari * jari * pi;
  }
}
