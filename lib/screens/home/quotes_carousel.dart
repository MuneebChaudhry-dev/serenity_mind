import 'package:flutter/material.dart';

class QuotesCarousel extends StatefulWidget {
  const QuotesCarousel({super.key});

  @override
  State<QuotesCarousel> createState() => _QuotesCarouselState();
}

class _QuotesCarouselState extends State<QuotesCarousel> {
  final PageController _quoteController = PageController();
  int _currentQuote = 0;

  final List<String> quotes = [
    'When you realize nothing is lacking, the whole world belongs to you.\n–Lao Tzu',
    'The greatest wealth is health.\n–Virgil',
    'Peace comes from within. Do not seek it without.\n–Buddha',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 38,
      ), // Add margin to prevent overlap with sibling above
      // Background color rgba(229, 158, 166, 1)
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(229, 158, 166, 1),
      ),
      child: Stack(
        clipBehavior: Clip.none, // Prevent clipping of the image
        children: [
          // Image at the start, centered, with 50% above the container
          Positioned(
            left: 0,
            right: 0, // Span the full width to center the child
            top: -38, // 50% of 76px (38px) above the container
            child: Center(
              child: Image.asset(
                'assets/images/qoute_bot.png', // Replace with your image path
                width: 87,
                height: 76,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 158,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _quoteController,
                  itemCount: quotes.length,
                  onPageChanged: (i) => setState(() => _currentQuote = i),
                  itemBuilder:
                      (context, index) => Container(
                        margin: const EdgeInsets.only(
                          top: 38,
                        ), // Add margin to push quotes below the image
                        child: Card(
                          color: Colors.transparent, // Ensure no background
                          elevation:
                              0, // Remove shadow to prevent any background effect
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: Text(
                                quotes[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                ),
                Positioned(
                  bottom: 8,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      quotes.length,
                      (i) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentQuote == i ? 12 : 8,
                        height: _currentQuote == i ? 12 : 8,
                        decoration: BoxDecoration(
                          color:
                              _currentQuote == i
                                  ? Colors.white
                                  : Colors.white70,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
