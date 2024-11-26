class NhanVien {
  String _maNV;
  String _hoTen;
  double _luongCoBan;

  NhanVien(this._maNV, this._hoTen, this._luongCoBan);

  String get manv => _maNV;
  String get hoten => _hoTen;
  double get luongcoban => _luongCoBan;

  set manv(String maNV) => (maNV.isNotEmpty) ? _maNV = maNV : _maNV;
  set hoten(String hoTen) => (hoTen.isNotEmpty) ? _maNV = hoTen : _maNV;
  set luongcoban(double luongcoban) =>
      (luongcoban > 0) ? _luongCoBan = luongcoban : _luongCoBan;

  double tongLuong() {
    return _luongCoBan;
  }

  void hienThiThongTin() {
    print('Mã Nhân Viên : ${_maNV}');
    print('họ Tên : ${_hoTen}');
    print('Lương cơ bản : ${_luongCoBan}');
    print('Tổng Lương : ${tongLuong()}');
  }
}
