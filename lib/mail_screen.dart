import 'dart:io';
import 'package:email/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  /// CAMERA
  File? image;

  final ImagePicker picker = ImagePicker();

  Future<void> openCamera() async {
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  /// DROPDOWN
  int selectedIndex = 0;

  String selectedBatch = "-Batch-";
  String selectedAmaravian = "-Amaravian-";

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F7),

      /// APP BAR
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,

        title: const Text(
          "Mail",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),

        actions: const [
          Icon(Icons.search, color: Colors.white),

          SizedBox(width: 18),

          Icon(Icons.more_vert, color: Colors.white),

          SizedBox(width: 12),
        ],

        /// TAB BAR
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55),

          child: Container(
            color: Colors.white,

            child: TabBar(
              controller: tabController,

              indicatorColor: const Color.fromARGB(255, 127, 0, 0),
              indicatorWeight: 4,

              labelColor: AppColors.houseOnTintColor,

              unselectedLabelColor: Colors.grey,

              tabs: const [
                Tab(text: "Inbox"),

                Tab(text: "Compose"),

                Tab(text: "Sent"),
              ],
            ),
          ),
        ),
      ),

      /// BODY
      body: TabBarView(
        controller: tabController,

        children: [
          /// INBOX TAB
          const Center(
            child: Text(
              "No Inbox Items",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.houseOnTintColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          /// COMPOSE TAB
          SingleChildScrollView(
            padding: const EdgeInsets.all(14),

            child: Column(
              children: [
                /// TO CARD
                Container(
                  padding: const EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.16),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text(
                        "To",
                        style: TextStyle(
                          color: AppColors.houseOnTintColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 22),

                      buildUserRow(
                        title: "All",
                        index: 0,
                        menuItems: const [],
                        showArrow: false,
                      ),

                      const SizedBox(height: 22),

                      buildUserRow(
                        title: "Batch",
                        index: 1,
                        subtitle: selectedBatch,

                        menuItems: const ["Batch A", "Batch B", "Batch C"],

                        showArrow: true,
                      ),

                      const SizedBox(height: 22),

                      buildUserRow(
                        title: "An Amaravian",
                        index: 2,
                        subtitle: selectedAmaravian,

                        menuItems: const ["Arun", "Kavin", "Rahul"],

                        showArrow: true,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                /// SUBJECT CARD
                Container(
                  padding: const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.16),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      /// ICON
                      Container(
                        height: 52,
                        width: 52,

                        decoration: const BoxDecoration(
                          color: AppColors.houserColor,
                          shape: BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.mail,
                          color: AppColors.primary,
                          size: 24,
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Text(
                              "Subject",
                              style: TextStyle(
                                color: AppColors.houseOnTintColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),

                            const SizedBox(height: 14),

                            Divider(color: Colors.grey.shade400),

                            const SizedBox(height: 10),

                            const Text(
                              "Compose email",
                              style: TextStyle(
                                color: AppColors.houseOnTintColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),

                            const SizedBox(height: 14),

                            const TextField(
                              maxLines: 10,

                              style: TextStyle(fontSize: 14),

                              decoration: InputDecoration(
                                hintText: "Write your email here...",
                                border: InputBorder.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                /// IMAGE PREVIEW
                if (image != null) ...[
                  Container(
                    height: 180,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      image: DecorationImage(
                        image: FileImage(image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),
                ],

                /// BOTTOM BAR
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 16,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.16),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Row(
                    children: [
                      /// CAMERA
                      GestureDetector(
                        onTap: openCamera,

                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,

                              decoration: const BoxDecoration(
                                color: AppColors.houserColor,
                                shape: BoxShape.circle,
                              ),

                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color:AppColors.primary,
                                size: 24,
                              ),
                            ),

                            const SizedBox(width: 8),

                            const Text(
                              "Camera",
                              style: TextStyle(
                                color: AppColors.houseOnTintColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      /// SEND BUTTON
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 12,
                        ),

                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(35),
                        ),

                        child: const Row(
                          children: [
                            Icon(Icons.send, color: Colors.white, size: 18),

                            SizedBox(width: 8),

                            Text(
                              "Send",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// SENT TAB
          const Center(
            child: Text(
              "No Sent Items",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.houseOnTintColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// USER ROW
  Widget buildUserRow({
    required String title,
    required int index,
    String? subtitle,
    required List<String> menuItems,
    bool showArrow = false,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },

      child: Row(
        children: [
          Icon(
            selectedIndex == index
                ? Icons.radio_button_checked
                : Icons.radio_button_off,

            color: selectedIndex == index
                ? AppColors.houseOnTintColor
                : Colors.grey,

            size: 22,
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),

          if (subtitle != null)
            PopupMenuButton<String>(
              onSelected: (value) {
                setState(() {
                  if (title == "Batch") {
                    selectedBatch = value;
                  } else {
                    selectedAmaravian = value;
                  }
                });
              },

              itemBuilder: (context) {
                return menuItems.map((item) {
                  return PopupMenuItem(value: item, child: Text(item));
                }).toList();
              },

              child: Row(
                children: [
                  Text(
                    subtitle,
                    style: const TextStyle(color: Color(0xff4B4E68)),
                  ),

                  if (showArrow)
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xff4B4E68),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
