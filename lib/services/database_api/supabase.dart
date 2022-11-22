import 'package:supabase/supabase.dart';

final SupaBase supaBase = SupaBase();

class SupaBase {
  static final SupaBase _instance = SupaBase._internal();

  factory SupaBase() => _instance;

  SupaBase._internal();

  final SupabaseClient client = SupabaseClient(
    'https://qvxpbgavyfvxvjaobwhf.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF2eHBiZ2F2eWZ2eHZqYW9id2hmIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njg5OTc4MzYsImV4cCI6MTk4NDU3MzgzNn0.Mq02i1jtMuoSfcuTY2VNzT2XzvPbpaNrn3eaH7oXZrc',
  );

  Future<Map> getUpdate() async {
    final response =
        await client.from('Update').select().order('LatestVersion');
    final List result = response.data as List;
    return result.isEmpty
        ? {}
        : {
            'LatestVersion': response.data[0]['LatestVersion'],
            'LatestUrl': response.data[0]['LatestUrl'],
            'arm64-v8a': response.data[0]['arm64-v8a'],
            'armeabi-v7a': response.data[0]['armeabi-v7a'],
            'universal': response.data[0]['universal'],
          };
  }

  Future<void> updateUserDetails(
    String? userId,
    String key,
    dynamic value,
  ) async {
    // final response = await client.from('Users').update({key: value},
    //     returning: ReturningOption.minimal).match({'id': userId}).execute();
    // print(response.toJson());
  }

  Future<int> createUser(Map data) async {
    final response = await client.from('Users').insert(data);
    return response.status ?? 404;
  }
}
