

class FilterModel {
  List<String>? make;
  List<String>? condition;
  List<String>? storage;
  List<String>? ram;

  FilterModel({this.make, this.condition, this.storage, this.ram});

  FilterModel.fromJson(Map<String, dynamic> json) {
    make = json['make'].cast<String>();
    condition = json['condition'].cast<String>();
    storage = json['storage'].cast<String>();
    ram = json['ram'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['make'] = this.make;
    data['condition'] = this.condition;
    data['storage'] = this.storage;
    data['ram'] = this.ram;
    return data;
  }
}