part of 'product_detail_bloc.dart';

class ProductDetailState extends Equatable {
  final ProductDetailModel? productDetailModel;
  final FormzSubmissionStatus getDetailStatus;
  final PostResponseBasketModel? postResponseBasketModel;
  final FormzSubmissionStatus postResponseBasketStatus;
  final List<ProductModel>? parentCategoryModel;
  final FormzSubmissionStatus getProductStatus;

  const ProductDetailState({
    this.productDetailModel,
    this.getDetailStatus = FormzSubmissionStatus.initial,
    this.postResponseBasketModel,
    this.postResponseBasketStatus = FormzSubmissionStatus.initial,
    this.parentCategoryModel,
    this.getProductStatus = FormzSubmissionStatus.initial,
  });

  ProductDetailState copyWith({
    ProductDetailModel? productDetailModel,
    FormzSubmissionStatus? getDetailStatus,
    PostResponseBasketModel? postResponseBasketModel,
    FormzSubmissionStatus? postResponseBasketStatus,
    List<ProductModel>? parentCategoryModel,
    FormzSubmissionStatus? getProductStatus,
  }) {
    return ProductDetailState(
      productDetailModel: productDetailModel ?? this.productDetailModel,
      getDetailStatus: getDetailStatus ?? this.getDetailStatus,
      postResponseBasketModel:
          postResponseBasketModel ?? this.postResponseBasketModel,
      postResponseBasketStatus:
          postResponseBasketStatus ?? this.postResponseBasketStatus,
      parentCategoryModel: parentCategoryModel ?? this.parentCategoryModel,
      getProductStatus: getProductStatus ?? this.getProductStatus,
    );
  }

  @override
  List<Object?> get props => [
        productDetailModel,
        getDetailStatus,
        postResponseBasketModel,
        postResponseBasketStatus,
        parentCategoryModel,
        getProductStatus,
      ];
}
