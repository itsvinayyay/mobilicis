import 'package:mobilicis/Data/Models/Post_Model.dart';
import 'package:mobilicis/Data/Models/Search_Model.dart';

abstract class PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<PostModel> posts;

  PostLoadedState(this.posts);
}

class PostErrorState extends PostState {
  final String error;

  PostErrorState(this.error);
}






