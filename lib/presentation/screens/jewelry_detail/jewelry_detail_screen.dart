import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/resource/colors/app_colors.dart';
import '../../../application/util/number_utils.dart';
import '../../../application/resource/fonts/app_font.dart';
import '../../../application/resource/strings/app_strings.dart';
import '../../../application/resource/styles/app_text_style.dart';
import '../../../application/resource/value_manager.dart';
import '../../../data/di/service_locator.dart';
import '../../../domain/entities/buy_jewelry/buy_jewelry_entity.dart';
import '../../custom_widgets/button/custom_filled_button.dart';
import '../../navigation/app_navigation.dart';
import 'bloc/jewelry_detail_bloc.dart';
import 'bloc/jewelry_detail_bloc_selector.dart';
import 'widgets/purchase_confirmation_bottom_sheet.dart';

/// Arguments for navigating to the jewelry detail screen.
class JewelryDetailArgs {
  final BuyJewelryEntity jewelry;

  const JewelryDetailArgs({required this.jewelry});
}

class JewelryDetailScreen extends StatefulWidget {
  const JewelryDetailScreen({super.key});

  @override
  State<JewelryDetailScreen> createState() => _JewelryDetailScreenState();
}

class _JewelryDetailScreenState extends State<JewelryDetailScreen> {
  final JewelryDetailBloc _bloc = serviceLocator.get<JewelryDetailBloc>();
  bool _isInitialized = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onAppBarScroll);
  }

  void _onAppBarScroll() {
    if (!mounted) return;
    final expandedHeight = MediaQuery.of(context).size.width;
    _bloc.updateAppBarScroll(_scrollController.offset, expandedHeight);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final args =
          ModalRoute.of(context)?.settings.arguments as JewelryDetailArgs;
      _bloc.initState(args.jewelry);
      _isInitialized = true;
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onAppBarScroll);
    _scrollController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return JewelryDetailDataSelector(
      builder: (jewelry) {
        if (jewelry == null) return const SizedBox.shrink();
        return Column(
          children: [
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  JewelryDetailAppBarTitleOpacitySelector(
                    builder: (appBarTitleOpacity) =>
                        _buildSliverAppBar(jewelry, appBarTitleOpacity),
                  ),
                  SliverToBoxAdapter(child: _buildProductInfo(jewelry)),
                  SliverToBoxAdapter(child: _buildSpecsRow(jewelry)),
                  if (jewelry.isCertified)
                    SliverToBoxAdapter(
                      child: _buildPremiumMaterialCard(jewelry),
                    ),
                  SliverToBoxAdapter(child: _buildDescriptionSection(jewelry)),
                  if (jewelry.features.isNotEmpty)
                    SliverToBoxAdapter(child: _buildFeaturesSection(jewelry)),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: SizeApp.s24),
                  ),
                ],
              ),
            ),
            _buildBottomBar(jewelry),
          ],
        );
      },
    );
  }

  Widget _buildSliverAppBar(
    BuyJewelryEntity jewelry,
    double appBarTitleOpacity,
  ) {
    final expandedHeight = MediaQuery.of(context).size.width;
    return SliverAppBar(
      expandedHeight: expandedHeight,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.bgWhite,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: PaddingApp.p8),
        child: Center(child: _buildBackButton()),
      ),
      title: Opacity(
        opacity: appBarTitleOpacity,
        child: Text(
          jewelry.name,
          style: AppTextStyles.semiBold(
            fontSize: AppFontSize.s16,
            color: AppColors.textBlack,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: PaddingApp.p8),
          child: Center(child: _buildFavoriteButton()),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: _buildProductImage(jewelry),
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return GestureDetector(
      onTap: () => AppNavigation.back(context),
      child: Container(
        width: SizeApp.s44,
        height: SizeApp.s44,
        decoration: BoxDecoration(
          color: AppColors.bgLightGray,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_back,
          color: AppColors.textBlack,
          size: SizeApp.s20,
        ),
      ),
    );
  }

  Widget _buildFavoriteButton() {
    return JewelryDetailFavoriteSelector(
      builder: (isFavorite) => GestureDetector(
        onTap: () => _bloc.toggleFavorite(),
        child: Container(
          width: SizeApp.s44,
          height: SizeApp.s44,
          decoration: BoxDecoration(
            color: isFavorite ? Colors.pink.shade50 : AppColors.bgLightGray,
            shape: BoxShape.circle,
          ),
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.pink : AppColors.textGray,
            size: SizeApp.s20,
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage(BuyJewelryEntity jewelry) {
    return AspectRatio(
      aspectRatio: 1,
      child: CachedNetworkImage(
        imageUrl: jewelry.imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: AppColors.bgLightGray,
          child: const Center(child: CircularProgressIndicator()),
        ),
        errorWidget: (context, url, error) => Container(
          color: AppColors.bgLightGray,
          child: Icon(
            Icons.diamond_outlined,
            size: SizeApp.s64,
            color: AppColors.textGray,
          ),
        ),
      ),
    );
  }

  Widget _buildProductInfo(BuyJewelryEntity jewelry) {
    return Padding(
      padding: const EdgeInsets.all(ScreenPaddingApp.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            jewelry.name,
            style: AppTextStyles.bold(
              fontSize: AppFontSize.s24,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: SizeApp.s8),
          _buildRatingRow(jewelry),
          const SizedBox(height: SizeApp.s12),
          _buildPriceRow(jewelry),
        ],
      ),
    );
  }

  Widget _buildRatingRow(BuyJewelryEntity jewelry) {
    return Row(
      children: [
        ...List.generate(5, (index) {
          return Icon(
            index < jewelry.rating.floor()
                ? Icons.star
                : (index < jewelry.rating
                      ? Icons.star_half
                      : Icons.star_border),
            color: Colors.amber,
            size: SizeApp.s20,
          );
        }),
        const SizedBox(width: SizeApp.s8),
        Text(
          '(${jewelry.reviewCount} ${AppStrings.reviews})',
          style: AppTextStyles.regular(
            fontSize: AppFontSize.s14,
            color: AppColors.textGray,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow(BuyJewelryEntity jewelry) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          NumberUtils.formatPrice(jewelry.price),
          style: AppTextStyles.bold(
            fontSize: AppFontSize.s26,
            color: AppColors.primary,
          ),
        ),
        if (jewelry.hasDiscount) ...[
          const SizedBox(width: SizeApp.s12),
          Text(
            NumberUtils.formatPrice(jewelry.originalPrice!),
            style: AppTextStyles.regular(
              fontSize: AppFontSize.s18,
              color: AppColors.textGray,
            ).copyWith(decoration: TextDecoration.lineThrough),
          ),
        ],
      ],
    );
  }

  Widget _buildSpecsRow(BuyJewelryEntity jewelry) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ScreenPaddingApp.horizontal,
      ),
      child: Row(
        children: [
          if (jewelry.weight != null)
            Expanded(
              child: _buildSpecItem(
                Icons.scale_outlined,
                AppStrings.weight,
                jewelry.weight!,
              ),
            ),
          if (jewelry.size != null)
            Expanded(
              child: _buildSpecItem(
                Icons.straighten_outlined,
                AppStrings.size,
                jewelry.size!,
              ),
            ),
          if (jewelry.material != null)
            Expanded(
              child: _buildSpecItem(
                Icons.category_outlined,
                AppStrings.material,
                jewelry.material!,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSpecItem(IconData icon, String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: MarginApp.m4),
      padding: const EdgeInsets.symmetric(vertical: PaddingApp.p16),
      decoration: BoxDecoration(
        color: AppColors.bgLightGray,
        borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary, size: SizeApp.s24),
          const SizedBox(height: SizeApp.s8),
          Text(
            label,
            style: AppTextStyles.regular(
              fontSize: AppFontSize.s12,
              color: AppColors.textGray,
            ),
          ),
          const SizedBox(height: SizeApp.s4),
          Text(
            value,
            style: AppTextStyles.semiBold(
              fontSize: AppFontSize.s14,
              color: AppColors.textBlack,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumMaterialCard(BuyJewelryEntity jewelry) {
    return Padding(
      padding: const EdgeInsets.all(ScreenPaddingApp.horizontal),
      child: Container(
        padding: const EdgeInsets.all(PaddingApp.p16),
        decoration: BoxDecoration(
          color: Colors.amber.shade50,
          borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
          border: Border.all(color: Colors.amber.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.premiumMaterial,
              style: AppTextStyles.semiBold(
                fontSize: AppFontSize.s16,
                color: Colors.amber.shade800,
              ),
            ),
            const SizedBox(height: SizeApp.s4),
            Text(
              '${jewelry.material ?? ""} • ${AppStrings.certifiedAuthentic}',
              style: AppTextStyles.regular(
                fontSize: AppFontSize.s14,
                color: Colors.amber.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionSection(BuyJewelryEntity jewelry) {
    if (jewelry.description == null || jewelry.description!.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ScreenPaddingApp.horizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.description,
            style: AppTextStyles.semiBold(
              fontSize: AppFontSize.s18,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: SizeApp.s12),
          Text(
            jewelry.description!,
            style: AppTextStyles.regular(
              fontSize: AppFontSize.s14,
              color: AppColors.textDarkGray,
              lineHeight: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection(BuyJewelryEntity jewelry) {
    return Padding(
      padding: const EdgeInsets.all(ScreenPaddingApp.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.features,
            style: AppTextStyles.semiBold(
              fontSize: AppFontSize.s18,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: SizeApp.s12),
          ...jewelry.features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: PaddingApp.p8),
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.teal.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.teal,
                      size: SizeApp.s16,
                    ),
                  ),
                  const SizedBox(width: SizeApp.s12),
                  Expanded(
                    child: Text(
                      feature,
                      style: AppTextStyles.regular(
                        fontSize: AppFontSize.s14,
                        color: AppColors.textDarkGray,
                      ),
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

  Widget _buildBottomBar(BuyJewelryEntity jewelry) {
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
      child: _buildBuyButton(jewelry),
    );
  }

  Widget _buildBuyButton(BuyJewelryEntity jewelry) {
    return CustomFilledButton(
      label: '${AppStrings.buy} • ${NumberUtils.formatPrice(jewelry.price)}',
      icon: Icons.shopping_bag_outlined,
      onPressed: () => _showPurchaseBottomSheet(jewelry),
    );
  }

  void _showPurchaseBottomSheet(BuyJewelryEntity jewelry) async {
    final success = await PurchaseConfirmationBottomSheet.show(
      context,
      jewelry: jewelry,
      onPayment: (quantity) => _bloc.purchaseJewelry(quantity),
    );

    if (success == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppStrings.purchaseSuccess),
          backgroundColor: Colors.green,
        ),
      );
    } else if (success == false && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppStrings.purchaseFailed),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
