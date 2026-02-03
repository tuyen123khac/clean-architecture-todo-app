import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/resource/colors/app_colors.dart';
import '../../../application/resource/fonts/app_font.dart';
import '../../../application/resource/strings/app_strings.dart';
import '../../../application/resource/styles/app_text_style.dart';
import '../../../application/resource/value_manager.dart';
import '../../../application/util/number_utils.dart';
import '../../../data/di/service_locator.dart';
import '../../../domain/entities/sell_jewelry/sell_jewelry_entity.dart';
import 'bloc/sell_jewelry_bloc.dart';
import 'bloc/sell_jewelry_bloc_selector.dart';
import 'bloc/sell_jewelry_state.dart';
import 'widgets/add_edit_jewelry_bottom_sheet.dart';
import 'widgets/sell_confirmation_bottom_sheet.dart';
import 'widgets/sell_jewelry_card.dart';

class SellJewelryScreen extends StatefulWidget {
  const SellJewelryScreen({super.key});

  @override
  State<SellJewelryScreen> createState() => _SellJewelryScreenState();
}

class _SellJewelryScreenState extends State<SellJewelryScreen> {
  final SellJewelryBloc _bloc = serviceLocator.get<SellJewelryBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        floatingActionButton: _buildFab(),
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(child: _buildBody()),
              _buildBottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFab() {
    return FloatingActionButton(
      onPressed: _showAddJewelrySheet,
      backgroundColor: AppColors.primary,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  void _showAddJewelrySheet() {
    AddEditJewelryBottomSheet.show(
      context,
      onSave: (entity) => _bloc.addJewelry(entity),
    );
  }

  void _showEditJewelrySheet(SellJewelryEntity jewelry) {
    AddEditJewelryBottomSheet.show(
      context,
      jewelry: jewelry,
      onSave: (entity) => _bloc.updateJewelry(entity),
    );
  }

  void _showDeleteConfirmation(SellJewelryEntity jewelry) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppStrings.deleteItem,
          style: AppTextStyles.bold(
            fontSize: AppFontSize.s18,
            color: AppColors.textBlack,
          ),
        ),
        content: Text(
          AppStrings.deleteItemConfirmation(jewelry.name),
          style: AppTextStyles.regular(
            fontSize: AppFontSize.s16,
            color: AppColors.textDarkGray,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              AppStrings.cancel,
              style: AppTextStyles.medium(
                fontSize: AppFontSize.s14,
                color: AppColors.textGray,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _deleteJewelry(jewelry);
            },
            child: Text(
              AppStrings.delete,
              style: AppTextStyles.medium(
                fontSize: AppFontSize.s14,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _deleteJewelry(SellJewelryEntity jewelry) async {
    await _bloc.deleteJewelry(jewelry.id);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppStrings.itemDeleted(jewelry.name)),
        action: _bloc.canUndoDelete
            ? SnackBarAction(
                label: AppStrings.undo,
                onPressed: () async {
                  final success = await _bloc.undoDelete();
                  if (success && mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(AppStrings.itemRestored),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
              )
            : null,
        backgroundColor: Colors.red,
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(ScreenPaddingApp.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleRow(),
          const SizedBox(height: SizeApp.s4),
          _buildSubtitle(),
          const SizedBox(height: SizeApp.s16),
          _buildPendingSyncBanner(),
          const SizedBox(height: SizeApp.s12),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.sellItems,
          style: AppTextStyles.bold(
            fontSize: AppFontSize.s32,
            color: AppColors.textBlack,
          ),
        ),
        _buildOnlineStatus(),
      ],
    );
  }

  Widget _buildOnlineStatus() {
    return SellJewelryOnlineSelector(
      builder: (isOnline) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingApp.p12,
          vertical: PaddingApp.p6,
        ),
        decoration: BoxDecoration(
          color: isOnline ? Colors.green.shade50 : Colors.red.shade50,
          borderRadius: BorderRadius.circular(BorderRadiusApp.r20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isOnline ? Icons.wifi : Icons.wifi_off,
              size: SizeApp.s16,
              color: isOnline ? Colors.green : Colors.red,
            ),
            const SizedBox(width: SizeApp.s4),
            Text(
              isOnline ? AppStrings.online : AppStrings.offline,
              style: AppTextStyles.medium(
                fontSize: AppFontSize.s14,
                color: isOnline ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubtitle() {
    return SellJewelryListSelector(
      builder: (list) => Text(
        AppStrings.itemsInInventory(list.length),
        style: AppTextStyles.regular(
          fontSize: AppFontSize.s14,
          color: AppColors.textDarkGray,
        ),
      ),
    );
  }

  Widget _buildPendingSyncBanner() {
    return SellJewelryPendingSyncSelector(
      builder: (count) {
        if (count == 0) return const SizedBox.shrink();
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingApp.p16,
            vertical: PaddingApp.p12,
          ),
          decoration: BoxDecoration(
            color: Colors.amber.shade50,
            borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
            border: Border.all(color: Colors.amber.shade200),
          ),
          child: Row(
            children: [
              Icon(
                Icons.access_time,
                size: SizeApp.s20,
                color: Colors.amber.shade800,
              ),
              const SizedBox(width: SizeApp.s8),
              Text(
                AppStrings.itemsPendingSync(count),
                style: AppTextStyles.medium(
                  fontSize: AppFontSize.s14,
                  color: Colors.amber.shade800,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => _bloc.bulkSelect(),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: PaddingApp.p14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
                border: Border.all(color: AppColors.bgLightGray),
              ),
              child: Center(
                child: Text(
                  AppStrings.bulkSelect,
                  style: AppTextStyles.medium(
                    fontSize: AppFontSize.s16,
                    color: AppColors.textBlack,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: SizeApp.s12),
        Expanded(
          child: GestureDetector(
            onTap: () => _bloc.clearSelection(),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: PaddingApp.p14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
                border: Border.all(color: AppColors.bgLightGray),
              ),
              child: Center(
                child: Text(
                  AppStrings.clearSelection,
                  style: AppTextStyles.medium(
                    fontSize: AppFontSize.s16,
                    color: AppColors.textGray,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SellJewelryStatusSelector(
      builder: (status) {
        switch (status) {
          case SellJewelryScreenStatus.loading:
            return _buildLoadingView();
          case SellJewelryScreenStatus.success:
            return _buildListView();
          case SellJewelryScreenStatus.error:
            return _buildErrorView();
          default:
            return _buildListView();
        }
      },
    );
  }

  Widget _buildLoadingView() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorView() {
    return SellJewelryErrorSelector(
      builder: (errorMessage) => Center(
        child: Padding(
          padding: const EdgeInsets.all(PaddingApp.p24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: SizeApp.s64,
                color: AppColors.textGray,
              ),
              const SizedBox(height: SizeApp.s16),
              Text(
                errorMessage ?? AppStrings.somethingWentWrong,
                style: AppTextStyles.medium(
                  fontSize: AppFontSize.s16,
                  color: AppColors.textDarkGray,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SizeApp.s24),
              ElevatedButton.icon(
                onPressed: () => _bloc.retry(),
                icon: const Icon(Icons.refresh),
                label: Text(AppStrings.retry),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: PaddingApp.p24,
                    vertical: PaddingApp.p12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return SellJewelryListSelector(
      builder: (inventoryList) {
        if (inventoryList.isEmpty) {
          return _buildEmptyView();
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: ScreenPaddingApp.horizontal,
          ),
          itemCount: inventoryList.length,
          itemBuilder: (context, index) {
            final jewelry = inventoryList[index];
            return SellJewelryCard(
              jewelry: jewelry,
              onIncrement: () => _bloc.incrementQuantity(index),
              onDecrement: () => _bloc.decrementQuantity(index),
              onEdit: () => _showEditJewelrySheet(jewelry),
              onDelete: () => _showDeleteConfirmation(jewelry),
            );
          },
        );
      },
    );
  }

  Widget _buildEmptyView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: SizeApp.s64,
            color: AppColors.textGray,
          ),
          const SizedBox(height: SizeApp.s16),
          Text(
            AppStrings.noItemsInInventory,
            style: AppTextStyles.medium(
              fontSize: AppFontSize.s16,
              color: AppColors.textDarkGray,
            ),
          ),
          const SizedBox(height: SizeApp.s8),
          Text(
            AppStrings.tapToAddFirstItem,
            style: AppTextStyles.regular(
              fontSize: AppFontSize.s14,
              color: AppColors.textGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return SellJewelrySummarySelector(
      builder: (itemCount, total) {
        if (itemCount == 0) return const SizedBox.shrink();
        return Container(
          padding: const EdgeInsets.all(ScreenPaddingApp.horizontal),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.itemsToSell(itemCount),
                      style: AppTextStyles.regular(
                        fontSize: AppFontSize.s14,
                        color: AppColors.textGray,
                      ),
                    ),
                    const SizedBox(height: SizeApp.s2),
                    Text(
                      AppStrings.estimatedPrice(NumberUtils.formatPrice(total)),
                      style: AppTextStyles.bold(
                        fontSize: AppFontSize.s20,
                        color: AppColors.textBlack,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => _showSellConfirmation(),
                icon: const Icon(Icons.shopping_bag_outlined),
                label: Text(AppStrings.sellNow),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: PaddingApp.p24,
                    vertical: PaddingApp.p14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSellConfirmation() async {
    final result = await SellConfirmationBottomSheet.show(
      context,
      itemsToSell: _bloc.state.itemsToSell,
      estimatedTotal: _bloc.state.estimatedTotal,
      onConfirm: () => _bloc.sellItems(),
    );

    if (!mounted) return;

    if (result == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppStrings.saleSuccess),
          backgroundColor: Colors.green,
        ),
      );
    } else if (result == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppStrings.saleFailed),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
