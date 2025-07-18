class ProductResponse {
  final int statusCode;
  final String message;
  final ProductData data;

  ProductResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      statusCode: json['status_code'],
      message: json['message'],
      data: ProductData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status_code': statusCode,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class ProductData {
  final String id;
  final String pname;
  final String pprice;
  final String pdesc;

  ProductData({
    required this.id,
    required this.pname,
    required this.pprice,
    required this.pdesc,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'],
      pname: json['pname'],
      pprice: json['pprice'],
      pdesc: json['pdesc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'pname': pname, 'pprice': pprice, 'pdesc': pdesc};
  }
}
