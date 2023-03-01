part of 'updates.dart';

Future programUpdate() async {
  String? file = stdin.readLineSync()!;
  print(file);

  var bytes = File(file).readAsBytesSync();
  var excel = Excel.decodeBytes(bytes);

  for (var table in excel.tables.keys) {
    for (var i = 0; i < excel.tables[table]!.rows.length; i++) {
      if (i != 0) {
        List<Data?> data = excel.tables[table]!.rows[i];

        bool result = await ProgramDatabase().update(
          uniqueId: data[3]!.value,
          priceProgram: data[27]!.value,
          priceProgramTotal: data[28]!.value,
          margin: data[31]!.value,
          marginTotal: data[32]!.value,
        );

        if (result) {
          print('$i Berhasil');
        } else {
          print('$i Gagal');
          exit(1);
        }
      }
    }
  }
  exit(1);
}
