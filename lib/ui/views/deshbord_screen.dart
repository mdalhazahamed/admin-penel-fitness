import 'package:fitness_admin_project/ui/views/category.dart';
import 'package:fitness_admin_project/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../business_logics/add_data.dart';
import '../widgets/custome_form_field.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController _imagesController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _thumbnailController = TextEditingController();
  TextEditingController _videoSorceController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  RxString category = 'video'.obs;
  RxInt allValue = 0.obs;

  // Initial Selected Value
  String dropdownvalue = 'video';

  // List of items in our dropdown menu
  var items = [
    'blog',
    'podcast',
    'video',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDADADA),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0xFFFCFCFC),
        title: Row(
          children: [
            Icon(Icons.dashboard, color: Colors.black),
            SizedBox(width: 6),
            Text(
              "Flutter Admin App",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xFFFCFCFC),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 10),
                    child: Text(
                      "Add new item",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: DropdownButton(
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                          print(dropdownvalue);
                        });
                      },
                    ),
                  ),
                  // ExpansionTile(
                  //   title: Text("users data"),
                  //   trailing: IconButton(
                  //       onPressed: () {},
                  //       icon: Icon(Icons.arrow_drop_down_outlined)),
                  //   children: [
                  //     Card(
                  //         child: Text(
                  //       "video",
                  //       style: TextStyle(fontSize: 20),
                  //     )),
                  //     SizedBox(
                  //       height: 5,
                  //     ),
                  //     Card(
                  //         child:
                  //             Text("podcast", style: TextStyle(fontSize: 20))),
                  //     SizedBox(
                  //       height: 5,
                  //     ),
                  //     Card(child: Text("blog", style: TextStyle(fontSize: 20))),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              // scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (dropdownvalue == 'blog')
                      ? Container(
                          height: 660,
                          width: 400,
                          color: Color(0xFFFCFCFC),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText("Blog images"),
                                customFormField(
                                    TextInputType.text,
                                    _imagesController,
                                    context,
                                    "blog images",
                                    (val) {}),
                                CustomText("Title"),
                                customFormField(
                                    TextInputType.text,
                                    _titleController,
                                    context,
                                    "Title",
                                    (val) {}),
                                CustomText("Description"),
                                TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  controller: _descriptionController,
                                  validator: (val) {},
                                  minLines: 3,
                                  maxLines: 6,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(15, 15, 20, 15),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.amber),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.amber),
                                    ),
                                    hintText: "Description",
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                CustomText("Type"),
                                customFormField(TextInputType.text,
                                    _typeController, context, "type", (val) {}),
                                CustomText("Thumbnail url"),
                                customFormField(
                                    TextInputType.text,
                                    _thumbnailController,
                                    context,
                                    "thumbnail url",
                                    (val) {}),
                                CustomText("Blog url"),
                                customFormField(
                                    TextInputType.text,
                                    _videoSorceController,
                                    context,
                                    "blog url",
                                    (val) {}),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        addData().adminDataAdd(
                                            _titleController.text.toString(),
                                            _descriptionController.text
                                                .toString(),
                                            _typeController.text.toString(),
                                            _thumbnailController.text
                                                .toString(),
                                            _videoSorceController.text
                                                .toString(),
                                            DateTime.now());
                                      },
                                      child: Text("Submit"),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                CategoryItemScreen()));
                                  },
                                  child: Text("Category"),
                                ),
                              ],
                            ),
                          ),
                        )
                      : (dropdownvalue == 'podcast')
                          ? Container(
                              height: 660,
                              width: 400,
                              color: Color(0xFFFCFCFC),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText("Description"),
                                    TextFormField(
                                      keyboardType: TextInputType.multiline,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      controller: _descriptionController,
                                      validator: (val) {},
                                      minLines: 3,
                                      maxLines: 6,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.fromLTRB(15, 15, 20, 15),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.amber),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.amber),
                                        ),
                                        hintText: "Description",
                                        hintStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomText("Podcast name"),
                                    customFormField(
                                        TextInputType.text,
                                        _titleController,
                                        context,
                                        "podcast name",
                                        (val) {}),
                                    CustomText("Type"),
                                    customFormField(
                                        TextInputType.text,
                                        _thumbnailController,
                                        context,
                                        "type",
                                        (val) {}),
                                    CustomText("Thumbnail url"),
                                    customFormField(
                                        TextInputType.text,
                                        _thumbnailController,
                                        context,
                                        "thumbnail url",
                                        (val) {}),
                                    CustomText("Podcast url"),
                                    customFormField(
                                        TextInputType.text,
                                        _videoSorceController,
                                        context,
                                        "podcast url",
                                        (val) {}),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            addData().adminDataAdd(
                                                _titleController.text
                                                    .toString(),
                                                _descriptionController.text
                                                    .toString(),
                                                _typeController.text.toString(),
                                                _thumbnailController.text
                                                    .toString(),
                                                _videoSorceController.text
                                                    .toString(),
                                                DateTime.now());
                                          },
                                          child: Text("Submit"),
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    CategoryItemScreen()));
                                      },
                                      child: Text("Category"),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              height: 660,
                              width: 400,
                              color: Color(0xFFFCFCFC),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText("Title"),
                                    customFormField(
                                        TextInputType.text,
                                        _titleController,
                                        context,
                                        "Title",
                                        (val) {}),
                                    CustomText("Description"),
                                    TextFormField(
                                      keyboardType: TextInputType.multiline,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      controller: _descriptionController,
                                      validator: (val) {},
                                      minLines: 3,
                                      maxLines: 6,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.fromLTRB(15, 15, 20, 15),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.amber),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.amber),
                                        ),
                                        hintText: "Description",
                                        hintStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomText("Type"),
                                    customFormField(
                                      TextInputType.text,
                                      _typeController,
                                      context,
                                      "Type",
                                      (val) {},
                                      readOnly: true,
                                    ),
                                    CustomText("Thumbnail url"),
                                    customFormField(
                                        TextInputType.text,
                                        _thumbnailController,
                                        context,
                                        "thumbnail url",
                                        (val) {}),
                                    CustomText("Video source link"),
                                    customFormField(
                                        TextInputType.text,
                                        _videoSorceController,
                                        context,
                                        "Video source link",
                                        (val) {}),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            addData().adminDataAdd(
                                                _titleController.text
                                                    .toString(),
                                                _descriptionController.text
                                                    .toString(),
                                                _typeController.text.toString(),
                                                _thumbnailController.text
                                                    .toString(),
                                                _videoSorceController.text
                                                    .toString(),
                                                DateTime.now());
                                          },
                                          child: Text("Submit"),
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    CategoryItemScreen()));
                                      },
                                      child: Text("Category"),
                                    ),
                                  ],
                                ),
                              ),
                            )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
