import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/data/data_source/network/models/paginated_res_wrapper.dart';
import 'package:todo_app/data/data_source/network/models/sales_member/sales_member_dto.dart';
import 'package:todo_app/data/data_source/network/models/sales_member/sales_title_enum_dto.dart';
import 'package:todo_app/domain/repositories/sales_member/sales_member_repository.dart';
import 'package:todo_app/domain/use_cases/sales_member/get_sales_members.dart';
import 'package:todo_app/domain/use_cases/sales_member/get_sales_members_params.dart';

// Mock class
class MockSalesMemberRepository extends Mock implements SalesMemberRepository {}

void main() {
  late GetSalesMembers useCase;
  late MockSalesMemberRepository mockRepository;

  setUp(() {
    mockRepository = MockSalesMemberRepository();
    useCase = GetSalesMembers(mockRepository);
    print('═══════════════════════════════════════════════════════════════');
    print('🔧 Setting up: MockSalesMemberRepository & GetSalesMembers UseCase');
  });

  tearDown(() {
    print('✅ Test completed');
    print('═══════════════════════════════════════════════════════════════\n');
  });

  group('GetSalesMembers UseCase', () {
    final tParams = const GetSalesMembersParams(page: 1, limit: 5);

    final tSalesMemberDtoList = [
      const SalesMemberDto(
        id: 1,
        name: 'John Doe',
        gender: 'male',
        age: 30,
        title: SalesTitleEnumDto.salesManager,
        phoneNumber: '+84123456789',
        description: 'Test description',
        imageUrl: 'https://example.com/image.jpg',
      ),
      const SalesMemberDto(
        id: 2,
        name: 'Jane Smith',
        gender: 'female',
        age: 28,
        title: SalesTitleEnumDto.salesSpecialist,
        phoneNumber: '+84987654321',
        description: 'Another description',
        imageUrl: 'https://example.com/image2.jpg',
      ),
    ];

    final tPaginatedResponse = PaginatedResWrapper<List<SalesMemberDto>>(
      data: tSalesMemberDtoList,
      total: 2,
      page: 1,
      limit: 5,
      hasMore: false,
    );

    test('should return GetSalesMembersResult when repository call is successful', () async {
      print('📋 TEST: Successful repository call');
      print('───────────────────────────────────────────────────────────────');

      // Arrange
      print('📥 Arrange: Mocking repository.getSalesMembers() to return 2 members');
      when(() => mockRepository.getSalesMembers(tParams))
          .thenAnswer((_) async => tPaginatedResponse);

      // Act
      print('▶️  Act: Calling useCase.call(params)');
      final result = await useCase.call(tParams);

      // Assert
      print('🔍 Assert: Verifying result data');
      print('   → Expected: 2 members, Got: ${result.data.length} members');
      print('   → First member: ${result.data[0].name}');
      print('   → Second member: ${result.data[1].name}');

      expect(result.data.length, equals(2));
      expect(result.data[0].id, equals(1));
      expect(result.data[0].name, equals('John Doe'));
      expect(result.data[1].id, equals(2));
      expect(result.data[1].name, equals('Jane Smith'));
      expect(result.total, equals(2));
      expect(result.page, equals(1));
      expect(result.limit, equals(5));
      expect(result.hasMore, equals(false));

      verify(() => mockRepository.getSalesMembers(tParams)).called(1);
      verifyNoMoreInteractions(mockRepository);
      print('✓  All assertions passed');
    });

    test('should correctly convert DTO to Entity', () async {
      print('📋 TEST: DTO to Entity conversion');
      print('───────────────────────────────────────────────────────────────');

      // Arrange
      print('📥 Arrange: Setting up mock with SalesMemberDto data');
      when(() => mockRepository.getSalesMembers(tParams))
          .thenAnswer((_) async => tPaginatedResponse);

      // Act
      print('▶️  Act: Calling useCase and checking entity conversion');
      final result = await useCase.call(tParams);

      // Assert
      final firstMember = result.data[0];
      print('🔍 Assert: Verifying DTO → Entity mapping');
      print('   → id: ${firstMember.id}');
      print('   → name: ${firstMember.name}');
      print('   → gender: ${firstMember.gender.name}');
      print('   → age: ${firstMember.age}');
      print('   → title: ${firstMember.title.name}');
      print('   → phone: ${firstMember.phone}');

      expect(firstMember.id, equals(1));
      expect(firstMember.name, equals('John Doe'));
      expect(firstMember.gender.name, equals('male'));
      expect(firstMember.age, equals(30));
      expect(firstMember.title.name, equals('salesManager'));
      expect(firstMember.phone, equals('+84123456789'));
      print('✓  All entity fields correctly mapped');
    });

    test('should return empty list when no data', () async {
      print('📋 TEST: Empty data handling');
      print('───────────────────────────────────────────────────────────────');

      // Arrange
      print('📥 Arrange: Mocking repository to return empty list');
      final emptyResponse = PaginatedResWrapper<List<SalesMemberDto>>(
        data: [],
        total: 0,
        page: 1,
        limit: 5,
        hasMore: false,
      );

      when(() => mockRepository.getSalesMembers(tParams))
          .thenAnswer((_) async => emptyResponse);

      // Act
      print('▶️  Act: Calling useCase with empty response');
      final result = await useCase.call(tParams);

      // Assert
      print('🔍 Assert: Verifying empty result');
      print('   → data.isEmpty: ${result.data.isEmpty}');
      print('   → total: ${result.total}');
      print('   → hasMore: ${result.hasMore}');

      expect(result.data, isEmpty);
      expect(result.total, equals(0));
      expect(result.hasMore, equals(false));
      print('✓  Empty list handled correctly');
    });

    test('should pass filter parameters correctly', () async {
      print('📋 TEST: Filter parameters passing');
      print('───────────────────────────────────────────────────────────────');

      // Arrange
      final filteredParams = const GetSalesMembersParams(
        page: 1,
        limit: 10,
        minAge: 25,
        maxAge: 40,
        gender: 'female',
      );

      print('📥 Arrange: Creating filtered params');
      print('   → page: ${filteredParams.page}');
      print('   → limit: ${filteredParams.limit}');
      print('   → minAge: ${filteredParams.minAge}');
      print('   → maxAge: ${filteredParams.maxAge}');
      print('   → gender: ${filteredParams.gender}');

      when(() => mockRepository.getSalesMembers(filteredParams))
          .thenAnswer((_) async => tPaginatedResponse);

      // Act
      print('▶️  Act: Calling useCase with filtered params');
      await useCase.call(filteredParams);

      // Assert
      print('🔍 Assert: Verifying repository was called with correct params');
      verify(() => mockRepository.getSalesMembers(filteredParams)).called(1);
      print('✓  Filter parameters passed correctly');
    });

    test('should propagate exception when repository throws', () async {
      print('📋 TEST: Exception propagation');
      print('───────────────────────────────────────────────────────────────');

      // Arrange
      print('📥 Arrange: Mocking repository to throw Exception');
      when(() => mockRepository.getSalesMembers(tParams))
          .thenThrow(Exception('Network error'));

      // Act & Assert
      print('▶️  Act & Assert: Expecting exception to be thrown');
      expect(
        () => useCase.call(tParams),
        throwsA(isA<Exception>()),
      );
      print('✓  Exception propagated correctly');
    });
  });
}
