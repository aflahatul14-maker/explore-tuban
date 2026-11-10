import 'package:flutter/material.dart';
import '../data/data_tuban.dart';
import 'detail_kuliner_screen.dart';

class FavoritScreen extends StatefulWidget {
  const FavoritScreen({super.key});

  @override
  State<FavoritScreen> createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  @override
  Widget build(BuildContext context) {
    // Menyaring item yang status isFavorite-nya true
    final favoritList = listDataTuban.where((item) => item.isFavorite).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      appBar: AppBar(
        title: const Text(
          'Favorit',
          style: TextStyle(
            color: Color(0xFF8B4513),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFFAF6EE),
        elevation: 0,
      ),
      body: favoritList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Belum Ada Favorit',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B4513),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Simpan kuliner favoritmu dengan menekan ikon hati.',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favoritList.length,
              itemBuilder: (context, index) {
                final item = favoritList[index];
                return Card(
                  color: const Color(0xFFFFF5F0),
                  elevation: 0,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        item.gambar,
                        width: 55,
                        height: 55,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 55,
                          height: 55,
                          color: Colors.grey[300],
                          child: const Icon(Icons.fastfood, color: Colors.grey),
                        ),
                      ),
                    ),
                    title: Text(
                      item.nama,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        '${item.kategori} • ${item.jarak}',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          item.isFavorite = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${item.nama} dihapus dari favorit'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailKulinerScreen(item: item),
                        ),
                      ).then((_) {
                        // Refresh halaman saat kembali dari detail
                        setState(() {});
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}