class PostModel {
  String? sId;
  String? deviceCondition;
  String? listedBy;
  String? deviceStorage;
  List<Images>? images;
  Images? defaultImage;
  String? listingLocation;
  String? make;
  String? marketingName;
  String? mobileNumber;
  String? model;
  bool? verified;
  String? status;
  String? listingDate;
  String? deviceRam;
  String? createdAt;
  String? listingId;
  int? listingNumPrice;
  String? listingState;

  PostModel(
      {this.sId,
        this.deviceCondition,
        this.listedBy,
        this.deviceStorage,
        this.images,
        this.defaultImage,
        this.listingLocation,
        this.make,
        this.marketingName,
        this.mobileNumber,
        this.model,
        this.verified,
        this.status,
        this.listingDate,
        this.deviceRam,
        this.createdAt,
        this.listingId,
        this.listingNumPrice,
        this.listingState});

  PostModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    deviceCondition = json['deviceCondition'];
    listedBy = json['listedBy'];
    deviceStorage = json['deviceStorage'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    defaultImage = json['defaultImage'] != null
        ? Images.fromJson(json['defaultImage'])
        : null;
    listingLocation = json['listingLocation'];
    make = json['make'];
    marketingName = json['marketingName'];
    mobileNumber = json['mobileNumber'];
    model = json['model'];
    verified = json['verified'];
    status = json['status'];
    listingDate = json['listingDate'];
    deviceRam = json['deviceRam'];
    createdAt = json['createdAt'];
    listingId = json['listingId'];
    listingNumPrice = json['listingNumPrice'];
    listingState = json['listingState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['deviceCondition'] = deviceCondition;
    data['listedBy'] = listedBy;
    data['deviceStorage'] = deviceStorage;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (defaultImage != null) {
      data['defaultImage'] = defaultImage!.toJson();
    }
    data['listingLocation'] = listingLocation;
    data['make'] = make;
    data['marketingName'] = marketingName;
    data['mobileNumber'] = mobileNumber;
    data['model'] = model;
    data['verified'] = verified;
    data['status'] = status;
    data['listingDate'] = listingDate;
    data['deviceRam'] = deviceRam;
    data['createdAt'] = createdAt;
    data['listingId'] = listingId;
    data['listingNumPrice'] = listingNumPrice;
    data['listingState'] = listingState;
    return data;
  }
}

class Images {
  String? fullImage;

  Images({this.fullImage});

  Images.fromJson(Map<String, dynamic> json) {
    fullImage = json['fullImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullImage'] = fullImage;
    return data;
  }
}
