import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilicis/Data/Repositories/Post_repository.dart';
import 'package:mobilicis/Logic/Cubits/Search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit() : super(SearchInitialState());

  PostRepository postRepository = PostRepository();

  void fetchSearches(String enteredSearch) async {
    emit(SearchLoadingState());
    try {
      Map<String, List<dynamic>> searches =
      await postRepository.searchDevices(enteredSearch);
      emit(SearchLoadedState(searches));
    } catch (ex) {
      emit(
        SearchErrorState(ex.toString()),
      );
    }
  }
}