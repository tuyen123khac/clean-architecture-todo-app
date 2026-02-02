import '../../../../domain/entities/sales_team/sales_person_entity.dart';

enum SalesTeamScreenStatus { initial, loading, success, error }

class SalesTeamState {
  List<SalesPersonEntity> salesTeam;
  List<SalesPersonEntity> salesTeamOriginal;
  SalesTeamScreenStatus screenStatus;

  SalesTeamState({
    required this.salesTeam,
    required this.salesTeamOriginal,
    this.screenStatus = SalesTeamScreenStatus.initial,
  });

  SalesTeamState copyWith({
    List<SalesPersonEntity>? salesTeam,
    List<SalesPersonEntity>? salesTeamOriginal,
    SalesTeamScreenStatus? screenStatus,
  }) {
    return SalesTeamState(
      salesTeam: salesTeam ?? this.salesTeam,
      salesTeamOriginal: salesTeamOriginal ?? this.salesTeamOriginal,
      screenStatus: screenStatus ?? this.screenStatus,
    );
  }
}
