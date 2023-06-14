import 'package:expance_tracker/Database/category_db/db_category.dart';
import 'package:expance_tracker/catagory_screen/catagory.dart';
import 'package:expance_tracker/catagory_screen/category_popup_bottamsheet.dart';
import 'package:expance_tracker/models/categories/catagory_model.dart';
import 'package:expance_tracker/screens/wedgets/bottamnavigationbar.dart';
import 'package:expance_tracker/transation_screens/transation.dart';
import 'package:expance_tracker/transation_screens/transation_add/transation_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const routename = "home-screen";

  final pages = const [scr_tarnsations(), Scr_catagory()];
  static ValueNotifier<int> selectedindex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 20.0,
        backgroundColor: const Color.fromARGB(66, 199, 186, 186),
        centerTitle: true,
        title: Text(
          style: GoogleFonts.tiltPrism(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          'XPENSo',
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: const Expancebottamnavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedindex,
          builder: (context, updated, _) {
            return pages[updated];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedindex.value == 0) {
            print('add expance');
            Navigator.of(context).pushNamed(screentransationadd.routename);
          } else {
            print('add category');
            category_popup(context);
            // //create a model to send insert_category() value'_sample'
            // final _sample = Category_Model(
            //   id: DateTime.now().millisecondsSinceEpoch.toString(),
            //   name: 'travel',
            //   type: catagory_type.income,
            // );
            // catagory_db().insert_category(_sample);
          }
        },
        foregroundColor: const Color.fromARGB(255, 108, 106, 106),
        tooltip: 'add expance',
        splashColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
