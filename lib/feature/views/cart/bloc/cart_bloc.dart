import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/database/database.dart';
import '../../../app/app.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on(_loadCart);
    on<CartUpdateProductEvent>(_updateCartProduct);
  }

  _loadCart(CartLoadEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    try {
      List<UserCartData> userCartList = await (App.db.selectAllUserCartData());
      emit(CartLoadedState(cartProductList: userCartList));
    } catch (e) {
      emit(CartErrorState());
    }
  }

  _updateCartProduct(
      CartUpdateProductEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    try {
      await event.action();
      List<UserCartData> userCartList = await (App.db.selectAllUserCartData());
      event.updateButton();
      emit(CartLoadedState(cartProductList: userCartList));
    } catch (e) {
      emit(CartErrorState());
    }
  }
}
