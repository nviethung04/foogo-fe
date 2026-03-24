import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

void main() async {
  // Đảm bảo Flutter Core đã khởi tạo trước khi chạy các setup khác
  WidgetsFlutterBinding.ensureInitialized();

  // Load các biến môi trường từ file .env
  await dotenv.load(fileName: ".env");

  // Bọc toàn bộ App bằng ProviderScope để dùng Riverpod (State Management)
  runApp(const ProviderScope(child: MyApp()));
}
