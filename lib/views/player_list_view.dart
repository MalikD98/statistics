// views/player_list_view.dart
import 'package:flutter/material.dart';
import 'stat_input_view.dart';

class PlayerListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Joueurs'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Joueur 1'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => StatInputPage(player: 'Joueur 1')));
            },
          ),
          // Ajouter plus de joueurs ici
        ],
      ),
    );
  }
}
