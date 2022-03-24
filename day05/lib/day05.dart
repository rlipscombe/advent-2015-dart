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

bool isNiceString2(String s) {
  // Now, a nice string is one with all of the following properties:
  // - It contains a pair of any two letters that appears at least twice in the string without overlapping, like
  //   xyxy (xy) or aabcdefgaa (aa), but not like aaa (aa, but it overlaps).
  // - It contains at least one letter which repeats with exactly one letter between them, like xyx, abcdefeghi (efe),
  //   or even aaa.

  return containsNonOverlappingRepeatedPair(s) &&
      containsRepeatedLetterWithSpacer(s);
}

bool containsNonOverlappingRepeatedPair(String s) {
  // Rule 1:
  // For each pair of letters in the string, look to see if that pair appears again in the string, starting from
  // immediately _after_ the current pair.
  // We could implement something like Elixir's chunk_every, but we also need the position, so let's just get into it.
  for (var i = 0; i < s.length - 1; ++i) {
    var pair = s[i] + s[i + 1];
    if (s.contains(pair, i + 2)) {
      return true;
    }
  }

  return false;
}

bool containsRepeatedLetterWithSpacer(String s) {
  // Rule 2:
  // For each letter in the string, does it occur 2 places further on?
  for (var i = 0; i < s.length - 2; ++i) {
    if (s[i] == s[i + 2]) {
      return true;
    }
  }

  return false;
}
