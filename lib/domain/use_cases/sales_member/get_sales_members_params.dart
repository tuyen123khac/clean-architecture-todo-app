class GetSalesMembersParams {
  final int page;
  final int limit;
  final int? minAge;
  final int? maxAge;
  final String? gender;

  const GetSalesMembersParams({
    this.page = 1,
    this.limit = 5,
    this.minAge,
    this.maxAge,
    this.gender,
  });

  GetSalesMembersParams copyWith({
    int? page,
    int? limit,
    int? minAge,
    int? maxAge,
    String? gender,
  }) {
    return GetSalesMembersParams(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      minAge: minAge ?? this.minAge,
      maxAge: maxAge ?? this.maxAge,
      gender: gender ?? this.gender,
    );
  }
}
