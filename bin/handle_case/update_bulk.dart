import 'dart:io';

import '../databases/databases.dart';
import 'models.dart';

Future updateBulk() async {
  List<dynamic> datas = await supabaseDev
      .from('warehouseStocks')
      .select()
      .eq('salesId', 129)
      .is_('outletId', null)
      .limit(5);

  List<dynamic> warehouseStocks = [];

  for (var data in datas) {
    warehouseStocks.add(
      WarehouseStockModel.fromJson(data).copyWith(outletId: 1197).toJson3(),
    );
  }

  print(warehouseStocks);

  await supabaseDev.from('warehouseStocks').upsert(warehouseStocks);

  exit(1);
}

Future importBulk() async {
  try {
    List<dynamic> datas = await supabaseDev
        .from('warehouseStocks')
        .select(
            '''*, cluster:masterClusters(*), program:programs(*), sales:masterSales(*), outlet:masterOutlets(*), item:itemId(*)''')
        .eq('salesId', 129)
        .eq('outletId', 1197)
        .limit(5);

    List<dynamic> receiptDetails = [];

    for (var data in datas) {
      receiptDetails.add(
        ReceiptDetailModel.fromJson(data).copyWith(receiptId: 1).toJson(),
      );
    }

    await supabaseDev.from('receiptDetails').insert(receiptDetails);
  } catch (e) {
    print(e);
  }

  exit(1);
}
