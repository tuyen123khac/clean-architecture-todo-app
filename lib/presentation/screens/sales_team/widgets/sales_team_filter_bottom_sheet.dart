import 'package:flutter/material.dart';
import 'package:todo_app/presentation/custom_widgets/button/custom_outline_button.dart';
import 'package:todo_app/presentation/navigation/app_navigation.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/strings/app_strings.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';
import '../../../../domain/entities/sales_member/sales_gender_enum_entity.dart';
import '../../../custom_widgets/button/custom_filled_button.dart';

class SalesTeamFilterState {
  final RangeValues ageRange;
  final SalesGenderEnumEntity? gender; // null means "all"

  const SalesTeamFilterState({
    this.ageRange = const RangeValues(18, 65),
    this.gender,
  });

  SalesTeamFilterState copyWith({
    RangeValues? ageRange,
    SalesGenderEnumEntity? Function()? gender,
  }) {
    return SalesTeamFilterState(
      ageRange: ageRange ?? this.ageRange,
      gender: gender != null ? gender() : this.gender,
    );
  }

  bool get isDefault =>
      ageRange.start == 18 && ageRange.end == 65 && gender == null;
}

class SalesTeamFilterBottomSheet extends StatefulWidget {
  final SalesTeamFilterState initialFilter;
  final Function(SalesTeamFilterState) onApply;

  const SalesTeamFilterBottomSheet({
    super.key,
    required this.initialFilter,
    required this.onApply,
  });

  @override
  State<SalesTeamFilterBottomSheet> createState() =>
      _SalesTeamFilterBottomSheetState();

  static Future<void> show(
    BuildContext context, {
    required SalesTeamFilterState initialFilter,
    required Function(SalesTeamFilterState) onApply,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SalesTeamFilterBottomSheet(
        initialFilter: initialFilter,
        onApply: onApply,
      ),
    );
  }
}

class _SalesTeamFilterBottomSheetState
    extends State<SalesTeamFilterBottomSheet> {
  late RangeValues _ageRange;
  SalesGenderEnumEntity? _gender;

  @override
  void initState() {
    super.initState();
    _ageRange = widget.initialFilter.ageRange;
    _gender = widget.initialFilter.gender;
  }

  void _resetFilters() {
    setState(() {
      _ageRange = const RangeValues(18, 65);
      _gender = null;
    });
  }

  void _applyFilters() {
    widget.onApply(SalesTeamFilterState(ageRange: _ageRange, gender: _gender));
    AppNavigation.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(BorderRadiusApp.r20),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(PaddingApp.p20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: SizeApp.s24),
              _buildAgeRangeSection(),
              const SizedBox(height: SizeApp.s24),
              _buildGenderSection(),
              const SizedBox(height: SizeApp.s32),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.filters,
              style: AppTextStyles.bold(
                fontSize: AppFontSize.s24,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: SizeApp.s4),
            Text(
              AppStrings.refineYourSearch,
              style: AppTextStyles.regular(
                fontSize: AppFontSize.s14,
                color: AppColors.textDarkGray,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () => AppNavigation.pop(context),
          icon: Icon(
            Icons.close,
            color: AppColors.textBlack,
            size: SizeApp.s24,
          ),
        ),
      ],
    );
  }

  Widget _buildAgeRangeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.ageRange,
              style: AppTextStyles.semiBold(
                fontSize: AppFontSize.s16,
                color: AppColors.textBlack,
              ),
            ),
            Text(
              '${_ageRange.start.round()} - ${_ageRange.end.round()} ${AppStrings.yearsOld}',
              style: AppTextStyles.medium(
                fontSize: AppFontSize.s14,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: SizeApp.s12),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: AppColors.bgLightGray,
            thumbColor: AppColors.primary,
            overlayColor: AppColors.primary.withValues(alpha: 0.2),
            trackHeight: 4,
          ),
          child: RangeSlider(
            values: _ageRange,
            min: 18,
            max: 65,
            divisions: 47,
            onChanged: _onTapAgeRange,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '18',
              style: AppTextStyles.regular(
                fontSize: AppFontSize.s12,
                color: AppColors.textDarkGray,
              ),
            ),
            Text(
              '65',
              style: AppTextStyles.regular(
                fontSize: AppFontSize.s12,
                color: AppColors.textDarkGray,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _onTapAgeRange(RangeValues values) {
    setState(() {
      _ageRange = values;
    });
  }

  Widget _buildGenderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.gender,
          style: AppTextStyles.semiBold(
            fontSize: AppFontSize.s16,
            color: AppColors.textBlack,
          ),
        ),
        const SizedBox(height: SizeApp.s12),
        Row(
          children: [
            _buildGenderChip(AppStrings.all, null),
            const SizedBox(width: SizeApp.s8),
            _buildGenderChip(AppStrings.male, SalesGenderEnumEntity.male),
            const SizedBox(width: SizeApp.s8),
            _buildGenderChip(AppStrings.female, SalesGenderEnumEntity.female),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderChip(String label, SalesGenderEnumEntity? value) {
    final isSelected = _gender == value;
    return GestureDetector(
      onTap: () => _onTapGenderChip(value),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingApp.p20,
          vertical: PaddingApp.p10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.bgLightGray,
          borderRadius: BorderRadius.circular(BorderRadiusApp.r20),
        ),
        child: Text(
          label,
          style: AppTextStyles.medium(
            fontSize: AppFontSize.s14,
            color: isSelected ? AppColors.bgWhite : AppColors.textDarkGray,
          ),
        ),
      ),
    );
  }

  void _onTapGenderChip(SalesGenderEnumEntity? value) {
    setState(() {
      _gender = value;
    });
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: CustomOutlinedButton(
            onPressed: _resetFilters,
            label: AppStrings.resetAll,
            colorText: AppColors.primary,
            borderColor: AppColors.primary,
          ),
        ),
        const SizedBox(width: SizeApp.s12),
        Expanded(
          child: CustomFilledButton(
            label: AppStrings.applyFilters,
            onPressed: _applyFilters,
          ),
        ),
      ],
    );
  }
}
