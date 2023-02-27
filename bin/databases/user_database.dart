import 'package:supabase/supabase.dart';

SupabaseClient supabase = SupabaseClient(
  'https://xsgwmtxkrfycnzttdpjo.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhzZ3dtdHhrcmZ5Y256dHRkcGpvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk2Mjc4NjQsImV4cCI6MTk4NTIwMzg2NH0.4TbTywLCrf4y5EG2BP3v6f8mJHFinkkGoSOxVDSEbZM',
);

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
