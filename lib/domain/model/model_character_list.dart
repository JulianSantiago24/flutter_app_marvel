import 'dart:convert';

class CharacterListModel {
  final int? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHtml;
  final String? etag;
  final Data? data;

  CharacterListModel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  factory CharacterListModel.fromJson(String str) =>
      CharacterListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CharacterListModel.fromMap(Map<String, dynamic> json) =>
      CharacterListModel(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": data?.toMap(),
      };
}

class Data {
  final int? offset;
  final int? limit;
  final int? total;
  final int? count;
  final List<Result>? results;

  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: json["results"] == null
            ? []
            : List<Result>.from(json["results"]!.map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class Result {
  final int? id;
  final String? name;
  final String? description;
  final String? modified;
  final Thumbnail? thumbnail;
  final String? resourceUri;
  final Comics? comics;
  final Comics? series;
  final Stories? stories;
  final Comics? events;
  final List<Url>? urls;

  Result({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceUri,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromMap(json["thumbnail"]),
        resourceUri: json["resourceURI"],
        comics: json["comics"] == null ? null : Comics.fromMap(json["comics"]),
        series: json["series"] == null ? null : Comics.fromMap(json["series"]),
        stories:
            json["stories"] == null ? null : Stories.fromMap(json["stories"]),
        events: json["events"] == null ? null : Comics.fromMap(json["events"]),
        urls: json["urls"] == null
            ? []
            : List<Url>.from(json["urls"]!.map((x) => Url.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "thumbnail": thumbnail?.toMap(),
        "resourceURI": resourceUri,
        "comics": comics?.toMap(),
        "series": series?.toMap(),
        "stories": stories?.toMap(),
        "events": events?.toMap(),
        "urls":
            urls == null ? [] : List<dynamic>.from(urls!.map((x) => x.toMap())),
      };
}

class Comics {
  final int? available;
  final String? collectionUri;
  final List<ComicsItem>? items;
  final int? returned;

  Comics({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Comics.fromJson(String str) => Comics.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Comics.fromMap(Map<String, dynamic> json) => Comics(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<ComicsItem>.from(
                json["items"]!.map((x) => ComicsItem.fromMap(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
        "returned": returned,
      };
}

class ComicsItem {
  final String? resourceUri;
  final String? name;

  ComicsItem({
    this.resourceUri,
    this.name,
  });

  factory ComicsItem.fromJson(String str) =>
      ComicsItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComicsItem.fromMap(Map<String, dynamic> json) => ComicsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class Stories {
  final int? available;
  final String? collectionUri;
  final List<StoriesItem>? items;
  final int? returned;

  Stories({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Stories.fromJson(String str) => Stories.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Stories.fromMap(Map<String, dynamic> json) => Stories(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<StoriesItem>.from(
                json["items"]!.map((x) => StoriesItem.fromMap(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
        "returned": returned,
      };
}

class StoriesItem {
  final String? resourceUri;
  final String? name;
  final ItemType? type;

  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  factory StoriesItem.fromJson(String str) =>
      StoriesItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StoriesItem.fromMap(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: itemTypeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": itemTypeValues.reverse[type],
      };
}

enum ItemType {
  COVER,
  INTERIOR_STORY,
  EMPTY,
  PINUP,
  BACKCOVERS,
  AD,
  TEXT_ARTICLE
}

final itemTypeValues = EnumValues({
  "ad": ItemType.AD,
  "backcovers": ItemType.BACKCOVERS,
  "cover": ItemType.COVER,
  "": ItemType.EMPTY,
  "interiorStory": ItemType.INTERIOR_STORY,
  "pinup": ItemType.PINUP,
  "text article": ItemType.TEXT_ARTICLE
});

class Thumbnail {
  final String? path;
  final String? extension;

  Thumbnail({
    this.path,
    this.extension,
  });

  factory Thumbnail.fromJson(String str) => Thumbnail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Thumbnail.fromMap(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
      );

  Map<String, dynamic> toMap() => {
        "path": path,
        "extension": extension,
      };
}

class Url {
  final UrlType? type;
  final String? url;

  Url({
    this.type,
    this.url,
  });

  factory Url.fromJson(String str) => Url.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Url.fromMap(Map<String, dynamic> json) => Url(
        type: urlTypeValues.map[json["type"]]!,
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "type": urlTypeValues.reverse[type],
        "url": url,
      };
}

enum UrlType { DETAIL, WIKI, COMICLINK }

final urlTypeValues = EnumValues({
  "comiclink": UrlType.COMICLINK,
  "detail": UrlType.DETAIL,
  "wiki": UrlType.WIKI
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
