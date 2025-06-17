import 'package:flutter/material.dart';
import 'package:yolo_intern/Widgets/freeze_button.dart';
import 'package:yolo_intern/services/card_service.dart';

class DebitCard extends StatefulWidget {
  const DebitCard({super.key});

  @override
  State<DebitCard> createState() => _DebitCardState();
}

class _DebitCardState extends State<DebitCard> {
  bool _frozen = false;
  late Future<Map<String, String>> _cardDetails;

  void _toggleFrozen() {
    setState(() {
      _frozen = !_frozen;
    });
  }

  @override
  void initState() {
    super.initState();
    _cardDetails = fetchFakeCardDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // CARD
        Container(
          width: 186,
          height: 296,
          margin: EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black,
            gradient: LinearGradient(
              colors: [Colors.black, Colors.grey.shade900],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: FutureBuilder<Map<String, String>>(
            future: _cardDetails,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error loading card',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else {
                final card = snapshot.data!;
                final cardNumber = card['number'] ?? '';
                final cardChunks = RegExp(
                  r'.{1,4}',
                ).allMatches(cardNumber).map((m) => m.group(0)!).toList();

                return _frozen
                    ? Image.asset('assets/images/Design_Layer.png')
                    : Stack(
                        children: [
                          // header - logos
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 19,
                              vertical: 14,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('assets/images/yolo_logo.png'),
                                Image.asset('assets/images/yes_bank.png'),
                              ],
                            ),
                          ),

                          // card number
                          Positioned(
                            top: 76,
                            left: 23,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var chunk in cardChunks)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      chunk,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),

                          // expiry
                          Positioned(
                            left: 94,
                            top: 75,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'expiry',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  card['expiry'] ?? '00/00',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 25),
                                const Text(
                                  'cvv',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      '***',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.visibility_off,
                                      color: Colors.red,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // copy
                          const Positioned(
                            left: 14,
                            top: 206,
                            child: Row(
                              children: [
                                Icon(Icons.copy, color: Colors.red, size: 18),
                                SizedBox(width: 6),
                                Text(
                                  'copy details',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // rupay
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 15,
                                right: 10,
                              ),
                              child: Image.asset('assets/images/rupay.png'),
                            ),
                          ),
                        ],
                      );
              }
            },
          ),
        ),

        SizedBox(width: 20),

        // FREEZE CIRCLE
        FreezeButton(
          img: 'assets/images/u_snowflake.png',
          isSelected: _frozen,
          onToggle: _toggleFrozen,
        ),
      ],
    );
  }
}
