import 'package:flutter/material.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/strings/app_strings.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';
import '../../../custom_widgets/button/custom_filled_button.dart';

enum GenderFilter { all, male, female }

class SalesTeamFilterState {
  final RangeValues ageRange;
  final GenderFilter gender;

  const SalesTeamFilterState({
    this.ageRange = const RangeValues(18, 65),
    this.gender = GenderFilter.all,
  });

  SalesTeamFilterState copyWith({
    RangeValues? ageRange,
    GenderFilter? gender,
  }) {
    return SalesTeamFilterState(
      ageRange: ageRange ?? this.ageRange,
      gender: gender ?? this.gender,
    );
  }

  bool get isDefault =>
      ageRange.start == 18 &&
      ageRange.end == 65 &&
      gender == GenderFilter.all;
}

class SalesTeamFilterBottomSheet extends StatefulWidget {
  final SalesTeamFilterState initialFilter;
  final Function(SalesTeamFilterState) onApply;

  const SalesTeamFilterBottomSheet({
    super.key,
    required this.initialFilter,
    required this.onApply,
  });

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

  @override
  State<SalesTeamFilterBottomSheet> createState() =>
      _SalesTeamFilterBottomSheetState();
}

class _SalesTeamFilterBottomSheetState
    extends State<SalesTeamFilterBottomSheet> {
  late RangeValues _ageRange;
  late GenderFilter _gender;

  @override
  void initState() {
    super.initState();
    _ageRange = widget.initialFilter.ageRange;
    _gender = widget.initialFilter.gender;
  }

  void _resetFilters() {
    setState(() {
      _ageRange = const RangeValues(18, 65);
      _gender = GenderFilter.all;
    });
  }

  void _applyFilters() {
    widget.onApply(SalesTeamFilterState(
      ageRange: _ageRange,
      gender: _gender,
    ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
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
          onPressed: () => Navigator.pop(context),
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
            onChanged: (values) {
              setState(() {
                _ageRange = values;
              });
            },
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
            _buildGenderChip(AppStrings.all, GenderFilter.all),
            const SizedBox(width: SizeApp.s8),
            _buildGenderChip(AppStrings.male, GenderFilter.male),
            const SizedBox(width: SizeApp.s8),
            _buildGenderChip(AppStrings.female, GenderFilter.female),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderChip(String label, GenderFilter value) {
    final isSelected = _gender == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _gender = value;
        });
      },
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
            color: isSelected ? Colors.white : AppColors.textDarkGray,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: _resetFilters,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: PaddingApp.p14),
              side: BorderSide(color: AppColors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
              ),
            ),
            child: Text(
              AppStrings.resetAll,
              style: AppTextStyles.semiBold(
                fontSize: AppFontSize.s16,
                color: AppColors.primary,
              ),
            ),
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
