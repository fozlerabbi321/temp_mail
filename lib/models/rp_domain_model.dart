class RpDomainModel {
  RpDomainModel({
      String? id, 
      String? type, 
      List<DomainList>? domainList, 
      int? totalItems,}){
    _id = id;
    _type = type;
    _domainList = domainList;
    _totalItems = totalItems;
}

  RpDomainModel.fromJson(dynamic json) {
    _id = json['@id'];
    _type = json['@type'];
    if (json['hydra:member'] != null) {
      _domainList = [];
      json['hydra:member'].forEach((v) {
        _domainList?.add(DomainList.fromJson(v));
      });
    }
    _totalItems = json['hydra:totalItems'];
  }
  String? _context;
  String? _id;
  String? _type;
  List<DomainList>? _domainList;
  int? _totalItems;

  String? get context => _context;
  String? get id => _id;
  String? get type => _type;
  List<DomainList>? get domainList => _domainList;
  int? get totalItems => _totalItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['@id'] = _id;
    map['@type'] = _type;
    if (_domainList != null) {
      map['hydra:member'] = _domainList?.map((v) => v.toJson()).toList();
    }
    map['hydra:totalItems'] = _totalItems;
    return map;
  }

}

class DomainList {
  DomainList({
      String? pathId, 
      String? type, 
      String? id,
      String? domain, 
      bool? isActive, 
      bool? isPrivate, 
      String? createdAt, 
      String? updatedAt,}){
    _pathId = pathId;
    _type = type;
    _id = id;
    _domain = domain;
    _isActive = isActive;
    _isPrivate = isPrivate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  DomainList.fromJson(dynamic json) {
    _pathId = json['@id'];
    _type = json['@type'];
    _id = json['id'];
    _domain = json['domain'];
    _isActive = json['isActive'];
    _isPrivate = json['isPrivate'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _pathId;
  String? _type;
  String? _id;
  String? _domain;
  bool? _isActive;
  bool? _isPrivate;
  String? _createdAt;
  String? _updatedAt;

  String? get pathId => _pathId;
  String? get type => _type;
  String? get id => _id;
  String? get domain => _domain;
  bool? get isActive => _isActive;
  bool? get isPrivate => _isPrivate;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['path_id'] = _pathId;
    map['type'] = _type;
    map['id'] = _id;
    map['domain'] = _domain;
    map['isActive'] = _isActive;
    map['isPrivate'] = _isPrivate;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}