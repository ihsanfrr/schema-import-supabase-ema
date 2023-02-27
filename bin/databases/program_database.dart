import 'package:supabase/supabase.dart';

SupabaseClient supabase = SupabaseClient(
  'https://xsgwmtxkrfycnzttdpjo.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhzZ3dtdHhrcmZ5Y256dHRkcGpvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk2Mjc4NjQsImV4cCI6MTk4NTIwMzg2NH0.4TbTywLCrf4y5EG2BP3v6f8mJHFinkkGoSOxVDSEbZM',
);

class ProgramDatabase {
  final String table = 'programs';

  Future<bool> insert({
    required String createdAt,
    required String docNumber,
    required String description,
    required int clusterId,
    required int qty,
    required int itemId,
    required String type,
    required String injectionType,
    required int priceItem,
    required int priceItemTotal,
    required String name,
    required int priceNGRS,
    required int priceNGRSTotal,
    required num perdanaSubsidy,
    required num perdanaSubsidiTotal,
    required int telkomselCashback,
    required int telkomselCashbackTotal,
    required num digistarCashback,
    required int digistarCashbackTotal,
    required int endOfYearInsentive,
    required int endOfYearInsentiveTotal,
    required int commitmentBudget,
    required int commitmentBudgetTotal,
    required int otherSubsidy,
    required int otherSubsidyTotal,
    required num priceProgram,
    required num priceProgramTotal,
    required int price,
    required int priceTotal,
    required double margin,
    required double marginTotal,
    required String uniqueId,
    required String expiredAt,
    required bool topable,
  }) async {
    try {
      await supabase.from(table).insert({
        'docNumber': docNumber,
        'description': description,
        'clusterId': clusterId,
        'qty': qty,
        'itemId': itemId,
        'type': type,
        'injectionType': injectionType,
        'priceItem': priceItem,
        'priceItemTotal': priceItemTotal,
        'name': name,
        'priceNGRS': priceNGRS,
        'priceNGRSTotal': priceNGRSTotal,
        'perdanaSubsidy': perdanaSubsidy,
        'perdanaSubsidiTotal': perdanaSubsidiTotal,
        'telkomselCashback': telkomselCashback,
        'telkomselCashbackTotal': telkomselCashbackTotal,
        'digistarCashback': digistarCashback,
        'digistarCashbackTotal': digistarCashbackTotal,
        'endOfYearInsentive': endOfYearInsentive,
        'endOfYearInsentiveTotal': endOfYearInsentiveTotal,
        'commitmentBudget': commitmentBudget,
        'commitmentBudgetTotal': commitmentBudgetTotal,
        'otherSubsidy': otherSubsidy,
        'otherSubsidyTotal': otherSubsidyTotal,
        'priceProgram': priceProgram,
        'priceProgramTotal': priceProgramTotal,
        'price': price,
        'priceTotal': priceTotal,
        'margin': margin,
        'marginTotal': marginTotal,
        'uniqueId': uniqueId,
        'expiredAt': expiredAt,
        'topable': topable,
        'createdAt': createdAt,
      });

      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }
}
