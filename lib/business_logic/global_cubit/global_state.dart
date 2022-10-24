part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class GlobalGetProductsLoadingState extends GlobalState {}

class GlobalGetProductsSuccessState extends GlobalState {
  final ProductResponse productResponse;

  GlobalGetProductsSuccessState(this.productResponse);
}

class GlobalGetProductsErrorState extends GlobalState {
  final String error;
  GlobalGetProductsErrorState(this.error);
}

class GlobalCategorySelectState extends GlobalState {}
