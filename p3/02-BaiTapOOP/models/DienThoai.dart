class Dienthoai {
  String _maDT;
  String _tenDT;
  String _hangSX;
  double _giaNhap;
  double _giaBan;
  int _slTonKho;
  bool _trangThai;

  Dienthoai(this._maDT, this._tenDT, this._hangSX, this._giaNhap, this._giaBan,
      this._slTonKho, this._trangThai);

  // Getter và Setter với validation

  // Mã điện thoại: không rỗng, định dạng "DT-XXX"
  String get maDT => _maDT;
  set maDT(String value) {
    if (value.isNotEmpty && RegExp(r'^DT-\d{3}$').hasMatch(value)) {
      _maDT = value;
    } 
  }

  // Tên điện thoại: không rỗng
  String get tenDT => _tenDT;
  set tenDT(String value) {
    if (value.isNotEmpty) {
      _tenDT = value;
    } 
  }

  // Hãng sản xuất: không rỗng
  String get hangSX => _hangSX;
  set hangSX(String value) {
    if (value.isNotEmpty) {
      _hangSX = value;
    } 
  }

  // Giá nhập: > 0
  double get giaNhap => _giaNhap;
  set giaNhap(double value) {
    if (value > 0) {
      _giaNhap = value;
    } 
  }

  // Giá bán: > 0 và lớn hơn giá nhập
  double get giaBan => _giaBan;
  set giaBan(double value) {
    if (value > _giaNhap) {
      _giaBan = value;
    } 
  }

  // Số lượng tồn kho: >= 0
  int get slTonKho => _slTonKho;
  set slTonKho(int value) {
    if (value >= 0) {
      _slTonKho = value;
    } 
  }

  // Trạng thái kinh doanh
  bool get trangThai => _trangThai;
  set trangThai(bool value) {
    _trangThai = value;
  }

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuan() {
    return _giaBan - _giaNhap;
  }

  // Phương thức hiển thị thông tin điện thoại
  void hienThiThongTin() {
    print("Mã DT: $_maDT");
    print("Tên DT: $_tenDT");
    print("Hãng SX: $_hangSX");
    print("Giá nhập: $_giaNhap");
    print("Giá bán: $_giaBan");
    print("Số lượng tồn kho: $_slTonKho");
    print(
        "Trạng thái kinh doanh: ${_trangThai ? 'Đang kinh doanh' : 'Ngừng kinh doanh'}");
    print("Lợi nhuận dự kiến: ${tinhLoiNhuan()}");
  }

  // Phương thức kiểm tra có thể bán không (còn hàng và đang kinh doanh)
  bool coTheBan() {
    return _slTonKho > 0 && _trangThai;
  }
}
