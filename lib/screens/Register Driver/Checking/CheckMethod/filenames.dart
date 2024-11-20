class FileInformation {
  int? id;
  String? collection;
  String? hashName;
  String? originalName;
  String? type;
  Map<String, String>? ext;
  Map<String, dynamic>? size; // changed to dynamic to accommodate nested maps
  String? path;
  String? url;

  FileInformation({
    this.id,
    this.collection,
    this.hashName,
    this.originalName,
    this.type,
    this.ext,
    this.size,
    this.path,
    this.url,
  });

  factory FileInformation.fromJson(Map<String, dynamic> json) {
    return FileInformation(
      id: json['id'] ?? '',
      collection: json['collection']?? '',
      hashName: json['hash_name']?? '',
      originalName: json['original_name']?? '',
      type: json['type']?? '',
      ext: Map<String, String>.from(json['ext']?? ''),
      size: Map<String, dynamic>.from(json['size']?? ''),
      path: json['path']?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ,
      'collection': collection,
      'hash_name': hashName,
      'original_name': originalName,
      'type': type,
      'ext': ext,
      'size': size,
      'path': path,
      'url': url,
    };
  }
}
