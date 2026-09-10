import 'dart:io';

void main() {
  String vorname = readName('Vorname: ');
  String nachname = readName('Nachname: ');

  int age = readAge();
  String gender = readGender();

  print('Gültiger Vorname: $vorname');
  print('Gültiger Nachname: $nachname');

  print('Gültiges Alter: $age');
  print('Gültiges Geschlecht: $gender');
}

String readName(String prompt) {
  String? input;

  while (input == null || input.trim().isEmpty) {
    stdout.write(prompt);
    input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print('Ungültige Eingabe.');
    }
  }

  return input.trim();
}

int readAge() {
  int? age;

  while (age == null || age < 0 || age > 150) {
    stdout.write('Alter: ');

    String? input = stdin.readLineSync();

    age = int.tryParse(input ?? '');

    if (age == null || age < 0 || age > 150) {
      print('Ungültige Eingabe.');
    }
  }

  return age;
}

String readGender() {

  while (true) {
    stdout.write('Geschlecht (m/w/d): ');
    String? input = stdin.readLineSync();

    if (input != null) {
      String gender = input.trim().toLowerCase();

      if (gender == 'm' || gender == 'w' || gender == 'd') {
        return gender;
      }
    }

    print('Ungültige Eingabe.');
  }
}