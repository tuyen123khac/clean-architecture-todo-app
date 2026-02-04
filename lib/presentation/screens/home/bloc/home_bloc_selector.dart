import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_bloc.dart';
import 'home_state.dart';

class HomeWishlistCountSelector extends BlocSelector<HomeBloc, HomeState, int> {
  HomeWishlistCountSelector({
    super.key,
    required Widget Function(int) builder,
  }) : super(
          selector: (state) => state.wishlistCount,
          builder: (_, count) => builder(count),
        );
}

class HomeSellJewelryCountSelector
    extends BlocSelector<HomeBloc, HomeState, int> {
  HomeSellJewelryCountSelector({
    super.key,
    required Widget Function(int) builder,
  }) : super(
          selector: (state) => state.sellJewelryCount,
          builder: (_, count) => builder(count),
        );
}

class HomePendingSyncCountSelector
    extends BlocSelector<HomeBloc, HomeState, int> {
  HomePendingSyncCountSelector({
    super.key,
    required Widget Function(int) builder,
  }) : super(
          selector: (state) => state.pendingSyncCount,
          builder: (_, count) => builder(count),
        );
}

/// Selector for navigation cards counters
class HomeCountersSelector
    extends BlocSelector<HomeBloc, HomeState, ({int wishlist, int sell})> {
  HomeCountersSelector({
    super.key,
    required Widget Function(({int wishlist, int sell})) builder,
  }) : super(
          selector: (state) =>
              (wishlist: state.wishlistCount, sell: state.sellJewelryCount),
          builder: (_, counters) => builder(counters),
        );
}
