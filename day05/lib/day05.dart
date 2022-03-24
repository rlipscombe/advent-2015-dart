// This makes several passes through the string, which is (relatively) expensive for large strings. Fortunately, the
// strings in the input are only 16 characters, and there's only 1000 of them, and I'm running this on a Core-i7, so
// meh.
bool isNiceString(String s) {
  return countVowels(s) >= 3 &&
      containsDoubleLetter(s) &&
      !containsBannedStrings(s);
}

// In a small concession to performance, we'll make a single pass through the string looking for the hard-coded
// patterns, rather than once per banned string. Another option would be to create an (extended?) regex, but that'd (at
// best!) compile down to the same when the RE is compiled.
bool containsBannedStrings(String s) {
  for (var i = 0; i < s.length - 1; ++i) {
    if (s[i] == 'a' && s[i + 1] == 'b') return true;
    if (s[i] == 'c' && s[i + 1] == 'd') return true;
    if (s[i] == 'p' && s[i + 1] == 'q') return true;
    if (s[i] == 'x' && s[i + 1] == 'y') return true;
  }

  return false;
}

int countVowels(String s) {
  int count = 0;

  for (var i = 0; i < s.length; ++i) {
    if (isVowel(s[i])) {
      ++count;
    }
  }

  return count;
}

bool isVowel(String s) {
  switch (s) {
    case 'a':
    case 'e':
    case 'i':
    case 'o':
    case 'u':
      return true;
  }
  return false;
}

bool containsDoubleLetter(String s) {
  if (s.length < 2) {
    return false;
  }

  for (var i = 0; i < s.length - 1; ++i) {
    if (s[i] == s[i + 1]) {
      return true;
    }
  }

  return false;
}
