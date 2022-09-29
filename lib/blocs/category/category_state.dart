part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {
  List<Object?> get props => [];
}

class CategoryLoading extends CategoryState {

  List<Object?> get props => [];
}

class CategoryLoaded extends CategoryState {
  List<Category> categories;
  CategoryLoaded({this.categories = const <Category>[]});
  List<Object?> get props => [];
}