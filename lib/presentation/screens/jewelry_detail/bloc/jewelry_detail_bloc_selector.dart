import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/buy_jewelry/buy_jewelry_entity.dart';
import 'jewelry_detail_bloc.dart';
import 'jewelry_detail_state.dart';

class JewelryDetailDataSelector
    extends BlocSelector<JewelryDetailBloc, JewelryDetailState, BuyJewelryEntity?> {
  JewelryDetailDataSelector({
    super.key,
    required Widget Function(BuyJewelryEntity?) builder,
  }) : super(
          selector: (state) => state.jewelry,
          builder: (_, jewelry) => builder(jewelry),
        );
}

class JewelryDetailFavoriteSelector
    extends BlocSelector<JewelryDetailBloc, JewelryDetailState, bool> {
  JewelryDetailFavoriteSelector({
    super.key,
    required Widget Function(bool isFavorite) builder,
  }) : super(
          selector: (state) => state.isFavorite,
          builder: (_, isFavorite) => builder(isFavorite),
        );
}

class JewelryDetailQuantitySelector
    extends BlocSelector<JewelryDetailBloc, JewelryDetailState, int> {
  JewelryDetailQuantitySelector({
    super.key,
    required Widget Function(int quantity) builder,
  }) : super(
          selector: (state) => state.quantity,
          builder: (_, quantity) => builder(quantity),
        );
}

class JewelryDetailTotalPriceSelector
    extends BlocSelector<JewelryDetailBloc, JewelryDetailState, double> {
  JewelryDetailTotalPriceSelector({
    super.key,
    required Widget Function(double totalPrice) builder,
  }) : super(
          selector: (state) => state.totalPrice,
          builder: (_, totalPrice) => builder(totalPrice),
        );
}

class JewelryDetailAppBarTitleOpacitySelector
    extends BlocSelector<JewelryDetailBloc, JewelryDetailState, double> {
  JewelryDetailAppBarTitleOpacitySelector({
    super.key,
    required Widget Function(double appBarTitleOpacity) builder,
  }) : super(
          selector: (state) => state.appBarTitleOpacity,
          builder: (_, opacity) => builder(opacity),
        );
}
