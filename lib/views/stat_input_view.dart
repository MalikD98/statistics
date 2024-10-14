import 'package:flutter/material.dart';
import '../controllers/stat_controller.dart';
import '../models/player_stat.dart';
import 'package:fluttertoast/fluttertoast.dart';  // Import du package fluttertoast

class StatInputPage extends StatefulWidget {
  final String player;
  StatInputPage({required this.player});

  @override
  _StatInputPageState createState() => _StatInputPageState();
}

class _StatInputPageState extends State<StatInputPage> {
  final StatController _statController = StatController();
  int attackSuccess = 0;
  int attackFail = 0;
  int serviceSuccess = 0;
  int serviceFail = 0;
  int receptionSuccess = 0;
  int receptionFail = 0;
  int blockSuccess = 0;
  int blockFail = 0; // Ajout pour les blocs ratés

  // Méthode pour sauvegarder les statistiques
  Future<void> _saveStats() async {
    try {
      PlayerStat stat = PlayerStat(
        player: widget.player,
        attacks: attackSuccess + attackFail,  // Calcul du total d'attaques
        attackSuccess: attackSuccess,
        attackFail: attackFail,
        services: serviceSuccess + serviceFail,  // Calcul du total de services
        serviceSuccess: serviceSuccess,
        serviceFail: serviceFail,
        receptions: receptionSuccess + receptionFail,  // Total des réceptions
        blocks: blockSuccess + blockFail, // Total des blocs
      );
      await _statController.addPlayerStat(stat);

      // Afficher un toast si la sauvegarde est réussie
      Fluttertoast.showToast(
        msg: "Les statistiques ont été sauvegardées avec succès",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
      );
    } catch (error) {
      // Afficher un toast si la sauvegarde échoue
      Fluttertoast.showToast(
        msg: "Échec de la sauvegarde des statistiques",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
  }

  // Interface graphique avec boutons de statistiques
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saisie des Stats - ${widget.player}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            // Section Attaque
            Text('Attaques', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildStatButton('réussie', Colors.green, () {
                  setState(() {
                    attackSuccess++;
                  });
                }),
                buildStatButton('passée', Colors.blue, () {
                  // Passée, ne change pas les stats ici
                }),
                buildStatButton('ratée', Colors.red, () {
                  setState(() {
                    attackFail++;
                  });
                }),
              ],
            ),
            SizedBox(height: 20),
            // Section Service
            Text('Services', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildStatButton('réussie', Colors.green, () {
                  setState(() {
                    serviceSuccess++;
                  });
                }),
                buildStatButton('passée', Colors.blue, () {
                  // Passée, ne change pas les stats ici
                }),
                buildStatButton('ratée', Colors.red, () {
                  setState(() {
                    serviceFail++;
                  });
                }),
              ],
            ),
            SizedBox(height: 20),
            // Section Réception
            Text('Réceptions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildStatButton('réussie', Colors.green, () {
                  setState(() {
                    receptionSuccess++;
                  });
                }),
                buildStatButton('ratée', Colors.red, () {
                  setState(() {
                    receptionFail++;
                  });
                }),
              ],
            ),
            SizedBox(height: 20),
            // Section Bloc
            Text('Blocs', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildStatButton('réussie', Colors.green, () {
                  setState(() {
                    blockSuccess++;
                  });
                }),
                buildStatButton('ratée', Colors.red, () {
                  setState(() {
                    blockFail++;
                  });
                }),
              ],
            ),
            SizedBox(height: 20),
            // Bouton pour sauvegarder les stats
            ElevatedButton(
              onPressed: _saveStats,
              child: Text('Sauvegarder les Stats'),
            ),
          ],
        ),
      ),
    );
  }

  // Fonction pour créer des boutons de statistiques
Widget buildStatButton(String label, Color color, VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,  // Utiliser directement Color pour backgroundColor
      minimumSize: Size(80, 80), // Taille similaire à l'image
    ),
    child: Text(label, style: TextStyle(color: Colors.white)),
  );
}

}
