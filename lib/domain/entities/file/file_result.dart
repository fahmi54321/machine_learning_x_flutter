abstract class FileResult {}

class FileSuccess extends FileResult {
  final String path;
  FileSuccess(this.path);
}

class FileCanceled extends FileResult {}
