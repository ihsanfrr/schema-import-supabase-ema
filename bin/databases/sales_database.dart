part of 'databases.dart';

class SalesDatabase {
  final String table = 'masterSales';

  Future<AuthResponse?> createAccount({required String email}) async {
    try {
      AuthResponse authResponse = await supabase.auth.signUp(
        email: email,
        password: 'password',
      );

      return authResponse;
    } catch (e) {
      print(e);

      return null;
    }
  }

  Future<Map<String, dynamic>?> createUser({
    required String email,
    required String name,
    required String uid,
    required int clusterId,
  }) async {
    try {
      List<Map<String, dynamic>> user = await supabase.from('users').insert({
        'email': email,
        'passwordRaw': 'password',
        'name': name,
        'status': 'Aktif',
        'uid': uid,
        'role': 'Sales',
        'clusterId': clusterId,
        'createdAt': DateTime.now().toIso8601String(),
      }).select();

      return user[0];
    } catch (e) {
      print(e);

      return null;
    }
  }

  Future<bool> insert({
    required String name,
    required String email,
    required String uid,
    required String division,
    required int clusterId,
    required int userId,
  }) async {
    try {
      await supabase.from(table).insert({
        'name': name,
        'position': 'Sales',
        'status': 'Aktif',
        'email': email,
        'latitude': 0.0,
        'longitude': 0.0,
        'uid': uid,
        'credits': 0,
        'division': division,
        'clusterId': clusterId,
        'userId': userId,
        'createdAt': DateTime.now().toIso8601String(),
      });

      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }
}
