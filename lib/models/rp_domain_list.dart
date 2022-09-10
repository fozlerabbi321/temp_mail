class RpDomainList {
  RpDomainList({
      String? id, 
      String? domain, 
      bool? isActive, 
      bool? isPrivate, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _domain = domain;
    _isActive = isActive;
    _isPrivate = isPrivate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  RpDomainList.fromJson(dynamic json) {
    _id = json['id'];
    _domain = json['domain'];
    _isActive = json['isActive'];
    _isPrivate = json['isPrivate'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _domain;
  bool? _isActive;
  bool? _isPrivate;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get domain => _domain;
  bool? get isActive => _isActive;
  bool? get isPrivate => _isPrivate;
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