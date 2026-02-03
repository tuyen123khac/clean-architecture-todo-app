import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/buy_jewelry/buy_jewelry_entity.dart';
import 'buy_jewelry_bloc.dart';
import 'buy_jewelry_state.dart';

class BuyJewelryStatusSelector
    extends BlocSelector<BuyJewelryBloc, BuyJewelryState, BuyJewelryScreenStatus> {
  BuyJewelryStatusSelector({
    super.key,
    required Widget Function(BuyJewelryScreenStatus) builder,
  }) : super(
          selector: (state) => state.screenStatus,
          builder: (_, status) => builder(status),
        );
}

class BuyJewelryListSelector
    extends BlocSelector<BuyJewelryBloc, BuyJewelryState, List<BuyJewelryEntity>> {
  BuyJewelryListSelector({
    super.key,
    required Widget Function(List<BuyJewelryEntity>) builder,
  }) : super(
          selector: (state) => state.displayList,
          builder: (_, jewelryList) => builder(jewelryList),
        );
}

class BuyJewelryAllItemsSelector
    extends BlocSelector<BuyJewelryBloc, BuyJewelryState, List<BuyJewelryEntity>> {
  BuyJewelryAllItemsSelector({
    super.key,
    required Widget Function(List<BuyJewelryEntity>) builder,
  }) : super(
          selector: (state) => state.buyJewelryList,
          builder: (_, jewelryList) => builder(jewelryList),
        );
}

class BuyJewelryWishlistSelector
    extends BlocSelector<BuyJewelryBloc, BuyJewelryState, List<BuyJewelryEntity>> {
  BuyJewelryWishlistSelector({
    super.key,
    required Widget Function(List<BuyJewelryEntity>) builder,
  }) : super(
          selector: (state) => state.buyJewelryWishList,
          builder: (_, wishlist) => builder(wishlist),
        );
}

class BuyJewelryTabSelector
    extends BlocSelector<BuyJewelryBloc, BuyJewelryState, ({BuyJewelryTab tab, int wishlistCount})> {
  BuyJewelryTabSelector({
    super.key,
    required Widget Function(BuyJewelryTab tab, int wishlistCount) builder,
  }) : super(
          selector: (state) => (tab: state.selectedTab, wishlistCount: state.wishlistCount),
          builder: (_, data) => builder(data.tab, data.wishlistCount),
        );
}

class BuyJewelryErrorSelector
    extends BlocSelector<BuyJewelryBloc, BuyJewelryState, String?> {
  BuyJewelryErrorSelector({
    super.key,
    required Widget Function(String?) builder,
  }) : super(
          selector: (state) => state.errorMessage,
          builder: (_, errorMessage) => builder(errorMessage),
        );
}
