import 'package:todo_app/presentation/base_bloc/base_cubit.dart';

import '../../../../domain/entities/sales_team/sales_person_entity.dart';
import 'sales_team_state.dart';

class SalesTeamBloc extends BaseCubit<SalesTeamState> {
  SalesTeamBloc()
      : super(SalesTeamState(salesTeam: [], salesTeamOriginal: []));

  void initState() {
    fetchSalesTeam();
  }

  Future<void> fetchSalesTeam() async {
    emit(state.copyWith(screenStatus: SalesTeamScreenStatus.loading));

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    final mockData = [
      SalesPersonEntity(
        name: 'Isabella Laurent',
        phone: '+1 (555) 345-6789',
        age: 35,
        description:
            'Diamond specialist with GIA certification. Dedicated to finding the perfect piece for you.',
        imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
        isFavorite: true,
      ),
      SalesPersonEntity(
        name: 'Alexander Stone',
        phone: '+1 (555) 567-8901',
        age: 41,
        description:
            'Vintage jewelry connoisseur and estate specialist. Bringing history and elegance together.',
        imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
        isFavorite: false,
      ),
      SalesPersonEntity(
        name: 'Elena Martinez',
        phone: '+1 (555) 789-0123',
        age: 29,
        description:
            'Contemporary jewelry expert specializing in modern designs and custom creations.',
        imageUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80',
        isFavorite: false,
      ),
    ];

    emit(state.copyWith(
      salesTeam: mockData,
      salesTeamOriginal: mockData,
      screenStatus: SalesTeamScreenStatus.success,
    ));
  }

  void toggleFavorite(int index) {
    final updatedList = List<SalesPersonEntity>.from(state.salesTeam);
    updatedList[index] = updatedList[index].copyWith(
      isFavorite: !updatedList[index].isFavorite,
    );
    emit(state.copyWith(salesTeam: updatedList));
  }
}
