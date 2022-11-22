import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../database_api/supabase.dart';

Uuid uuid = const Uuid();

Future addUserData(String name) async {
  int? status;
  await Hive.box('settings').put('name', name.trim());
  final DateTime now = DateTime.now();
  final List createDate = now
      .toUtc()
      .add(const Duration(hours: 5, minutes: 30))
      .toString()
      .split('.')
    ..removeLast()
    ..join('.');

  String userId = uuid.v1();
  status = await supaBase.createUser({
    'id': userId,
    'name': name,
    'created_at': '${createDate[0]} IST',
  });

  while (status == null || status == 409) {
    userId = uuid.v1();
    status = await supaBase.createUser({
      'id': userId,
      'name': name,
      'created_at': '${createDate[0]} IST',
    });
  }
  await Hive.box('settings').put('userId', userId);
}
