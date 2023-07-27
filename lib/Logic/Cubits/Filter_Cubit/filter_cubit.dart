import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilicis/Data/Repositories/Post_repository.dart';
import 'package:mobilicis/Logic/Cubits/Filter_Cubit/filter_state.dart';


class FilterCubit extends Cubit<FilterState>{
  FilterCubit() : super(FilterLoadingState()){
    fetchFilters();
  }

  PostRepository postRepository = PostRepository();

  void fetchFilters() async {
    try {
      Map<String, List<dynamic>> filters = await postRepository.getFilters();
      emit(FilterLoadedState(filters));
    } catch (ex) {
      emit(
        FilterErrorState(ex.toString()),
      );
    }
  }
}