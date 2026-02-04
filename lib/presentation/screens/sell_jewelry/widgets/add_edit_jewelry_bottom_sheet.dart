import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/strings/app_strings.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';
import '../../../../domain/entities/buy_jewelry/jewelry_category_enum_entity.dart';
import '../../../../domain/entities/sell_jewelry/sell_jewelry_entity.dart';
import '../../../custom_widgets/button/custom_filled_button.dart';

class AddEditJewelryBottomSheet extends StatefulWidget {
  final SellJewelryEntity? jewelry;
  final Function(SellJewelryEntity) onSave;

  const AddEditJewelryBottomSheet({
    super.key,
    this.jewelry,
    required this.onSave,
  });

  static Future<void> show(
    BuildContext context, {
    SellJewelryEntity? jewelry,
    required Function(SellJewelryEntity) onSave,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddEditJewelryBottomSheet(
        jewelry: jewelry,
        onSave: onSave,
      ),
    );
  }

  @override
  State<AddEditJewelryBottomSheet> createState() =>
      _AddEditJewelryBottomSheetState();
}

class _AddEditJewelryBottomSheetState extends State<AddEditJewelryBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _priceController;
  late final TextEditingController _stockController;
  late final TextEditingController _weightController;
  late final TextEditingController _sizeController;
  late final TextEditingController _materialController;
  late final TextEditingController _imageUrlController;
  late JewelryCategoryEnumEntity _selectedCategory;

  bool get isEditing => widget.jewelry != null;

  @override
  void initState() {
    super.initState();
    final jewelry = widget.jewelry;
    _nameController = TextEditingController(text: jewelry?.name ?? '');
    _priceController = TextEditingController(
      text: jewelry?.price.toStringAsFixed(0) ?? '',
    );
    _stockController = TextEditingController(
      text: jewelry?.stock.toString() ?? '1',
    );
    _weightController = TextEditingController(text: jewelry?.weight ?? '');
    _sizeController = TextEditingController(text: jewelry?.size ?? '');
    _materialController = TextEditingController(text: jewelry?.material ?? '');
    _imageUrlController = TextEditingController(text: jewelry?.imageUrl ?? '');
    _selectedCategory = jewelry?.category ?? JewelryCategoryEnumEntity.gold24k;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _weightController.dispose();
    _sizeController.dispose();
    _materialController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (!_formKey.currentState!.validate()) return;

    final entity = SellJewelryEntity(
      id: widget.jewelry?.id ?? const Uuid().v4(),
      name: _nameController.text.trim(),
      category: _selectedCategory,
      price: double.parse(_priceController.text.replaceAll(',', '')),
      imageUrl: _imageUrlController.text.trim().isEmpty
          ? null
          : _imageUrlController.text.trim(),
      stock: int.parse(_stockController.text),
      quantityToSell: widget.jewelry?.quantityToSell ?? 0,
      weight: _weightController.text.trim().isEmpty
          ? null
          : _weightController.text.trim(),
      size: _sizeController.text.trim().isEmpty
          ? null
          : _sizeController.text.trim(),
      material: _materialController.text.trim().isEmpty
          ? null
          : _materialController.text.trim(),
      syncStatus: widget.jewelry?.syncStatus ?? SellJewelrySyncStatus.synced,
    );

    widget.onSave(entity);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(ScreenPaddingApp.horizontal),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNameField(),
                    const SizedBox(height: SizeApp.s16),
                    _buildCategorySelector(),
                    const SizedBox(height: SizeApp.s16),
                    Row(
                      children: [
                        Expanded(child: _buildPriceField()),
                        const SizedBox(width: SizeApp.s12),
                        Expanded(child: _buildStockField()),
                      ],
                    ),
                    const SizedBox(height: SizeApp.s16),
                    _buildMaterialField(),
                    const SizedBox(height: SizeApp.s16),
                    Row(
                      children: [
                        Expanded(child: _buildWeightField()),
                        const SizedBox(width: SizeApp.s12),
                        Expanded(child: _buildSizeField()),
                      ],
                    ),
                    const SizedBox(height: SizeApp.s16),
                    _buildImageUrlField(),
                    const SizedBox(height: SizeApp.s24),
                    _buildSaveButton(),
                    SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(ScreenPaddingApp.horizontal),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.bgLightGray, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            isEditing ? AppStrings.editJewelry : AppStrings.addNewJewelry,
            style: AppTextStyles.bold(
              fontSize: AppFontSize.s20,
              color: AppColors.textBlack,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: const EdgeInsets.all(PaddingApp.p8),
              decoration: BoxDecoration(
                color: AppColors.bgLightGray,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                size: SizeApp.s20,
                color: AppColors.textDarkGray,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(AppStrings.jewelryName, required: true),
        const SizedBox(height: SizeApp.s8),
        TextFormField(
          controller: _nameController,
          decoration: _inputDecoration(AppStrings.enterJewelryName),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return AppStrings.nameRequired;
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildCategorySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(AppStrings.category, required: true),
        const SizedBox(height: SizeApp.s8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p16),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.bgLightGray),
            borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<JewelryCategoryEnumEntity>(
              value: _selectedCategory,
              isExpanded: true,
              items: JewelryCategoryEnumEntity.values.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(
                    category.fullName,
                    style: AppTextStyles.regular(
                      fontSize: AppFontSize.s16,
                      color: AppColors.textBlack,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedCategory = value);
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(AppStrings.price, required: true),
        const SizedBox(height: SizeApp.s8),
        TextFormField(
          controller: _priceController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: _inputDecoration('0'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.priceRequired;
            }
            final price = double.tryParse(value.replaceAll(',', ''));
            if (price == null || price <= 0) {
              return AppStrings.invalidPrice;
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildStockField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(AppStrings.stock, required: true),
        const SizedBox(height: SizeApp.s8),
        TextFormField(
          controller: _stockController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: _inputDecoration('1'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.stockRequired;
            }
            final stock = int.tryParse(value);
            if (stock == null || stock <= 0) {
              return AppStrings.invalidStock;
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildWeightField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(AppStrings.weight),
        const SizedBox(height: SizeApp.s8),
        TextFormField(
          controller: _weightController,
          decoration: _inputDecoration('e.g. 10g'),
        ),
      ],
    );
  }

  Widget _buildSizeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(AppStrings.size),
        const SizedBox(height: SizeApp.s8),
        TextFormField(
          controller: _sizeController,
          decoration: _inputDecoration('e.g. 16cm'),
        ),
      ],
    );
  }

  Widget _buildMaterialField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(AppStrings.material),
        const SizedBox(height: SizeApp.s8),
        TextFormField(
          controller: _materialController,
          decoration: _inputDecoration('e.g. 24K Gold'),
        ),
      ],
    );
  }

  Widget _buildImageUrlField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(AppStrings.imageUrl),
        const SizedBox(height: SizeApp.s8),
        TextFormField(
          controller: _imageUrlController,
          decoration: _inputDecoration('https://example.com/image.jpg'),
          keyboardType: TextInputType.url,
        ),
      ],
    );
  }

  Widget _buildLabel(String text, {bool required = false}) {
    return RichText(
      text: TextSpan(
        text: text,
        style: AppTextStyles.medium(
          fontSize: AppFontSize.s14,
          color: AppColors.textDarkGray,
        ),
        children: required
            ? [
                TextSpan(
                  text: ' *',
                  style: AppTextStyles.medium(
                    fontSize: AppFontSize.s14,
                    color: AppColors.error,
                  ),
                ),
              ]
            : null,
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: AppTextStyles.regular(
        fontSize: AppFontSize.s16,
        color: AppColors.textGray,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: PaddingApp.p16,
        vertical: PaddingApp.p14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
        borderSide: BorderSide(color: AppColors.bgLightGray),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
        borderSide: BorderSide(color: AppColors.bgLightGray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
        borderSide: BorderSide(color: AppColors.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
        borderSide: BorderSide(color: AppColors.error),
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: CustomFilledButton(
        label: isEditing ? AppStrings.saveChanges : AppStrings.addJewelry,
        onPressed: _handleSave,
      ),
    );
  }
}
