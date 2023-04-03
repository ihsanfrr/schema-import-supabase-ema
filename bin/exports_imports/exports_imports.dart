import 'dart:io';

import 'package:supabase/supabase.dart';

import '../databases/databases.dart';
import '../handle_case/models.dart';

class ExportsImports {
  Future<void> init() async {
    List<String> tables = [
      'masterClusters',
      'users',
      'masterSales',
      'masterOutlets',
      'masterItemTypes',
      'masterItems',
      'programs',
      'warehouseStocks',
      'histories',
      'receipts',
      'receiptDetails',
      'credits',
    ];

    // DELETE ALL TABLE ENTRY
    // for (var table in tables.reversed.toList()) {
    await supabaseDev.from('receiptDetails').delete().gt('id', 0);
    //   print('Delete From $table: Done');
    // }

    // EXPORTs FROM ALL TABLE
    List<List<dynamic>> tableEntries = [];
    List<dynamic> warehouseStocks = [];
    List<dynamic> histories = [];
    List<dynamic> receipts = [];
    List<dynamic> receiptDetails = [];
    List<dynamic> credits = [];
    for (int j = 0; j < tables.length; j++) {
      var table = tables[j];
      if (j < 7) {
        // tableEntries.add(await supabase.from(table).select());
        // print('Select From $table: Done');
      } else if (table == 'warehouseStocks') {
        // List<dynamic> results = [];
        // int offset = 0;

        // while (true) {
        //   List<dynamic> data =
        //       await supabase.from(table).select().range(offset, offset + 9999);

        //   if (data.isEmpty) {
        //     break;
        //   }

        //   results.addAll(data);

        //   offset += 10000;
        //   print(offset);
        // }

        // warehouseStocks.addAll(results);
        // print(results.length);
        // print('Select From $table: Done');
      } else if (table == 'histories') {
        // List<dynamic> results = [];
        // int offset = 0;

        // while (true) {
        //   List<dynamic> data =
        //       await supabase.from(table).select().range(offset, offset + 9999);

        //   if (data.isEmpty) {
        //     break;
        //   }

        //   results.addAll(data);

        //   offset += 10000;
        //   print(offset);
        // }

        // histories.addAll(results);
        // print(results.length);
        // print('Select From $table: Done');
      } else if (table == 'receipts') {
        // List<dynamic> results = [];
        // int offset = 0;

        // while (true) {
        //   List<dynamic> data =
        //       await supabase.from(table).select().range(offset, offset + 9999);

        //   if (data.isEmpty) {
        //     break;
        //   }

        //   results.addAll(data);

        //   offset += 10000;
        //   print(offset);
        // }

        // receipts.addAll(results);
        // print(results.length);
        // print('Select From $table: Done');
      } else if (table == 'receiptDetails') {
        List<dynamic> results = [];
        int offset = 0;

        while (true) {
          List<dynamic> data =
              await supabase.from(table).select().range(offset, offset + 9999);

          if (data.isEmpty) {
            break;
          }

          results.addAll(data);

          offset += 10000;
          print(offset);
        }

        receiptDetails.addAll(results);
        print(results.length);
        print('Select From $table: Done');
      } else if (table == 'credits') {
        // credits.add(await supabase.from(table).select());
        // print('Select From $table: Done');
      }
    }

    // IMPORTs FOR ALL TABLE
    for (int i = 0; i < tables.length; i++) {
      var table = tables[i];
      if (i < 7) {
        // await supabaseDev.from(table).insert(tableEntries[i]);
        // print('Insert Bulk To $table: Done');
      } else if (table == 'warehouseStocks') {
        // List<dynamic> dataList = warehouseStocks;
        // final numParts = 30;
        // int partSize = (dataList.length / numParts).ceil();
        // List<List<dynamic>> dataParts = [];
        // for (int i = 0; i < dataList.length; i += partSize) {
        //   print(i);
        //   dataParts.add(dataList.sublist(i,
        //       i + partSize > dataList.length ? dataList.length : i + partSize));
        // }

        // Future<void> insertData(List<dynamic> dataList) async {
        //   await supabaseDev.from(table).insert(dataList);
        // }

        // for (List<dynamic> part in dataParts) {
        //   await insertData(part);
        // }
        // print('Insert Bulk To $table: Done');
      } else if (table == 'histories') {
        // List<dynamic> dataList = histories;
        // final numParts = 30;
        // int partSize = (dataList.length / numParts).ceil();
        // List<List<dynamic>> dataParts = [];
        // for (int i = 0; i < dataList.length; i += partSize) {
        //   print(i);
        //   dataParts.add(dataList.sublist(i,
        //       i + partSize > dataList.length ? dataList.length : i + partSize));
        // }

        // Future<void> insertData(List<dynamic> dataList) async {
        //   await supabaseDev.from(table).insert(dataList);
        // }

        // for (List<dynamic> part in dataParts) {
        //   await insertData(part);
        // }
        // print('Insert Bulk To $table: Done');
      } else if (table == 'receipts') {
        // List<dynamic> dataList = receipts;
        // final numParts = 30;
        // int partSize = (dataList.length / numParts).ceil();
        // List<List<dynamic>> dataParts = [];
        // for (int i = 0; i < dataList.length; i += partSize) {
        //   print(i);
        //   dataParts.add(dataList.sublist(i,
        //       i + partSize > dataList.length ? dataList.length : i + partSize));
        // }

        // Future<void> insertData(List<dynamic> dataList) async {
        //   await supabaseDev.from(table).insert(dataList);
        // }

        // for (List<dynamic> part in dataParts) {
        //   await insertData(part);
        // }
        // print('Insert Bulk To $table: Done');
      } else if (table == 'receiptDetails') {
        List<dynamic> dataList = receiptDetails.toSet().toList();
        // final numParts = 30;
        // int partSize = (dataList.length / numParts).ceil();
        // List<List<dynamic>> dataParts = [];
        // for (int i = 0; i < dataList.length; i += partSize) {
        //   print(i);
        //   dataParts.add(dataList.sublist(i,
        //       i + partSize > dataList.length ? dataList.length : i + partSize));
        // }

        // Future<void> insertData(List<dynamic> dataList) async {
        //   await supabaseDev.from(table).insert(dataList);
        // }

        // for (List<dynamic> part in dataParts) {
        //   await insertData(part);
        // }
        await supabaseDev.from(table).insert(dataList);
        print('Insert Bulk To $table: Done');
      } else if (table == 'credits') {
        // await supabaseDev.from(table).insert(credits);
        // print('Insert Bulk To $table: Done');
      }
    }

    exit(1);
  }
}
