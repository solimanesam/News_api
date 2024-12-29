import 'package:equatable/equatable.dart';

class EntityModel extends Equatable {
  final String title, subtitle, image, link;
  const EntityModel(
      {required this.title,
      required this.subtitle,
      required this.image,
      required this.link});

  @override
  List<Object?> get props => [title, subtitle, image, link];
}
