import 'package:flutter/material.dart';
import 'package:quran/views/every_types_screen/widgets/daily_column_widget.dart';
import 'package:quran/views/every_types_screen/widgets/prayer_time_card.dart';
import 'package:quran/views/every_types_screen/widgets/tap_page_content.dart';
import 'package:quran/views/every_types_screen/widgets/three_tabs_container.dart';
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: PrayerTimeCard(
                  imageUrl: 'assets/images/open_book.jpg',
                ),
              ),
              const SliverToBoxAdapter(
                child: DailyColumnWidget(
                  arabicText: 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
                  englishText:
                      'All praise and thanks be to the Lord of the worlds.',
                  surahName: "الفاتحة",
                  numJaz: 1,
                  numAyah: 1,
                ),
              ),
              SliverPadding(
                sliver: ThreeTabsContainer(
                    tabController: _tabController, tabs: tabs),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              TapPageContent(tabController: _tabController)
            ],
          ),
        ),
      ),
    );
  }
}
