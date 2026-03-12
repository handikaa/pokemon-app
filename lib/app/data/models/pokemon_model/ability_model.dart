import 'dart:convert';

import 'package:equatable/equatable.dart';

class AbilityModel extends Equatable {
  final String? name;
  final String? url;

  const AbilityModel({this.name, this.url});

  factory AbilityModel.empty() {
    return const AbilityModel(name: '', url: '');
  }

  factory AbilityModel.fromRawJson(String str) =>
      AbilityModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory AbilityModel.fromJson(Map<String, dynamic> json) =>
      AbilityModel(name: json['name'] as String?, url: json['url'] as String?);

  Map<String, dynamic> toJson() => {'name': name, 'url': url};

  @override
  List<Object?> get props => [name, url];
}
