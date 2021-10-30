class Character {

  int? charId;
  String? name;
  String? birthday;
  List<String>? descriptionRole;
  String? img;
  String? status;
  String? nickname;
  List<dynamic>? appearanceOfSeasons;
  String? actorName;
  String? category;
  List<dynamic>? betterCallSaulAppearance;




  Character({
    int? charId,
    String? name,
    String? birthday,
    List<String>? descriptionRole,
    String? img,
    String? status,
    String? nickname,
    List<dynamic>? appearanceOfSeasons,
    String? actorName,
    String? category,
    List<dynamic>? betterCallSaulAppearance,
  });

  Character.fromJson(Map<String,dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    descriptionRole = json['occupation'] != null ? json['occupation'].cast<String>() : [];
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearanceOfSeasons = json['appearance'] != null ? json['appearance'].cast<int>() : [];
    actorName = json['portrayed'];
    category = json['category'];
    betterCallSaulAppearance = json['better_call_saul_appearance'] != null
        ? json['better_call_saul_appearance'].cast<int>()
        : [];
  }




  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['char_id'] = charId;
    map['name'] = name;
    map['birthday'] = birthday;
    map['occupation'] = descriptionRole;
    map['img'] = img;
    map['status'] = status;
    map['nickname'] = nickname;
    map['appearance'] = appearanceOfSeasons;
    map['portrayed'] = actorName;
    map['category'] = category;
    map['better_call_saul_appearance'] = betterCallSaulAppearance;

    return map;
  }
}
