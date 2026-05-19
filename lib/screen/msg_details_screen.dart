import 'package:flutter/material.dart';

class AlumniMessageScreen extends StatelessWidget {
  const AlumniMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        title: const Text(
          "Amaravian Alumni",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.black54,
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.archive_outlined,
              color: Colors.black54,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            /// SUBJECT

            const Text(
              "Amaravians in Ranchi",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 20),

            /// PROFILE + DETAILS

            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                const CircleAvatar(
                  radius: 24,
                  backgroundImage:
                      NetworkImage(
                    "https://i.pravatar.cc/150?img=15",
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [

                      Row(
                        children: [

                          const Text(
                            "Rahul Sharma",
                            style:
                                TextStyle(
                              fontWeight:
                                  FontWeight
                                      .bold,
                              fontSize:
                                  15,
                            ),
                          ),

                          const SizedBox(
                              width: 8),

                          Text(
                            "<rahul@email.com>",
                            style:
                                TextStyle(
                              color: Colors
                                  .grey[600],
                              fontSize:
                                  12,
                            ),
                          )
                        ],
                      ),

                      const SizedBox(
                          height: 5),

                      Text(
                        "To : All Members",
                        style:
                            TextStyle(
                          fontSize: 12,
                          color: Colors
                              .grey[600],
                        ),
                      ),

                      const SizedBox(
                          height: 5),

                      Text(
                        "16 Feb 2022 • 10:24 AM",
                        style:
                            TextStyle(
                          fontSize: 11,
                          color: Colors
                              .grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Divider(
              color: Colors.grey.shade300,
            ),

            const SizedBox(height: 25),

            /// MESSAGE BODY

            const Text(
              "Hello Sir,\n\n"
              "I hope this message finds you well."
              "I recently moved to Ranchi and would like to connect with fellow Amaravians in the city."
              "May I know whether there is an active chapter available or any alumni members currently residing in Ranchi?"
              "Looking forward to hearing from you."
              "Best Regards,"
              "Rahul Sharma",

              style: TextStyle(
                fontSize: 14,
                height: 1.8,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 40),

          
           
          ],
        ),
      ),
      bottomNavigationBar: Container(
  padding: const EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 14,
  ),

  decoration: BoxDecoration(
    color: Colors.white,
    border: Border(
      top: BorderSide(
        color: Colors.grey.shade300,
      ),
    ),
  ),

  child: Row(
    mainAxisAlignment:
        MainAxisAlignment.spaceBetween,

    children: [

      ElevatedButton.icon(
  onPressed: () {},

  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: const Color(0xffB11212),
    side: const BorderSide(
      color: Color(0xffB11212),
      width: 2,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),

  icon: const Icon(
    Icons.reply,
    color: Color(0xffB11212),
  ),

  label: const Text(
    "Reply",
    style: TextStyle(
      color: Color(0xffB11212),
    ),
  ),
),
                 ElevatedButton.icon(
  onPressed: () {},

  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: const Color(0xffB11212),
    side: const BorderSide(
      color: Color(0xffB11212),
      width: 2,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),

  icon: const Icon(
    Icons.forward_rounded,
    color: Color(0xffB11212),
  ),

  label: const Text(
    "forward",
    style: TextStyle(
      color: Color(0xffB11212),
    ),
  ),
),
    ],
  ),
),
    );
  }
}