

class SearchModel {
  List<String>? makes;
  List<String>? models;
  String? message;
  String? searchModel;

  SearchModel({this.makes, this.models, this.message, this.searchModel});

  SearchModel.fromJson(Map<String, dynamic> json) {
    makes = json['makes'].cast<String>();
    models = json['models'].cast<String>();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['searchModel'] = this.searchModel;
    return data;
  }
}
