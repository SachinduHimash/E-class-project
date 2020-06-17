import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:studentapp/screens/home.dart';
import 'package:studentapp/screens/paperAccess_page.dart';
import 'package:studentapp/screens/pastPaper.dart';
import 'package:studentapp/screens/profile.dart';
import 'package:studentapp/screens/rank.dart';
import 'package:studentapp/screens/welcome_page.dart';

import 'components/chip_item.dart';
import 'components/choose_tab_item.dart';
import 'components/colors_item.dart';
import 'components/gradient_item.dart';
import 'components/heading.dart';
import 'components/radio_item.dart';
import 'data.dart';
import 'main.dart';
import 'model/badge.dart';
import 'model/choice_value.dart';
import 'package:progress_dialog/progress_dialog.dart';
class DefaultAppBarDemo extends StatefulWidget {
  @override
  State createState() {
    return _State();
  }
  static ProgressDialog pr;
  static bool load = false;
  
}

class _State extends State<DefaultAppBarDemo>
    with SingleTickerProviderStateMixin {
  static const kStyles = [
    ChoiceValue<TabStyle>(
      title: 'TabStyle.react',
      label: 'Appbar use react style',
      value: TabStyle.react,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.reactCircle',
      label: 'Appbar use reactCircle style',
      value: TabStyle.reactCircle,
    ),
    ChoiceValue<TabStyle>(
      title: kIsWeb
          ? 'TabStyle.flip (Flutter Web is not supported)'
          : 'TabStyle.flip',
      label: 'Appbar use flip style',
      value: TabStyle.flip,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.textIn',
      label: 'Appbar use textIn style',
      value: TabStyle.textIn,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.titled',
      label: 'Appbar use titled style',
      value: TabStyle.titled,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.fixed',
      label: 'Appbar use fixed style',
      value: TabStyle.fixed,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.fixedCircle',
      label: 'Appbar use fixedCircle style',
      value: TabStyle.fixedCircle,
    ),
  ];

  static final kTabTypes = [
    ChoiceValue<List<TabItem>>(
      title: 'Icon Tab',
      label: 'Appbar use icon with Tab',
      value: Data.items(image: false),
    ),
    ChoiceValue<List<TabItem>>(
      title: 'Image Tab',
      label: 'Appbar use image with Tab',
      value: Data.items(image: true),
    ),
  ];
  var _tabItems = kTabTypes.first;

  ChoiceValue<TabStyle> _style = kStyles.first;
  ChoiceValue<Curve> _curve = Data.curves.first;
  Color _barColor = Colors.blue[900];
  Gradient _gradient = Data.gradients.first;
  Badge _badge;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabItems.value.length, vsync: this);
  }

  List<Widget> navItems= [Home(),PaperAccessPage(),Home(),PaperAccessPage(),Home()];

  @override
  Widget build(BuildContext context) {
    var options = <Widget>[
      const Heading('Appbar Color'),
      ColorsItem(Data.namedColors, _barColor, _onBarColorChanged),
      const Heading('Background Gradient'),
      GradientItem(Data.gradients, _gradient, _onGradientChanged),
      const Heading('Badge Chip'),
      ChipItem(Data.badges, _badge, _onBadgeChanged),
      const Heading('Tab Type'),
      ChooseTabItem(kTabTypes, _tabItems, _onTabItemTypeChanged),
      const Heading('Tab Style'),
    ];
    options.addAll(kStyles.map((s) => RadioItem<TabStyle>(s, _style,
        s.value == TabStyle.flip && kIsWeb ? null : _onStyleChanged)));
    if (_style.value != TabStyle.fixed &&
        _style.value != TabStyle.fixedCircle) {
      options.add(const Heading('Animation Curve'));
      options.addAll(
          Data.curves.map((c) => RadioItem<Curve>(c, _curve, _onCurveChanged)));
    }
    DefaultAppBarDemo.pr = new ProgressDialog(context,isDismissible: false,);
    DefaultAppBarDemo.pr.style(message: "Please wait...");
    
    return WillPopScope(
      onWillPop:  () async => false,
          child: Scaffold(
        body: TabBarView(
         
            controller: _tabController,
            dragStartBehavior: DragStartBehavior.start,
            children: _tabItems.value
                .map((i) => i.title == 'Home' || i.title == 'Happy'
                    ? Home(): i.title == 'Paper' ? PaperAccessPage(): i.title == 'Rank' ?Rank():i.title == 'Profile' ? Profile() :PastPaper())
                    // : ( i.title == 'Paper' ?  PaperAccessPage() : ( i.title == 'Profile' ?  Profile() : (i.title == 'Rank' ?  Rank() : PastPaper())))
                    // )
                .toList(growable: false)),
        bottomNavigationBar: _badge == null
            ? ConvexAppBar(
                items: _tabItems.value,
                style: _style.value,
                curve: _curve.value,
                backgroundColor: _barColor,
                gradient: _gradient,
                controller: _tabController,
                onTap: (int i) => {debugPrint('select index=$i'), if((i == 3 && !PastPaper.val) || (i==2 && Rank.ranks.isEmpty)) {DefaultAppBarDemo.pr.show(),DefaultAppBarDemo.load = true}},
              )
            : ConvexAppBar.badge(
                {3: _badge.text, 4: Icons.assistant_photo, 2: Colors.redAccent},
                badgePadding: _badge.padding,
                badgeColor: _badge.badgeColor,
                badgeBorderRadius: _badge.borderRadius,
                items: _tabItems.value,
                style: _style.value,
                curve: _curve.value,
                backgroundColor: _barColor,
                gradient: _gradient,
                controller: _tabController,
                onTap: (int i) => debugPrint('select index=$i'),
              ),
      ),
    );
  }

  void _onTabItemTypeChanged(ChoiceValue<List<TabItem>> value) {
    
    setState(() {
      _tabItems = value;
    });
  }

  void _onStyleChanged(ChoiceValue<TabStyle> value) {
    
    setState(() {
      _style = value;
    });
  }

  void _onCurveChanged(ChoiceValue<Curve> value) {
    
    setState(() {
      _curve = value;
    });
  }

  void _onBarColorChanged(Color value) {
    
    setState(() {
      _barColor = value;
    });
  }

  void _onGradientChanged(Gradient value) {
    
    setState(() {
      _gradient = value;
    });
  }

  void _onBadgeChanged(Badge value) {
    
    setState(() {
      _badge = value;
    });
  }
}
