// To parse this JSON data, do
//
//     final exerciseModel = exerciseModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

ExerciseModel exerciseModelFromJson(String str) => ExerciseModel.fromJson(json.decode(str));

String exerciseModelToJson(ExerciseModel data) => json.encode(data.toJson());

class ExerciseModel {
  final String? id;
  final dynamic trainerId;
  final dynamic gymId;
  final String? name;
  final String? description;
  final String? instructions;
  final List<dynamic>? aliases;
  final String? status;
  final String? source;
  final String? level;
  final bool? isBodyweight;
  final bool? isDistance;
  final bool? isTimed;
  final bool? isCardio;
  final int? bodyTier;
  final int? coefficient;
  final bool? isAssisted;
  final bool? isUnilateral;
  final String? mobilityType;
  final String? movementPattern;
  final int? olyRating;
  final int? olyTier;
  final int? powerTier;
  final int? tier;
  final int? toneRating;
  final int? rating;
  final int? repsScale;
  final dynamic parseId;
  final dynamic relativeWeight;
  final int? listPosition;
  final String? preferredDistanceScale;
  final String? referenceId;
  final String? mediaVersion;
  final String? angle0Image;
  final String? angle0Video;
  final String? angle1Image;
  final String? angle1Video;
  final dynamic angle2Image;
  final dynamic angle2Video;
  final String? headerImage;
  final String? thumbImage;
  final String? fullVideo;
  final String? headerVideo;
  final String? oneRepVideo;
  final int? typecode;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Category>? equipments;
  final List<Muscle>? mainMuscles;
  final List<Muscle>? secondaryMuscles;
  final List<Category>? categories;
  RxBool? selected = false.obs;

