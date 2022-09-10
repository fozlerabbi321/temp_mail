class DomainModel {
  DomainModel({
      String? id, 
      String? domain, 
      int? isActive, 
      int? isPrivate, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _domain = domain;
    _isActive = isActive;
    _isPrivate = isPrivate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  DomainModel.fromJson(dynamic json) {
    _id = json['id'];
    _domain = json['domain'];
    _isActive = json['isActive'];
    _isPrivate = json['isPrivate'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _domain;
  int? _isActive;
  int? _isPrivate;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get domain => _domain;
  int? get isActive => _isActive;
  int? get isPrivate => _isPrivate;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['domain'] = _domain;
    map['isActive'] = _isActive;
    map['isPrivate'] = _isPrivate;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}