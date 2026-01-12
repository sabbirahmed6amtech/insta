import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/post_model.dart';
import '../controller/home_controller.dart';
import '../../../util/dimensions.dart';
import '../../../util/extensions.dart';
import '../../../theme/llight_theme.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PostHeader(post: post),
        _PostImages(images: post.postImages),
        _PostActions(post: post),
        _PostLikes(post: post),
        _PostCaption(post: post),
        _PostComments(post: post),
        _PostTime(post: post),
        SizedBox(height: Dimensions.paddingSize16),
      ],
    );
  }
}

class _PostHeader extends StatelessWidget {
  final PostModel post;

  const _PostHeader({required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize12,
        vertical: Dimensions.paddingSize8,
      ),
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).extension<InstaColors>()!.gradientPurple,
                  Theme.of(context).extension<InstaColors>()!.gradientOrange,
                ],
              ),
            ),
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              padding: const EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundImage: NetworkImage(post.userProfileImage),
              ),
            ),
          ),
          SizedBox(width: Dimensions.paddingSize10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      post.username,
                      style: TextStyle(
                        fontSize: Dimensions.fontSize14,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    if (post.isVerified) ...[
                      SizedBox(width: Dimensions.paddingSize5),
                      Icon(
                        Icons.verified,
                        size: Dimensions.iconSize16,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ],
                  ],
                ),
                if (post.location.isNotEmpty)
                  Text(
                    post.location,
                    style: TextStyle(
                      fontSize: Dimensions.fontSize12,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).iconTheme.color,
              size: Dimensions.iconSize24,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _PostImages extends StatefulWidget {
  final List<String> images;

  const _PostImages({required this.images});

  @override
  State<_PostImages> createState() => _PostImagesState();
}

class _PostImagesState extends State<_PostImages> {
  int currentPage = 0;
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SizedBox(
          height: Dimensions.postImageHeight,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Image.network(
                widget.images[index],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
        ),
        if (widget.images.length > 1)
          Positioned(
            top: Dimensions.paddingSize12,
            right: Dimensions.paddingSize12,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSize8,
                vertical: Dimensions.paddingSize5,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(Dimensions.radius12),
              ),
              child: Text(
                '${currentPage + 1}/${widget.images.length}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: Dimensions.fontSize12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        if (widget.images.length > 1)
          Positioned(
            bottom: Dimensions.paddingSize12,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.images.length,
                (index) => Container(
                  width: 6,
                  height: 6,
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSize5 / 2,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPage == index
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(
                            context,
                          ).colorScheme.onSecondary.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _PostActions extends StatelessWidget {
  final PostModel post;

  const _PostActions({required this.post});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize12,
        vertical: Dimensions.paddingSize8,
      ),
      child: Row(
        children: [
          Obx(() {
            final currentPost = controller.posts.firstWhere(
              (p) => p.id == post.id,
              orElse: () => post,
            );
            return IconButton(
              icon: Icon(
                currentPost.isLiked ? Icons.favorite : Icons.favorite_border,
                color: currentPost.isLiked
                    ? Theme.of(context).extension<InstaColors>()!.heartRed
                    : Theme.of(context).iconTheme.color,
                size: Dimensions.iconSize28,
              ),
              onPressed: () => controller.toggleLike(post.id),
            );
          }),
          IconButton(
            icon: Icon(
              Icons.mode_comment_outlined,
              color: Theme.of(context).iconTheme.color,
              size: Dimensions.iconSize28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.send_outlined,
              color: Theme.of(context).iconTheme.color,
              size: Dimensions.iconSize28,
            ),
            onPressed: () {},
          ),
          const Spacer(),
          Obx(() {
            final currentPost = controller.posts.firstWhere(
              (p) => p.id == post.id,
              orElse: () => post,
            );
            return IconButton(
              icon: Icon(
                currentPost.isSaved ? Icons.bookmark : Icons.bookmark_border,
                color: Theme.of(context).iconTheme.color,
                size: Dimensions.iconSize28,
              ),
              onPressed: () => controller.toggleSave(post.id),
            );
          }),
        ],
      ),
    );
  }
}

class _PostLikes extends StatelessWidget {
  final PostModel post;

  const _PostLikes({required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (post.likedBy.isNotEmpty)
            Row(
              children: [
                SizedBox(
                  width: 25,
                  height: 20,
                  child: Stack(
                    children: List.generate(
                      post.likedBy.length > 2 ? 2 : post.likedBy.length,
                      (index) => Positioned(
                        left: index * 15.0,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.outline,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: Dimensions.paddingSize8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: Dimensions.fontSize14,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      children: [
                        const TextSpan(text: 'Liked by '),
                        TextSpan(
                          text: post.likedBy.first,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        if (post.likedBy.length > 1)
                          TextSpan(
                            text:
                                ' and ${(post.likes - 1).toCompactFormat()} others',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          else
            Text(
              '${post.likes.toCompactFormat()} likes',
              style: TextStyle(
                fontSize: Dimensions.fontSize14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
        ],
      ),
    );
  }
}

class _PostCaption extends StatelessWidget {
  final PostModel post;

  const _PostCaption({required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize12,
        vertical: Dimensions.paddingSize5,
      ),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: Dimensions.fontSize14,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          children: [
            TextSpan(
              text: post.username,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(text: ' ${post.caption}'),
          ],
        ),
      ),
    );
  }
}

class _PostComments extends StatelessWidget {
  final PostModel post;

  const _PostComments({required this.post});

  @override
  Widget build(BuildContext context) {
    if (post.comments == 0) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize12,
        vertical: Dimensions.paddingSize5,
      ),
      child: Text(
        'View all ${post.comments} comments',
        style: TextStyle(
          fontSize: Dimensions.fontSize14,
          color: Theme.of(context).textTheme.bodySmall?.color,
        ),
      ),
    );
  }
}

class _PostTime extends StatelessWidget {
  final PostModel post;

  const _PostTime({required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize12,
        vertical: Dimensions.paddingSize5,
      ),
      child: Text(
        post.createdAt.toInstagramFormat(),
        style: TextStyle(
          fontSize: Dimensions.fontSize12,
          color: Theme.of(context).textTheme.bodySmall?.color,
        ),
      ),
    );
  }
}
