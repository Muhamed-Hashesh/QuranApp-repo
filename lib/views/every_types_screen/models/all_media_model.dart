class AllMediaModel {
  List<Data>? data;

  AllMediaModel({data});

  AllMediaModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  String? image;
  List<PreparedBy>? preparedBy;
  List<Attachments>? attachments;

  Data({
    id,
    title,
    description,
    image,
    preparedBy,
    attachments,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    if (json['prepared_by'] != null) {
      preparedBy = <PreparedBy>[];
      json['prepared_by'].forEach((v) {
        preparedBy!.add(PreparedBy.fromJson(v));
      });
    }
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(Attachments.fromJson(v));
      });
    }
    if (json['locales'] != null) {
      json['locales'].forEach((v) {});
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    if (preparedBy != null) {
      data['prepared_by'] = preparedBy!.map((v) => v.toJson()).toList();
    }
    if (attachments != null) {
      data['attachments'] = attachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PreparedBy {
  int? id;
  String? title;
  String? description;

  PreparedBy({
    id,
    title,
    description,
  });

  PreparedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}

class Attachments {
  String? size;
  String? description;
  String? mediaUrl;

  Attachments({size, description, mediaUrl});

  Attachments.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    description = json['description'];
    mediaUrl = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['size'] = size;
    data['description'] = description;
    return data;
  }
}
