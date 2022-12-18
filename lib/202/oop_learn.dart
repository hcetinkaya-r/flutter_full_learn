import 'dart:io';

import 'package:flutter_101/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);

  void toShare(Uri path) {
    Future<void> _launchUrl() async {
      !await launchUrl(path);
    }
  }
}

class FileDownload extends IFileDownload with ShareMixin {
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    print('a');

    return true;
  }
  
  @override
  void toShare(Uri path) {
    // TODO: implement toShare
  }

  void smsShare(){}
}

class SmsDownload implements IFileDownload  {
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    print('a');

    return true;
  }

  @override
  void toShare(Uri path) {
    // TODO: implement toShare
  }

  void smsShare() {}
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}


mixin ShareMixin on IFileDownload{
  void toShowFile(){

  }
}


