import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/data_tuban.dart';

class DetailKulinerScreen extends StatefulWidget {
  final Wisata item;

  const DetailKulinerScreen({super.key, required this.item});

  @override
  State<DetailKulinerScreen> createState() => _DetailKulinerScreenState();
}

class _DetailKulinerScreenState extends State<DetailKulinerScreen> {
  // Fungsi untuk membuka Google Maps yang kompatibel dengan Android & Web
  Future<void> _bukaGoogleMaps(String lokasi) async {
    final Uri url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(lokasi)}',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal membuka Google Maps')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Gambar
            Stack(
              children: [
                Image.asset(
                  widget.item.gambar,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 250,
                    color: Colors.grey[300],
                    child: const Icon(Icons.fastfood, size: 60, color: Colors.grey),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        widget.item.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.item.isFavorite = !widget.item.isFavorite;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),

            // Informasi Detail Kuliner
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.nama,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.item.rating}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(${widget.item.ulasan} ulasan)',
                        style: const TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Chip(
                    label: Text(
                      widget.item.kategori,
                      style: const TextStyle(fontSize: 12),
                    ),
                    backgroundColor: const Color(0xFFF0E5D8),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.item.deskripsi,
                    style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 8),

                  // Info Harga
                  Row(
                    children: [
                      const Icon(Icons.payments_outlined, color: Color(0xFF8B4513)),
                      const SizedBox(width: 12),
                      Text(
                        widget.item.hargaTiket,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Info Lokasi
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, color: Color(0xFF8B4513)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.item.lokasi,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Info Jam Buka
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Color(0xFF8B4513)),
                      const SizedBox(width: 12),
                      Text(
                        widget.item.jamBuka,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Tombol "Lihat di Peta"
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8B4513),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.map_outlined),
                      label: const Text(
                        'Lihat di Peta',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        _bukaGoogleMaps(widget.item.lokasi);
                      },
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