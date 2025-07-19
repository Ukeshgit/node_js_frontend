class ApiResponseModel {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<Data> data;
  final Support? support;

  ApiResponseModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    this.support,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data:
          (json['data'] as List<dynamic>)
              .map((item) => Data.fromJson(item))
              .toList(),
      support:
          json['support'] != null ? Support.fromJson(json['support']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'per_page': perPage,
      'total': total,
      'total_pages': totalPages,
      'data': data.map((d) => d.toJson()).toList(),
      if (support != null) 'support': support!.toJson(),
    };
  }
}

class Data {
  final int id;
  final String name;
  final int year;
  final String color;
  final String pantoneValue;

  Data({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantoneValue,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
      year: json['year'],
      color: json['color'],
      pantoneValue: json['pantone_value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'year': year,
      'color': color,
      'pantone_value': pantoneValue,
    };
  }
}

class Support {
  final String url;
  final String text;

  Support({required this.url, required this.text});

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(url: json['url'], text: json['text']);
  }

  Map<String, dynamic> toJson() {
    return {'url': url, 'text': text};
  }
}
