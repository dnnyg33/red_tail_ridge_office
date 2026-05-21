import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum MiniAppId { preparePayroll }

class MiniApp extends Equatable {
  const MiniApp({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
  });

  final MiniAppId id;
  final String name;
  final String description;
  final IconData icon;

  @override
  List<Object?> get props => [id, name, description, icon];
}