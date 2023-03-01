part of 'databases.dart';

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

  /// Untuk keperluan Update HPP, Total HPP, Margin, Total Margin By UniqueId
  Future<bool> update({
    required String uniqueId,
    required num priceProgram,
    required num priceProgramTotal,
    required double margin,
    required double marginTotal,
  }) async {
    try {
      await supabase.from(table).update({
        'priceProgram': priceProgram,
        'priceProgramTotal': priceProgramTotal,
        'margin': margin,
        'marginTotal': marginTotal
      }).match({'uniqueId': uniqueId});

      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }
}
