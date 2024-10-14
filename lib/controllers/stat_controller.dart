// controllers/stat_controller.dart
import '../models/player_stat.dart';
import '../services/database_service.dart';
import '../services/excel_service.dart';

class StatController {
  final DatabaseService _dbService = DatabaseService();
  final ExcelService _excelService = ExcelService();

  Future<void> addPlayerStat(PlayerStat stat) async {
    await _dbService.insertStat(stat);
  }

  Future<void> exportStats() async {
    List<PlayerStat> stats = await _dbService.getAllStats();
    await _excelService.exportToExcel(stats);
  }
}
