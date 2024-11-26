import 'main.dart';

class Lophoc {
  String _tenLop;
  List<SinhVien> _danhSachSv = [];
  Lophoc(this._tenLop);

  String get tenLop => _tenLop;
  List<SinhVien> get danhSachSv => _danhSachSv;

  set tenLop(String tenLop) {
    if (tenLop.isNotEmpty) {
      _tenLop = tenLop;
    }
  }

  void themSinhVien(SinhVien sv) => _danhSachSv.add(sv);

  void hienThiDanhSachLop() {
    print('---------------');
    print('Danh sách sinh vien lop ${_tenLop} ');
    for (var sv in _danhSachSv) {
      print('Thong tin');
      sv.hienThiThongTin();
      print('Xếp Loại : ${sv.xepLoai()}');
    }
  }
}
