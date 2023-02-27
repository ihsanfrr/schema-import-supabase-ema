import 'dart:io';

import 'package:excel/excel.dart';
import 'package:supabase/supabase.dart';

SupabaseClient supabase = SupabaseClient(
  'https://xsgwmtxkrfycnzttdpjo.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhzZ3dtdHhrcmZ5Y256dHRkcGpvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk2Mjc4NjQsImV4cCI6MTk4NTIwMzg2NH0.4TbTywLCrf4y5EG2BP3v6f8mJHFinkkGoSOxVDSEbZM',
);

Future warehouseStockImport() async {
  // TODO: masukkan path file xlsx yang tersimpan.
  var file = "/Users/ihsanfrr/Downloads/Format Stok Gudang TAP MAGETAN 2.xlsx";
  var bytes = File(file).readAsBytesSync();
  var excel = Excel.decodeBytes(bytes);

  String name = '';
  List<dynamic> program = [];
  List<dynamic> item = [];

  List<dynamic> warehouseStocks = [];

  for (var table in excel.tables.keys) {
    for (var i = 0; i < excel.tables[table]!.rows.length; i++) {
      if (i != 0) {
        List<Data?> data = excel.tables[table]!.rows[i];
        if (name == data[3]!.value) {
          if (program.isNotEmpty) {
            warehouseStocks.add({
              'itemId': program[0]['item']['id'],
              'docNumber': data[1] != null ? data[1]!.value : null,
              'serialNumber': int.parse(data[2]!.value),
              'programName': program[0]['name'],
              'isDeleted': false,
              'clusterId': 1,
              'programId': program[0]['id'],
              'clusterDestination': null,
              'verifiedByDestination': false,
              'salesId': null,
              'outletId': null,
              'msisdn': data[7] != null ? data[7]!.value : null,
              'outletAt': null,
              'salesAt': null,
              'clusterAt': null,
              'expiredAt': data[6] != null
                  ? DateTime.parse(data[6]!.value).toIso8601String()
                  : null,
              'uniqueId': data[8] != null ? data[8]!.value : null,
              'createdAt': data[6] != null
                  ? DateTime.parse(data[6]!.value)
                      .add(Duration(days: -120))
                      .toIso8601String()
                  : null,
              'updatedAt': null,
            });

            print('$i added');
          } else {
            warehouseStocks.add({
              'itemId': item[0]['id'],
              'docNumber': data[1] != null ? data[1]!.value : null,
              'serialNumber': int.parse(data[2]!.value),
              'programName': null,
              'isDeleted': false,
              'clusterId': 1,
              'programId': null,
              'clusterDestination': null,
              'verifiedByDestination': false,
              'salesId': null,
              'outletId': null,
              'msisdn': data[7] != null ? data[7]!.value : null,
              'outletAt': null,
              'salesAt': null,
              'clusterAt': null,
              'expiredAt': data[6] != null
                  ? DateTime.parse(data[6]!.value).toIso8601String()
                  : null,
              'uniqueId': data[8] != null ? data[8]!.value : null,
              'createdAt': data[6] != null
                  ? DateTime.parse(data[6]!.value)
                      .add(Duration(days: -120))
                      .toIso8601String()
                  : null,
              'updatedAt': null,
            });

            print('$i added');
          }
        } else {
          name = data[3]!.value;
          program = await supabase
              .from('programs')
              .select('''*, item:masterItems(*)''').eq('name', name.trim());

          if (program.isNotEmpty) {
            warehouseStocks.add({
              'itemId': program[0]['item']['id'],
              'docNumber': data[1] != null ? data[1]!.value : null,
              'serialNumber': int.parse(data[2]!.value),
              'programName': program[0]['name'],
              'isDeleted': false,
              'clusterId': 1,
              'programId': program[0]['id'],
              'clusterDestination': null,
              'verifiedByDestination': false,
              'salesId': null,
              'outletId': null,
              'msisdn': data[7] != null ? data[7]!.value : null,
              'outletAt': null,
              'salesAt': null,
              'clusterAt': null,
              'expiredAt': data[6] != null
                  ? DateTime.parse(data[6]!.value).toIso8601String()
                  : null,
              'uniqueId': data[8] != null ? data[8]!.value : null,
              'createdAt': data[6] != null
                  ? DateTime.parse(data[6]!.value)
                      .add(Duration(days: -120))
                      .toIso8601String()
                  : null,
              'updatedAt': null,
            });

            print('$i added');
          } else {
            program = [];
            item = await supabase
                .from('masterItems')
                .select()
                .eq('name', name.trim());

            if (item.isNotEmpty) {
              warehouseStocks.add({
                'itemId': item[0]['id'],
                'docNumber': data[1] != null ? data[1]!.value : null,
                'serialNumber': int.parse(data[2]!.value),
                'programName': null,
                'isDeleted': false,
                'clusterId': 1,
                'programId': null,
                'clusterDestination': null,
                'verifiedByDestination': false,
                'salesId': null,
                'outletId': null,
                'msisdn': data[7] != null ? data[7]!.value : null,
                'outletAt': null,
                'salesAt': null,
                'clusterAt': null,
                'expiredAt': data[6] != null
                    ? DateTime.parse(data[6]!.value).toIso8601String()
                    : null,
                'uniqueId': data[8] != null ? data[8]!.value : null,
                'createdAt': data[6] != null
                    ? DateTime.parse(data[6]!.value)
                        .add(Duration(days: -120))
                        .toIso8601String()
                    : null,
                'updatedAt': null,
              });

              print('$i added');
            } else {
              List<Map<String, dynamic>> items =
                  await supabase.from('masterItems').insert({
                'name': name,
                'typeId': 1,
                'isDeleted': false,
                'basePrice': 0,
                'price': 0,
                'topable': false,
                'createdAt': DateTime.now().toIso8601String(),
              }).select();

              item = items;

              warehouseStocks.add({
                'itemId': item[0]['id'],
                'docNumber': data[1] != null ? data[1]!.value : null,
                'serialNumber': int.parse(data[2]!.value),
                'programName': null,
                'isDeleted': false,
                'clusterId': 1,
                'programId': null,
                'clusterDestination': null,
                'verifiedByDestination': false,
                'salesId': null,
                'outletId': null,
                'msisdn': data[7] != null ? data[7]!.value : null,
                'outletAt': null,
                'salesAt': null,
                'clusterAt': null,
                'expiredAt': data[6] != null
                    ? DateTime.parse(data[6]!.value).toIso8601String()
                    : null,
                'uniqueId': data[8] != null ? data[8]!.value : null,
                'createdAt': data[6] != null
                    ? DateTime.parse(data[6]!.value)
                        .add(Duration(days: -120))
                        .toIso8601String()
                    : null,
                'updatedAt': null,
              });

              print('$i added');
            }
          }
        }
      }
      if (i == 10000) {
        print(warehouseStocks.length);
        await supabase.from('warehouseStocks').insert(warehouseStocks);
        exit(1);
      }
    }
  }
}
