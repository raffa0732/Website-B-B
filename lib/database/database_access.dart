import 'package:mysql1/mysql1.dart';

class DatabaseAccess {
  Future main() async {
    final connection = await MySqlConnection.connect(new ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: '',
      db: 'beb_prova'
    ));


    var result = await connection.query('SELECT * FROM richiesta_prenotazione');
    print(result);

    await connection.close();
  }
}