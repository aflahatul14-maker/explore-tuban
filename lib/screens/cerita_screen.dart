import 'package:flutter/material.dart';
import '../data/data_tuban.dart';

class CeritaScreen extends StatelessWidget {
  const CeritaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      appBar: AppBar(
        title: const Text(
          'Cerita Rakyat & Legenda',
          style: TextStyle(color: Color(0xFF8B4513), fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFAF6EE),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: listCeritaRakyat.length,
        itemBuilder: (context, index) {
          final cerita = listCeritaRakyat[index];
          return Card(
            color: const Color(0xFFFFF5F0),
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  cerita.gambar,
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 55,
                    height: 55,
                    color: Colors.grey[300],
                    child: const Icon(Icons.book, color: Colors.grey),
                  ),
                ),
              ),
              title: Text(
                cerita.judul,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  cerita.ringkasan,
                  style: const TextStyle(fontSize: 11, color: Colors.black54),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              trailing: const Icon(Icons.chevron_right, color: Colors.black54),
              onTap: () {
                // Navigasi ke Halaman Detail Cerita Rakyat
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailCeritaScreen(cerita: cerita),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Halaman Detail Cerita Rakyat
class DetailCeritaScreen extends StatelessWidget {
  final CeritaRakyat cerita;

  const DetailCeritaScreen({super.key, required this.cerita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF6EE),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF8B4513)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          cerita.judul,
          style: const TextStyle(color: Color(0xFF8B4513), fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                cerita.gambar,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Icon(Icons.book, size: 50, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Chip(
              label: Text(cerita.kategori, style: const TextStyle(fontSize: 12)),
              backgroundColor: const Color(0xFFF0E5D8),
            ),
            const SizedBox(height: 12),
            Text(
              cerita.judul,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              cerita.isi,
              style: const TextStyle(fontSize: 14, height: 1.6),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFF0E5D8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.lightbulb_outline, color: Color(0xFF8B4513)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Pesan Moral: ${cerita.pesanMoral}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF8B4513),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}