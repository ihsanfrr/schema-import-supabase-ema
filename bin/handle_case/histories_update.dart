part of "../imports/imports.dart";

Future<void> createReceiptAndHistory() async {
  // List<Map<String, dynamic>> histories =
  //     await supabase.from("histories").insert({
  //   "salesId": 128,
  //   "outletId": 2395,
  //   "type": "dropItem",
  //   "status": "Success",
  //   "data": {
  //     "type": "Drop Item",
  //     "items": [
  //       {
  //         "id": 230927,
  //         "itemId": 60,
  //         "salesId": 128,
  //         "outletId": null,
  //         "clusterId": 18,
  //         "createdAt": "2023-02-21 00:00:00+00",
  //         "docNumber": "EMA/IN/0078/02/2023",
  //         "isDeleted": false,
  //         "programId": 249,
  //         "updatedAt": null,
  //         "serialNumber": 500176249791
  //       },
  //       {
  //         "id": 230928,
  //         "itemId": 60,
  //         "salesId": 128,
  //         "outletId": null,
  //         "clusterId": 18,
  //         "createdAt": "2023-02-21 00:00:00+00",
  //         "docNumber": "EMA/IN/0078/02/2023",
  //         "isDeleted": false,
  //         "programId": 249,
  //         "updatedAt": null,
  //         "serialNumber": 500176249792
  //       },
  //     ],
  //     "nominal": 21000,
  //     "paymentMethod": "Cash",
  //     "cash": 21000,
  //     "bni": 0,
  //     "bri": 0,
  //     "bca": 0,
  //     "mandiri": 0,
  //     "receiptLink": "",
  //     "paidOff": true,
  //   },
  //   "createdAt": DateTime.now().toIso8601String(),
  //   "updatedAt": null,
  // }).select();

  // print(histories[0]["id"]);

  // List<dynamic> receipts = await supabase.from("receipts").insert({
  //   "salesId": 128,
  //   "outletId": 2395,
  //   "historyId": 3472,
  //   "type": "Drop Item",
  //   "data": {
  //     "nominal": 21000,
  //     "items": [
  //       {
  //         "id": 230927,
  //         "itemId": 60,
  //         "salesId": 128,
  //         "outletId": null,
  //         "clusterId": 18,
  //         "createdAt": "2023-02-21 00:00:00+00",
  //         "docNumber": "EMA/IN/0078/02/2023",
  //         "isDeleted": false,
  //         "programId": 249,
  //         "updatedAt": null,
  //         "serialNumber": 500176249791
  //       },
  //       {
  //         "id": 230928,
  //         "itemId": 60,
  //         "salesId": 128,
  //         "outletId": null,
  //         "clusterId": 18,
  //         "createdAt": "2023-02-21 00:00:00+00",
  //         "docNumber": "EMA/IN/0078/02/2023",
  //         "isDeleted": false,
  //         "programId": 249,
  //         "updatedAt": null,
  //         "serialNumber": 500176249792
  //       }
  //     ],
  //   },
  //   "paymentMethod": "Cash",
  //   "cash": 21000,
  //   "bni": 0,
  //   "bri": 0,
  //   "bca": 0,
  //   "mandiri": 0,
  //   "receiptLink": "",
  //   "paidOff": true,
  //   "createdAt": DateTime.now().toIso8601String(),
  //   "updatedAt": null,
  //   "invoiceNumber": "NGW 12366",
  // }).select();

  // print(receipts[0]["id"]);

  // exit(1);

  // String file = "/Users/ihsanfrr/Downloads/warehouseStocks_rows-_2_ (1).xlsx";
  // var bytes = File(file).readAsBytesSync();
  // var excel = Excel.decodeBytes(bytes);

  // List<dynamic> warehouseStocks = [];

  // ProgramModel program = await supabase
  //     .from('programs')
  //     .select()
  //     .eq('id', 306)
  //     .limit(1)
  //     .withConverter<ProgramModel>((data) => ProgramModel.fromJson(data[0]));

  // SalesModel sales = await supabase
  //     .from('masterSales')
  //     .select()
  //     .eq('id', 109)
  //     .limit(1)
  //     .withConverter<SalesModel>((data) => SalesModel.fromMap(data[0]));

  // OutletModel outlet = await supabase
  //     .from('masterOutlets')
  //     .select()
  //     .eq('id', 2677)
  //     .limit(1)
  //     .withConverter<OutletModel>((data) => OutletModel.fromJson(data[0]));

  // ReceiptDetailModel receiptDetailModel = ReceiptDetailModel(
  //         receiptId: 1095,
  //         itemId: (data[1]!.value as double).toInt(),
  //         item: {
  //           "id": 67,
  //           "name": "Perdana SimPATI SIM OTA - 10 ( S239 )",
  //           "type": null,
  //           "price": 500,
  //           "typeId": 1,
  //           "topable": false,
  //           "basePrice": 10,
  //           "createdAt": "2023-01-29T16:28:01.247807+00:00",
  //           "isDeleted": false,
  //           "updatedAt": null
  //         },
  //         docNumber: data[2] != null ? data[2]!.value : null,
  //         serialNumber: (data[3]!.value as double).toInt(),
  //         isDeleted: data[5]!.value == "false" ? false : true,
  //         clusterId: (data[6]!.value as double).toInt(),
  //         cluster: {
  //           "id": 1,
  //           "name": "TAP Madiun",
  //           "type": "BO",
  //           "parent": 1,
  //           "status": "Aktif",
  //           "address":
  //               "Jl. Thamrin No.34, Klegen, Kec. Kartoharjo, Kota Madiun",
  //           "createdAt": "2022-12-01T06:15:15.291485+00:00",
  //           "updatedAt": null
  //         },
  //         programId: (data[7]!.value as double).toInt(),
  //         program: program.toJson(),
  //         clusterDestination: data[8] != null ? data[8]!.value : null,
  //         verifiedByDestination: data[9]!.value == "false" ? false : true,
  //         salesId: (data[10]!.value as double).toInt(),
  //         sales: sales.toJson(),
  //         outletId: (data[11]!.value as double).toInt(),
  //         outlet: outlet.toJson(),
  //         msisdn: data[12] != null ? data[12]!.value : null,
  //         outletAt: data[13]!.value,
  //         salesAt: data[14]!.value,
  //         clusterAt: data[15]!.value,
  //         expiredAt: data[16]!.value,
  //         createdAt: DateTime.now().toIso8601String(),
  //       );

  // for (var table in excel.tables.keys) {
  //   for (var i = 0; i < excel.tables[table]!.rows.length; i++) {
  //     if (i != 0) {
  //       List<Data?> data = excel.tables[table]!.rows[i];

  //       // print(i);
  //       // await supabase
  //       //     .from("receiptDetails")
  //       //     .insert(receiptDetailModel.toJson());
  //     }

  //     if (i == 5000) {
  //       exit(1);
  //     }
  //   }
  // }
}
