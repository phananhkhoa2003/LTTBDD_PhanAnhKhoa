import 'NhanVien.dart';

class NhanVienBanHang extends NhanVien {
  double _doanhSo;
  double _hoaHong;

  NhanVienBanHang(String maNV, String hoTen, double luongCoBan, this._doanhSo,
      this._hoaHong)
      : super(maNV, hoTen, luongCoBan);

  double get doanhso => _doanhSo;
  double get hoahong => _hoaHong;

  set doanhso(double doanhso) => (doanhso >= 0) ? _doanhSo = doanhso : _doanhSo;
  set hoahong(double hoahong) =>
      (hoahong >= 0 && hoahong <= 1) ? _hoaHong = hoahong : _hoaHong;

  @override
  double tongLuong() {
    return (_doanhSo * _hoaHong) + super.luongcoban;
  }

  @override
  void hienThiThongTin() {
    super.hienThiThongTin();
    print('Doanh số: ${_doanhSo}');
    print('Hoa Hồng : ${_hoaHong}');
  }
}
