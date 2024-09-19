import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/screens/basket/BasketPage.dart';
import 'package:flutter_application_1/screens/home/home_bloc/home_bloc.dart';
import 'package:flutter_application_1/screens/home/widgets/snack_bar.dart';
import 'package:flutter_application_1/screens/product_detail/ProductDetailPage1.dart';
import 'package:flutter_application_1/screens/see_all/see_all_bloc/see_all_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../katalog/katalog_bloc/katalog_bloc.dart';

// ignore: must_be_immutable
class ProductWidget extends StatefulWidget {
  ProductWidget(
      {required this.index,
      required this.model,
      required this.isMaxWidth,
      this.isSeeAllPage,
      this.tab,
      super.key});
  bool isMaxWidth;
  bool? isSeeAllPage;
  int index;
  ProductModel model;
  int? tab;

  @override
  State<ProductWidget> createState() => _ProductwidgetState();
}

class _ProductwidgetState extends State<ProductWidget> {
  // late BasketBloc basketBloc;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            Card(
              elevation: 5,
              shadowColor: Colors.black,
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage1(
                        model: widget.model,
                        tab: widget.tab,
                      ),
                    ),
                  );
                },
                child: Stack(children: [
                  Container(
                    width: widget.isMaxWidth
                        ? double.infinity
                        : MediaQuery.of(context).size.width * 0.7,
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: NetworkImage(
                                  widget.model.variations?[0].files?[0].url ??
                                      '',
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            height: 240,
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.model.variations?[0].prices?[0].type ==
                                          'Price'
                                      ? '${widget.model.variations?[0].prices?[0].value?.toInt() ?? '0'} сум'
                                      : '${widget.model.variations?[0].prices?[1].value?.toInt() ?? '0'} сум',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Text(
                                  '180 000 сум',
                                  style: TextStyle(
                                    // decoration: TextDecoration.lineThrough,
                                    color: AppColors.grey3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.yellow,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 2,
                              ),
                              child: const Text(
                                'x 12 мес',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.model.name ?? 'Empty',
                          maxLines: 2,
                          style: const TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: AppColors.green,
                                  ),
                                  onPressed: () {
                                    bool isAlreadyHave = false;
                                    if (basketProducts.contains(widget.model)) {
                                      isAlreadyHave = true;
                                      if (!widget.isMaxWidth) {
                                        context.read<HomeBloc>().add(
                                              PostBasketProductHomeEvent(
                                                productVariationId: widget
                                                    .model.variations![0].id!,
                                                count: 2,
                                              ),
                                            );
                                      } else if (widget.isMaxWidth &&
                                          widget.isSeeAllPage == true) {
                                        context.read<SeeAllBloc>().add(
                                              PostBasketProductSeeAllEvent(
                                                productVariationId: widget
                                                    .model.variations![0].id!,
                                                count: 1,
                                              ),
                                            );
                                      } else if (widget.isSeeAllPage == null &&
                                          widget.isMaxWidth) {
                                        context.read<KatalogBloc>().add(
                                              PostBasketProductKatalogEvent(
                                                productVariationId: widget
                                                    .model.variations![0].id!,
                                                count: 1,
                                              ),
                                            );
                                      }
                                    }
                                    if (!isAlreadyHave) {
                                      if (!widget.isMaxWidth) {
                                        context.read<HomeBloc>().add(
                                              PostBasketProductHomeEvent(
                                                productVariationId: widget
                                                    .model.variations![0].id!,
                                                count: 1,
                                              ),
                                            );
                                      } else if (widget.isMaxWidth &&
                                          widget.isSeeAllPage == true) {
                                        context.read<SeeAllBloc>().add(
                                              PostBasketProductSeeAllEvent(
                                                productVariationId: widget
                                                    .model.variations![0].id!,
                                                count: 1,
                                              ),
                                            );
                                      } else if (widget.isMaxWidth &&
                                          widget.isSeeAllPage == null) {
                                        context.read<KatalogBloc>().add(
                                              PostBasketProductKatalogEvent(
                                                productVariationId: widget
                                                    .model.variations![0].id!,
                                                count: 1,
                                              ),
                                            );
                                      }
                                    }
                                    snackBar(
                                        context: context,
                                        name: widget.model.name ?? 'Empty',
                                        addProduct: true);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 15,
                                    ),
                                    child: Text(
                                      'в корзину',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: AppColors.grey1,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailPage1(
                                        model: widget.model,
                                        tab: null,
                                      ),
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: 12,
                    child: CircleAvatar(
                      backgroundColor: AppColors.grey1,
                      radius: 17,
                      child: Center(
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            setState(
                              () {
                                isSelected != isSelected;
                              },
                            );
                          },
                          icon: Icon(
                            isSelected
                                ? Icons.favorite
                                : Icons.favorite_border_rounded,
                            color:
                                isSelected ? AppColors.green : AppColors.grey2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
