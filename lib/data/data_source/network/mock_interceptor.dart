import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'endpoints/network_urls.dart';
import 'exceptions/base_exception.dart';

// Mock data for To-Call (sales team)
// Following DATA_MODEL.md: id, name, gender, age, title, phone_number, description, image_url
// Title uses enum values: salesManager, salesSpecialist, seniorSalesRep, salesTeamLead, salesRep
final List<Map<String, dynamic>> mockSalesTeam = [
  {
    'id': 1,
    'name': 'Nguyen Thi Mai',
    'gender': 'female',
    'age': 35,
    'title': 'salesManager',
    'phone_number': '+84912345678',
    'description': 'Over 10 years of experience in luxury jewelry sales. Expert in diamond certification and customer relationship management.',
    'image_url': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
  },
  {
    'id': 2,
    'name': 'Tran Van Minh',
    'gender': 'male',
    'age': 41,
    'title': 'salesTeamLead',
    'phone_number': '+84987654321',
    'description': 'Specializes in high-value gold transactions and VIP client services. Fluent in English and Mandarin.',
    'image_url': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
  },
  {
    'id': 3,
    'name': 'Le Hoang Anh',
    'gender': 'female',
    'age': 29,
    'title': 'salesSpecialist',
    'phone_number': '+84911223344',
    'description': 'Expert in contemporary jewelry designs and custom creations. Passionate about helping clients find their perfect piece.',
    'image_url': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80',
  },
  {
    'id': 4,
    'name': 'Pham Duc Long',
    'gender': 'male',
    'age': 45,
    'title': 'seniorSalesRep',
    'phone_number': '+84999887766',
    'description': 'Vintage jewelry connoisseur with deep knowledge of antique pieces and estate jewelry valuations.',
    'image_url': 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e',
  },
  {
    'id': 5,
    'name': 'Vo Ngoc Lan',
    'gender': 'female',
    'age': 32,
    'title': 'salesSpecialist',
    'phone_number': '+84955667788',
    'description': 'Pearl and gemstone expert. Certified gemologist with extensive knowledge of colored stones.',
    'image_url': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
  },
  {
    'id': 6,
    'name': 'Hoang Quoc Bao',
    'gender': 'male',
    'age': 38,
    'title': 'salesRep',
    'phone_number': '+84944332211',
    'description': 'Wedding and engagement ring specialist. Dedicated to making special moments even more memorable.',
    'image_url': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
  },
  {
    'id': 7,
    'name': 'Nguyen Thanh Thao',
    'gender': 'female',
    'age': 27,
    'title': 'salesRep',
    'phone_number': '+84933445566',
    'description': 'Fashion jewelry consultant bringing the latest trends to your collection. Social media savvy.',
    'image_url': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
  },
  {
    'id': 8,
    'name': 'Do Manh Hung',
    'gender': 'male',
    'age': 52,
    'title': 'seniorSalesRep',
    'phone_number': '+84922334455',
    'description': 'Investment grade jewelry advisor with expertise in gold bars and bullion. Trusted by collectors.',
    'image_url': 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d',
  },
  {
    'id': 9,
    'name': 'Bui Phuong Linh',
    'gender': 'female',
    'age': 24,
    'title': 'salesRep',
    'phone_number': '+84911556677',
    'description': 'Custom design consultant. Creative and detail-oriented, turning jewelry dreams into reality.',
    'image_url': 'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04',
  },
  {
    'id': 10,
    'name': 'Ly Quang Vinh',
    'gender': 'male',
    'age': 48,
    'title': 'salesManager',
    'phone_number': '+84900112233',
    'description': 'Luxury watch and jewelry specialist. Over 20 years in the premium market segment.',
    'image_url': 'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7',
  },
  {
    'id': 11,
    'name': 'Dang Thu Ha',
    'gender': 'female',
    'age': 31,
    'title': 'salesSpecialist',
    'phone_number': '+84977889900',
    'description': 'Bridal jewelry specialist. Creating perfect looks for your special day with attention to every detail.',
    'image_url': 'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f',
  },
  {
    'id': 12,
    'name': 'Truong Hoai Nam',
    'gender': 'male',
    'age': 55,
    'title': 'salesTeamLead',
    'phone_number': '+84966778899',
    'description': 'Colored gemstone expert specializing in rare and exotic stones from around the world.',
    'image_url': 'https://images.unsplash.com/photo-1463453091185-61582044d556',
  },
];

