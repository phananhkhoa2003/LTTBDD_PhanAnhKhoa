import 'DienThoai.dart';
import 'HoaDon.dart';

class Cuahang {
  String _tenCuaHang;
  String _diaChi;
  List<Dienthoai> _danhSachDienThoai = [];
  List<Hoadon> _danhSachHoaDon = [];

  Cuahang(this._tenCuaHang, this._diaChi);

  String get tencuahang => _tenCuaHang;
  String get diachi => _diaChi;
  // Thêm điện thoại mới
  void themDienThoai(Dienthoai dt) {
    _danhSachDienThoai.add(dt);
    print("Đã thêm điện thoại: ${dt.tenDT}");
  }

  // Cập nhật thông tin điện thoại theo mã
  void capNhatDienThoai(String maDT, Dienthoai dtCapNhat) {
    for (int i = 0; i < _danhSachDienThoai.length; i++) {
      if (_danhSachDienThoai[i].maDT == maDT) {
        _danhSachDienThoai[i] = dtCapNhat;
        print("Cập nhật thành công điện thoại có mã $maDT");
        return;
      }
    }
    print("Không tìm thấy điện thoại với mã $maDT");
  }

  // Ngừng kinh doanh điện thoại
  void ngungKinhDoanhDienThoai(String maDT) {
    var dtList = _danhSachDienThoai.where((dt) => dt.maDT == maDT);
    if (dtList.isNotEmpty) {
      var dt = dtList.first;
      dt.trangThai = false;
      print("Điện thoại $maDT đã ngừng kinh doanh.");
    } else {
      print("Không tìm thấy điện thoại với mã $maDT.");
    }
  }

  // Tìm kiếm điện thoại theo mã, tên, hoặc hãng
  List<Dienthoai> timKiemDienThoai(
      {String? maDT, String? tenDT, String? hangSX}) {
    return _danhSachDienThoai
        .where((dt) =>
            (maDT != null && dt.maDT == maDT) ||
            (tenDT != null &&
                dt.tenDT.toLowerCase().contains(tenDT.toLowerCase())) ||
            (hangSX != null &&
                dt.hangSX.toLowerCase().contains(hangSX.toLowerCase())))
        .toList();
  }

  // Hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    print("Danh sách điện thoại trong cửa hàng:");
    for (var dt in _danhSachDienThoai) {
      dt.hienThiThongTin(); // Giả sử Dienthoai có phương thức này
    }
  }

  // ======= Phương thức quản lý hóa đơn =======

  // Tạo hóa đơn mới và cập nhật tồn kho
  void taoHoaDon(Hoadon hd) {
    if (hd.soLuongMua <= hd.dienthoai.slTonKho) {
      _danhSachHoaDon.add(hd);
      hd.dienthoai.slTonKho -= hd.soLuongMua;
      print("Hóa đơn ${hd.maHoaDon} đã được tạo thành công.");
    } else {
      print("Số lượng tồn kho không đủ để tạo hóa đơn.");
    }
  }

  // Tìm kiếm hóa đơn theo mã, ngày, hoặc tên khách hàng
  List<Hoadon> timKiemHoaDon(
      {String? maHD, DateTime? ngayBan, String? tenKhachHang}) {
    return _danhSachHoaDon
        .where((hd) =>
            (maHD != null && hd.maHoaDon == maHD) ||
            (ngayBan != null && hd.ngayBan.isAtSameMomentAs(ngayBan)) ||
            (tenKhachHang != null &&
                hd.tenKhachHang
                    .toLowerCase()
                    .contains(tenKhachHang.toLowerCase())))
        .toList();
  }

  // Hiển thị danh sách hóa đơn
  void hienThiDanhSachHoaDon() {
    print("Danh sách hóa đơn của cửa hàng:");
    for (var hd in _danhSachHoaDon) {
      hd.hienThiThongTinHoaDon(); // Giả sử Hoadon có phương thức này
    }
  }

  // ======= Phương thức thống kê =======

  // Tính tổng doanh thu theo khoảng thời gian
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    double doanhThu = 0;
    for (var hd in _danhSachHoaDon) {
      if (hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay)) {
        doanhThu += hd.tinhTongTien();
      }
    }
    return doanhThu;
  }

  // Tính tổng lợi nhuận theo khoảng thời gian
  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    double loiNhuan = 0;
    for (var hd in _danhSachHoaDon) {
      if (hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay)) {
        loiNhuan += hd.tinhLoiNhuanThucTe();
      }
    }
    return loiNhuan;
  }

  // Thống kê top điện thoại bán chạy
  void thongKeTopDienThoaiBanChay() {
    _danhSachDienThoai.sort((a, b) => b.slTonKho.compareTo(a.slTonKho));
    hienThiDanhSachDienThoai();
  }

  // Thống kê tồn kho
  void thongKeTonKho() {
    for (var dt in _danhSachDienThoai) {
      print("${dt.tenDT}: ${dt.slTonKho} chiếc");
    }
  }
}
