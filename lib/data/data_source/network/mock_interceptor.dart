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

// Mock data for Jewelry catalog
// Following DATA_MODEL.md: id, name, category, price, image_url
final List<Map<String, dynamic>> mockJewelryCatalog = [
  // SJC Gold
  {'id': 'jewelry-001', 'name': 'SJC Gold Bar 1 Tael', 'category': 'SJC Gold', 'price': 72000000, 'image_url': 'https://images.unsplash.com/photo-1610375461246-83df859d849d'},
  {'id': 'jewelry-002', 'name': 'SJC Gold Bar 5 Chi', 'category': 'SJC Gold', 'price': 36000000, 'image_url': 'https://images.unsplash.com/photo-1589656966895-2f33e7653819'},
  {'id': 'jewelry-003', 'name': 'SJC Gold Bar 2 Chi', 'category': 'SJC Gold', 'price': 14500000, 'image_url': 'https://images.unsplash.com/photo-1624365168968-f283d506c6b6'},
  // 24K Gold
  {'id': 'jewelry-004', 'name': '24K Plain Gold Ring', 'category': '24K Gold', 'price': 15000000, 'image_url': 'https://images.unsplash.com/photo-1605100804763-247f67b3557e'},
  {'id': 'jewelry-005', 'name': '24K Gold Necklace', 'category': '24K Gold', 'price': 45000000, 'image_url': 'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f'},
  {'id': 'jewelry-006', 'name': '24K Gold Bracelet', 'category': '24K Gold', 'price': 28000000, 'image_url': 'https://images.unsplash.com/photo-1611591437281-460bfbe1220a'},
  // 18K Gold
  {'id': 'jewelry-007', 'name': '18K Wedding Ring', 'category': '18K Gold', 'price': 8500000, 'image_url': 'https://images.unsplash.com/photo-1603561591411-07134e71a2a9'},
  {'id': 'jewelry-008', 'name': '18K Gold Earrings', 'category': '18K Gold', 'price': 12000000, 'image_url': 'https://images.unsplash.com/photo-1535632066927-ab7c9ab60908'},
  {'id': 'jewelry-009', 'name': '18K Gold Pendant', 'category': '18K Gold', 'price': 6500000, 'image_url': 'https://images.unsplash.com/photo-1602751584552-8ba73aad10e1'},
  // 14K Gold
  {'id': 'jewelry-010', 'name': '14K Gold Chain', 'category': '14K Gold', 'price': 5200000, 'image_url': 'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338'},
  {'id': 'jewelry-011', 'name': '14K Gold Anklet', 'category': '14K Gold', 'price': 3800000, 'image_url': 'https://images.unsplash.com/photo-1573408301185-9146fe634ad0'},
  // White Gold
  {'id': 'jewelry-012', 'name': 'White Gold Diamond Ring', 'category': 'White Gold', 'price': 25000000, 'image_url': 'https://images.unsplash.com/photo-1608042314453-ae338d80c427'},
  {'id': 'jewelry-013', 'name': 'White Gold Pearl Earrings', 'category': 'White Gold', 'price': 18000000, 'image_url': 'https://images.unsplash.com/photo-1630019852942-f89202989a59'},
  // Gemstone
  {'id': 'jewelry-014', 'name': 'Ruby Pendant Necklace', 'category': 'Gemstone', 'price': 85000000, 'image_url': 'https://images.unsplash.com/photo-1599459183200-59c3a0e770e5'},
  {'id': 'jewelry-015', 'name': 'Emerald Tennis Bracelet', 'category': 'Gemstone', 'price': 65000000, 'image_url': 'https://images.unsplash.com/photo-1611085583191-a3b181a88401'},
];

// In-memory store for POST /sell-transactions
final List<Map<String, dynamic>> mockSellTransactions = [];

class MockInterceptor extends Interceptor {
  MockInterceptor(this._connectionChecker);

  final InternetConnection _connectionChecker;

  static const String _pathSalesTeam = NetworkUrls.salesTeam;
  static const String _pathJewelry = NetworkUrls.jewelry;
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
    switch (options.path) {
      case _pathSalesTeam:
        return _handleSalesTeamRequest(options);
      case _pathJewelry:
        return _mockResponse(options, {
          'data': mockJewelryCatalog,
          'total': mockJewelryCatalog.length,
        });
      default:
        return null;
    }
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
