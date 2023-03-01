part of 'databases.dart';

class UserDatabase {
  final String table = 'users';

  Future createSuperAdmin() async {
    try {
      AuthResponse authResponse = await supabase.auth.signUp(
        email: 'superadmin@gmail.com',
        password: 'password',
      );

      if (authResponse.user != null) {
        await supabase.from(table).insert({
          'email': 'superadmin@gmail.com',
          'passwordRaw': 'password',
          'name': 'Super Admin',
          'status': 'Aktif',
          'uid': authResponse.user!.id,
          'role': 'Super Admin',
          'clusterId': 1,
          'createdAt': DateTime.now().toIso8601String(),
        });

        print('Berhasil');
      }
    } catch (e) {
      print(e);
    }
  }
}
