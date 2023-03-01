part of 'imports.dart';

Future programImport() async {
  String? file = stdin.readLineSync()!;
  print(file);

  var bytes = File(file).readAsBytesSync();
  var excel = Excel.decodeBytes(bytes);

  for (var table in excel.tables.keys) {
    for (var i = 0; i < excel.tables[table]!.rows.length; i++) {
      if (i != 0) {
        List<Data?> data = excel.tables[table]!.rows[i];

        bool result = await ProgramDatabase().insert(
          createdAt: DateTime.parse(data[0]!.value).toIso8601String(),
          docNumber: data[4]!.value,
          description: data[5]!.value,
          clusterId: (data[6]!.value as double).toInt(),
          qty: (data[7]!.value as double).toInt(),
          itemId: (data[8]!.value as double).toInt(),
          type: data[9]!.value,
          injectionType: data[10]!.value,
          priceItem: (data[11]!.value as double).toInt(),
          priceItemTotal: (data[12]!.value as double).toInt(),
          name: data[2]!.value,
          priceNGRS: (data[13]!.value as double).toInt(),
          priceNGRSTotal: (data[14]!.value as double).toInt(),
          perdanaSubsidy: data[15]!.value,
          perdanaSubsidiTotal: data[16]!.value,
          telkomselCashback: (data[17]!.value as double).toInt(),
          telkomselCashbackTotal: (data[18]!.value as double).toInt(),
          digistarCashback: data[19]!.value,
          digistarCashbackTotal: (data[20]!.value as double).toInt(),
          endOfYearInsentive: (data[21]!.value as double).toInt(),
          endOfYearInsentiveTotal: (data[22]!.value as double).toInt(),
          commitmentBudget: (data[23]!.value as double).toInt(),
          commitmentBudgetTotal: (data[24]!.value as double).toInt(),
          otherSubsidy: (data[25]!.value as double).toInt(),
          otherSubsidyTotal: (data[26]!.value as double).toInt(),
          priceProgram: data[27]!.value,
          priceProgramTotal: data[28]!.value,
          price: (data[29]!.value as double).toInt(),
          priceTotal: (data[30]!.value as double).toInt(),
          margin: data[31]!.value,
          marginTotal: data[32]!.value,
          uniqueId: data[3]!.value,
          expiredAt: DateTime.parse(data[0]!.value)
              .add(Duration(days: 120))
              .toIso8601String(),
          topable: false,
        );

        if (result) {
          print('$i Import Program Berhasil');
        } else {
          print('$i Import Program Gagal');
        }
      }
    }
  }
  exit(1);
}
