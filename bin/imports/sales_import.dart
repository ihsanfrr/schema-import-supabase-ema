part of 'imports.dart';

Future salesImport() async {
  String? file = stdin.readLineSync()!;
  print(file);

  var bytes = File(file).readAsBytesSync();
  var excel = Excel.decodeBytes(bytes);

  for (var table in excel.tables.keys) {
    for (var i = 0; i < excel.tables[table]!.rows.length; i++) {
      if (i != 0) {
        List<Data?> data = excel.tables[table]!.rows[i];

        String email = '${data[2]!.value.toString().toCamelCase()}@gmail.com';
        String name = data[2]!.value;
        int clusterId = data[0]!.value == 'MADIUN'
            ? 1
            : data[0]!.value == 'MAGETAN'
                ? 17
                : 18;

        AuthResponse? authResponse =
            await SalesDatabase().createAccount(email: email);

        if (authResponse != null) {
          String uid = authResponse.user!.id;

          Map<String, dynamic>? user = await SalesDatabase().createUser(
            email: email,
            name: name,
            uid: uid,
            clusterId: clusterId,
          );

          bool result = await SalesDatabase().insert(
            name: name,
            email: email,
            uid: uid,
            division: (data[1]!.value).toString().toLowerCase(),
            clusterId: clusterId,
            userId: user!['id'],
          );

          if (result) {
            print('Pembuatan Akun Sales $name Berhasil');
          } else {
            print('Pembuatan Akun Sales $name Gagal');
          }
        }
      }
    }
  }
  exit(1);
}
