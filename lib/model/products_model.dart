class ProductDataModel {
  int? success;
  
  Data? data;

  ProductDataModel({this.success,  this.data});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

}

class Data {
  Cart? cart;
  RecommendedProducts? recommendedProducts;

  Data({this.cart, this.recommendedProducts});

  Data.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
    recommendedProducts = json['recommended_products'] != null
        ? RecommendedProducts.fromJson(json['recommended_products'])
        : null;
  }

}

class Cart {
  List<Products>? products;
  
  String? couponStatus;
  String? coupon;
  
  String? voucher;
  int? rewardStatus;
  String? reward;
  List<Totals>? totals;
  String? offer;
  int? offerAverage;
  String? total;
  double? totalRaw;
  int? totalProductCount;

  Cart(
      {this.products,
     
      this.couponStatus,
      this.coupon,
     
      this.voucher,
      this.rewardStatus,
      this.reward,
      this.totals,
      this.offer,
      this.offerAverage,
      this.total,
      this.totalRaw,
      this.totalProductCount});

  Cart.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    
    couponStatus = json['coupon_status'];
    coupon = json['coupon'];
 
    voucher = json['voucher'];
    rewardStatus = json['reward_status'];
    reward = json['reward'];
    if (json['totals'] != null) {
      totals = <Totals>[];
      json['totals'].forEach((v) {
        totals!.add(Totals.fromJson(v));
      });
    }
    offer = json['offer'];
    offerAverage = json['offer_average'];
    total = json['total'];
    totalRaw = json['total_raw'];
    totalProductCount = json['total_product_count'];
  }

}

class Products {
  String? key;
  String? thumb;
  String? name;
  String? productId;
  dynamic categoryId;
  String? manufacturerName;
 
  dynamic quantity;
  String? minimum;
  String? maximum;
  bool? stock;
  String? reward;
  int? priceNoTax;
  String? priceNoTaxFormatted;
  dynamic price;
  String? priceFormatted;
  String? total;
  String? totalFormatted;
  int? avaialbleQuantity;
   
  String? enName;
  String? eventPrice;
  List<Special>? special;
  List<CategoryHierarchy>? categoryHierarchy;

  Products(
      {this.key,
      this.thumb,
      this.name,
      this.productId,
      this.categoryId,
      this.manufacturerName,
      
      this.quantity,
      this.minimum,
      this.maximum,
      this.stock,
      this.reward,
      this.priceNoTax,
      this.priceNoTaxFormatted,
      this.price,
      this.priceFormatted,
      this.total,
      this.totalFormatted,
      this.avaialbleQuantity,
      
      this.enName,
      this.eventPrice,
      this.special,
      this.categoryHierarchy});

  Products.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    thumb = json['thumb'];
    name = json['name'];
    productId = json['product_id'];
    categoryId = json['category_id'];
    manufacturerName = json['manufacturer_name'];
    
    quantity = json['quantity'];
    minimum = json['minimum'];
    maximum = json['maximum'];
    stock = json['stock'];
    reward = json['reward'];
    priceNoTax = json['price_no_tax'];
    priceNoTaxFormatted = json['price_no_tax_formatted'];
    price = json['price'];
    priceFormatted = json['price_formatted'];
    total = json['total'];
    totalFormatted = json['total_formatted'];
    avaialbleQuantity = json['avaialble_quantity'];
     
    enName = json['en_name'];
    eventPrice = json['event_price'];
    if (json['special'] != null) {
      special = <Special>[];
      json['special'].forEach((v) {
        special!.add(Special.fromJson(v));
      });
    }
    if (json['category_hierarchy'] != null) {
      categoryHierarchy = <CategoryHierarchy>[];
      json['category_hierarchy'].forEach((v) {
        categoryHierarchy!.add(CategoryHierarchy.fromJson(v));
      });
    }
  }

}

class Special {
  String? discountRatio;
  String? originalPrice;
  String? priceFormated;
  double? originalPriceWithoutCurrency;
  dynamic priceWithoutCurrency;

  Special(
      {this.discountRatio,
      this.originalPrice,
      this.priceFormated,
      this.originalPriceWithoutCurrency,
      this.priceWithoutCurrency});

