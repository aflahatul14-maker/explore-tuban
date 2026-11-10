import 'package:flutter/material.dart';
import '../data/data_tuban.dart';
import 'detail_kuliner_screen.dart';

class PetaScreen extends StatefulWidget {
  const PetaScreen({super.key});

  @override
  State<PetaScreen> createState() => _PetaScreenState();
}

class _PetaScreenState extends State<PetaScreen> {
  // Index lokasi/kuliner yang sedang dipilih di peta
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final itemAktif = listDataTuban[_selectedIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      appBar: AppBar(
        title: const Text(
          'Peta Kuliner',
          style: TextStyle(
            color: Color(0xFF8B4513),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFFAF6EE),
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Tampilan Area Peta
          Container(
            color: const Color(0xFFE8F0E5),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on, size: 60, color: Colors.red),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                  ),
                  child: Text(
                    itemAktif.nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B4513),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Daftar Kartu Menu Makanan yang Bisa Digeser di Bawah Peta
          Positioned(
            left: 0,
            right: 0,
            bottom: 16,
            child: SizedBox(
              height: 110,
              child: PageView.builder(
                itemCount: listDataTuban.length,
                controller: PageController(viewportFraction: 0.9),
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = listDataTuban[index];
                  return Card(
                    color: const Color(0xFFFFF5F0),
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              item.gambar,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                width: 60,
                                height: 60,
                                color: Colors.grey[300],
                                child: const Icon(Icons.fastfood, color: Colors.grey),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item.nama,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '★ ${item.rating} • ${item.jarak}',
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  item.kategori,
                                  style: const TextStyle(fontSize: 11, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8B4513),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailKulinerScreen(item: item),
                                ),
                              );
                            },
                            child: const Text('Detail', style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}