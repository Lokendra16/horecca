class HomeCollections {
  String? id;
  String? title;
  String? image;
  List<HomeProducts>? products = [];

  HomeCollections({
    this.id,
    this.title,
    this.products,
    this.image,
  });
}

class HomeProducts {
  String? id;
  String? title;
  String? image;
  String? price;
  String? vendor;

  HomeProducts({
    this.id,
    this.title,
    this.image,
    this.price,
    this.vendor,
  });
}

class Price {
  String? amount;
  Price({
    this.amount,
  });
}
