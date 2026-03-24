import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Nhúng file router mà chúng ta sẽ tạo ở dưới
import 'routes/app_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Lắng nghe cấu hình GoRouter từ Riverpod
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Foogo', // Thay bằng tên app bạn đã chốt
      debugShowCheckedModeBanner: false, // Ẩn chữ "DEBUG" ở góc màn hình
      // ==========================================
      // CẤU HÌNH GIAO DIỆN (THEME)
      // ==========================================
      theme: ThemeData(
        // Màu cam/đỏ cực kỳ phù hợp với app đồ ăn vì nó kích thích vị giác
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
      ),

      // Cấu hình cho chế độ Dark Mode
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.dark,
        ),
      ),

      // Tự động chuyển Sáng/Tối theo cài đặt của điện thoại
      themeMode: ThemeMode.system,

      // ==========================================
      // CẤU HÌNH ĐIỀU HƯỚNG (ROUTER)
      // ==========================================
      routerConfig: goRouter,
    );
  }
}
