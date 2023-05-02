class GraphQLResponse {
  Data? data;

  GraphQLResponse({this.data});

  GraphQLResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Collections? collections;

  Data({this.collections});

  Data.fromJson(Map<String, dynamic> json) {
    collections =
        json['collections'] != null ? new Collections.fromJson(json['collections']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.collections != null) {
      data['collections'] = this.collections!.toJson();
    }
    return data;
  }
}

class Collections {
  List<Products>? products;

  Collections({required this.products});

  Collections.fromJson(Map<String, dynamic> json) {
    print("From Json Called!");
    var refinedData = convert(json);
    var refinedData1 = convert(refinedData["products"]);
    if(refinedData!=null){
      // this.products = refinedData;
    }
    this.products = null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }

  Map<String,dynamic> convert(Map<String, dynamic> json) {
    var refined = Map<String, dynamic>();
    json["edges"].forEach((v) {
      // print(v);
      refined.addAll(v["node"]);
    });
    print("Refined : $refined");
    return refined;
  }
}

class Products {
  String? id;

  Products({this.id});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    return data;
  }
}
