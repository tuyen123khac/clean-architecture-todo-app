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
        appBar: _buildAppBar(),
        body: SafeArea(
          child: Column(
            children: [_buildHeader(), _buildBody(), _buildBottomBar()],
          ),
        ),
      ),
    );
  }

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
            size: SizeApp.s12,
            color: isOnline ? Colors.green : Colors.red,
          ),
          const SizedBox(width: SizeApp.s4),
          Text(
            isOnline ? AppStrings.online : AppStrings.offline,
            style: AppTextStyles.medium(
              fontSize: AppFontSize.s12,
              color: isOnline ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
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
      padding: const EdgeInsets.symmetric(
        horizontal: ScreenPaddingApp.horizontal,
      ),
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
    return SellJewelrySelectionModeSelector(
      builder: (isSelectionMode, selectedIds) {
        if (isSelectionMode) {
          return _buildSelectionModeButtons(selectedIds);
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
          // Add Jewelry button
          GestureDetector(
            onTap: _showAddJewelrySheet,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingApp.p12,
                vertical: PaddingApp.p8,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(BorderRadiusApp.r20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add, color: Colors.white, size: SizeApp.s14),
                  const SizedBox(width: SizeApp.s4),
                  Text(
                    AppStrings.addJewelry,
                    style: AppTextStyles.medium(
                      fontSize: AppFontSize.s12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: SizeApp.s8),
          // Bulk Delete button
          GestureDetector(
            onTap: () => _bloc.enterSelectionMode(),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingApp.p12,
                vertical: PaddingApp.p8,
              ),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(BorderRadiusApp.r20),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                    size: SizeApp.s14,
                  ),
                  const SizedBox(width: SizeApp.s4),
                  Text(
                    'Bulk Delete',
                    style: AppTextStyles.medium(
                      fontSize: AppFontSize.s12,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionModeButtons(Set<String> selectedIds) {
    return Container(
      margin: const EdgeInsets.only(bottom: MarginApp.m8),
      child: Row(
        children: [
          Expanded(
            child: CustomOutlinedButton(
              label: 'Select All',
              icon: Icons.select_all,
              onPressed: () => _bloc.selectAll(),
              fontSizeText: AppFontSize.s14,
              paddingButton: const EdgeInsets.symmetric(
                vertical: PaddingApp.p6,
              ),
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
              paddingButton: const EdgeInsets.symmetric(
                vertical: PaddingApp.p6,
              ),
            ),
          ),
        ],
      ),
    );
  }

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
    return SellJewelrySelectionModeSelector(
      builder: (isSelectionMode, selectedIds) {
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
                final isSelected = selectedIds.contains(jewelry.id);

                if (isSelectionMode) {
                  return SellJewelryCard(
                    jewelry: jewelry,
                    isSelectionMode: true,
                    isSelected: isSelected,
                    onTap: () => _bloc.toggleSelection(jewelry.id),
                    onEdit: () => _showEditJewelrySheet(jewelry),
                  );
                }

                return Dismissible(
                  key: Key(jewelry.id),
                  direction: DismissDirection.endToStart,
                  background: _buildDismissBackground(),
                  confirmDismiss: (direction) async {
                    return await _confirmDelete(jewelry);
                  },
                  onDismissed: (direction) {
                    _deleteJewelry(jewelry);
                  },
                  child: SellJewelryCard(
                    jewelry: jewelry,
                    onIncrement: () => _bloc.incrementQuantity(index),
                    onDecrement: () => _bloc.decrementQuantity(index),
                    onEdit: () => _showEditJewelrySheet(jewelry),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildDismissBackground() {
    return Container(
      margin: const EdgeInsets.only(bottom: MarginApp.m12),
      padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p24),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(BorderRadiusApp.r16),
      ),
      alignment: Alignment.centerRight,
      child: const Icon(
        Icons.delete_outline,
        color: Colors.white,
        size: SizeApp.s28,
      ),
    );
  }

  Future<bool> _confirmDelete(SellJewelryEntity jewelry) async {
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
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  AppStrings.cancel,
                  style: AppTextStyles.medium(
                    fontSize: AppFontSize.s14,
                    color: AppColors.textGray,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
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
        ) ??
        false;
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
            child: Text(
              '${selectedIds.length} items selected',
              style: AppTextStyles.medium(
                fontSize: AppFontSize.s16,
                color: AppColors.textBlack,
              ),
            ),
          ),
          CustomFilledButton(
            label: AppStrings.delete,
            icon: Icons.delete_outline,
            color: Colors.red,
            onPressed: () => _confirmDeleteSelected(),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteSelected() async {
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
          'Are you sure you want to delete $selectedCount items?',
          style: AppTextStyles.regular(
            fontSize: AppFontSize.s16,
            color: AppColors.textDarkGray,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              AppStrings.cancel,
              style: AppTextStyles.medium(
                fontSize: AppFontSize.s14,
                color: AppColors.textGray,
              ),
            ),
          ),
          CustomFilledButton(
            label: AppStrings.delete,
            icon: Icons.delete_outline,
            color: Colors.red,
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _bloc.deleteSelected();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$selectedCount items deleted'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _buildSellBottomBar() {
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
              CustomFilledButton(
                label: AppStrings.sellNow,
                icon: Icons.shopping_bag_outlined,
                color: Colors.teal,
                onPressed: () => _showSellConfirmation(),
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
