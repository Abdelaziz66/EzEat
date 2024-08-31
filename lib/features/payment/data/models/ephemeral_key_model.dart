
class EphemeralKeyModel {
  String? id;
  String? object;
  List<AssociatedObject>? associatedObjects;
  int? created;
  int? expires;
  bool? livemode;
  String? secret;

  EphemeralKeyModel({
    this.id,
    this.object,
    this.associatedObjects,
    this.created,
    this.expires,
    this.livemode,
    this.secret,
  });

  factory EphemeralKeyModel.fromJson(Map<String, dynamic> json) => EphemeralKeyModel(
    id: json["id"],
    object: json["object"],
    associatedObjects: json["associated_objects"] == null ? [] : List<AssociatedObject>.from(json["associated_objects"]!.map((x) => AssociatedObject.fromJson(x))),
    created: json["created"],
    expires: json["expires"],
    livemode: json["livemode"],
    secret: json["secret"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "associated_objects": associatedObjects == null ? [] : List<dynamic>.from(associatedObjects!.map((x) => x.toJson())),
    "created": created,
    "expires": expires,
    "livemode": livemode,
    "secret": secret,
  };
}

class AssociatedObject {
  String? id;
  String? type;

  AssociatedObject({
    this.id,
    this.type,
  });

  factory AssociatedObject.fromJson(Map<String, dynamic> json) => AssociatedObject(
    id: json["id"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
  };
}
