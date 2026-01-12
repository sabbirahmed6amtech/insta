import 'package:flutter/material.dart';
import '../model/story_model.dart';
import '../../../util/dimensions.dart';
import '../../../theme/llight_theme.dart';

class StoriesSection extends StatelessWidget {
  final List<StoryModel> stories;

  const StoriesSection({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.storyCircleSize + 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize8,
          vertical: Dimensions.paddingSize8,
        ),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return _StoryItem(story: stories[index]);
        },
      ),
    );
  }
}

class _StoryItem extends StatelessWidget {
  final StoryModel story;

  const _StoryItem({required this.story});

  @override
  Widget build(BuildContext context) {
    final isYourStory = story.username == 'Your Story';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: Dimensions.storyCircleSize,
                height: Dimensions.storyCircleSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: story.isSeen
                      ? null
                      : LinearGradient(
                          colors: [
                            Theme.of(
                              context,
                            ).extension<InstaColors>()!.gradientPurple,
                            Theme.of(
                              context,
                            ).extension<InstaColors>()!.gradientOrange,
                            Theme.of(
                              context,
                            ).extension<InstaColors>()!.gradientYellow,
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                  border: story.isSeen
                      ? Border.all(
                          color: Theme.of(context).colorScheme.outline,
                          width: 2,
                        )
                      : null,
                ),
                padding: const EdgeInsets.all(3),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  padding: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(story.profileImage),
                  ),
                ),
              ),
              if (story.isLive)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSize8,
                      vertical: Dimensions.paddingSize5,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                      border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      'LIVE',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: Dimensions.fontSize10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              if (isYourStory)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.onSecondary,
                      size: Dimensions.iconSize16,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: Dimensions.paddingSize5),
          SizedBox(
            width: Dimensions.storyCircleSize,
            child: Text(
              story.username,
              style: TextStyle(
                fontSize: Dimensions.fontSize12,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