  ExerciseModel({
    this.id,
    this.trainerId,
    this.gymId,
    this.name,
    this.description,
    this.instructions,
    this.aliases,
    this.status,
    this.source,
    this.level,
    this.isBodyweight,
    this.isDistance,
    this.isTimed,
    this.isCardio,
    this.bodyTier,
    this.coefficient,
    this.isAssisted,
    this.isUnilateral,
    this.mobilityType,
    this.movementPattern,
    this.olyRating,
    this.olyTier,
    this.powerTier,
    this.tier,
    this.toneRating,
    this.rating,
    this.repsScale,
    this.parseId,
    this.relativeWeight,
    this.listPosition,
    this.preferredDistanceScale,
    this.referenceId,
    this.mediaVersion,
    this.angle0Image,
    this.angle0Video,
    this.angle1Image,
    this.angle1Video,
    this.angle2Image,
    this.angle2Video,
    this.headerImage,
    this.thumbImage,
    this.fullVideo,
    this.headerVideo,
    this.oneRepVideo,
    this.typecode,
    this.createdAt,
    this.updatedAt,
    this.equipments,
    this.mainMuscles,
    this.secondaryMuscles,
    this.categories,
    this.selected
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
    id: json["id"],
    trainerId: json["trainerId"],
    gymId: json["gymId"],
    name: json["name"],
    description: json["description"],
    instructions: json["instructions"],
    aliases: json["aliases"] == null ? [] : List<dynamic>.from(json["aliases"]!.map((x) => x)),
    status: json["status"],
    source: json["source"],
    level: json["level"],
    isBodyweight: json["isBodyweight"],
    isDistance: json["isDistance"],
    isTimed: json["isTimed"],
    isCardio: json["isCardio"],
    bodyTier: json["bodyTier"],
    coefficient: json["coefficient"],
    isAssisted: json["isAssisted"],
    isUnilateral: json["isUnilateral"],
    mobilityType: json["mobilityType"],
    movementPattern: json["movementPattern"],
    olyRating: json["olyRating"],
    olyTier: json["olyTier"],
    powerTier: json["powerTier"],
    tier: json["tier"],
    toneRating: json["toneRating"],
    rating: json["rating"],
    repsScale: json["repsScale"],
    parseId: json["parseId"],
    relativeWeight: json["relativeWeight"],
    listPosition: json["listPosition"],
    preferredDistanceScale: json["preferredDistanceScale"],
    referenceId: json["referenceId"],
    mediaVersion: json["mediaVersion"],
    angle0Image: json["angle0Image"],
    angle0Video: json["angle0Video"],
    angle1Image: json["angle1Image"],
    angle1Video: json["angle1Video"],
    angle2Image: json["angle2Image"],
    angle2Video: json["angle2Video"],
    headerImage: json["headerImage"],
    thumbImage: json["thumbImage"],
    fullVideo: json["fullVideo"],
    headerVideo: json["headerVideo"],
    oneRepVideo: json["oneRepVideo"],
    typecode: json["typecode"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    equipments: json["equipments"] == null ? [] : List<Category>.from(json["equipments"]!.map((x) => Category.fromJson(x))),
    mainMuscles: json["mainMuscles"] == null ? [] : List<Muscle>.from(json["mainMuscles"]!.map((x) => Muscle.fromJson(x))),
    secondaryMuscles: json["secondaryMuscles"] == null ? [] : List<Muscle>.from(json["secondaryMuscles"]!.map((x) => Muscle.fromJson(x))),
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    selected: false.obs,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "trainerId": trainerId,
    "gymId": gymId,
    "name": name,
    "description": description,
    "instructions": instructions,
    "aliases": aliases == null ? [] : List<dynamic>.from(aliases!.map((x) => x)),
    "status": status,
    "source": source,
    "level": level,
    "isBodyweight": isBodyweight,
    "isDistance": isDistance,
    "isTimed": isTimed,
    "isCardio": isCardio,
    "bodyTier": bodyTier,
    "coefficient": coefficient,
    "isAssisted": isAssisted,
    "isUnilateral": isUnilateral,
    "mobilityType": mobilityType,
    "movementPattern": movementPattern,
    "olyRating": olyRating,
    "olyTier": olyTier,
    "powerTier": powerTier,
    "tier": tier,
    "toneRating": toneRating,
    "rating": rating,
    "repsScale": repsScale,
    "parseId": parseId,
    "relativeWeight": relativeWeight,
    "listPosition": listPosition,
    "preferredDistanceScale": preferredDistanceScale,
    "referenceId": referenceId,
    "mediaVersion": mediaVersion,
    "angle0Image": angle0Image,
    "angle0Video": angle0Video,
    "angle1Image": angle1Image,
    "angle1Video": angle1Video,
    "angle2Image": angle2Image,
    "angle2Video": angle2Video,
    "headerImage": headerImage,
    "thumbImage": thumbImage,
    "fullVideo": fullVideo,
    "headerVideo": headerVideo,
    "oneRepVideo": oneRepVideo,
    "typecode": typecode,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "equipments": equipments == null ? [] : List<dynamic>.from(equipments!.map((x) => x.toJson())),
    "mainMuscles": mainMuscles == null ? [] : List<dynamic>.from(mainMuscles!.map((x) => x.toJson())),
    "secondaryMuscles": secondaryMuscles == null ? [] : List<dynamic>.from(secondaryMuscles!.map((x) => x.toJson())),
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}

class Category {
  final String? id;
  final String? name;
  final String? referenceId;
  final String? thumbImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Exercise? exerciseExerciseCategories;
  final String? description;
  final Exercise? exerciseEquipment;

  Category({
    this.id,
    this.name,
    this.referenceId,
    this.thumbImage,
    this.createdAt,
    this.updatedAt,
    this.exerciseExerciseCategories,
    this.description,
    this.exerciseEquipment,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    referenceId: json["referenceId"],
    thumbImage: json["thumbImage"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    exerciseExerciseCategories: json["ExerciseExerciseCategories"] == null ? null : Exercise.fromJson(json["ExerciseExerciseCategories"]),
    description: json["description"],
    exerciseEquipment: json["ExerciseEquipment"] == null ? null : Exercise.fromJson(json["ExerciseEquipment"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "referenceId": referenceId,
    "thumbImage": thumbImage,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "ExerciseExerciseCategories": exerciseExerciseCategories?.toJson(),
    "description": description,
    "ExerciseEquipment": exerciseEquipment?.toJson(),
  };
}

class Exercise {
  final String? id;
  final String? exerciseId;
  final String? exerciseCategoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? equipmentId;
  final String? muscleGroupId;

  Exercise({
    this.id,
    this.exerciseId,
    this.exerciseCategoryId,
    this.createdAt,
    this.updatedAt,
    this.equipmentId,
    this.muscleGroupId,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    id: json["id"],
    exerciseId: json["exerciseId"],
    exerciseCategoryId: json["exerciseCategoryId"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    equipmentId: json["equipmentId"],
    muscleGroupId: json["muscleGroupId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "exerciseId": exerciseId,
    "exerciseCategoryId": exerciseCategoryId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "equipmentId": equipmentId,
    "muscleGroupId": muscleGroupId,
  };
}

class Muscle {
  final String? id;
  final dynamic description;
  final bool? isAccessoryMuscle;
  final bool? isCore;
  final bool? isFront;
  final bool? isPull;
  final bool? isPush;
  final bool? isUpperBody;
  final String? name;
  final double? utilityPercentage;
  final String? referenceId;
  final String? thumbImage;
  final dynamic imageImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Exercise? exerciseMainMuscleGroups;
  final Exercise? exerciseSecondaryMuscleGroups;

  Muscle({
    this.id,
    this.description,
    this.isAccessoryMuscle,
    this.isCore,
    this.isFront,
    this.isPull,
    this.isPush,
    this.isUpperBody,
    this.name,
    this.utilityPercentage,
    this.referenceId,
    this.thumbImage,
    this.imageImage,
    this.createdAt,
    this.updatedAt,
    this.exerciseMainMuscleGroups,
    this.exerciseSecondaryMuscleGroups,
  });

  factory Muscle.fromJson(Map<String, dynamic> json) => Muscle(
    id: json["id"],
    description: json["description"],
    isAccessoryMuscle: json["isAccessoryMuscle"],
    isCore: json["isCore"],
    isFront: json["isFront"],
    isPull: json["isPull"],
    isPush: json["isPush"],
    isUpperBody: json["isUpperBody"],
    name: json["name"],
    utilityPercentage: json["utilityPercentage"]?.toDouble(),
    referenceId: json["referenceId"],
    thumbImage: json["thumbImage"],
    imageImage: json["imageImage"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    exerciseMainMuscleGroups: json["ExerciseMainMuscleGroups"] == null ? null : Exercise.fromJson(json["ExerciseMainMuscleGroups"]),
    exerciseSecondaryMuscleGroups: json["ExerciseSecondaryMuscleGroups"] == null ? null : Exercise.fromJson(json["ExerciseSecondaryMuscleGroups"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "isAccessoryMuscle": isAccessoryMuscle,
    "isCore": isCore,
    "isFront": isFront,
    "isPull": isPull,
    "isPush": isPush,
    "isUpperBody": isUpperBody,
    "name": name,
    "utilityPercentage": utilityPercentage,
    "referenceId": referenceId,
    "thumbImage": thumbImage,
    "imageImage": imageImage,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "ExerciseMainMuscleGroups": exerciseMainMuscleGroups?.toJson(),
    "ExerciseSecondaryMuscleGroups": exerciseSecondaryMuscleGroups?.toJson(),
  };
}
