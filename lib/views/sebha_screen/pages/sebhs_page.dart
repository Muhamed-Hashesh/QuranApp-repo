import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/views/custom_drawer/pages/custom_drawer.dart';
import 'package:quran_project/views/sebha_screen/model/sebha_list.dart';
import 'package:quran_project/widgets/custom_appbar.dart';
import 'package:quran_project/widgets/reach_text_reqaa.dart';

class ElectronicSebhaPage extends StatefulWidget {
  const ElectronicSebhaPage({super.key});

  @override
  _ElectronicSebhaPageState createState() => _ElectronicSebhaPageState();
}

class _ElectronicSebhaPageState extends State<ElectronicSebhaPage> {
  int counter = 0;
  String selectedText = 'قم باختيار تسبيحة للبدء';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'السبحة الالكترونية'),
        drawer: CustomDrawer(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _showAddTasbeehModal(context),
          icon: const Icon(Icons.add),
          label: const Text('أضف تسبيحة'),
          elevation: 0,
          highlightElevation: 0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: 24),
                  child: Text(
                    selectedText,
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 88,
                    vertical: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    counter.toString(),
                    style: TextStyle(
                      fontFamily: 'Digital',
                      fontSize: 50,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                16.height,
                TasbeehTexts(
                  sebhaList: sebhaList,
                  onSelect: (index, count, text) {
                    setState(() {
                      counter = count;
                      selectedText = text;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddTasbeehModal(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    final TextEditingController countController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: 'التسبيحة',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: countController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'عدد التسبيحات',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (textController.text.isNotEmpty &&
                      countController.text.isNotEmpty) {
                    setState(() {
                      sebhaList.add({
                        'text': textController.text,
                        'count': int.tryParse(countController.text) ?? 30,
                      });
                    });
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('أضف'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class TasbeehTexts extends StatefulWidget {
  const TasbeehTexts({
    super.key,
    required this.sebhaList,
    required this.onSelect,
  });

  final List<Map<String, dynamic>> sebhaList;
  final Function(int, int, String) onSelect; // index, count, text

  @override
  _TasbeehTextsState createState() => _TasbeehTextsState();
}

class _TasbeehTextsState extends State<TasbeehTexts> {
  int _selectedIndex = -1;
  List<int> _counters = [];

  @override
  void initState() {
    super.initState();
    // Initialize counters for each item in the sebhaList
    _initializeCounters();
  }

  // تحديث _counters عند تحديث قائمة sebhaList
  void _initializeCounters() {
    _counters = List.generate(widget.sebhaList.length, (index) => 0);
  }

  // إعادة تهيئة _counters عند كل تغيير في widget.sebhaList
  @override
  void didUpdateWidget(covariant TasbeehTexts oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sebhaList.length != widget.sebhaList.length) {
      _initializeCounters();
    }
  }

  void _incrementCounter(int index) {
    setState(() {
      if (_counters[index] < widget.sebhaList[index]['count']) {
        _counters[index]++;
      }
      _selectedIndex = index;
    });
    widget.onSelect(index, _counters[index], widget.sebhaList[index]['text']);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListView.separated(
        itemBuilder: (context, index) {
          // تأكد من أن الفهرس في الحدود الصحيحة للقائمة
          if (index < 0 || index >= widget.sebhaList.length) {
            return Container(); // إرجاع عنصر فارغ لتجنب الأخطاء
          }
          return TasbeehahRow(
            sebhaList: widget.sebhaList,
            index: index,
            counter: _counters[index],
            isSelected: _selectedIndex == index,
            onTap: () => _incrementCounter(index),
          );
        },
        separatorBuilder: (BuildContext context, int index) => 16.height,
        itemCount: widget.sebhaList.length,
      ),
    );
  }
}

class TasbeehahRow extends StatelessWidget {
  const TasbeehahRow({
    super.key,
    required this.sebhaList,
    required this.index,
    required this.counter,
    required this.isSelected,
    required this.onTap,
  });

  final List<Map<String, dynamic>> sebhaList;
  final int index;
  final int counter;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: isSelected ? const Color(0xffA48979) : Colors.transparent,
        child: Row(
          children: [
            24.width,
            Expanded(
              child: Text(
                sebhaList[index]['text'],
                style: Theme.of(context).textTheme.displaySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            ReachTextReqaa(
              repeatCount: counter,
              isNum: true,
              num: sebhaList[index]['count'],
            ),
            24.width,
          ],
        ),
      ),
    );
  }
}
