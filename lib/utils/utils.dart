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
