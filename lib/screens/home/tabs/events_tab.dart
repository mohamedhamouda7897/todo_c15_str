import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_c15_str/firebase/firebase_manager.dart';

class EventsTab extends StatelessWidget {
  String category;

  EventsTab({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseManager.getTasks(category),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: Colors.blue));
        }
        if (snapShot.hasError) {
          return Center(child: Text("Something went wrong"));
        }

        if(snapShot.data!.docs.isEmpty){
          return Center(child: Text("No Tasks"));
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 8),
            itemBuilder: (context, index) {
              return Container(
                height: 203,

                width: double.infinity,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/${snapShot.data?.docs[index].data().category}.png",
                    ),
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2FEFF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            DateTime.fromMillisecondsSinceEpoch(
                              snapShot.data?.docs[index].data().date ?? 0,
                            ).toString().substring(8, 10),
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            DateFormat('MMM').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                snapShot.data?.docs[index].data().date ?? 0,
                              ),
                            ),
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2FEFF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          snapShot.data?.docs[index].data().title ?? "",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        trailing: Icon(Icons.favorite_border),
                      ),
                    ),
                  ],
                ),
              );
            },

            itemCount: snapShot.data?.docs.length ?? 0,
          ),
        );
      },
    );
  }
}
