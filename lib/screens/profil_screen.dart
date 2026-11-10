import 'package:flutter/material.dart';
import 'favorit_screen.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  void _showInfoDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF8B4513),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Tutup',
              style: TextStyle(color: Color(0xFF8B4513)),
            ),
          ),
        ],
      ),
    );
  }

  void _showKeluarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Konfirmasi Keluar'),
        content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Berhasil keluar')),
              );
            },
            child: const Text('Keluar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(
            color: Color(0xFF8B4513),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFFAF6EE),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Avatar Profil
            const Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Color(0xFF8B4513),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'afla',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Card Menu Profil
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Menu Favorit
                  ListTile(
                    leading: const Icon(
                      Icons.favorite_border,
                      color: Color(0xFF8B4513),
                    ),
                    title: const Text('Favorit'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavoritScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1),

                  // Menu Riwayat
                  ListTile(
                    leading: const Icon(
                      Icons.history,
                      color: Color(0xFF8B4513),
                    ),
                    title: const Text('Riwayat'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      _showInfoDialog(
                        context,
                        'Riwayat',
                        'Belum ada riwayat penelusuran terbaru.',
                      );
                    },
                  ),
                  const Divider(height: 1),

                  // Menu Pengaturan
                  ListTile(
                    leading: const Icon(
                      Icons.settings_outlined,
                      color: Color(0xFF8B4513),
                    ),
                    title: const Text('Pengaturan'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      _showInfoDialog(
                        context,
                        'Pengaturan',
                        'Pengaturan aplikasi (Bahasa, Notifikasi, Tema) sudah disesuaikan.',
                      );
                    },
                  ),
                  const Divider(height: 1),

                  // Menu Tentang Aplikasi
                  ListTile(
                    leading: const Icon(
                      Icons.info_outline,
                      color: Color(0xFF8B4513),
                    ),
                    title: const Text('Tentang Aplikasi'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      _showInfoDialog(
                        context,
                        'Explore Tuban v1.0.0',
                        'Aplikasi pemandu kuliner khas dan cerita rakyat legendaris Kabupaten Tuban.',
                      );
                    },
                  ),
                  const Divider(height: 1),

                  // Menu Keluar
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    title: const Text(
                      'Keluar',
                      style: TextStyle(color: Colors.red),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => _showKeluarDialog(context),
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