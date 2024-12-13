const String host = 'https://api.coincap.io/v2/';
const String wsHost = 'wss://ws.coincap.io/';
// ignore: constant_identifier_names
enum Status { LOADING, COMPLETED, ERROR }

class Path {
  static const String asset = 'assets/';
  static String Function(dynamic) assetHistorical = (assetId) => 'assets/$assetId/history';
}