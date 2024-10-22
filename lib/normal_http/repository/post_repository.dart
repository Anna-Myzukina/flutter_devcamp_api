import '../api/post_service.dart';
import '../model/post_model.dart';

class PostNormalRepository {
  final PostService postService;

  PostNormalRepository(this.postService);

  Future<List<PostModel>> fetchPosts() => postService.fetchPosts();

  Future<PostModel> createPost(PostModel post) => postService.createPost(post);

  Future<PostModel> updatePost(int id, PostModel post) =>
      postService.updatePost(id, post);

  Future<void> deletePost(int id) => postService.deletePost(id);
}
