// class PokemonModel {
//   int? id;
//   String? number;
//   String? name;
//   String? img;

//   PokemonModel({
//     this.id,
//     this.number,
//     this.name,
//     this.img,
//   });

//   PokemonModel pokemonFormJson(Map<String, dynamic> json) {
//     return PokemonModel(
//       id: json["id"],
//       number: json ["num"],
//       name: json ["name"],
//       img: json ["img"],
//     );
//   }
// }

// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromJson(jsonString);

import 'dart:convert';

List<PokemonModel> pokemonModelFromJson(String str) => List<PokemonModel>.from(
    json.decode(str).map((x) => PokemonModel.fromJson(x)));

String pokemonModelToJson(List<PokemonModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PokemonModel {
  int id;
  String num;
  String name;
  String img;
  List<Type> type;
  String height;
  String weight;
  String candy;
  Egg egg;
  List<double>? multipliers;
  List<Type> weaknesses;
  int? candyCount;
  double spawnChance;
  double avgSpawns;
  String spawnTime;
  List<Evolution>? nextEvolution;
  List<Evolution>? prevEvolution;

  PokemonModel({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.egg,
    required this.multipliers,
    required this.weaknesses,
    this.candyCount,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    this.nextEvolution,
    this.prevEvolution,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        img: json["img"],
        type: List<Type>.from(json["type"].map((x) => typeValues.map[x]!)),
        height: json["height"],
        weight: json["weight"],
        candy: json["candy"],
        egg: eggValues.map[json["egg"]]!,
        multipliers: json["multipliers"] == null
            ? []
            : List<double>.from(json["multipliers"]!.map((x) => x?.toDouble())),
        weaknesses:
            List<Type>.from(json["weaknesses"].map((x) => typeValues.map[x]!)),
        candyCount: json["candy_count"],
        spawnChance: json["spawn_chance"]?.toDouble(),
        avgSpawns: json["avg_spawns"]?.toDouble(),
        spawnTime: json["spawn_time"],
        nextEvolution: json["next_evolution"] == null
            ? []
            : List<Evolution>.from(
                json["next_evolution"]!.map((x) => Evolution.fromJson(x))),
        prevEvolution: json["prev_evolution"] == null
            ? []
            : List<Evolution>.from(
                json["prev_evolution"]!.map((x) => Evolution.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "num": num,
        "name": name,
        "img": img,
        "type": List<dynamic>.from(type.map((x) => typeValues.reverse[x])),
        "height": height,
        "weight": weight,
        "candy": candy,
        "egg": eggValues.reverse[egg],
        "multipliers": multipliers == null
            ? []
            : List<dynamic>.from(multipliers!.map((x) => x)),
        "weaknesses":
            List<dynamic>.from(weaknesses.map((x) => typeValues.reverse[x])),
        "candy_count": candyCount,
        "spawn_chance": spawnChance,
        "avg_spawns": avgSpawns,
        "spawn_time": spawnTime,
        "next_evolution": nextEvolution == null
            ? []
            : List<dynamic>.from(nextEvolution!.map((x) => x.toJson())),
        "prev_evolution": prevEvolution == null
            ? []
            : List<dynamic>.from(prevEvolution!.map((x) => x.toJson())),
      };
}

enum Egg { NOT_IN_EGGS, OMANYTE_CANDY, THE_10_KM, THE_2_KM, THE_5_KM }

final eggValues = EnumValues({
  "Not in Eggs": Egg.NOT_IN_EGGS,
  "Omanyte Candy": Egg.OMANYTE_CANDY,
  "10 km": Egg.THE_10_KM,
  "2 km": Egg.THE_2_KM,
  "5 km": Egg.THE_5_KM
});

class Evolution {
  String num;
  String name;

  Evolution({
    required this.num,
    required this.name,
  });

  factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
        num: json["num"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "num": num,
        "name": name,
      };
}

enum Type {
  BUG,
  DARK,
  DRAGON,
  ELECTRIC,
  FAIRY,
  FIGHTING,
  FIRE,
  FLYING,
  GHOST,
  GRASS,
  GROUND,
  ICE,
  NORMAL,
  POISON,
  PSYCHIC,
  ROCK,
  STEEL,
  WATER
}

final typeValues = EnumValues({
  "Bug": Type.BUG,
  "Dark": Type.DARK,
  "Dragon": Type.DRAGON,
  "Electric": Type.ELECTRIC,
  "Fairy": Type.FAIRY,
  "Fighting": Type.FIGHTING,
  "Fire": Type.FIRE,
  "Flying": Type.FLYING,
  "Ghost": Type.GHOST,
  "Grass": Type.GRASS,
  "Ground": Type.GROUND,
  "Ice": Type.ICE,
  "Normal": Type.NORMAL,
  "Poison": Type.POISON,
  "Psychic": Type.PSYCHIC,
  "Rock": Type.ROCK,
  "Steel": Type.STEEL,
  "Water": Type.WATER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
