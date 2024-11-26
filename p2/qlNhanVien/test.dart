import 'NhanVIenBanHang.dart';
import 'NhanVien.dart';

void main() {
  var nv = NhanVien('NV01', 'Nguyen Van A', 5000000);
  print('Nhân Viên thường: ');
  nv.hienThiThongTin();

  var nv1 = NhanVienBanHang('NV01', 'Nguyen Van b', 5000000, 7000000, 0.2);
  print('Nhân Viên bán hàng: ');
  nv1.hienThiThongTin();

  nv1.doanhso = 800000000;
  print(' sau khi tăng doanh so');
  nv1.hienThiThongTin();
}
