int day1(String input) {
  var result = 0;
  for (var i = 0; i < input.length; ++i) {
    switch (input[i]) {
      case '(':
        ++result;
        break;
      case ')':
        --result;
        break;
    }
  }

  return result;
}
