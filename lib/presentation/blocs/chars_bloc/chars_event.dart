part of 'chars_bloc.dart';

@immutable
sealed class CharsEvent {}

class GetCharsList extends CharsEvent {
  final String? name;
  GetCharsList({this.name});
}
