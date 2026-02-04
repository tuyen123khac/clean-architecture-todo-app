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
import '../../custom_widgets/button/circular_icon_button.dart';
import '../../custom_widgets/button/custom_filled_button.dart';
import '../../custom_widgets/list/feature_check_item.dart';
import '../../custom_widgets/rating/rating_stars.dart';
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
      child: Scaffold(backgroundColor: AppColors.bgWhite, body: _buildBody()),
    );
  }

  Widget _buildBody() {
    return JewelryDetailDataSelector(
      builder: (jewelry) {
        if (jewelry == null) return const SizedBox.shrink();
        return Column(
          children: [_buildJewelryContent(jewelry), _buildBottomBar(jewelry)],
        );
      },
    );
  }

  Widget _buildJewelryContent(BuyJewelryEntity jewelry) {
    return Expanded(
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
            SliverToBoxAdapter(child: _buildPremiumMaterialCard(jewelry)),
          SliverToBoxAdapter(child: _buildDescriptionSection(jewelry)),
          if (jewelry.features.isNotEmpty)
            SliverToBoxAdapter(child: _buildFeaturesSection(jewelry)),
          const SliverToBoxAdapter(child: SizedBox(height: SizeApp.s24)),
        ],
      ),
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
    return CircularIconButton(
      icon: Icons.arrow_back,
      onTap: () => AppNavigation.back(context),
    );
  }

  Widget _buildFavoriteButton() {
    return JewelryDetailFavoriteSelector(
      builder: (isFavorite) => CircularIconButton(
        icon: isFavorite ? Icons.favorite : Icons.favorite_border,
        onTap: () => _bloc.toggleFavorite(),
        backgroundColor: isFavorite ? AppColors.favoriteLight : AppColors.bgLightGray,
        iconColor: isFavorite ? AppColors.favorite : AppColors.textGray,
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
        RatingStars(rating: jewelry.rating),
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
          color: AppColors.premiumLight,
          borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
          border: Border.all(color: AppColors.premiumBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.premiumMaterial,
              style: AppTextStyles.semiBold(
                fontSize: AppFontSize.s16,
                color: AppColors.premium,
              ),
            ),
            const SizedBox(height: SizeApp.s4),
            Text(
              '${jewelry.material ?? ""} • ${AppStrings.certifiedAuthentic}',
              style: AppTextStyles.regular(
                fontSize: AppFontSize.s14,
                color: AppColors.warning,
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
            (feature) => FeatureCheckItem(text: feature),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuyJewelryEntity jewelry) {
    return Container(
      padding: const EdgeInsets.all(ScreenPaddingApp.horizontal),
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withValues(alpha: 0.05),
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
          backgroundColor: AppColors.success,
        ),
      );
    } else if (success == false && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppStrings.purchaseFailed),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }
}
