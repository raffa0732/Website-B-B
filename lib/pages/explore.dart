import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:website/classes/footer.dart';
import 'package:website/main.dart';

class EsploraCremaSection extends StatelessWidget {
  const EsploraCremaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;
    final double rowHeight = isDesktop ? 260 : 320;

    return Scaffold(
      appBar: CustomHotelAppBar(),
      backgroundColor: Colors.white,

      //MAIN CONTENT (scrollable)
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 40,
            horizontal:
                isDesktop ? MediaQuery.of(context).size.width * 0.10 : 20,
          ),
          child: Column(
            children: [
              // --- RIGA 1 ---
              SizedBox(
                height: rowHeight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildImageBlock(
                          'https://picsum.photos/800/800?random=1'),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: _buildColorBlock(
                        color: Colors.black,
                        child: const Text(
                          'B&B Via Castello',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: _buildBorderBlock(
                        child: const Text(
                          'Un rifugio di design nel cuore di Crema.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // --- RIGA 2 ---
              SizedBox(
                height: rowHeight * 0.7,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _buildColorBlock(
                        color: Colors.deepOrangeAccent,
                        child: const Text(
                          'BENVENUTI',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: _buildImageBlock(
                          'https://picsum.photos/400/400?random=2'),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: _buildImageBlock(
                          'https://picsum.photos/400/400?random=5'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // --- RIGA 3 ---
              SizedBox(
                height: isDesktop ? rowHeight * 1.3 : null,
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 1,
                        child: _buildImageBlock(
                            'https://picsum.photos/500/700?random=3'),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: _buildBorderBlock(
                          padding: 30,
                          child: _buildServicesWithLabels(isDesktop),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // --- RIGA 4 ---
              SizedBox(
                height: rowHeight * 0.6,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: _buildImageBlock(
                          'https://picsum.photos/600/400?random=6'),
                    ),
                    Expanded(
                      child: _buildImageBlock(
                          'https://picsum.photos/600/400?random=7'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: const BBViaCastelloFooter(),
      ),
    );
  }

  // --------------------------------------------------
  // HELPERS
  // --------------------------------------------------

  Widget _buildImageBlock(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Image.network(url, fit: BoxFit.cover),
    );
  }

  Widget _buildColorBlock({
    required Color color,
    required Widget child,
    double padding = 20,
  }) {
    return Container(
      color: color,
      padding: EdgeInsets.all(padding),
      child: Center(child: child),
    );
  }

  Widget _buildBorderBlock({
    required Widget child,
    double padding = 20,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      padding: EdgeInsets.all(padding),
      child: Center(child: child),
    );
  }

  Widget _buildServicesWithLabels(bool isDesktop) {
    final List<Map<String, dynamic>> servizi = [
      {'icon': Icons.wifi, 'label': 'WI-FI'},
      {'icon': Icons.breakfast_dining, 'label': 'COLAZIONE'},
      {'icon': Icons.tv, 'label': 'SMART TV'},
      {'icon': Icons.ac_unit, 'label': 'ARIA COND.'},
      {'icon': Icons.local_parking, 'label': 'PARCHEGGIO'},
      {'icon': Icons.pedal_bike, 'label': 'BICICLETTE'},
    ];

    return Wrap(
      spacing: isDesktop ? 40 : 20,
      runSpacing: 30,
      alignment: WrapAlignment.center,
      children: servizi
          .map(
            (s) => SizedBox(
              width: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    s['icon'],
                    size: isDesktop ? 45 : 35,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    s['label'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
