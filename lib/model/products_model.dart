class ProductsModel {
  ProductsModel({
    this.bed,
    this.bedroom,
    this.bookshelf,
    this.chair,
    this.diningroom,
    this.diningset,
    this.livingroom,
    this.sofa,
    this.table,
    this.wardrobes,
    this.light,
  });

  ProductsModel.fromJson(dynamic json) {
    if (json['bed'] != null) {
      bed = [];
      json['bed'].forEach((v) {
        bed?.add(Bed.fromJson(v));
      });
    }
    if (json['bedroom'] != null) {
      bedroom = [];
      json['bedroom'].forEach((v) {
        bedroom?.add(Bedroom.fromJson(v));
      });
    }
    if (json['bookshelf'] != null) {
      bookshelf = [];
      json['bookshelf'].forEach((v) {
        bookshelf?.add(Bookshelf.fromJson(v));
      });
    }
    if (json['chair'] != null) {
      chair = [];
      json['chair'].forEach((v) {
        chair?.add(Chair.fromJson(v));
      });
    }
    if (json['diningroom'] != null) {
      diningroom = [];
      json['diningroom'].forEach((v) {
        diningroom?.add(Diningroom.fromJson(v));
      });
    }
    if (json['diningset'] != null) {
      diningset = [];
      json['diningset'].forEach((v) {
        diningset?.add(Diningset.fromJson(v));
      });
    }
    if (json['livingroom'] != null) {
      livingroom = [];
      json['livingroom'].forEach((v) {
        livingroom?.add(Livingroom.fromJson(v));
      });
    }
    if (json['sofa'] != null) {
      sofa = [];
      json['sofa'].forEach((v) {
        sofa?.add(Sofa.fromJson(v));
      });
    }
    if (json['table'] != null) {
      table = [];
      json['table'].forEach((v) {
        table?.add(Table.fromJson(v));
      });
    }
    if (json['wardrobes'] != null) {
      wardrobes = [];
      json['wardrobes'].forEach((v) {
        wardrobes?.add(Wardrobes.fromJson(v));
      });
    }
    if (json['light'] != null) {
      light = [];
      json['light'].forEach((v) {
        light?.add(Light.fromJson(v));
      });
    }
  }
  List<Bed>? bed;
  List<Bedroom>? bedroom;
  List<Bookshelf>? bookshelf;
  List<Chair>? chair;
  List<Diningroom>? diningroom;
  List<Diningset>? diningset;
  List<Livingroom>? livingroom;
  List<Sofa>? sofa;
  List<Table>? table;
  List<Wardrobes>? wardrobes;
  List<Light>? light;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (bed != null) {
      map['bed'] = bed?.map((v) => v.toJson()).toList();
    }
    if (bedroom != null) {
      map['bedroom'] = bedroom?.map((v) => v.toJson()).toList();
    }
    if (bookshelf != null) {
      map['bookshelf'] = bookshelf?.map((v) => v.toJson()).toList();
    }
    if (chair != null) {
      map['chair'] = chair?.map((v) => v.toJson()).toList();
    }
    if (diningroom != null) {
      map['diningroom'] = diningroom?.map((v) => v.toJson()).toList();
    }
    if (diningset != null) {
      map['diningset'] = diningset?.map((v) => v.toJson()).toList();
    }
    if (livingroom != null) {
      map['livingroom'] = livingroom?.map((v) => v.toJson()).toList();
    }
    if (sofa != null) {
      map['sofa'] = sofa?.map((v) => v.toJson()).toList();
    }
    if (table != null) {
      map['table'] = table?.map((v) => v.toJson()).toList();
    }
    if (wardrobes != null) {
      map['wardrobes'] = wardrobes?.map((v) => v.toJson()).toList();
    }
    if (light != null) {
      map['light'] = light?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Light {
  Light({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Light.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }
  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Wardrobes {
  Wardrobes({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Wardrobes.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }
  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Table {
  Table({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Table.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }
  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Sofa {
  Sofa({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Sofa.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }
  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Livingroom {
  Livingroom({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Livingroom.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }
  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Diningset {
  Diningset({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Diningset.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }
  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Diningroom {
  Diningroom({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Diningroom.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }
  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Chair {
  Chair({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Chair.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }
  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Bookshelf {
  Bookshelf({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Bookshelf.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }
  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Bedroom {
  Bedroom({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Bedroom.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }
  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Bed {
  Bed({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Bed.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }
  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}
