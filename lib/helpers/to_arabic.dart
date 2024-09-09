String convertToArabicNumerals(String number) {
  const arabicDigits = '٠١٢٣٤٥٦٧٨٩';
  return number.split('').map((char) {
    if (char.contains(
      RegExp(r'[0-9]'),
    )) {
      return arabicDigits[int.parse(char)];
    }
    return char;
  }).join();
}
