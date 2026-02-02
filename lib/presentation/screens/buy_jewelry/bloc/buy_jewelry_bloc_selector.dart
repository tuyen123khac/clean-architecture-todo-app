import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/buy_jewelry/jewelry_entity.dart';
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
    extends BlocSelector<BuyJewelryBloc, BuyJewelryState, List<JewelryEntity>> {
  BuyJewelryListSelector({
    super.key,
    required Widget Function(List<JewelryEntity>) builder,
  }) : super(
          selector: (state) => state.displayList,
          builder: (_, jewelryList) => builder(jewelryList),
        );
}

class BuyJewelryTabSelector
    extends BlocSelector<BuyJewelryBloc, BuyJewelryState, ({JewelryTab tab, int wishlistCount})> {
  BuyJewelryTabSelector({
    super.key,
    required Widget Function(JewelryTab tab, int wishlistCount) builder,
  }) : super(
          selector: (state) => (tab: state.selectedTab, wishlistCount: state.wishlistCount),
          builder: (_, data) => builder(data.tab, data.wishlistCount),
        );
}
