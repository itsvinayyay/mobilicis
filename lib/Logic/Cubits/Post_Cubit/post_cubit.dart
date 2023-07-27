import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilicis/Data/Models/Post_Model.dart';
import 'package:mobilicis/Data/Repositories/Post_repository.dart';
import 'package:mobilicis/Logic/Cubits/Post_Cubit/post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPosts();
  }

  PostRepository postRepository = PostRepository();

  void fetchPosts() async {
    try {
      List<PostModel> posts = await postRepository.fetchPosts();
      emit(PostLoadedState(posts));
    } catch (ex) {
      emit(
        PostErrorState(ex.toString()),
      );
    }
  }
}
