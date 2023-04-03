import 'dart:io';

import '../databases/databases.dart';
import '../handle_case/models.dart';

createHistory() async {
  final result = await supabase
      .from('histories')
      .insert(
        HistoryModel(
          salesId: 108,
          outletId: 3049,
          type: 'dropItem',
          status: 'Success',
          data: {
            "bca": 0,
            "bni": 0,
            "bri": 40062400,
            "cash": 0,
            "type": "Drop Item",
            "items": [],
            "mandiri": 0,
            "nominal": 40062400,
            "paidOff": true,
            "receiptLink": "",
            "paymentMethod": "Cash"
          },
          createdAt:
              DateTime(2023, 02, 27).add(Duration(hours: -7)).toIso8601String(),
        ),
      )
      .select();

  print(result[0]['id']);

  exit(1);
}

createReceipt() async {
  final result = await supabase
      .from('receipts')
      .insert(
        ReceiptModel(
          salesId: 108,
          outletId: 3049,
          historyId: 23166,
          type: 'Drop Item',
          data: {
            "items": [],
            "nominal": 40062400,
          },
          paymentMethod: 'Cash',
          cash: 0,
          bni: 0,
          bri: 40062400,
          bca: 0,
          mandiri: 0,
          receiptLink: '',
          paidOff: true,
          createdAt:
              DateTime(2023, 02, 27).add(Duration(hours: -7)).toIso8601String(),
          invoiceNumber: 'MDU 14403',
        ).toJson(),
      )
      .select();

  print(result[0]['id']);

  exit(1);
}

createReceiptDetails() async {
  List<dynamic> receiptDetails = [];
  List<dynamic> stoks = await supabase.from('warehouseStocks').select(
      '''*, item:masterItems(*), cluster:masterClusters(*), program:programs(*), sales:masterSales(*), outlet:outletId(*)''').match({
    'salesId': 111,
    'outletId': 3048,
  });

  print(stoks.length);

  for (var stok in stoks) {
    receiptDetails.add(
      ReceiptDetailModel(
        receiptId: 10663,
        itemId: stok['itemId'],
        item: stok['item'],
        docNumber: stok['docNumber'],
        serialNumber: stok['serialNumber'],
        isDeleted: stok['isDeleted'],
        clusterId: stok['clusterId'],
        cluster: stok['cluster'],
        programId: stok['programId'],
        program: stok['program'],
        clusterDestination: stok['clusterDestination'],
        verifiedByDestination: stok['verifiedByDestination'],
        salesId: stok['salesId'],
        sales: stok['sales'],
        outletId: stok['outletId'],
        outlet: stok['outlet'],
        msisdn: stok['msisdn'],
        outletAt: stok['outletAt'],
        salesAt: stok['salesAt'],
        clusterAt: stok['clusterAt'],
        expiredAt: stok['expiredAt'],
        createdAt: stok['createdAt'],
      ).toJson(),
    );
  }

  List<dynamic> dataList = receiptDetails;
  final numParts = 30;
  int partSize = (dataList.length / numParts).ceil();
  List<List<dynamic>> dataParts = [];
  for (int i = 0; i < dataList.length; i += partSize) {
    print(i);
    dataParts.add(dataList.sublist(
        i, i + partSize > dataList.length ? dataList.length : i + partSize));
  }

  Future<void> insertData(List<dynamic> dataList) async {
    await supabase.from('receiptDetails').insert(dataList);
  }

  for (List<dynamic> part in dataParts) {
    await insertData(part);
  }
  print('Insert Bulk To: Done');

  print(receiptDetails.length);

  print('DONE');

  exit(1);
}
