import 'DienThoai.dart';

class Hoadon {
  String _maHoaDon;
  DateTime _ngayBan;
  Dienthoai _dienthoai;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoai;
  int _soLuongMua;

  Hoadon(this._maHoaDon, this._ngayBan, this._dienthoai, this._giaBanThucTe,
      this._tenKhachHang, this._soDienThoai, this._soLuongMua);

  // Getter và Setter với validation

  Dienthoai get dienthoai => _dienthoai;
  set dienthoai(Dienthoai value) {
    _dienthoai = value;
  }

  // Mã hóa đơn: không rỗng, định dạng "HD-XXX"
  String get maHoaDon => _maHoaDon;
  set maHoaDon(String value) {
    if (value.isNotEmpty && RegExp(r'^HD-\d{3}$').hasMatch(value)) {
      _maHoaDon = value;
    }
  }

  // Ngày bán: không sau ngày hiện tại
  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime value) {
    if (value.isBefore(DateTime.now()) ||
        value.isAtSameMomentAs(DateTime.now())) {
      _ngayBan = value;
    }
  }

  // Giá bán thực tế: > 0
  double get giaBanThucTe => _giaBanThucTe;
  set giaBanThucTe(double value) {
    if (value > 0) {
      _giaBanThucTe = value;
    }
  }

  // Thông tin khách hàng: không rỗng
  String get tenKhachHang => _tenKhachHang;
  set tenKhachHang(String value) {
    if (value.isNotEmpty) {
      _tenKhachHang = value;
    }
  }

  // Số điện thoại: đúng định dạng (ví dụ: 10 số)
  String get soDienThoai => _soDienThoai;
  set soDienThoai(String value) {
    if (RegExp(r'^\d{10}$').hasMatch(value)) {
      _soDienThoai = value;
    }
  }

  // Số lượng mua: > 0 và <= tồn kho
  int get soLuongMua => _soLuongMua;
  set soLuongMua(int value) {
    if (value > 0 && value <= _dienthoai.slTonKho) {
      _soLuongMua = value;
      _dienthoai.slTonKho -= value; // Cập nhật tồn kho
    }
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _giaBanThucTe * _soLuongMua;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    double loiNhuan1Sp = _giaBanThucTe - _dienthoai.giaNhap;
    return loiNhuan1Sp * _soLuongMua;
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTinHoaDon() {
    print("=== Thông Tin Hóa Đơn ===");
    print("Mã hóa đơn: $_maHoaDon");
    print("Ngày bán: $_ngayBan");
    print("Tên khách hàng: $_tenKhachHang");
    print("Số điện thoại: $_soDienThoai");
    print("Tên điện thoại: ${_dienthoai.tenDT}");
    print("Số lượng mua: $_soLuongMua");
    print("Giá bán thực tế: $_giaBanThucTe");
    print("Tổng tiền: ${tinhTongTien()}");
    print("Lợi nhuận thực tế: ${tinhLoiNhuanThucTe()}");
  }
}
