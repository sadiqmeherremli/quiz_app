void printInitialLetters(String sentence) {
  List<String> words = sentence.split(' ');
  
  for (String word in words) {
    if (word.trim().isNotEmpty) {
      print(word[0]);
    }
  }
}

void main() {
  String sentence = "Hello World";
  printInitialLetters(sentence);
}