// Mock data for Jewelry catalog with detailed information
final List<Map<String, dynamic>> mockJewelryCatalog = [
  // SJC Gold
  {
    'id': 1,
    'name': 'SJC Gold Bar 1 Tael',
    'category': 'goldSjc',
    'price': 192000000,
    'original_price': 200000000,
    'image_url': 'https://images.unsplash.com/photo-1610375461246-83df859d849d',
    'weight': '37.5g',
    'size': '50x28mm',
    'material': 'SJC 99.99%',
    'stock': 15,
    'rating': 4.9,
    'review_count': 256,
    'description': 'Premium SJC gold bar with 99.99% purity. Internationally recognized and certified by the State Bank of Vietnam. Perfect for investment and gifting.',
    'features': ['Certified 99.99% pure gold', 'Official SJC hologram', 'Lifetime buyback guarantee', 'Comes with certificate', 'Secure packaging'],
    'is_certified': true,
  },
  {
    'id': 2,
    'name': 'SJC Gold Bar 5 Chi',
    'category': 'goldSjc',
    'price': 96000000,
    'original_price': null,
    'image_url': 'https://plus.unsplash.com/premium_photo-1678495324281-b6e39deea8cc?q=80&w=677&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'weight': '18.75g',
    'size': '35x20mm',
    'material': 'SJC 99.99%',
    'stock': 25,
    'rating': 4.8,
    'review_count': 189,
    'description': 'Mid-sized SJC gold bar perfect for both investment and gifting purposes. Features authentic SJC branding and certification.',
    'features': ['Certified 99.99% pure gold', 'Official SJC hologram', 'Lifetime buyback guarantee', 'Perfect gift size'],
    'is_certified': true,
  },
  {
    'id': 3,
    'name': 'SJC Gold Bar 2 Chi',
    'category': 'goldSjc',
    'price': 39500000,
    'original_price': 40000000,
    'image_url': 'https://images.unsplash.com/photo-1745341664947-dd3715684cca?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'weight': '7.5g',
    'size': '25x15mm',
    'material': 'SJC 99.99%',
    'stock': 50,
    'rating': 4.7,
    'review_count': 312,
    'description': 'Compact SJC gold bar ideal for first-time investors. Small but carries the same quality and certification as larger bars.',
    'features': ['Certified 99.99% pure gold', 'Official SJC hologram', 'Affordable investment option', 'Easy to store'],
    'is_certified': true,
  },
  // 24K Gold
  {
    'id': 4,
    'name': '24K Plain Gold Ring',
    'category': 'gold24k',
    'price': 15000000,
    'original_price': 18000000,
    'image_url': 'https://images.unsplash.com/photo-1605100804763-247f67b3557e',
    'weight': '5.2g',
    'size': 'Size 7',
    'material': '24K Gold',
    'stock': 8,
    'rating': 4.6,
    'review_count': 94,
    'description': 'Classic 24K pure gold ring with timeless design. Handcrafted by master jewelers with attention to every detail.',
    'features': ['Pure 24K gold', 'Handcrafted design', 'Free resizing within 30 days', 'Complimentary gift box', 'Secure shipping'],
    'is_certified': true,
  },
  {
    'id': 5,
    'name': '24K Gold Necklace',
    'category': 'gold24k',
    'price': 45000000,
    'original_price': 52000000,
    'image_url': 'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f',
    'weight': '15.8g',
    'size': '45cm',
    'material': '24K Gold',
    'stock': 5,
    'rating': 4.9,
    'review_count': 67,
    'description': 'Elegant 24K gold necklace featuring intricate Vietnamese-inspired patterns. A statement piece for special occasions.',
    'features': ['Pure 24K gold', 'Traditional Vietnamese design', 'Lifetime warranty', 'Complimentary gift packaging', 'Insured shipping'],
    'is_certified': true,
  },
  {
    'id': 6,
    'name': '24K Gold Bracelet',
    'category': 'gold24k',
    'price': 28000000,
    'original_price': null,
    'image_url': 'https://images.unsplash.com/photo-1611591437281-460bfbe1220a',
    'weight': '9.5g',
    'size': '18cm',
    'material': '24K Gold',
    'stock': 12,
    'rating': 4.7,
    'review_count': 128,
    'description': 'Sophisticated 24K gold bracelet with modern chain design. Perfect balance of elegance and durability.',
    'features': ['Pure 24K gold', 'Modern design', 'Adjustable clasp', 'Gift box included', 'Secure shipping'],
    'is_certified': true,
  },
  // 18K Gold
  {
    'id': 7,
    'name': 'Classic Solitaire Ring',
    'category': 'gold18k',
    'price': 8500000,
    'original_price': 10500000,
    'image_url': 'https://images.unsplash.com/photo-1603561591411-07134e71a2a9',
    'weight': '3.2g',
    'size': '2mm band',
    'material': '18K Gold',
    'stock': 5,
    'rating': 4.8,
    'review_count': 128,
    'description': 'Timeless elegance meets modern craftsmanship in this stunning solitaire ring featuring a brilliant-cut diamond set in luxurious 18K gold.',
    'features': ['Certified authentic precious metal', 'Lifetime warranty included', 'Complimentary gift packaging', 'Free resizing within 30 days', 'Secure & insured shipping'],
    'is_certified': true,
  },
  {
    'id': 8,
    'name': '18K Gold Earrings',
    'category': 'gold18k',
    'price': 12000000,
    'original_price': 14500000,
    'image_url': 'https://images.unsplash.com/photo-1535632066927-ab7c9ab60908',
    'weight': '4.8g',
    'size': '15mm drop',
    'material': '18K Gold',
    'stock': 10,
    'rating': 4.6,
    'review_count': 156,
    'description': 'Stunning 18K gold drop earrings that add elegance to any outfit. Features secure butterfly backs for comfortable all-day wear.',
    'features': ['18K solid gold', 'Hypoallergenic', 'Secure butterfly backs', 'Gift box included', 'Free shipping'],
    'is_certified': true,
  },
  {
    'id': 9,
    'name': '18K Gold Pendant',
    'category': 'gold18k',
    'price': 6500000,
    'original_price': null,
    'image_url': 'https://images.unsplash.com/photo-1602751584552-8ba73aad10e1',
    'weight': '2.8g',
    'size': '20x15mm',
    'material': '18K Gold',
    'stock': 18,
    'rating': 4.5,
    'review_count': 89,
    'description': 'Delicate 18K gold pendant with minimalist design. Perfect for layering or wearing alone for a subtle statement.',
    'features': ['18K solid gold', 'Minimalist design', 'Chain sold separately', 'Gift packaging available'],
    'is_certified': false,
  },
  // 14K Gold
  {
    'id': 10,
    'name': '14K Gold Chain',
    'category': 'gold14k',
    'price': 5200000,
    'original_price': 6000000,
    'image_url': 'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338',
    'weight': '4.2g',
    'size': '50cm',
    'material': '14K Gold',
    'stock': 22,
    'rating': 4.4,
    'review_count': 203,
    'description': 'Versatile 14K gold chain suitable for pendants or worn alone. Features a durable lobster clasp closure.',
    'features': ['14K solid gold', 'Durable construction', 'Lobster clasp', 'Various lengths available', 'Free shipping'],
    'is_certified': false,
  },
  {
    'id': 11,
    'name': '14K Gold Anklet',
    'category': 'gold14k',
    'price': 3800000,
    'original_price': null,
    'image_url': 'https://images.unsplash.com/photo-1573408301185-9146fe634ad0',
    'weight': '2.5g',
    'size': '23cm',
    'material': '14K Gold',
    'stock': 15,
    'rating': 4.3,
    'review_count': 76,
    'description': 'Dainty 14K gold anklet perfect for summer or beach days. Lightweight and comfortable for everyday wear.',
    'features': ['14K solid gold', 'Adjustable length', 'Water-resistant', 'Delicate design'],
    'is_certified': false,
  },
  // White Gold
  {
    'id': 12,
    'name': 'White Gold Diamond Ring',
    'category': 'goldWhite',
    'price': 25000000,
    'original_price': 30000000,
    'image_url': 'https://images.unsplash.com/photo-1608042314453-ae338d80c427',
    'weight': '4.5g',
    'size': 'Size 6',
    'material': '18K White Gold',
    'stock': 3,
    'rating': 4.9,
    'review_count': 145,
    'description': 'Exquisite white gold ring featuring a certified diamond center stone. Perfect for engagements or special celebrations.',
    'features': ['18K white gold', 'Certified diamond', 'GIA certificate included', 'Free resizing', 'Insured delivery'],
    'is_certified': true,
  },
  {
    'id': 13,
    'name': 'White Gold Pearl Earrings',
    'category': 'goldWhite',
    'price': 18000000,
    'original_price': 21000000,
    'image_url': 'https://images.unsplash.com/photo-1630019852942-f89202989a59',
    'weight': '5.2g',
    'size': '8mm pearls',
    'material': '18K White Gold',
    'stock': 7,
    'rating': 4.7,
    'review_count': 98,
    'description': 'Classic white gold earrings featuring lustrous Akoya pearls. Timeless elegance for any occasion.',
    'features': ['18K white gold', 'AAA grade Akoya pearls', 'Secure post backs', 'Gift box included', 'Certificate of authenticity'],
    'is_certified': true,
  },
  // Gemstone
  {
    'id': 14,
    'name': 'Ruby Pendant Necklace',
    'category': 'gemstone',
    'price': 85000000,
    'original_price': 95000000,
    'image_url': 'https://images.unsplash.com/photo-1741886422087-204620c77a85?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'weight': '8.5g',
    'size': '2.5ct ruby',
    'material': '18K Gold',
    'stock': 2,
    'rating': 5.0,
    'review_count': 34,
    'description': 'Magnificent 2.5 carat natural ruby pendant set in 18K gold. Features a vibrant pigeon blood color highly prized by collectors.',
    'features': ['Natural untreated ruby', 'Pigeon blood color', 'GRS certificate', '18K gold setting', 'Insurance included'],
    'is_certified': true,
  },
  {
    'id': 15,
    'name': 'Emerald Tennis Bracelet',
    'category': 'gemstone',
    'price': 65000000,
    'original_price': null,
    'image_url': 'https://images.unsplash.com/photo-1611085583191-a3b181a88401',
    'weight': '12.5g',
    'size': '18cm',
    'material': '18K White Gold',
    'stock': 4,
    'rating': 4.8,
    'review_count': 52,
    'description': 'Stunning emerald tennis bracelet featuring 25 Colombian emeralds set in 18K white gold. A true collector\'s piece.',
    'features': ['Colombian emeralds', '18K white gold setting', 'Double safety clasp', 'Certificate included', 'Luxury packaging'],
    'is_certified': true,
  },
];

