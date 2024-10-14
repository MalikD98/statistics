// services/database_service.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/player_stat.dart';

class DatabaseService {
  Database? _database;

  Future<void> initDb() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'volley_stats.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE stats(id INTEGER PRIMARY KEY, player TEXT, attacks INT, attack_success INT, attack_fail INT, services INT, service_success INT, service_fail INT, receptions INT, blocks INT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertStat(PlayerStat stat) async {
    await _database?.insert('stats', stat.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<PlayerStat>> getAllStats() async {
    final List<Map<String, dynamic>> maps = await _database!.query('stats');
    return List.generate(maps.length, (i) {
      return PlayerStat(
        player: maps[i]['player'],
        attacks: maps[i]['attacks'],
        attackSuccess: maps[i]['attack_success'],
        attackFail: maps[i]['attack_fail'],
        services: maps[i]['services'],
        serviceSuccess: maps[i]['service_success'],
        serviceFail: maps[i]['service_fail'],
        receptions: maps[i]['receptions'],
        blocks: maps[i]['blocks'],
      );
    });
  }
}
