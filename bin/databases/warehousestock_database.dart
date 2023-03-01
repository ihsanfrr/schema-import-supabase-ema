part of 'databases.dart';

class WarehouseStockDatabase {
  final String table = 'warehouseStocks';

  Future<bool> insert({
    required int itemId,
    required String docNumber,
    required int serialNumber,
    String? programName,
    required bool isDeleted,
    required int clusterId,
    int? programId,
    int? clusterDestination,
    required bool verifiedByDestination,
    int? salesId,
    int? outletId,
    required String msisdn,
    String? outletAt,
    String? salesAt,
    String? clusterAt,
    required String expiredAt,
    required String uniqueId,
    required String createdAt,
    String? updatedAt,
  }) async {
    try {
      await supabase.from(table).insert({
        'itemId': itemId,
        'docNumber': docNumber,
        'serialNumber': serialNumber,
        'programName': programName,
        'isDeleted': isDeleted,
        'clusterId': clusterId,
        'programId': programId,
        'clusterDestination': clusterDestination,
        'verifiedByDestination': verifiedByDestination,
        'salesId': salesId,
        'outletId': outletId,
        'msisdn': msisdn,
        'outletAt': outletAt,
        'salesAt': salesAt,
        'clusterAt': clusterAt,
        'expiredAt': expiredAt,
        'uniqueId': uniqueId,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      });

      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }
}
