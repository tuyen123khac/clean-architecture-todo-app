import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/data/data_source/network/exceptions/base_exception.dart';
import 'package:todo_app/data/data_source/network/models/paginated_res_wrapper.dart';
import 'package:todo_app/data/data_source/network/models/sales_member/sales_member_dto.dart';
import 'package:todo_app/data/data_source/network/models/sales_member/sales_title_enum_dto.dart';
import 'package:todo_app/data/data_source/network/remote_data_source.dart';
import 'package:todo_app/data/repositories/sales_member/sales_member_repository.impl.dart';
import 'package:todo_app/domain/use_cases/sales_member/get_sales_members_params.dart';

// Mock class
class MockRemoteDataSource extends Mock implements RemoteDataSource {}

void main() {
  late SalesMemberRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = SalesMemberRepositoryImpl(mockRemoteDataSource);
    print('═══════════════════════════════════════════════════════════════');
    print('🔧 Setting up: MockRemoteDataSource & SalesMemberRepositoryImpl');
  });

  tearDown(() {
    print('✅ Test completed');
    print('═══════════════════════════════════════════════════════════════\n');
  });

  group('SalesMemberRepositoryImpl', () {
    final tParams = const GetSalesMembersParams(page: 1, limit: 5);

    final tSalesMemberDtoList = [
      const SalesMemberDto(
        id: 1,
        name: 'Nguyen Thi Mai',
        gender: 'female',
        age: 35,
        title: SalesTitleEnumDto.salesManager,
        phoneNumber: '+84912345678',
        description: 'Over 10 years of experience',
        imageUrl: 'https://example.com/image.jpg',
      ),
    ];

    final tPaginatedResponse = PaginatedResWrapper<List<SalesMemberDto>>(
      data: tSalesMemberDtoList,
      total: 1,
      page: 1,
      limit: 5,
      hasMore: false,
    );

    group('getSalesMembers', () {
      test('should return PaginatedResWrapper when API call is successful', () async {
        print('📋 TEST: Successful API call');
        print('───────────────────────────────────────────────────────────────');

        // Arrange
        print('📥 Arrange: Mocking remoteDataSource.getSalesTeam()');
        when(() => mockRemoteDataSource.getSalesTeam(
              page: tParams.page,
              limit: tParams.limit,
              minAge: tParams.minAge,
              maxAge: tParams.maxAge,
              gender: tParams.gender,
            )).thenAnswer((_) async => tPaginatedResponse);

        // Act
        print('▶️  Act: Calling repository.getSalesMembers()');
        final result = await repository.getSalesMembers(tParams);

        // Assert
        print('🔍 Assert: Verifying API response');
        print('   → data.length: ${result.data.length}');
        print('   → first member: ${result.data[0].name}');
        print('   → total: ${result.total}');

        expect(result, equals(tPaginatedResponse));
        expect(result.data.length, equals(1));
        expect(result.data[0].name, equals('Nguyen Thi Mai'));

        verify(() => mockRemoteDataSource.getSalesTeam(
              page: 1,
              limit: 5,
              minAge: null,
              maxAge: null,
              gender: null,
            )).called(1);
        print('✓  API called correctly and response returned');
      });

      test('should pass filter parameters to remote data source', () async {
        print('📋 TEST: Filter parameters forwarding');
        print('───────────────────────────────────────────────────────────────');

        // Arrange
        final filteredParams = const GetSalesMembersParams(
          page: 2,
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

        when(() => mockRemoteDataSource.getSalesTeam(
              page: filteredParams.page,
              limit: filteredParams.limit,
              minAge: filteredParams.minAge,
              maxAge: filteredParams.maxAge,
              gender: filteredParams.gender,
            )).thenAnswer((_) async => tPaginatedResponse);

        // Act
        print('▶️  Act: Calling repository with filtered params');
        await repository.getSalesMembers(filteredParams);

        // Assert
        print('🔍 Assert: Verifying remoteDataSource received correct params');
        verify(() => mockRemoteDataSource.getSalesTeam(
              page: 2,
              limit: 10,
              minAge: 25,
              maxAge: 40,
              gender: 'female',
            )).called(1);
        print('✓  All filter params forwarded correctly');
      });

      test('should rethrow BaseException when API throws BaseException', () async {
        print('📋 TEST: BaseException rethrow');
        print('───────────────────────────────────────────────────────────────');

        // Arrange
        print('📥 Arrange: Mocking API to throw NetworkException');
        when(() => mockRemoteDataSource.getSalesTeam(
              page: tParams.page,
              limit: tParams.limit,
              minAge: tParams.minAge,
              maxAge: tParams.maxAge,
              gender: tParams.gender,
            )).thenThrow(NetworkException());

        // Act & Assert
        print('▶️  Act & Assert: Expecting NetworkException to be rethrown');
        expect(
          () => repository.getSalesMembers(tParams),
          throwsA(isA<NetworkException>()),
        );
        print('✓  NetworkException rethrown correctly');
      });

      test('should throw UnknownException when API throws unexpected error', () async {
        print('📋 TEST: Unknown error wrapping');
        print('───────────────────────────────────────────────────────────────');

        // Arrange
        print('📥 Arrange: Mocking API to throw generic Exception');
        when(() => mockRemoteDataSource.getSalesTeam(
              page: tParams.page,
              limit: tParams.limit,
              minAge: tParams.minAge,
              maxAge: tParams.maxAge,
              gender: tParams.gender,
            )).thenThrow(Exception('Unexpected error'));

        // Act & Assert
        print('▶️  Act & Assert: Expecting UnknownException wrapper');
        expect(
          () => repository.getSalesMembers(tParams),
          throwsA(isA<UnknownException>()),
        );
        print('✓  Generic exception wrapped in UnknownException');
      });

      test('should return paginated data with hasMore true when more data available', () async {
        print('📋 TEST: Pagination hasMore flag');
        print('───────────────────────────────────────────────────────────────');

        // Arrange
        final paginatedWithMore = PaginatedResWrapper<List<SalesMemberDto>>(
          data: tSalesMemberDtoList,
          total: 10,
          page: 1,
          limit: 5,
          hasMore: true,
        );

        print('📥 Arrange: Mocking response with hasMore=true');
        print('   → total: 10, limit: 5, hasMore: true');

        when(() => mockRemoteDataSource.getSalesTeam(
              page: tParams.page,
              limit: tParams.limit,
              minAge: tParams.minAge,
              maxAge: tParams.maxAge,
              gender: tParams.gender,
            )).thenAnswer((_) async => paginatedWithMore);

        // Act
        print('▶️  Act: Calling repository.getSalesMembers()');
        final result = await repository.getSalesMembers(tParams);

        // Assert
        print('🔍 Assert: Verifying pagination metadata');
        print('   → hasMore: ${result.hasMore}');
        print('   → total: ${result.total}');

        expect(result.hasMore, isTrue);
        expect(result.total, equals(10));
        print('✓  Pagination metadata returned correctly');
      });
    });
  });
}
