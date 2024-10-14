// services/excel_service.dart
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';  // Import pour obtenir le répertoire local
import '../models/player_stat.dart';

class ExcelService {
  Future<void> exportToExcel(List<PlayerStat> stats) async {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Stats'];
    sheetObject.appendRow([
      "Joueur", "Attaques", "Succès Attaques", "Échecs Attaques", "Services", "Succès Services", "Échecs Services", "Réceptions", "Blocs"
    ]);

    for (var stat in stats) {
      sheetObject.appendRow([
        stat.player, stat.attacks, stat.attackSuccess, stat.attackFail, stat.services, stat.serviceSuccess, stat.serviceFail, stat.receptions, stat.blocks
      ]);
    }

    // Obtenir le répertoire de l'application
    Directory? directory = await getApplicationDocumentsDirectory();

    // Créer le chemin d'exportation
    String outputFile = '${directory.path}/storage/stats.xlsx';

    // Créer le dossier "storage" s'il n'existe pas
    Directory('${directory.path}/storage').create(recursive: true)
      .then((Directory storageDirectory) {
        // Sauvegarder le fichier Excel dans le dossier
        File(outputFile)
          ..createSync(recursive: true)
          ..writeAsBytesSync(excel.encode()!);
      });
  }
}
