import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  const Category({required this.name});

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name];
}
