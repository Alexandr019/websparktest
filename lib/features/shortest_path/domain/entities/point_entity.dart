import 'package:equatable/equatable.dart';

class PointEntity extends Equatable {
  final int x;
  final int y;

  const PointEntity(this.x, this.y);

  @override
  String toString() => '($x,$y)';

  @override
  List<Object?> get props => [x, y];
}
