void main(List<String> args) {

  if (args.isEmpty) {
    print('Hallo!');
  } else {
    print('Hallo ${args.join(' ')}!');
  }
}