// In-memory store for POST /sell-transactions
final List<Map<String, dynamic>> mockSellTransactions = [];

class MockInterceptor extends Interceptor {
  MockInterceptor(this._connectionChecker);

  final InternetConnection _connectionChecker;

  static const String _pathSalesTeam = NetworkUrls.salesTeam;
  static const String _pathJewelry = NetworkUrls.jewelry;
  static const String _pathSellJewelry = NetworkUrls.sellJewelry;
  static const String _pathSellTransactions = '/sell-transactions';

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final hasConnection = await _connectionChecker.hasInternetAccess;
    if (!hasConnection) {
      return handler.reject(NetworkException());
    }

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    final method = options.method.toUpperCase();
    final Response<dynamic>? response = switch (method) {
      'GET' => _handleGetRequest(options),
      'POST' => _handlePostRequest(options),
      _ => null,
    };

    if (response != null) {
      handler.resolve(response);
    } else {
      handler.next(options);
    }
  }

  Response<dynamic>? _handleGetRequest(RequestOptions options) {
    final path = options.path;

    // Handle jewelry by ID: /jewelry/{id}
    if (path.startsWith(_pathJewelry) && path != _pathJewelry) {
      final idStr = path.replaceFirst('$_pathJewelry/', '');
      final id = int.tryParse(idStr);
      if (id != null) {
        return _handleJewelryDetailRequest(options, id);
      }
    }

    switch (path) {
      case _pathSalesTeam:
        return _handleSalesTeamRequest(options);
      case _pathJewelry:
        return _handleJewelryListRequest(options);
      default:
        return null;
    }
  }

  Response<dynamic> _handleJewelryListRequest(RequestOptions options) {
    return _mockResponse(options, {
      'data': mockJewelryCatalog,
      'total': mockJewelryCatalog.length,
    });
  }

  Response<dynamic>? _handleJewelryDetailRequest(
      RequestOptions options, int id) {
    final jewelry = mockJewelryCatalog.cast<Map<String, dynamic>?>().firstWhere(
          (item) => item?['id'] == id,
          orElse: () => null,
        );

    if (jewelry == null) {
      return Response<dynamic>(
        requestOptions: options,
        statusCode: 404,
        data: {'error': 'Jewelry not found'},
      );
    }

    return _mockResponse(options, {'data': jewelry});
  }

  Response<dynamic> _handleSalesTeamRequest(RequestOptions options) {
    final queryParams = options.queryParameters;

    // Extract pagination params
    final page = int.tryParse(queryParams['page']?.toString() ?? '1') ?? 1;
    final limit = int.tryParse(queryParams['limit']?.toString() ?? '10') ?? 10;

    // Extract filter params
    final minAge = int.tryParse(queryParams['minAge']?.toString() ?? '');
    final maxAge = int.tryParse(queryParams['maxAge']?.toString() ?? '');
    final gender = queryParams['gender']?.toString();

    // Apply filters
    var filteredData = List<Map<String, dynamic>>.from(mockSalesTeam);

    // Filter by age range
    if (minAge != null) {
      filteredData = filteredData.where((item) {
        final age = item['age'] as int;
        return age >= minAge;
      }).toList();
    }

    if (maxAge != null) {
      filteredData = filteredData.where((item) {
        final age = item['age'] as int;
        return age <= maxAge;
      }).toList();
    }

    // Filter by gender
    if (gender != null && gender.isNotEmpty && gender != 'all') {
      filteredData = filteredData.where((item) {
        return item['gender'] == gender;
      }).toList();
    }

    // Calculate pagination
    final total = filteredData.length;
    final startIndex = (page - 1) * limit;
    final endIndex = startIndex + limit;
    final hasMore = endIndex < total;

    // Apply pagination
    final paginatedData = startIndex >= total
        ? <Map<String, dynamic>>[]
        : filteredData.sublist(
            startIndex,
            endIndex > total ? total : endIndex,
          );

    return _mockResponse(options, {
      'data': paginatedData,
      'total': total,
      'page': page,
      'limit': limit,
      'hasMore': hasMore,
    });
  }

  Response<dynamic>? _handlePostRequest(RequestOptions options) {
    switch (options.path) {
      case _pathSellJewelry:
        // Mock sync sell jewelry - just return success
        final body = options.data is Map<String, dynamic>
            ? Map<String, dynamic>.from(options.data as Map)
            : <String, dynamic>{};
        return _mockResponse(options, {'result': 'ok', 'synced': body});
      case _pathSellTransactions:
        final body = options.data is Map<String, dynamic>
            ? Map<String, dynamic>.from(options.data as Map)
            : <String, dynamic>{};
        mockSellTransactions.add(body);
        return _mockResponse(options, {'result': 'ok', 'saved': body});
      default:
        return null;
    }
  }

  Response<dynamic> _mockResponse(
    RequestOptions options,
    Map<String, dynamic> map,
  ) {
    return Response<dynamic>(
      requestOptions: options,
      statusCode: 200,
      data: map,
    );
  }
}
