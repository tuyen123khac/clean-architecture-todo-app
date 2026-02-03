import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/sell_jewelry/sell_jewelry_entity.dart';
import 'sell_jewelry_bloc.dart';
import 'sell_jewelry_state.dart';

class SellJewelryStatusSelector
    extends BlocSelector<SellJewelryBloc, SellJewelryState, SellJewelryScreenStatus> {
  SellJewelryStatusSelector({
    super.key,
    required Widget Function(SellJewelryScreenStatus) builder,
  }) : super(
          selector: (state) => state.screenStatus,
          builder: (_, status) => builder(status),
        );
}

class SellJewelryListSelector
    extends BlocSelector<SellJewelryBloc, SellJewelryState, List<SellJewelryEntity>> {
  SellJewelryListSelector({
    super.key,
    required Widget Function(List<SellJewelryEntity>) builder,
  }) : super(
          selector: (state) => state.inventoryWithQuantities,
          builder: (_, list) => builder(list),
        );
}

class SellJewelryOnlineSelector
    extends BlocSelector<SellJewelryBloc, SellJewelryState, bool> {
  SellJewelryOnlineSelector({
    super.key,
    required Widget Function(bool) builder,
  }) : super(
          selector: (state) => state.isOnline,
          builder: (_, isOnline) => builder(isOnline),
        );
}

class SellJewelryPendingSyncSelector
    extends BlocSelector<SellJewelryBloc, SellJewelryState, int> {
  SellJewelryPendingSyncSelector({
    super.key,
    required Widget Function(int) builder,
  }) : super(
          selector: (state) => state.pendingSyncCount,
          builder: (_, count) => builder(count),
        );
}

class SellJewelrySummarySelector
    extends BlocSelector<SellJewelryBloc, SellJewelryState, ({int itemCount, double total})> {
  SellJewelrySummarySelector({
    super.key,
    required Widget Function(int itemCount, double total) builder,
  }) : super(
          selector: (state) => (itemCount: state.totalItemsToSell, total: state.estimatedTotal),
          builder: (_, data) => builder(data.itemCount, data.total),
        );
}

class SellJewelryErrorSelector
    extends BlocSelector<SellJewelryBloc, SellJewelryState, String?> {
  SellJewelryErrorSelector({
    super.key,
    required Widget Function(String?) builder,
  }) : super(
          selector: (state) => state.errorMessage,
          builder: (_, error) => builder(error),
        );
}

class SellJewelrySelectionModeSelector
    extends BlocSelector<SellJewelryBloc, SellJewelryState, ({bool isSelectionMode, Set<String> selectedIds})> {
  SellJewelrySelectionModeSelector({
    super.key,
    required Widget Function(bool isSelectionMode, Set<String> selectedIds) builder,
  }) : super(
          selector: (state) => (isSelectionMode: state.isSelectionMode, selectedIds: state.selectedIds),
          builder: (_, data) => builder(data.isSelectionMode, data.selectedIds),
        );
}
