import 'dart:io';

import '../databases/databases.dart';
import '../handle_case/models.dart';

Future<String?> incrementAndGet({required int clusterId}) async {
  try {
    await supabase.rpc(
      'incrementInvoiceNumber',
      params: {'clusterid': clusterId},
    );

    InvoiceNumberModel invoiceNumber = await supabase
        .from('invoiceNumbers')
        .select()
        .match({'clusterId': clusterId})
        .limit(1)
        .withConverter<InvoiceNumberModel>(
          (data) => InvoiceNumberModel.fromJson(data[0]),
        );

    return '${invoiceNumber.code} ${invoiceNumber.number}';
  } catch (e) {
    print(e.toString());

    return null;
  }
}

createHistory({
  required int salesId,
  required int outletId,
  required int cash,
}) async {
  final result = await supabase
      .from('histories')
      .insert(
        HistoryModel(
          salesId: salesId,
          outletId: outletId,
          type: 'dropItem',
          status: 'Success',
          data: {
            "bca": 0,
            "bni": 0,
            "bri": 0,
            "cash": cash,
            // "type": "Drop Item",
            "type": "Top Up",
            "items": [],
            "mandiri": 0,
            "nominal": cash,
            "paidOff": true,
            "receiptLink": "",
            "paymentMethod": "Cash"
          },
          createdAt: DateTime(2023, 03, 05).toIso8601String(),
        ),
      )
      .select();

  print(result[0]['id']);

  List<dynamic> clusterId =
      await supabase.from('masterSales').select().eq('id', salesId);

  String? invoiceNumber =
      await incrementAndGet(clusterId: clusterId[0]['clusterId']);

  await supabase
      .from('receipts')
      .insert(
        ReceiptModel(
          salesId: result[0]['salesId'],
          outletId: result[0]['outletId'],
          historyId: result[0]['id'],
          type: result[0]['data']['type'],
          data: {
            "nominal": result[0]['data']['nominal'],
          },
          paymentMethod: 'Cash',
          cash: result[0]['data']['cash'],
          bni: 0,
          bri: 0,
          bca: 0,
          mandiri: 0,
          receiptLink: '',
          paidOff: true,
          createdAt: result[0]['createdAt'],
          invoiceNumber: invoiceNumber,
        ).toJson(),
      )
      .select();

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
