part of 'desings_bloc.dart';

class DesingsState extends Equatable {
  factory DesingsState.initial() =>
      DesingsState(desings: const [], isLoading: false, categoryOption: none());
  const DesingsState({
    required this.desings,
    required this.isLoading,
    required this.categoryOption,
  });
  final List<Desing> desings;
  final bool isLoading;
  final Option<Category> categoryOption;
  @override
  List<Object> get props => [desings, isLoading, categoryOption];

  DesingsState copyWith({
    List<Desing>? desings,
    bool? isLoading,
    Option<Category>? categoryOption,
  }) {
    return DesingsState(
      desings: desings ?? this.desings,
      isLoading: isLoading ?? this.isLoading,
      categoryOption: categoryOption ?? this.categoryOption,
    );
  }
}
