abstract class FilterState{}

class FilterLoadingState extends FilterState{}

class FilterLoadedState extends FilterState{
  final Map<String, List<dynamic>> filters;

  FilterLoadedState(this.filters);
}

class FilterErrorState extends FilterState{
  final String error;
  FilterErrorState(this.error);
}