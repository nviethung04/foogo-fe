import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Provider cung cấp GoRouter cho toàn bộ App
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/', // Màn hình đầu tiên khi mở app
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const PlaceholderHomeScreen(),
      ),
      // Sau này bạn sẽ thêm các route khác vào đây:
      // GoRoute(path: '/camera', builder: (context, state) => const CameraScreen()),
      // GoRoute(path: '/map', builder: (context, state) => const MapScreen()),
    ],
  );
});

// Màn hình tạm thời để test xem App đã chạy lên được chưa
class PlaceholderHomeScreen extends StatelessWidget {
  const PlaceholderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Foogo - Trạm Khám Phá')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.fastfood, size: 80, color: Colors.deepOrange),
            const SizedBox(height: 16),
            const Text(
              'Base App đã sẵn sàng!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Code mở camera sau này
              },
              icon: const Icon(Icons.camera_alt),
              label: const Text('Chụp ảnh món ăn'),
            ),
          ],
        ),
      ),
    );
  }
}
