import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/themes/colors.dart';
import 'package:quran/views/every_types_screen/widgets/prayer_time_card.dart';
import 'package:quran/views/every_types_screen/widgets/tap_page_content.dart';
import 'package:quran/views/every_types_screen/widgets/three_tabs_container.dart';
import 'package:quran/views/every_types_screen/widgets/today_verse_card_audio.dart';
import 'package:quran/views/every_types_screen/widgets/todey_verse_card_slidable.dart';
import 'package:quran/widgets/custom_appbar.dart';
import '../../custom_drawer/pages/custom_drawer.dart';

class EveryTypesView extends StatefulWidget {
  const EveryTypesView({super.key});

  @override
  State<EveryTypesView> createState() => _EveryTypesViewState();
}

class _EveryTypesViewState extends State<EveryTypesView>
    with TickerProviderStateMixin {
  final List<String> tabs = ['جميع التصنيفات', 'كل الوسائط', 'أوقات الصلاة'];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const Customappbar(
            title: 'القرآن الكريم', centerTitle: false, searchBar: true),
        drawer: CustomDrawer(),
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: PrayerTimeCard(),
            ),
            const SliverToBoxAdapter(
              child: TodeyVerseCardSlidable(),
            ),
            SliverPadding(
              sliver:
                  ThreeTabsContainer(tabController: _tabController, tabs: tabs),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            ),
            TapPageContent(tabController: _tabController)
          ],
        ),
      ),
    );
  }
}
