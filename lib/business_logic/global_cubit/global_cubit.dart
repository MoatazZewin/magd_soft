import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/product_response.dart';

import '../../constants/end_points.dart';
import '../../data/data_providers/remote/dio_helper.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  Future navigate({VoidCallback? afterSuccess}) async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    afterSuccess!();
  }

  List<ProductModel> all = [];
  List<ProductModel> acer = [];
  List<ProductModel> apple = [];
  List<ProductModel> razer = [];
  ProductResponse? productResponse;

  Future getProduct() async {
    emit(GlobalGetProductsLoadingState());
    await DioHelper.getData(url: product, query: {}).then((value) {
      productResponse = ProductResponse.fromJson(value.data);
      productResponse?.listProducts?.forEach((element) {
        all.add(element);
        print(all.toString());
        if (element.company == 'Acer') {
          acer.add(element);
        } else if (element.company == 'Razer') {
          razer.add(element);
        } else {
          apple.add(element);
        }
      });
      emit(GlobalGetProductsSuccessState(productResponse!));
    }).catchError((error) {});
  }


}
