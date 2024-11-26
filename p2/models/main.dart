class SinhVien {
  String _hoTen;
  int _tuoi;
  String _maSV;
  double _diemTB;

  SinhVien(this._maSV, this._hoTen, this._diemTB, this._tuoi);

  String get hoten => _hoTen;
  String get masv => _maSV;
  double get diemtb => _diemTB;
  int get tuoi => _tuoi;

  set hoten(String hoTen) {
    if (hoten.isNotEmpty) {
      _hoTen = hoTen;
    }
  }

  set tuoi(int tuoi) => _tuoi = (tuoi > 0) ? tuoi : _tuoi;
  set masv(String masv) => {(masv.isNotEmpty) ? _maSV = masv : _maSV};
  set diemtb(double diemtb) =>
      _diemTB = (diemtb >= 0 && diemtb <= 10) ? diemtb : _diemTB;

  void hienThiThongTin() {
    print('Ho Ten : ${hoten}');
    print('Tuổi : ${tuoi}');
    print('Mã SV : ${masv}');
    print('Điểm TB : ${diemtb}');
  }

  String xepLoai() {
    switch (_diemTB) {
      case >= 8:
        return 'Giỏi';
      case >= 6.5 && < 8:
        return 'Khá';
      case >= 5 && < 6.5:
        return 'Trung Bình';
      default:
        return 'Yếu';
    }
  }
}
