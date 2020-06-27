import 'dart:io';
import "package:path/path.dart" show dirname, join, normalize;
import '../lib/json_to_dart.dart';

String _scriptPath() {
  var script = Platform.script.toString();
  if (script.startsWith("file://")) {
    script = script.substring(7);
    print(script);
  } else {
    final idx = script.indexOf("file:/");
    script = script.substring(idx + 5);
    print('there');
  }
  return script.substring(1);
}

main() {
  final classGenerator = new ModelGenerator('Sample');
  final currentDirectory = dirname(_scriptPath());
  final filePath = normalize(join(currentDirectory, 'sample.json'));
  final jsonRawData = new File(filePath).readAsStringSync();
  DartCode dartCode = classGenerator.generateDartClasses(jsonRawData);
  print(dartCode.code);
}
