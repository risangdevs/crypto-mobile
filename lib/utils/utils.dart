String logoUrl(String symbol) {
  return 'https://assets.coincap.io/assets/icons/${symbol.toLowerCase()}@2x.png';
}

double stringToDouble(String value) {
  try {
    return double.parse(value);
  } catch (e) {
    return double.nan; // Or handle the error as appropriate
  }
}

String formatWithThousandSeparator(double number) {
  // Separate the number into integer and fractional parts
  String integerPart = number.truncate().toString();
  String fractionalPart = number - number.truncate() > 0 ? number.toString().split('.')[1] : '';

  // Use a StringBuffer to build the formatted string
  StringBuffer buffer = StringBuffer();
  
  // Format the integer part with thousand separators
  int length = integerPart.length;
  for (int i = length - 1; i >= 0; i--) {
    buffer.write(integerPart[i]);
    if ((length - i) % 3 == 0 && i != 0) {
      buffer.write(',');
    }
  }

  // Reverse the integer part
  String formattedIntegerPart = buffer.toString().split('').reversed.join('');

  // Combine integer part with fractional part
  if (fractionalPart.isNotEmpty) {
    return '$formattedIntegerPart.$fractionalPart';
  } else {
    return formattedIntegerPart;
  }
}

String formatLargeNumber(double number) {
  if (number >= 1e12) {
    return '${(number / 1e12).toStringAsFixed(3)}T'; // Billion
  } else if (number >= 1e9) {
    return '${(number / 1e9).toStringAsFixed(3)}B'; // Million
  } else if (number >= 1e6) {
    return '${(number / 1e6).toStringAsFixed(3)}M'; // Trillion
  } else if (number >= 1e3) {
    return '${(number / 1e3).toStringAsFixed(3)}K'; // Thousand
  } else {
    return number.toStringAsFixed(0); // No suffix
  }
}