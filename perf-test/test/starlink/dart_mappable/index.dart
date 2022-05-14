part of perf_test.test;

void testStarlink(Iterable list) {
  final stopwatch = Stopwatch()..start();
  final records = list.map((x) => Mapper.fromMap<Record>(x)).toList();
  final deserializationMs = stopwatch.elapsedMilliseconds;
  final timePerRecordMs =
      (deserializationMs / records.length).toStringAsPrecision(2);
  print(
      'Deserialization of ${records.length} records executed in ${deserializationMs}ms, at $timePerRecordMs ms per record');

  final stopwatch2 = Stopwatch()..start();
  JsonEncoder.withIndent(' ')
      .convert(records.map((x) => Mapper.toJson(x)).toList());
  final serializationMs = stopwatch2.elapsedMilliseconds;
  final timePerRecordMs2 =
      (serializationMs / records.length).toStringAsPrecision(2);
  print(
      'Serialization of ${records.length} records executed in ${serializationMs}ms, at $timePerRecordMs2 ms per record');
}
