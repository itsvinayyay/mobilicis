abstract class SearchState{}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  Map<String, List<dynamic>> searches;

  SearchLoadedState(this.searches);
}

class SearchErrorState extends SearchState {
  final String error;

  SearchErrorState(this.error);
}

class SearchInitialState extends SearchState{}