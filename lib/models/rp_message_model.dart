class RpMessageModel {
  RpMessageModel({
      String? context, 
      String? id, 
      String? type, 
      List<MessageList>? messageList, 
      int? totalItems,}){
    _context = context;
    _id = id;
    _type = type;
    _messageList = messageList;
    _totalItems = totalItems;
}

  RpMessageModel.fromJson(dynamic json) {
    _context = json['@context'];
    _id = json['@id'];
    _type = json['@type'];
    if (json['hydra:member'] != null) {
      _messageList = [];
      json['hydra:member'].forEach((v) {
        _messageList?.add(MessageList.fromJson(v));
      });
    }
    _totalItems = json['hydra:totalItems'];
  }
  String? _context;
  String? _id;
  String? _type;
  List<MessageList>? _messageList;
  int? _totalItems;

  String? get context => _context;
  String? get id => _id;
  String? get type => _type;
  List<MessageList>? get messageList => _messageList;
  int? get totalItems => _totalItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['@context'] = _context;
    map['@id'] = _id;
    map['@type'] = _type;
    if (_messageList != null) {
      map['hydra:member'] = _messageList?.map((v) => v.toJson()).toList();
    }
    map['hydra:totalItems'] = _totalItems;
    return map;
  }

}

class MessageList {
  MessageList({
      String? keyId, 
      String? type, 
      String? id, 
      String? accountId, 
      String? msgid, 
      From? from, 
      List<To>? to, 
      String? subject, 
      String? intro, 
      bool? seen, 
      bool? isDeleted, 
      bool? hasAttachments, 
      int? size, 
      String? downloadUrl, 
      String? createdAt, 
      String? updatedAt,}){
    _keyId = keyId;
    _type = type;
    _id = id;
    _accountId = accountId;
    _msgid = msgid;
    _from = from;
    _to = to;
    _subject = subject;
    _intro = intro;
    _seen = seen;
    _isDeleted = isDeleted;
    _hasAttachments = hasAttachments;
    _size = size;
    _downloadUrl = downloadUrl;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  MessageList.fromJson(dynamic json) {
    _keyId = json['@id'];
    _type = json['@type'];
    _id = json['id'];
    _accountId = json['accountId'];
    _msgid = json['msgid'];
    _from = json['from'] != null ? From.fromJson(json['from']) : null;
    if (json['to'] != null) {
      _to = [];
      json['to'].forEach((v) {
        _to?.add(To.fromJson(v));
      });
    }
    _subject = json['subject'];
    _intro = json['intro'];
    _seen = json['seen'];
    _isDeleted = json['isDeleted'];
    _hasAttachments = json['hasAttachments'];
    _size = json['size'];
    _downloadUrl = json['downloadUrl'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _keyId;
  String? _type;
  String? _id;
  String? _accountId;
  String? _msgid;
  From? _from;
  List<To>? _to;
  String? _subject;
  String? _intro;
  bool? _seen;
  bool? _isDeleted;
  bool? _hasAttachments;
  int? _size;
  String? _downloadUrl;
  String? _createdAt;
  String? _updatedAt;

  String? get keyId => _keyId;
  String? get type => _type;
  String? get id => _id;
  String? get accountId => _accountId;
  String? get msgid => _msgid;
  From? get from => _from;
  List<To>? get to => _to;
  String? get subject => _subject;
  String? get intro => _intro;
  bool? get seen => _seen;
  bool? get isDeleted => _isDeleted;
  bool? get hasAttachments => _hasAttachments;
  int? get size => _size;
  String? get downloadUrl => _downloadUrl;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['@id'] = _keyId;
    map['@type'] = _type;
    map['id'] = _id;
    map['accountId'] = _accountId;
    map['msgid'] = _msgid;
    if (_from != null) {
      map['from'] = _from?.toJson();
    }
    if (_to != null) {
      map['to'] = _to?.map((v) => v.toJson()).toList();
    }
    map['subject'] = _subject;
    map['intro'] = _intro;
    map['seen'] = _seen;
    map['isDeleted'] = _isDeleted;
    map['hasAttachments'] = _hasAttachments;
    map['size'] = _size;
    map['downloadUrl'] = _downloadUrl;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}

class To {
  To({
      String? address, 
      String? name,}){
    _address = address;
    _name = name;
}

  To.fromJson(dynamic json) {
    _address = json['address'];
    _name = json['name'];
  }
  String? _address;
  String? _name;

  String? get address => _address;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = _address;
    map['name'] = _name;
    return map;
  }

}

class From {
  From({
      String? address, 
      String? name,}){
    _address = address;
    _name = name;
}

  From.fromJson(dynamic json) {
    _address = json['address'];
    _name = json['name'];
  }
  String? _address;
  String? _name;

  String? get address => _address;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = _address;
    map['name'] = _name;
    return map;
  }

}