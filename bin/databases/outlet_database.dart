import 'package:supabase/supabase.dart';

SupabaseClient supabase = SupabaseClient(
  'https://xsgwmtxkrfycnzttdpjo.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhzZ3dtdHhrcmZ5Y256dHRkcGpvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk2Mjc4NjQsImV4cCI6MTk4NTIwMzg2NH0.4TbTywLCrf4y5EG2BP3v6f8mJHFinkkGoSOxVDSEbZM',
);

class OutletDatabase {
  final String table = 'masterOutlets';

  Future<bool> insert({
    required int digiposId,
    required String noChip,
    required String name,
    String? ownerName,
    String? noSd,
    required String address,
    required int clusterId,
    required int salesId,
    required String day,
  }) async {
    try {
      await supabase.from(table).insert({
        'digiposId': digiposId,
        'noChip': noChip,
        'name': name,
        'ownerName': ownerName,
        'noSd': noSd,
        'type': 'rsout',
        'active': DateTime.now().toIso8601String(),
        'address': address,
        'clusterId': clusterId,
        'latitude': 0.0,
        'longitude': 0.0,
        'isDeleted': false,
        'salesId': salesId,
        'day': day,
        'createdAt': DateTime.now().toIso8601String(),
      });

      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }
}
