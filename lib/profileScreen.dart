import 'package:flutter/material.dart';

import 'constants.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isNotificationOn = true;
    bool isCollapsed = false;
    var top = 0.0;
    return Scaffold(
      backgroundColor: kPrimaryBgColor,
      body: CustomScrollView(
        // shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            stretch: true,
            centerTitle: false,
            expandedHeight: kDefaultMargin * 14,
            collapsedHeight: kDefaultMargin * 6,
            leading: ActionIcon(icon: Icons.arrow_back),
            leadingWidth: kDefaultMargin,
            actions: [
              ActionIcon(icon: Icons.videocam),
              ActionIcon(icon: Icons.call),
              ActionIcon(icon: Icons.more_vert),
            ],
            flexibleSpace: Stack(
              clipBehavior: Clip.none,
              children: [
                LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  // print('constraints=' +
                  //     constraints.toString() +
                  //     'top: $top ; $isCollapsed');
                  top < kDefaultMargin * 10
                      ? isCollapsed = true
                      : isCollapsed = false;
                  return FlexibleSpaceBar(
                    titlePadding:
                        EdgeInsets.symmetric(horizontal: kDefaultMargin),
                    title: Container(
                      // margin: EdgeInsets.symmetric(vertical: kDefaultMargin2),
                      // color: Colors.blue.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Visibility(
                            visible: isCollapsed,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: kDefaultMargin2 * 2,
                                backgroundImage: NetworkImage(dummyUserPic),
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dummyName,
                                style: kTitleTextStyle,
                              ),
                              Text(
                                '  last seen at ' + dummyLastSeen,
                                style:
                                    kSubtitleTextStyle.copyWith(fontSize: 10),
                              ),
                              SizedBox(height: kDefaultMargin),
                            ],
                          ),
                        ],
                      ),
                    ),
                    background: Visibility(
                      visible: !isCollapsed,
                      child: Image.network(
                        dummyUserPic,
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.darken,
                      ),
                    ),
                  );
                }),
                Positioned(
                  right: kDefaultMargin,
                  bottom: -(kDefaultMargin2 * 2),
                  child: CircleAvatar(
                    radius: kDefaultMargin2 * 2,
                    backgroundColor: kButtonBlueColor,
                    child: Icon(
                      Icons.chat_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Divider(height: 2),
                Container(
                  // height: kDefaultMargin * 30,
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultMargin, vertical: kDefaultMargin2),
                  color: kAccentColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoBlock(
                        headerWidget: Text(
                          'Info',
                          style: kHeaderTextStyle.copyWith(
                            color: kButtonBlueColor,
                          ),
                        ),
                        titleText: dummyPhone,
                        subtitleText: 'Mobile',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: kDefaultMargin2 / 2,
                        ),
                        child: Divider(
                          color: kPrimaryBgColor,
                          thickness: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InfoBlock(
                            titleText: 'Notifications',
                            subtitleText: 'On', //TODO: Toggle reactive text
                          ),
                          VerticalDivider(color: kPrimaryBgColor),
                          Switch(
                            value: isNotificationOn,
                            activeColor: kButtonBlueColor,
                            onChanged: (val) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 400),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActionIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const ActionIcon({
    Key? key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

class InfoBlock extends StatelessWidget {
  final Widget? headerWidget;
  final String titleText;
  final String subtitleText;

  const InfoBlock({
    this.headerWidget,
    required this.titleText,
    required this.subtitleText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerWidget ?? Container(), //TODO: Remove null dependecy
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultMargin2 / 2),
          child: Text(
            titleText,
            style: kTitleTextStyle,
          ),
        ),
        Text(
          subtitleText,
          style: kSubtitleTextStyle,
        ),
      ],
    );
  }
}
