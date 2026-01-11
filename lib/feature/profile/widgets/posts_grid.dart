import 'package:flutter/material.dart';

class PostsGrid extends StatelessWidget {
  final List<String> posts;

  const PostsGrid({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              posts[index],
              fit: BoxFit.cover,
            ),
            if (index == 5)
              Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.video_library,
                  color: Colors.white,
                  size: 20,
                ),
              ),
          ],
        );
      },
    );
  }
}
