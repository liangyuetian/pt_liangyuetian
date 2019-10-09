import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';

class SQLKnow extends StatefulWidget {
  @override
  _SQLKnow createState() => new _SQLKnow();
}

class _SQLKnow extends State {
  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    createFileOfPdfUrl().then((f) {
      setState(() {
        pathPDF = f.path;
//        print(pathPDF);
      });
    });
  }

  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }


  Future<File> createFileOfPdfUrl() async {
    final filename = 'SQL必知必会（第4版）.pdf';
    //var request = await HttpClient().getUrl(Uri.parse(url));
    //var response = await request.close();
    final String path = 'assets/pdf/SQL必知必会（第4版）.pdf';
    var bytes = await rootBundle.load("assets/pdf/SQL必知必会（第4版）.pdf");

    String dir = (await getApplicationDocumentsDirectory()).path;
    writeToFile(bytes,'$dir/$filename');
    File file = new File('$dir/$path');
    //await file.writeAsBytes(bytes);

    return file;
  }

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("SQL必知必会（第4版）"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        path: pathPDF);
  }
}