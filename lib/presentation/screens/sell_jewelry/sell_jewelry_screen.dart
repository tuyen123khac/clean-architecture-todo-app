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
import '../../custom_widgets/app_bar/custom_app_bar.dart';
import '../../custom_widgets/button/custom_filled_button.dart';
import '../../custom_widgets/button/custom_outline_button.dart';
import '../../custom_widgets/button/custom_pill_button.dart';
import '../../navigation/app_navigation.dart';
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
  final _bloc = serviceLocator.get<SellJewelryBloc>();

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
        appBar: _buildAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              _buildBody(),
              _buildBottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  // ==================== App Bar ====================

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      backgroundColor: AppColors.bgWhite,
      centerTitle: true,
      marginLeftIcon: MarginApp.m8,
      leadingWidget: Icon(
        Icons.arrow_back_ios,
        color: AppColors.textBlack,
        size: SizeApp.s20,
      ),
      titleWidget: Text(
        AppStrings.sellItems,
        style: AppTextStyles.bold(
          fontSize: AppFontSize.s24,
          color: AppColors.textBlack,
        ),
      ),
      onPressLeftIcon: () => AppNavigation.back(context),
      actionButtons: [
        SellJewelryOnlineSelector(
          builder: (isOnline) => _buildOnlineStatusChip(isOnline),
        ),
      ],
    );
  }

  Widget _buildOnlineStatusChip(bool isOnline) {
    return Container(
      margin: const EdgeInsets.only(right: MarginApp.m12),
      child: CustomPillButton(
        label: isOnline ? AppStrings.online : AppStrings.offline,
        icon: isOnline ? Icons.wifi : Icons.wifi_off,
        backgroundColor: isOnline ? AppColors.successLight : AppColors.errorLight,
        foregroundColor: isOnline ? AppColors.success : AppColors.error,
        iconSize: SizeApp.s12,
      ),
    );
  }

  // ==================== Header ====================

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ScreenPaddingApp.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSubtitle(),
          _buildPendingSyncBanner(),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildSubtitle() {
    return SellJewelryListSelector(
      builder: (list) => Container(
        margin: const EdgeInsets.only(bottom: MarginApp.m8),
        child: Text(
          AppStrings.itemsInInventory(list.length),
          style: AppTextStyles.regular(
            fontSize: AppFontSize.s14,
            color: AppColors.textDarkGray,
          ),
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
          margin: const EdgeInsets.only(bottom: MarginApp.m8),
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingApp.p16,
            vertical: PaddingApp.p12,
          ),
          decoration: BoxDecoration(
            color: AppColors.warningLight,
            borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
            border: Border.all(color: AppColors.warning.withValues(alpha: 0.3)),
          ),
          child: Row(
            children: [
              Icon(Icons.access_time, size: SizeApp.s20, color: AppColors.warning),
              const SizedBox(width: SizeApp.s8),
              Text(
                AppStrings.itemsPendingSync(count),
                style: AppTextStyles.medium(
                  fontSize: AppFontSize.s14,
                  color: AppColors.warning,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButtons() {
    return SellJewelrySelectionModeSelector(
      builder: (isSelectionMode, selectedIds) {
        if (isSelectionMode) {
          return _buildSelectionModeButtons();
        }
        return _buildNormalModeButtons();
      },
    );
  }

  Widget _buildNormalModeButtons() {
    return Container(
      margin: const EdgeInsets.only(bottom: MarginApp.m8),
      child: Row(
        children: [
          CustomPillButton(
            label: AppStrings.addJewelry,
            icon: Icons.add,
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.textWhite,
            onPressed: _onPressAddJewelry,
          ),
          const SizedBox(width: SizeApp.s8),
          CustomPillButton(
            label: AppStrings.bulkDelete,
            icon: Icons.delete_outline,
            backgroundColor: AppColors.errorLight,
            foregroundColor: AppColors.error,
            borderColor: AppColors.error.withValues(alpha: 0.3),
            onPressed: _onPressBulkDelete,
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionModeButtons() {
    return Container(
      margin: const EdgeInsets.only(bottom: MarginApp.m8),
      child: Row(
        children: [
          Expanded(
            child: CustomOutlinedButton(
              label: AppStrings.selectAll,
              icon: Icons.select_all,
              onPressed: () => _bloc.selectAll(),
              fontSizeText: AppFontSize.s14,
            ),
          ),
          const SizedBox(width: SizeApp.s12),
          Expanded(
            child: CustomOutlinedButton(
              label: AppStrings.cancel,
              onPressed: () => _bloc.exitSelectionMode(),
              fontSizeText: AppFontSize.s14,
              colorText: AppColors.textDarkGray,
              borderColor: AppColors.border,
            ),
          ),
        ],
      ),
    );
  }

  // ==================== Body ====================

  Widget _buildBody() {
    return Expanded(
      child: SellJewelryStatusSelector(
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
      ),
    );
  }

  Widget _buildLoadingView() =>
      const Center(child: CircularProgressIndicator());

  Widget _buildErrorView() {
    return SellJewelryErrorSelector(
      builder: (errorMessage) => Center(
        child: Padding(
          padding: const EdgeInsets.all(PaddingApp.p24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: SizeApp.s64, color: AppColors.textGray),
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
              CustomFilledButton(
                label: AppStrings.retry,
                icon: Icons.refresh,
                onPressed: () => _bloc.retry(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inventory_2_outlined, size: SizeApp.s64, color: AppColors.textGray),
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

  Widget _buildListView() {
    return SellJewelrySelectionModeSelector(
      builder: (isSelectionMode, selectedIds) {
        return SellJewelryListSelector(
          builder: (inventoryList) {
            if (inventoryList.isEmpty) return _buildEmptyView();

            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: ScreenPaddingApp.horizontal,
              ),
              itemCount: inventoryList.length,
              itemBuilder: (context, index) =>
                  _buildListItem(inventoryList[index], index, isSelectionMode, selectedIds),
            );
          },
        );
      },
    );
  }

  Widget _buildListItem(
    SellJewelryEntity jewelry,
    int index,
    bool isSelectionMode,
    Set<String> selectedIds,
  ) {
    final isSelected = selectedIds.contains(jewelry.id);

    if (isSelectionMode) {
      return SellJewelryCard(
        jewelry: jewelry,
        isSelectionMode: true,
        isSelected: isSelected,
        onTap: () => _bloc.toggleSelection(jewelry.id),
        onEdit: () => _onPressEditJewelry(jewelry),
      );
    }

    return Dismissible(
      key: Key(jewelry.id),
      direction: DismissDirection.endToStart,
      background: _buildDismissBackground(),
      confirmDismiss: (direction) => _confirmDeleteSingle(jewelry),
      onDismissed: (direction) => _onDeleteJewelry(jewelry),
      child: SellJewelryCard(
        jewelry: jewelry,
        onIncrement: () => _bloc.incrementQuantity(index),
        onDecrement: () => _bloc.decrementQuantity(index),
        onEdit: () => _onPressEditJewelry(jewelry),
      ),
    );
  }

  Widget _buildDismissBackground() {
    return Container(
      margin: const EdgeInsets.only(bottom: MarginApp.m12),
      padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p24),
      decoration: BoxDecoration(
        color: AppColors.error,
        borderRadius: BorderRadius.circular(BorderRadiusApp.r16),
      ),
      alignment: Alignment.centerRight,
      child: Icon(Icons.delete_outline, color: AppColors.textWhite, size: SizeApp.s28),
    );
  }

  // ==================== Bottom Bar ====================

  Widget _buildBottomBar() {
    return SellJewelrySelectionModeSelector(
      builder: (isSelectionMode, selectedIds) {
        if (isSelectionMode) {
          return _buildSelectionBottomBar(selectedIds);
        }
        return _buildSellBottomBar();
      },
    );
  }

  Widget _buildSelectionBottomBar(Set<String> selectedIds) {
    if (selectedIds.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(ScreenPaddingApp.horizontal),
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        boxShadow: [
          BoxShadow(
            color: AppColors.bgBlack.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              AppStrings.itemsSelected(selectedIds.length),
              style: AppTextStyles.medium(
                fontSize: AppFontSize.s16,
                color: AppColors.textBlack,
              ),
            ),
          ),
          CustomFilledButton(
            label: AppStrings.delete,
            icon: Icons.delete_outline,
            color: AppColors.error,
            onPressed: _onPressDeleteSelected,
          ),
        ],
      ),
    );
  }

  Widget _buildSellBottomBar() {
    return SellJewelrySummarySelector(
      builder: (itemCount, total) {
        if (itemCount == 0) return const SizedBox.shrink();

        return Container(
          padding: const EdgeInsets.all(ScreenPaddingApp.horizontal),
          decoration: BoxDecoration(
            color: AppColors.bgWhite,
            boxShadow: [
              BoxShadow(
                color: AppColors.bgBlack.withValues(alpha: 0.05),
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
              CustomFilledButton(
                label: AppStrings.sellNow,
                icon: Icons.shopping_bag_outlined,
                color: AppColors.info,
                onPressed: _onPressSellNow,
              ),
            ],
          ),
        );
      },
    );
  }

  // ==================== Actions ====================

  void _onPressAddJewelry() {
    AddEditJewelryBottomSheet.show(
      context,
      onSave: (entity) => _bloc.addJewelry(entity),
    );
  }

  void _onPressEditJewelry(SellJewelryEntity jewelry) {
    AddEditJewelryBottomSheet.show(
      context,
      jewelry: jewelry,
      onSave: (entity) => _bloc.updateJewelry(entity),
    );
  }

  void _onPressBulkDelete() => _bloc.enterSelectionMode();

  void _onDeleteJewelry(SellJewelryEntity jewelry) async {
    await _bloc.deleteJewelry(jewelry.id);
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppStrings.itemDeleted(jewelry.name)),
        backgroundColor: AppColors.error,
        action: _bloc.canUndoDelete
            ? SnackBarAction(
                label: AppStrings.undo,
                textColor: AppColors.textWhite,
                onPressed: () async {
                  final success = await _bloc.undoDelete();
                  if (success && mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(AppStrings.itemRestored),
                        backgroundColor: AppColors.success,
                      ),
                    );
                  }
                },
              )
            : null,
      ),
    );
  }

  Future<bool> _confirmDeleteSingle(SellJewelryEntity jewelry) async {
    return await showDialog<bool>(
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
                onPressed: () => AppNavigation.pop(context, false),
                child: Text(
                  AppStrings.cancel,
                  style: AppTextStyles.medium(
                    fontSize: AppFontSize.s14,
                    color: AppColors.textGray,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => AppNavigation.pop(context, true),
                child: Text(
                  AppStrings.delete,
                  style: AppTextStyles.medium(
                    fontSize: AppFontSize.s14,
                    color: AppColors.error,
                  ),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  void _onPressDeleteSelected() async {
    final selectedCount = _bloc.state.selectedIds.length;
    final confirmed = await showDialog<bool>(
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
          AppStrings.deleteItemsConfirmation(selectedCount),
          style: AppTextStyles.regular(
            fontSize: AppFontSize.s16,
            color: AppColors.textDarkGray,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => AppNavigation.pop(context, false),
            child: Text(
              AppStrings.cancel,
              style: AppTextStyles.medium(
                fontSize: AppFontSize.s14,
                color: AppColors.textGray,
              ),
            ),
          ),
          TextButton(
            onPressed: () => AppNavigation.pop(context, true),
            child: Text(
              AppStrings.delete,
              style: AppTextStyles.medium(
                fontSize: AppFontSize.s14,
                color: AppColors.error,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _bloc.deleteSelected();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppStrings.itemsDeletedCount(selectedCount)),
          backgroundColor: AppColors.error,
          action: _bloc.canUndoDelete
              ? SnackBarAction(
                  label: AppStrings.undo,
                  textColor: AppColors.textWhite,
                  onPressed: () async {
                    final deletedCount = _bloc.deletedItemsCount;
                    final success = await _bloc.undoDelete();
                    if (success && mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppStrings.itemsRestored(deletedCount)),
                          backgroundColor: AppColors.success,
                        ),
                      );
                    }
                  },
                )
              : null,
        ),
      );
    }
  }

  void _onPressSellNow() async {
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
          backgroundColor: AppColors.success,
        ),
      );
    } else if (result == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppStrings.saleFailed),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }
}
