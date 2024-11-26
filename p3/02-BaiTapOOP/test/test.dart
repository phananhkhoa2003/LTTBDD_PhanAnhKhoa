import '../models/CuaHang.dart';
import '../models/DienThoai.dart';
import '../models/HoaDon.dart';

void main() {
  // Tạo cửa hàng mẫu
  Cuahang cuaHang = Cuahang("Cửa hàng Điện thoại A", "123 Đường ABC");

  // Thêm điện thoại mẫu
  Dienthoai dt1 =
      Dienthoai("DT-001", "iPhone 14", "Apple", 20000000, 25000000, 10, true);
  Dienthoai dt2 =
      Dienthoai("DT-002", "Galaxy S23", "Samsung", 18000000, 23000000, 5, true);
  Dienthoai dt3 =
      Dienthoai("DT-003", "Xperia 5", "Sony", 15000000, 20000000, 8, true);

  cuaHang.themDienThoai(dt1);
  cuaHang.themDienThoai(dt2);
  cuaHang.themDienThoai(dt3);

  print("\n--- Danh sách điện thoại sau khi thêm ---");
  cuaHang.hienThiDanhSachDienThoai();

  // Cập nhật thông tin điện thoại
  Dienthoai dtCapNhat = Dienthoai(
      "DT-002", "Galaxy S23 Ultra", "Samsung", 19000000, 24000000, 5, true);
  cuaHang.capNhatDienThoai("DT-002", dtCapNhat);
  print("\n--- Danh sách điện thoại sau khi cập nhật ---");
  cuaHang.hienThiDanhSachDienThoai();

  // Tạo hóa đơn hợp lệ
  Hoadon hd1 = Hoadon(
      "HD-001", DateTime.now(), dt1, 25000000, "Nguyen Van A", "0123456789", 2);
  cuaHang.taoHoaDon(hd1);

  print("\n--- Danh sách hóa đơn sau khi tạo ---");
  cuaHang.hienThiDanhSachHoaDon();

  // Tính tổng doanh thu trong khoảng thời gian
  double doanhThu = cuaHang.tinhTongDoanhThu(
      DateTime.now().subtract(Duration(days: 7)),
      DateTime.now().add(Duration(days: 1)));
  print("\nTổng doanh thu: ${doanhThu}");

  // Thống kê tồn kho
  print("\n--- Báo cáo tồn kho ---");
  cuaHang.thongKeTonKho();
}
