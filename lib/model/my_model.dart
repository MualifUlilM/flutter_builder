class MyModel {
  int id;
  String name;
  String photo;
  String phone;
  String address;
  String email;

  MyModel.fromJSON(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.address = json["address"];
    this.email = json["email"];
    this.phone = json["phone"];
    this.photo = json["photo"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "name": this.name,
      "photo": this.photo,
      "phone": this.phone,
      "email": this.email,
      "address": this.address,
    };
  }
}

class ModelItem {
  Map<String, dynamic> items = {};

  ModelItem.setter() {}
}

class ModelMap {
  static String x = "asd";
  Map<String, dynamic> a = {x: "asdasd"};
}
