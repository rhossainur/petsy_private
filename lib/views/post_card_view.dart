import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petpal/model/post_model.dart';
import 'package:petpal/widgets/custom_key_details_card.dart';
import 'package:petpal/widgets/custom_post_view_footer.dart';

class PostCardView extends StatefulWidget {
  final Post? post;

  const PostCardView({Key? key, this.post}) : super(key: key);

  @override
  _PostCardViewState createState() => _PostCardViewState();
}

class _PostCardViewState extends State<PostCardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: CustomPostViewFooter(
          onPressedContactDetails: () {},
          onPressedChatOwner: () {},
          contactDetailsIcon: EvaIcons.phone,
          chatOwnerIcon: EvaIcons.messageCircle,
          contactDetailsString: "Get Contact Details",
          chatOwnerString: "Chat With Owner"),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            collapsedHeight: 250,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(EvaIcons.share),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(EvaIcons.heart),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage("images/dog_post_test.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomKeyDetails(
                  breed: widget.post!.breed,
                  months: widget.post!.months,
                  color: widget.post!.color,
                  description: widget.post!.description,
                  name: widget.post!.name,
                  years: widget.post!.years,
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
