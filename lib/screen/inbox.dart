import 'package:flutter/material.dart';
import 'msg_details_screen.dart';

class InboxItemsScreen extends StatefulWidget {
  const InboxItemsScreen({super.key});

  @override
  State<InboxItemsScreen> createState() => _InboxItemsScreenState();
}

class _InboxItemsScreenState extends State<InboxItemsScreen> {
  int selectedIndex = -1;

  // நீங்கள் விரும்பினால் இந்த டேட்டாவை உங்கள் இன்லாக்ஸ் மெசேஜ்களுக்கு ஏற்ப மாற்றிக்கொள்ளலாம்
  final List data = [
    {
      "title": "Ranchi",
      "message": "Click to view the contents of this message...",
      "date": "Feb 16, 2022",
      "tag": "ALL",
    },
    {
      "title": "Ranchi",
      "message": "Click to view the contents of this message...",
      "date": "Feb 16, 2022",
      "tag": "ALL",
    },
    {
      "title": "Ranchi",
      "message": "Click to view the contents of this message...",
      "date": "Feb 16, 2022",
      "tag": "ALL",
    },
    {
      "title": "Ranchi",
      "message": "Click to view the contents of this message...",
      "date": "Feb 16, 2022",
      "tag": "ALL",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Scaffold நீக்கப்பட்டு நேரடியாக Column ரிட்டர்ன் செய்யப்படுகிறது
    return Column(
      children: [
        // HEADER
        Container(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: 14,
          ),
          color: const Color(0xffF7F4F4),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 21,
                  color: Color(0xffC21807),
                ),
              ),
              const SizedBox(width: 14),
              const Text(
                "Inbox", // இங்க தலைப்பு "Inbox" என மாற்றப்பட்டுள்ளது
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.delete_outline,
                color: Colors.grey.shade700,
                size: 25,
              ),
            ],
          ),
        ),

        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: data.length,
            separatorBuilder: (_, __) {
              return Divider(
                height: 1,
                color: Colors.grey.shade200,
              );
            },
            itemBuilder: (context, index) {
              var item = data[index];
              bool isSelected = selectedIndex == index;

              return InkWell(
                onTap: () async {
                  setState(() {
                    selectedIndex = index;
                  });

                  await Future.delayed(
                    const Duration(milliseconds: 180),
                  );

                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AlumniMessageScreen(),
                      ),
                    );
                  }

                  setState(() {
                    selectedIndex = -1;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 20,
                  ),
                  color: isSelected ? const Color(0xffF8E7E7) : Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Icon(
                          Icons.circle_outlined,
                          size: 18,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    item["title"],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff222222),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  item["date"],
                                  style: TextStyle(
                                    fontSize: 11.5,
                                    color: Colors.red.shade300,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 11,
                                    vertical: 7,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFFE5E5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text(
                                    "ALL",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffFF4A3A),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    item["message"],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                      height: 1.3,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                  color: Colors.brown.shade300,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}