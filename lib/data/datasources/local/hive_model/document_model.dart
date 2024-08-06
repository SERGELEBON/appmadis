import 'package:hive/hive.dart';

//part 'document_model.g.dart';

@HiveType(typeId: 1)
class DocumentModel extends HiveObject {
  @HiveField(0)
  String documentType;

  @HiveField(1)
  String filePath;

  DocumentModel({
    required this.documentType,
    required this.filePath,
  });
}


