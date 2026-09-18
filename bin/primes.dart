import 'dart:io';

// void main() {
//   int max = readMax();
//   final stopwatch = Stopwatch()..start();

//   List<int> primes = [];

//   for (int i = 2; i <= max; i++) {
//     bool isPrime = true;

//     for (int j = 2; j * j <= i; j++) {
//       if (i % j == 0) {
//         isPrime = false;
//         break;
//       }
//     }

//     if (isPrime) {
//       primes.add(i);
//     }
//   }

//   print('Primzahlen bis $max: ${primes.last}');
//   stopwatch.stop();
//   print('Die Funktion dauerte: ${stopwatch.elapsedMilliseconds} ms');
//   print('Präzise Dauer: ${stopwatch.elapsedMicroseconds} µs');
// }

void main() {
  int max = readMax();

  final stopwatch = Stopwatch()..start();
  if (max == 2) {
    print('Primzahlen bis $max: 2');
    return;
  }

  List<int> primes = [2];

  for (var i = 3; i <= max; i += 2) {
    bool isPrime = true;

    for (var j = 0; primes[j] * primes[j] <= i; j++) {
      if (i % primes[j] == 0) {
        isPrime = false;
        break;
      }
    }

    if (isPrime) {
      primes.add(i);
    }
  }

  print('Primzahlen bis $max: ${primes.last}');
  stopwatch.stop();
  print('Die Funktion dauerte: ${stopwatch.elapsedMilliseconds} ms');
  print('Präzise Dauer: ${stopwatch.elapsedMicroseconds} µs');
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
