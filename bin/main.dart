// import 'imports/sales_import.dart';
// import 'imports/outlet_import.dart';
// import 'imports/program_import.dart';
// import 'databases/user_database.dart';
// import 'imports/warehousestock_import.dart';
// import 'updates/program_update.dart';

import 'dart:io';
import 'package:collection/collection.dart';
import 'package:supabase/supabase.dart';

import 'databases/databases.dart';
import 'exports_imports/exports_imports.dart';
import 'handle_case/models.dart';
import 'handle_case/receipt_details.dart';
import 'inserts/history.dart';

main() async {
  // salesImport();
  // outletImport();
  // programImport();
  // warehouseStockImport();
  // UserDatabase().createSuperAdmin();
  // programUpdate();
  // createReceiptAndHistory();
  // duplicateRow();
  // AuthResponse authResponse = await supabaseDev.auth.signUp(
  //   email: 'rikoalfian@gmail.com',
  //   password: 'fandra30',
  // );

  // print(authResponse.session);
  // updateBulk();
  // importBulk();
  // AuthResponse authResponse = await supabaseDev.auth.signUp(
  //   email: 'pakbayu@gmail.com',
  //   password: 'password',
  // );
  // compareHistory();
  createHistory(
    salesId: 0,
    outletId: 0,
    cash: 0,
  );
  // createReceipt();
  // createReceiptDetails();
  // updateSomething(
  //   outletId: 2012,
  //   date: 16,
  //   salesId: 120,
  //   uniqueId: 'VF-0306-210223',
  //   limit: 56,
  // );
  // await supabase.from('warehouseStocks').update({'salesId': 104}).match({
  //   'salesId': 97,
  //   'uniqueId': 'VF-0305-210223',
  // }).is_('outletId', null);

  // final result = await supabase
  //     .from('warehouseStocks')
  //     .select()
  //     // .update({'outletAt': null})
  //     .match({
  //       'salesId': 121,
  //       'uniqueId': 'VF-0306-210223',
  //     })
  //     .is_('outletId', null)
  //     .gte('outletAt', '2023-03-03')
  //     .lte('outletAt', '2023-03-04');

  // print(result.length);
  // updateRD();
  // await ExportsImports().init();
  // List<dynamic> data = await supabase.from('warehouseStocks').select().match({
  //   'salesId': 132,
  //   'outletId': 2228,
  //   'programId': 364,
  // }).gt('outletAt', '2023-03-27 15:00:00');
  // print(data.length);

  // await supabase.from('warehouseStocks').update({
  //   'outletId': null,
  //   'outletAt': null,
  // }).match({
  //   'salesId': 132,
  //   'outletId': 2228,
  //   'programId': 364,
  // }).gt('outletAt', '2023-03-27 15:00:00');

  // List<dynamic> data2 = await supabase.from('warehouseStocks').select().match({
  //   'salesId': 132,
  //   'outletId': 2228,
  //   'programId': 364,
  // }).gt('outletAt', '2023-03-27 15:00:00');
  // print(data2.length);

  // exit(1);
}

updateRD() async {
  try {
    List<dynamic> dataRD = await supabase.from('buatIsan').select();

    for (int i = 0; i < dataRD.length; i++) {
      var data = dataRD[i];
      List<dynamic> program = await supabase
          .from('programs')
          .select()
          .eq('uniqueId', data['uniqueid']);

      await supabase.from('receiptDetails').update({
        'programId': program[0]['id'],
        'program': program[0],
      }).eq('id', data['id']);

      print(i);
    }

    print('Selesai');
  } catch (e) {
    print(e);
  }
  exit(1);
}

compareHistory() async {
  // List<dynamic> sales =
  //     await supabase.from('masterSales').select().order('id', ascending: true);

  // for (var i = 0; i < sales.length; i++) {
  //   SalesModel salesModel = SalesModel.fromMap(sales[i]);
  //   print(salesModel.name);
  // }

  List<dynamic> histories = await supabase.from('histories').select().match(
    {'salesId': 129, 'type': 'dropItem'},
  ).order('id', ascending: true);

  List<dynamic> receipts = await supabase.from('receipts').select().match(
    {'salesId': 129},
  ).order('historyId', ascending: true);

  List<int> historyIds = histories.map((e) => (e['id'] as int)).toList();

  List<int> historyIds2 = receipts.map((e) => (e['historyId'] as int)).toList();

  for (var i = 0; i < historyIds.length; i++) {
    List<dynamic> data =
        await supabase.from('receipts').select().eq('historyId', historyIds[i]);

    if (data.isNotEmpty) {
      print(data[0]['invoiceNumber']);
    } else {
      print(historyIds[i]);
    }
  }

  exit(1);
}
