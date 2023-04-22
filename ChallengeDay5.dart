typedef word = Map<String, String>;

class Dictionary {
  word wordList = {};

  void add(word input) {
    wordList.addAll(input);
  }

  String get(String key) {
    return wordList[key] ?? "";
  }

  void delete(String key) {
    if (wordList.containsKey(key)) {
      wordList.remove(key);
    }
  }

  void update(word input) {
    if (wordList.containsKey(input.keys.first)) {
      wordList.update(input.keys.first, (value) => input.values.first);
    }
  }

  void showAll() {
    wordList.forEach((key, value) {
      print("{$key: $value}");
    });
  }

  int count() {
    return wordList.length;
  }

  void upsert(word input) {
    if (wordList.containsKey(input.keys.first)) {
      update(input);
    } else {
      add(input);
    }
  }

  bool exists(String key) {
    return wordList.containsKey(key);
  }

  void bulkAdd(List<word> input) {
    input.forEach((element) {
      if (!exists(element["term"] ?? "")) {
        add(element);
      }
    });
  }

  void bulkDelete(List<String> input) {
    input.forEach((element) {
      if (wordList.containsKey(element)) {
        wordList.remove(element);
      }
    });
  }
}

void main() {
  var myDict = Dictionary();

  myDict.add({"apple": "사과"});
  myDict.add({"bacon": "베이컨"});
  myDict.add({"crayon": "크래용"});

  myDict.add({"bacon": "베이컨"});

  myDict.upsert({"code": "코드아님"});
  myDict.upsert({"apple": "사과아님", "bacon": "베이컨아님", "code": "코드아님"});

  // myDict.delete("apple");
  print(myDict.get("apple"));
  print(myDict.get("boom"));

  myDict.bulkDelete(["apple", "bacon", "asdfasdf"]);
  myDict.bulkAdd([
    {"apple": "과사", "bacon": "돼지", "asdfasdf": "gibberish"}
  ]);

  print("count: ${myDict.count()}");

  myDict.showAll();
}
