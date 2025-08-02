import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_c15_str/firebase/firebase_manager.dart';
import 'package:todo_c15_str/models/task_model.dart';
import 'package:todo_c15_str/screens/add_event/chip_item.dart';

class AddEventScreen extends StatefulWidget {
  static const String routeName = "AddEventScreen";

  AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  int selectedCategoryIndex = 0;

  var titleController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  var descriptionController = TextEditingController();
  List<String> categories = [
    "meeting",
    "holiday",
    "workshop",
    "sport",
    "book_club",
    "eating",
    "birthday",
    "gaming",
    "exhibition",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.blue),
        title: Text(
          "Create Event",
          style: GoogleFonts.inter(
            fontSize: 24,
            color: Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          spacing: 16.h,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                "assets/images/${categories[selectedCategoryIndex]}.png",
              ),
            ),

            Container(
              height: 40,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ChipItem(
                    bg: selectedCategoryIndex == index  ? Colors.blue : Colors.transparent,
                    textColor: selectedCategoryIndex == index ? Colors.white : Colors.blue,
                    borderColor: Colors.blue,
                    title: categories[index],
                    isSelected: selectedCategoryIndex == index,
                    onTap: () {
                      selectedCategoryIndex = index;
                      setState(() {});
                    },
                  );
                },
                itemCount: 9,
              ),
            ),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Title",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: "Description",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select Date",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    selectTaskDate();
                  },
                  child: Text(
                    selectedDate.toString().substring(0, 10),
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),
              ],
            ),

            Container(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  TaskModel model = TaskModel(title: titleController.text,
                      userId: FirebaseAuth.instance.currentUser!.uid,
                      description: descriptionController.text,
                      category: categories[selectedCategoryIndex],
                      date: selectedDate.millisecondsSinceEpoch);
                  FirebaseManager.createEvent(model);
                  Navigator.pop(context);
                },

                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(
                  "Create Event",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectTaskDate() async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (chosenDate != null) {
      selectedDate = chosenDate;
    }
    setState(() {});
  }
}
