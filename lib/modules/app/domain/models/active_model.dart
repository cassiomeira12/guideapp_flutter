class ActiveModel {
  final String symbol;
  final String longName;
  final String sector;
  final String industry;

  ActiveModel({
    required this.symbol,
    required this.longName,
    required this.sector,
    required this.industry,
  });

  factory ActiveModel.fromJson(Map<String, dynamic> json) {
    return ActiveModel(
      symbol: json['symbol'],
      longName: json['longname'] ?? '',
      sector: json['sector'] ?? '',
      industry: json['industry'] ?? '',
    );
  }

  String get sectorIndustry {
    return '$sector - $industry';
  }
}
