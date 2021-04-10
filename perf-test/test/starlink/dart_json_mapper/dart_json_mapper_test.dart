library perf_test.test;

import 'dart:convert' show json;
import 'dart:io' show File;

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:path/path.dart' as path;

import 'dart_json_mapper_test.mapper.g.dart' show initializeJsonMapper;

part './index.dart';
part './model.dart';

void main() async {
  initializeJsonMapper();
  print('\n>> dart_json_mapper');
  testStarlink(json.decode(
      await File(path.absolute('test/starlink/starlink.json')).readAsString()));
}
