import 'dart:io';

// void main() {
//   int max = readMax();
//   final stopwatch = Stopwatch()..start();

//

//   print('Primzahlen bis $max: ${primes.last}');
//   stopwatch.stop();
//   print('Die Funktion dauerte: ${stopwatch.elapsedMilliseconds} ms');
//   print('Präzise Dauer: ${stopwatch.elapsedMicroseconds} µs');
// }

void main() {
  int max = readMax();

  final stopwatch = Stopwatch()..start();
  print(primitivePrime(max).length);
  stopwatch.stop();
  print('primitivePrimes($max) dauerte: ${stopwatch.elapsedMilliseconds} ms');
  print('primitivePrimes($max) präzise: ${stopwatch.elapsedMicroseconds} µs');

  stopwatch.reset();
  stopwatch.start();
  print(improvedPrime(max).length);
  stopwatch.stop();
  print('improvedPrimes($max) dauerte: ${stopwatch.elapsedMilliseconds} ms');
  print('improvedPrimes($max) präzise: ${stopwatch.elapsedMicroseconds} µs');

  stopwatch.reset();
  stopwatch.start();
  print(sieveOfEratosthenes(max).length);
  stopwatch.stop();
  print('sieveOfEratosthenes($max) dauerte: ${stopwatch.elapsedMilliseconds} ms');
  print('sieveOfEratosthenes($max) präzise: ${stopwatch.elapsedMicroseconds} µs');
}

List<int> primitivePrime(int max) {
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

  return primes;
}

List<int> sieveOfEratosthenes(int max) {
  final isPrime = List.filled(max + 1, true);

  for (var p = 2; p * p <= max; p++) {
    if (isPrime[p]) {
      for (var i = p * p; i <= max; i += p) {
        isPrime[i] = false;
      }
    }
  }

  final primes = <int>[];

  for (var i = 2; i < isPrime.length; i++) {
    if (isPrime[i]) primes.add(i);
  }

  return primes;
}

List<int> improvedPrime(int max) {
  if (max == 2) {
    return [2];
  }

  final primes = [2];

  for (var i = 3; i <= max; i += 2) {
    var isPrime = true;

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

  return primes;
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
