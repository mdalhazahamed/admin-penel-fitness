import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_admin_project/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../widgets/back_dialog_box.dart';
import '../widgets/custome_form_field.dart';

class CategoryItemScreen extends StatefulWidget {
  const CategoryItemScreen({super.key});

  @override
  State<CategoryItemScreen> createState() => _CategoryItemScreenState();
}

class _CategoryItemScreenState extends State<CategoryItemScreen> {
  TextEditingController _imgController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _categoryNameController = TextEditingController();

  // final _auth = FirebaseAuth.instance;
  CollectionReference usersForm =
      FirebaseFirestore.instance.collection('practice');

  List categoriesArray = [];

  getData() async {
    var values = await usersForm.doc("blog").get();
    final data = values.data();
    print(data);
    //  final strategies =
    //     data!.map((item) => item as Map<String, dynamic>).toList();

    // data!.forEach((element) async {
    //   print("HEY" + element['category_name']);
    // });
  }

  Future onSubmit() async {
    try {
      usersForm.doc('blog').update({
        'categories': FieldValue.arrayUnion([
          {
            'category_img': _imgController.text,
            'category_name': _categoryNameController.text,
            'title': _titleController.text,
          }
        ])
      });
      // usersForm.doc('blog').set({
      //   'categories': [
      //     {
      //       'category_img': _imgController.text,
      //       'category_name': _categoryNameController.text,
      //       'title': _titleController.text,
      //     }
      //   ]

      //     'categories': {
      //   'category_img': _imgController.text,
      //   'category_name': _categoryNameController.text,
      //   'title': _titleController.text,
      // }

      // })

      // usersForm.doc('blog').collection('categories').set({
      //   'category_img': _imgController.text,
      //   'category_name': _categoryNameController.text,
      //   'title': _titleController.text,

      // }).whenComplete(() {
      //   print("Added Success");
      // });
    } catch (error) {
      print("Failed to add user: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDADADA),
      appBar: AppBar(
        backgroundColor: Color(0xFFDADADA),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          color: Color(0xFFFCFCFC),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                CustomText("Category name"),
                customFormField(TextInputType.text, _categoryNameController,
                    context, "category_name", (val) {}),
                CustomText("title"),
                customFormField(TextInputType.text, _titleController, context,
                    "title Name", (val) {}),
                CustomText("Image url"),
                customFormField(TextInputType.text, _imgController, context,
                    "images", (val) {}),
                TextButton(
                  onPressed: () {
                    onSubmit();
                  },
                  child: Center(child: Text("Submit")),
                ),
                // TextButton(
                //   onPressed: () {
                //     getData();
                //   },
                //   child: Text("Get Data"),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackDialogBox();
        });
    return exitApp;
  }
}
