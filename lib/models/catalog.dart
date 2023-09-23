import 'dart:convert';

class Mymodels {
  static final CatModel = Mymodels._internal();

  Mymodels._internal();
 
  factory Mymodels() => CatModel;

  static List<Item> items = [];

  Item getbyId(int id) =>
      items.firstWhere((element) => element.id == id, orElse: () => Item(0, '', 0, '', '', ''));

  Item? getbyPosition(int pos) => pos < items.length ? items[pos] : null;
}


class Item {
  final int id; // Explicitly specify 'int' as the type for the 'id' parameter.
  final String name;
  final num price;
  final String desc;
  final String color;
  final String image;

  Item(
    this.id,
    this.name,
    this.price,
    this.desc,
    this.color,
    this.image,
  );

  Item copyWith({
    int? id,
    String? name,
    num? price,
    String? desc,
    String? color,
    String? image,
  }) {
    return Item(
      id ?? this.id,
      name ?? this.name,
      price ?? this.price,
      desc ?? this.desc,
      color ?? this.color,
      image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'desc': desc,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id'] as int,               //mistake yaha ki
      map['name'] as String,
      map['price'] as num,
      map['desc'] as String,
      map['color'] as String,
      map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, price: $price, desc: $desc, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.price == price &&
        other.desc == desc &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        desc.hashCode ^
        color.hashCode ^
        image.hashCode;
  }

  static fold(int i, Function(dynamic total, dynamic current) param1) {}
}
