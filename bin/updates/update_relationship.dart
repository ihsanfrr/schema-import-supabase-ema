part of 'updates.dart';

enum Relationships { cluster, item, program, sales, outlet }

@Deprecated(
    'Ini dipakai ketika skema import langsung menggunakan csv di supabase')
Future updateStockRelationship({required Relationships relationships}) async {
  switch (relationships) {
    case Relationships.cluster:
      updateStock(table: 'masterClusters');
      break;
    case Relationships.item:
      updateStock(table: 'masterItems');
      break;
    case Relationships.program:
      updateStock(table: 'programs');
      // getQty(table: 'programs');
      break;
    case Relationships.sales:
      updateStock(table: 'masterSales');
      break;
    default:
      updateStock(table: 'masterOutlets');
  }
}

Future getQty({required String table}) async {
  List<dynamic> datas = await supabase.from(table).select();
  List<PostgrestResponse<dynamic>> result = [];

  for (var i = 0; i < datas.length; i++) {
    PostgrestResponse<dynamic> data = await supabase
        .from('warehouseStocks')
        .select('*, item:itemId(*), program:programId(*)',
            FetchOptions(count: CountOption.exact))
        .eq('programId', datas[i]['id']);

    print('index $i');

    result.add(data);
  }

  exit(1);
}

Future updateStock({required String table}) async {
  List<dynamic> datas = await supabase.from(table).select();
  int val = 0;

  for (var data in datas) {
    if (data['name'] != null) {
      String message = await updateWarehouseStock(
        fieldName: 'programName',
        fieldValue: data['name'],
        data: {'programId': data['id']},
      );

      print('programName: ${data['name']}');
      print(message);
      print(val++);
    }
  }

  exit(1);
}

Future<String> updateWarehouseStock({
  required String fieldName,
  required String fieldValue,
  required Map<String, dynamic> data,
}) async {
  try {
    await supabase
        .from('warehouseStocks')
        .update(data)
        .eq(fieldName, fieldValue);

    return 'Berhasil';
  } catch (e) {
    return 'Gagal';
  }
}