  Special.fromJson(Map<String, dynamic> json) {
    discountRatio = json['discount_ratio'];
    originalPrice = json['original_price'];
    priceFormated = json['price_formated'];
    originalPriceWithoutCurrency = json['originalPriceWithoutCurrency'];
    priceWithoutCurrency = json['priceWithoutCurrency'];
  }

 
}

class CategoryHierarchy {
  dynamic categoryId;
  String? name;
  String? enName;

  CategoryHierarchy({this.categoryId, this.name, this.enName});

  CategoryHierarchy.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    enName = json['en_name'];
  }

 
}

class Totals {
  String? title;
  String? text;
  String? value;
  String? code;

  Totals({this.title, this.text, this.value, this.code});

  Totals.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    text = json['text'];
    value = json['value'];
    code = json['code'];
  }


}

class RecommendedProducts {
  List<Products>? products;
 

  RecommendedProducts({this.products,  });

  RecommendedProducts.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    
  }

}

/*

class Products {
  String? id;
  String? thumb;
  String? priceFormated;
  String? priceWithoutCurrency;
  double? price;
  String? name;
  String? enName;
  String? description;
  String? sku;
  String? isbn;
  bool? hasOption;
  int? categoryId;
  int? quantity;
  List<Special>? special;
  String? manufacturer;
  bool? isNew;
  bool? isExclusive;
  int? order;
  Null? score;
  String? eventPrice;
  double? rating;
  String? totalReviews;
  String? seoUrlAr;
  String? seoUrlEn;
  String? shareUrl;
  List<Options>? options;
  List<CategoryHierarchy>? categoryHierarchy;
  Tag? tag;

  Products(
      {this.id,
      this.thumb,
      this.priceFormated,
      this.priceWithoutCurrency,
      this.price,
      this.name,
      this.enName,
      this.description,
      this.sku,
      this.isbn,
      this.hasOption,
      this.categoryId,
      this.quantity,
      this.special,
      this.manufacturer,
      this.isNew,
      this.isExclusive,
      this.order,
      this.score,
      this.eventPrice,
      this.rating,
      this.totalReviews,
      this.seoUrlAr,
      this.seoUrlEn,
      this.shareUrl,
      this.options,
      this.categoryHierarchy,
      this.tag});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thumb = json['thumb'];
    priceFormated = json['price_formated'];
    priceWithoutCurrency = json['priceWithoutCurrency'];
    price = json['price'];
    name = json['name'];
    enName = json['en_name'];
    description = json['description'];
    sku = json['sku'];
    isbn = json['isbn'];
    hasOption = json['has_option'];
    categoryId = json['category_id'];
    quantity = json['quantity'];
    if (json['special'] != null) {
      special = <Special>[];
      json['special'].forEach((v) {
        special!.add(Special.fromJson(v));
      });
    }
    manufacturer = json['manufacturer'];
    isNew = json['is_new'];
    isExclusive = json['is_exclusive'];
    order = json['order'];
    score = json['score'];
    eventPrice = json['event_price'];
    rating = json['rating'];
    totalReviews = json['total_reviews'];
    seoUrlAr = json['seo_url_ar'];
    seoUrlEn = json['seo_url_en'];
    shareUrl = json['share_url'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
    if (json['category_hierarchy'] != null) {
      categoryHierarchy = <CategoryHierarchy>[];
      json['category_hierarchy'].forEach((v) {
        categoryHierarchy!.add(CategoryHierarchy.fromJson(v));
      });
    }
    tag = json['tag'] != null ? Tag.fromJson(json['tag']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['thumb'] = thumb;
    data['price_formated'] = priceFormated;
    data['priceWithoutCurrency'] = priceWithoutCurrency;
    data['price'] = price;
    data['name'] = name;
    data['en_name'] = enName;
    data['description'] = description;
    data['sku'] = sku;
    data['isbn'] = isbn;
    data['has_option'] = hasOption;
    data['category_id'] = categoryId;
    data['quantity'] = quantity;
    if (special != null) {
      data['special'] = special!.map((v) => v.toJson()).toList();
    }
    data['manufacturer'] = manufacturer;
    data['is_new'] = isNew;
    data['is_exclusive'] = isExclusive;
    data['order'] = order;
    data['score'] = score;
    data['event_price'] = eventPrice;
    data['rating'] = rating;
    data['total_reviews'] = totalReviews;
    data['seo_url_ar'] = seoUrlAr;
    data['seo_url_en'] = seoUrlEn;
    data['share_url'] = shareUrl;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    if (categoryHierarchy != null) {
      data['category_hierarchy'] =
          categoryHierarchy!.map((v) => v.toJson()).toList();
    }
    if (tag != null) {
      data['tag'] = tag!.toJson();
    }
    return data;
  }
}

class Special {
  String? discountRatio;
  String? originalPrice;
  String? priceFormated;
  double? originalPriceWithoutCurrency;
  int? priceWithoutCurrency;
  int? dateStart;
  int? dateEnd;
  String? tagName;
  String? tagColor;

  Special(
      {this.discountRatio,
      this.originalPrice,
      this.priceFormated,
      this.originalPriceWithoutCurrency,
      this.priceWithoutCurrency,
      this.dateStart,
      this.dateEnd,
      this.tagName,
      this.tagColor});

  Special.fromJson(Map<String, dynamic> json) {
    discountRatio = json['discount_ratio'];
    originalPrice = json['original_price'];
    priceFormated = json['price_formated'];
    originalPriceWithoutCurrency = json['originalPriceWithoutCurrency'];
    priceWithoutCurrency = json['priceWithoutCurrency'];
    dateStart = json['date_start'];
    dateEnd = json['date_end'];
    tagName = json['tag_name'];
    tagColor = json['tag_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['discount_ratio'] = discountRatio;
    data['original_price'] = originalPrice;
    data['price_formated'] = priceFormated;
    data['originalPriceWithoutCurrency'] = originalPriceWithoutCurrency;
    data['priceWithoutCurrency'] = priceWithoutCurrency;
    data['date_start'] = dateStart;
    data['date_end'] = dateEnd;
    data['tag_name'] = tagName;
    data['tag_color'] = tagColor;
    return data;
  }
}

class Options {
  int? optionId;
  int? productOptionId;
  String? type;
  int? required;
  String? name;
  String? enName;
  List<OptionValue>? optionValue;

  Options(
      {this.optionId,
      this.productOptionId,
      this.type,
      this.required,
      this.name,
      this.enName,
      this.optionValue});

  Options.fromJson(Map<String, dynamic> json) {
    optionId = json['option_id'];
    productOptionId = json['product_option_id'];
    type = json['type'];
    required = json['required'];
    name = json['name'];
    enName = json['en_name'];
    if (json['option_value'] != null) {
      optionValue = <OptionValue>[];
      json['option_value'].forEach((v) {
        optionValue!.add(OptionValue.fromJson(v));
      });
    }
  }

 
}

class OptionValue {
  int? productOptionVariantId;
  int? quantity;
  String? image;
  String? hexColor;
  String? sku;
  String? price;
  String? priceFormated;
  String? eventPrice;
  String? name;
  String? enName;

  OptionValue(
      {this.productOptionVariantId,
      this.quantity,
      this.image,
      this.hexColor,
      this.sku,
      this.price,
      this.priceFormated,
      this.eventPrice,
      this.name,
      this.enName});

  OptionValue.fromJson(Map<String, dynamic> json) {
    productOptionVariantId = json['product_option_variant_id'];
    quantity = json['quantity'];
    image = json['image'];
    hexColor = json['hex_color'];
    sku = json['sku'];
    price = json['price'];
    priceFormated = json['price_formated'];
    eventPrice = json['event_price'];
    name = json['name'];
    enName = json['en_name'];
  }

 
}

class CategoryHierarchy {
  int? categoryId;
  String? name;
  String? enName;

  CategoryHierarchy({this.categoryId, this.name, this.enName});

  CategoryHierarchy.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    enName = json['en_name'];
  }

   
}

class Tag {
  String? text;
  String? backgroundColor;

  Tag({this.text, this.backgroundColor});

  Tag.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    backgroundColor = json['background_color'];
  }

  
}


*/