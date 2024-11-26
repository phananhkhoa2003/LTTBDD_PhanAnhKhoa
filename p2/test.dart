import 'models/LopHoc.dart';
import 'models/main.dart';

void main() {
  var sv = SinhVien("SV001", "Nguyen Van A", 8.5, 20);
  var sv1 = SinhVien("SV002", "Nguyen Van B", 7.0, 21);
  var sv2 = SinhVien("SV003", "Nguyen Van C", 9.5, 22);
  var sv3 = SinhVien("SV004", "Nguyen Van D", 2.5, 20);
  var sv4 = SinhVien("SV005", "Nguyen Van E", 3.5, 24);
  var sv5 = SinhVien("SV006", "Nguyen Van F", 5.5, 27);

  // print(sv.hoten);
  // sv.hienThiThongTin();
  // print(sv.xepLoai());
  // sv.hoten = "Nguyen Van B";
  // sv.masv = 'SV01';
  // sv.hienThiThongTin();
  // print(sv.xepLoai());
  // sv.hoten = "";
  // sv.hienThiThongTin();
  // print(sv.xepLoai());

  var lopHoc = Lophoc("21DTHF1");
  lopHoc.themSinhVien(sv);
  lopHoc.themSinhVien(sv1);
  lopHoc.themSinhVien(sv2);
  lopHoc.themSinhVien(sv3);
  lopHoc.themSinhVien(sv4);
  lopHoc.themSinhVien(sv5);

  lopHoc.hienThiDanhSachLop();
}
