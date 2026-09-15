import 'dart:io';
import 'dart:math';

void main(){

  int? max;

  while (max == null || max <= 0) {
    stdout.write('Anzahl der Würfe: ');
    String? input = stdin.readLineSync();
    max = int.tryParse(input ?? '');

    if (max == null || max <= 0) {
      print('Ungültige Eingabe.');
    }
  }

  List<int> rolls = [];
  int consecutiveSixes = 0;

  Random random = Random();

  while (consecutiveSixes != 2 && rolls.length < max) {
    int rolledNum = random.nextInt(6) + 1;
    rolls.add(rolledNum);

    if (rolledNum == 6) {
      consecutiveSixes++;
    } else {
      consecutiveSixes = 0;
    }
  }

  if (consecutiveSixes == 2) {
    print('Benötigte Würfe: ${rolls.length}');
  } else {
    print('Limit erreicht.');
  }

  print('Gewürfelte Werte: $rolls');
}
