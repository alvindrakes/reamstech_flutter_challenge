import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../data/abilities-list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_ctrl.dart';
import '../constants/theme_colors.dart';
import 'package:reamstech_challenge/shared_widgets/item_card.dart';

class HomePage extends StatelessWidget {
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
          SliverToBoxAdapter(child: const SizedBox(height: 10)),
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
    return GetBuilder<HomeCtrl>(
      init: HomeCtrl(),
      builder: (ctrl) {
        return ctrl.isLoading
            ? SliverToBoxAdapter(
                child: Center(
                child: PlatformCircularProgressIndicator(),
              ))
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ItemCard(
                      title: ctrl.itemCards[index].title,
                      subtitle: ctrl.itemCards[index].subtitle,
                      imageUrl: ctrl.itemCards[index].imageUrl,
                    );
                  },
                  childCount: SimulatedData.abilities.length,
                ),
              );
      },
    );
  }
}
