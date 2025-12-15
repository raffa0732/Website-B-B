import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BBViaCastelloFooter extends StatelessWidget {
  const BBViaCastelloFooter({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      // You should handle this in a real application, e.g., showing a SnackBar
      debugPrint('Impossibile lanciare $url'); 
    }
  }

  Widget _buildContactItem(IconData icon, String text, String? url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: url != null ? () => _launchUrl(url) : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.amber, size: 20),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkItem(String text, String url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () => _launchUrl(url),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white70,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // The main container for the footer, with a dark background
    return Container(
      color: const Color(0xFF333333), 
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Use Wrap for a responsive layout of footer sections
          Wrap(
            spacing: 40.0, 
            runSpacing: 30.0, 
            // Centers sections on smaller screens, spaces them on wider screens
            alignment: WrapAlignment.spaceBetween, 
            children: [
              // 1. Contatti Section
              _FooterSection(
                title: 'Contatti B&B Via Castello',
                children: [
                  _buildContactItem(
                    Icons.location_on,
                    'Via Castello, XX - 26013 Crema CR',
                    'https://maps.app.goo.gl/examplelocation',
                  ),
                  _buildContactItem(
                    Icons.phone,
                    '+39 0373 XXXXXX',
                    'tel:+390373XXXXXX',
                  ),
                  _buildContactItem(
                    Icons.email,
                    'info@bebviacastellocrema.it',
                    'mailto:info@bebviacastellocrema.it',
                  ),
                ],
              ),
              
              // 2. Seguici e Contattaci Section
              _FooterSection(
                title: 'Seguici e Contattaci',
                children: [
                  // Social Media Icons
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.facebook, color: Colors.white, size: 30),
                        onPressed: () => _launchUrl('https://www.facebook.com/bebviacastellocrema/'),
                        tooltip: 'Facebook',
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(Icons.public, color: Colors.white, size: 30),
                        onPressed: () => _launchUrl('https://www.airbnb.it/rooms/425811?search_mode=regular_search&adults=1&check_in=2025-12-18&check_out=2025-12-23&children=0&infants=0&pets=0&photo_id=2346983701&source_impression_id=p3_1765539896_P3Rt7CHn-BZhXDIO&previous_page_section_name=1000&federated_search_id=dab61910-1acd-4444-81ae-bffee7fc0206'),
                        tooltip: 'Airbnb',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Call to Action Button
                  ElevatedButton(
                    onPressed: () => _launchUrl('mailto:cinziamiraglio@gmail.com'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[700], 
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    child: const Text(
                      'CONTATTACI ORA',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                  ),
                ],
              ),

              // 3. Esplora Crema Section
              _FooterSection(
                title: 'Esplora Crema',
                children: [
                  _buildLinkItem(
                    'La Città di Crema (Proloco)',
                    'https://www.prolococrema.it/',
                  ),
                  _buildLinkItem(
                    'Cosa Vedere: Itinerari',
                    'https://www.prolococrema.it/itinerari',
                  ),
                  _buildLinkItem(
                    'Eventi Locali',
                    'https://www.prolococrema.it/eventi-in-citt%C3%A0',
                  ),
                ],
              ),
            ],
          ),
          
          // Separator
          const Divider(color: Colors.white30, height: 40, thickness: 1),
          
          // Copyright Text
          const Center(
            child: Text(
              '\u00a9 2024 B&B Via Castello Crema. Tutti i diritti riservati. | P.IVA XXXXXXXXXXX',
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Helper Widget for Footer Sections ---
class _FooterSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _FooterSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.amber[400],
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          // Use the spread operator to add the list of child widgets directly
          ...children, 
        ],
      ),
    );
  }
}