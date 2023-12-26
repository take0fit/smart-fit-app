class ChatMessageFile {
  ChatMessageFile({
    required this.name,
    this.sizeBytes,
    this.contentType,
    required this.url,
  });

  ChatMessageFile.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        sizeBytes = map['sizeBytes'],
        contentType = map['contentType'],
        url = map['url'];

  final String name;
  final int? sizeBytes;
  final String? contentType;
  final String url;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'sizeBytes': sizeBytes,
      'contentType': contentType,
      'url': url,
    };
  }
}
