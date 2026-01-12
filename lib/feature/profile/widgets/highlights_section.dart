import 'package:flutter/material.dart';
import '../model/highlight_model.dart';
import '../../../util/dimensions.dart';

class HighlightsSection extends StatelessWidget {
  final List<HighlightModel> highlights;

  const HighlightsSection({super.key, required this.highlights});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize16,
          vertical: Dimensions.paddingSize10,
        ),
        itemCount: highlights.length,
        itemBuilder: (context, index) {
          return _HighlightItem(highlight: highlights[index]);
        },
      ),
    );
  }
}

class _HighlightItem extends StatelessWidget {
  final HighlightModel highlight;

  const _HighlightItem({required this.highlight});

  @override
  Widget build(BuildContext context) {
    final isNew = highlight.coverImage.isEmpty;

    return Padding(
      padding: EdgeInsets.only(right: Dimensions.paddingSize16),
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
                width: 1,
              ),
            ),
            child: isNew
                ? Icon(
                    Icons.add,
                    size: Dimensions.iconSize32,
                    color: Theme.of(context).colorScheme.onSurface,
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(highlight.coverImage),
                  ),
          ),
          SizedBox(height: Dimensions.paddingSize5),
          Text(
            highlight.title,
            style: TextStyle(
              fontSize: Dimensions.fontSize12,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
