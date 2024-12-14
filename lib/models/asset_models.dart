class Asset {
  final String id;
  final String rank;
  final String symbol;
  final String name;
  final String supply;
  final String? maxSupply;
  final String marketCapUsd;
  final String volumeUsd24Hr;
  final String priceUsd;
  final String changePercent24Hr;
  final String? vwap24Hr;
  final String? explorer;

  Asset({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    required this.supply,
    this.maxSupply,
    required this.marketCapUsd,
    required this.volumeUsd24Hr,
    required this.priceUsd,
    required this.changePercent24Hr,
    this.vwap24Hr,
    this.explorer,
  });

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      id: json['id'],
      rank: json['rank'],
      symbol: json['symbol'],
      name: json['name'],
      supply: json['supply'],
      maxSupply: json['maxSupply'],
      marketCapUsd: json['marketCapUsd'],
      volumeUsd24Hr: json['volumeUsd24Hr'],
      priceUsd: json['priceUsd'],
      changePercent24Hr: json['changePercent24Hr'],
      vwap24Hr: json['vwap24Hr'],
      explorer: json['explorer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rank': rank,
      'symbol': symbol,
      'name': name,
      'supply': supply,
      'maxSupply': maxSupply,
      'marketCapUsd': marketCapUsd,
      'volumeUsd24Hr': volumeUsd24Hr,
      'priceUsd': priceUsd,
      'changePercent24Hr': changePercent24Hr,
      'vwap24Hr': vwap24Hr,
      'explorer': explorer,
    };
  }
}

class AssetData {
  final Asset data;
  final int timestamp;

  AssetData({
    required this.data,
    required this.timestamp,
  });

  factory AssetData.fromJson(Map<String, dynamic> json) {
    return AssetData(
      data: Asset.fromJson(json['data']),
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'timestamp': timestamp,
    };
  }
}

class AssetListData {
  final List<Asset> data;
  final int timestamp;

  AssetListData({
    required this.data,
    required this.timestamp,
  });

  factory AssetListData.fromJson(Map<String, dynamic> json) {
    return AssetListData(
      data:
          List<Asset>.from(json['data'].map((asset) => Asset.fromJson(asset))),
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((asset) => asset.toJson()).toList(),
      'timestamp': timestamp,
    };
  }
}

class HistoricalDataList {
  final List<HistoricalData> data;
  final int timestamp;

  HistoricalDataList({
    required this.data,
    required this.timestamp,
  });

  factory HistoricalDataList.fromJson(Map<String, dynamic> json) {
    return HistoricalDataList(
      data:
          List<HistoricalData>.from(json['data'].map((asset) => HistoricalData.fromJson(asset))),
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((asset) => asset.toJson()).toList(),
      'timestamp': timestamp,
    };
  }
}


class HistoricalData {
  final String priceUsd;
  final int time;
  // final String circulatingSupply;
  final DateTime date;

  HistoricalData({
    required this.priceUsd,
    required this.time,
    // required this.circulatingSupply,
    required this.date,
  });

  // Factory constructor to create an instance from JSON
  factory HistoricalData.fromJson(Map<String, dynamic> json) {
    return HistoricalData(
      priceUsd: json['priceUsd'],
      time: json['time'],
      // circulatingSupply: json['circulatingSupply'],
      date: DateTime.parse(json['date']),
    );
  }

  // Method to convert instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'priceUsd': priceUsd,
      'time': time,
      // 'circulatingSupply': circulatingSupply,
      'date': date.toIso8601String(),
    };
  }
}
