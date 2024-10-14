// models/player_stat.dart
class PlayerStat {
  final String player;
  int attacks;
  int attackSuccess;
  int attackFail;
  int services;
  int serviceSuccess;
  int serviceFail;
  int receptions;
  int blocks;

  PlayerStat({
    required this.player,
    this.attacks = 0,
    this.attackSuccess = 0,
    this.attackFail = 0,
    this.services = 0,
    this.serviceSuccess = 0,
    this.serviceFail = 0,
    this.receptions = 0,
    this.blocks = 0,
  });

  // Convertir un objet PlayerStat en Map pour SQLite
  Map<String, dynamic> toMap() {
    return {
      'player': player,
      'attacks': attacks,
      'attack_success': attackSuccess,
      'attack_fail': attackFail,
      'services': services,
      'service_success': serviceSuccess,
      'service_fail': serviceFail,
      'receptions': receptions,
      'blocks': blocks,
    };
  }
}
