import 'dart:io';

void main() {
  final vorname = readName('Vorname: ');
  final nachname = readName('Nachname: ');

  final age = readAge();
  final gender = readGender();

  if (age < 40) {
    print('Hallo, $vorname!');
  } else {
    final hour = DateTime.now().hour;
    final greeting = getGreeting(hour);

    print('$greeting, ${gender.anrede} $nachname');
  }
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

enum Gender {
  male(anrede: 'Herr'),
  female(anrede: 'Frau'),
  diverse(anrede: '');

  const Gender({required this.anrede});

  static Gender fromShort(String short) => switch (short) {
    'm' => Gender.male,
    'w' => Gender.female,
    'd' => Gender.diverse,
    (_) => throw Exception('No matching gender found.'),
  };

  final String anrede;
}

Gender readGender() {
  while (true) {
    stdout.write('Geschlecht (m/w/d): ');
    String? input = stdin.readLineSync();

    if (input != null) {
      String gender = input.trim().toLowerCase();

      if (gender == 'm' || gender == 'w' || gender == 'd') {
        return Gender.fromShort(gender);
      }
    }

    print('Ungültige Eingabe.');
  }
}

String getGreeting(int hour) {
  if (hour < 11) {
    return 'Guten Morgen';
  } else if (hour < 18) {
    return 'Guten Tag';
  } else {
    return 'Guten Abend';
  }
}
