import '../api/post_service.dart';
import '../model/post.dart';

class PostRepositoryNormal {
  final PostService postServece;

  PostRepositoryNormal(this.postServece);

  Future<List<Post>> fetchPost() => postServece.fetchPost();

  Future<Post> createPost(Post post) => postServece.createPost(post);

  Future<Post> updatePost(int id, Post post) =>
      postServece.updatePost(id, post);

  Future<void> deletePost(int id) => postServece.deletePost(id);
}
