import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../data/abilities-list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_ctrl.dart';
import '../constants/theme_colors.dart';
import 'package:reamstech_challenge/shared_widgets/item_card.dart';

class HomePage extends GetView<HomeCtrl> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        material: (context, android) => MaterialAppBarData(
          elevation: 0.0,
          centerTitle: true,
        ),
        cupertino: (context, cupertino) => CupertinoNavigationBarData(
          heroTag: 'HomePage',
          transitionBetweenRoutes: false,
        ),
        title: Text("Reams Tech"),
        backgroundColor: const Color(0xFF00A9EC),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          _FilterBar(),
          SliverToBoxAdapter(child: const SizedBox(height: 20)),
          _ItemList(),
          SliverToBoxAdapter(child: const SizedBox(height: 50)),
        ],
      ),
    );
  }
}

class _FilterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      key: Key('filterBar'),
      elevation: 0.0,
      pinned: true,
      backgroundColor: Colors.white,
      title: SizedBox(
        height: 40,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: ThemeColors.searchBar,
          splashColor: Colors.transparent,
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: <InlineSpan>[
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 7),
                  ),
                  TextSpan(
                      text: 'Search for a job ',
                      style: TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              ),
            ),
          ),
          textColor: Colors.black45,
        ),
      ),
    );
  }
}

class _ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ItemCard(
            title: "Hello",
            subtitle: "this is a test",
            imageUrl:
                "http://static.wikia.nocookie.net/dota2_gamepedia/images/0/0e/Telekinesis_icon.png",
          );
        },
        childCount: SimulatedData.abilities.length,
      ),
    );
  }
}
