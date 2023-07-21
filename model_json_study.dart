// convert json to dart
// https://javiercbk.github.io/json_to_dart/

void main() {
  var myMap = {
    "name": "Kezia",
    "age": 21,
    "city": "Surabaya",
    "address": [
      {
        "country": "Indonesia",
        "city": "Surabaya",
      },
      {
        "country": "Indonesia",
        "city": "Malang",
      }
    ]
  };

  print(myMap["name"]);
  print(myMap["address"]);

  var addressList = myMap["address"];
  print(addressList);

  (addressList as List).forEach((e) {
    print(e);
    print(e["city"]);
  });

  print("==============");

  var obj = Person.fromJson(myMap);
  print(obj);
  print(obj.name);
  print(obj.age);
  print(obj.city);
  print(obj.address);

  var myAddress = obj.address;
  print("my address : ");
  myAddress!.map((e) {
    print(e.country);
    print(e.city);
  }).toList();
}

class Person {
  String? name;
  int? age;
  String? city;
  List<Address>? address;

  Person({this.name, this.age, this.city, this.address});

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    city = json['city'];
    if (json['address'] != null) {
      address = <Address>[];
      (json['address'] as List).forEach((e) {
        address!.add(Address.fromJson(e));
      });
    }
  }
}

class Address {
  String? country;
  String? city;

  Address({this.country, this.city});

  Address.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    city = json['city'];
  }
}
