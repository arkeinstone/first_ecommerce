part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  List<Object?> get props => [];
}
class LoadCategories extends CategoryEvent{
  List<Object?> get props => [];
}

class UpdateCategories extends CategoryEvent{
  final List<Category> categories;
  UpdateCategories({required this.categories});
  List<Object?> get props => [categories];
}
