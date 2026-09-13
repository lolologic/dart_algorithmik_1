import 'dart:io';

void main() {

  int max = readMax();
  List<int> primes = [];

  for (int i = 2; i <= max; i++) {

    bool isPrime = true; 

    for (int j = 2; j * j <= i; j++) {

      if (i % j == 0) {
        isPrime = false;
        break;
      }
    }

    if (isPrime) {
      primes.add(i);
    }
  }

  print('Primzahlen bis $max: $primes');
}

int readMax() {
  
  int? max;

  while (max == null || max < 2) {

    stdout.write('Primzahlen bis: ');
    String? input = stdin.readLineSync();
    max = int.tryParse(input ?? '');

    if (max == null || max < 2) {
      print('Ungültige Eingabe. Bitte geben Sie eine Zahl größer oder gleich 2 ein.');
    }
  }

  return max;
}