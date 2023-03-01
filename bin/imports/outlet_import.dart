part of 'imports.dart';

Future outletImport() async {
  String? file = stdin.readLineSync()!;
  print(file);

  var bytes = File(file).readAsBytesSync();
  var excel = Excel.decodeBytes(bytes);

  for (var table in excel.tables.keys) {
    for (var i = 0; i < excel.tables[table]!.rows.length; i++) {
      if (i != 0) {
        List<Data?> data = excel.tables[table]!.rows[i];

        int digiposId = (data[1]!.value as double).toInt();
        String name = data[2]!.value;
        String noChip = '0${(data[3]!.value as double).toInt()}';
        String address = data[4]!.value;
        String day = data[5]!.value;
        int userId = (data[6]!.value as double).toInt();
        int clusterId = (data[7]!.value as double).toInt();

        bool result = await OutletDatabase().insert(
          digiposId: digiposId,
          noChip: noChip,
          name: name,
          address: address,
          clusterId: clusterId,
          salesId: userId,
          day: day,
        );

        if (result) {
          print('Import Data Outlet $name Berhasil');
        } else {
          print('Import Data Outlet $name Gagal');
        }
      }
    }
  }
  exit(1);
}
