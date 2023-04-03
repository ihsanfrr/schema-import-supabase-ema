import 'dart:io';

import '../databases/databases.dart';
import 'models.dart';

Future duplicateRow() async {
  ReceiptDetailModel receipt = await supabase
      .from('receiptDetails')
      .select()
      .eq('id', 39762)
      .limit(1)
      .withConverter<ReceiptDetailModel>(
        (data) => ReceiptDetailModel.fromJson(data[0]),
      );

  print(receipt.toJson());

  await supabase.from('receiptDetails').insert(receipt
      .copyWith(
        receiptId: 3443,
        serialNumber: 901408428678,
        salesId: 129,
        outletId: 2686,
      )
      .toJson());
  print(1);
  await supabase.from('receiptDetails').insert(receipt
      .copyWith(
        receiptId: 3443,
        serialNumber: 901408428679,
        salesId: 129,
        outletId: 2686,
      )
      .toJson());
  print(2);

  await supabase.from('receiptDetails').insert(receipt
      .copyWith(
        receiptId: 3444,
        serialNumber: 901408428686,
        salesId: 129,
        outletId: 2342,
      )
      .toJson());
  print(3);
  await supabase.from('receiptDetails').insert(receipt
      .copyWith(
        receiptId: 3444,
        serialNumber: 901408428687,
        salesId: 129,
        outletId: 2342,
      )
      .toJson());
  print(4);
  // ReceiptModel receipt = await supabase
  //     .from('receipts')
  //     .select()
  //     .eq('id', 3358)
  //     .limit(1)
  //     .withConverter<ReceiptModel>(
  //       (data) => ReceiptModel.fromJson(data[0]),
  //     );

  // print(receipt.toJson());

  // await supabase.from('receipts').insert(receipt.copyWith(
  //       data: {
  //         "items": [
  //           {
  //             "id": 239492,
  //             "itemId": 60,
  //             "salesId": 129,
  //             "outletId": null,
  //             "clusterId": 18,
  //             "createdAt": "2023-02-23T00:00:00+00:00",
  //             "docNumber": "EMA/IN/0081/02/2023",
  //             "isDeleted": false,
  //             "programId": 265,
  //             "updatedAt": null,
  //             "serialNumber": 901408428686
  //           },
  //           {
  //             "id": 239493,
  //             "itemId": 60,
  //             "salesId": 129,
  //             "outletId": null,
  //             "clusterId": 18,
  //             "createdAt": "2023-02-23T00:00:00+00:00",
  //             "docNumber": "EMA/IN/0081/02/2023",
  //             "isDeleted": false,
  //             "programId": 265,
  //             "updatedAt": null,
  //             "serialNumber": 901408428687
  //           }
  //         ],
  //         "nominal": 39000,
  //       },
  //       cash: 39000,
  //       createdAt: DateTime.now().toIso8601String(),
  //       outletId: 2342,
  //       historyId: 4208,
  //       invoiceNumber: 'NGW 13002',
  //     ).toJson());

  exit(1);
}
