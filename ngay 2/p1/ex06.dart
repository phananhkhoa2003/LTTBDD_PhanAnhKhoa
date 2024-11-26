import 'dart:io';

import 'dart:math';

// chuyen doi 1 so nguyên thành số nhị phân
void chuyenDoiSoNguyenThanhSoNhiPhan() {
  int a = 0;
  do {
    stdout.write('nhap h so a (a >=  0 ): ');
    String? input = stdin.readLineSync();
    if (input != null) {
      a = int.tryParse(input) ?? 0;
    }
    if (a <= 0) {
      print("vui long nhap so khac");
      continue;
    }

    String binaryString = a.toRadixString(2);

    print('nhi phan la: ' + binaryString);
  } while (a <= 0);
}

// viet chương trình tính tổng các ước số của một số nguyên được nhập từ bàn phím

void timUocSoCuaSoNguyen() {
  int a = 0;
  int sum = 0;
  do {
    stdout.write('nhap he so a là so nguuyen: ');
    String? input = stdin.readLineSync();
    if (input != null) {
      a = int.tryParse(input) ?? 0;
    }
    if (a == 0) {
      print("vui long nhap so khac");
      continue;
    }
    if (a == 1 || a == -1) {
      sum = 1;
      break;
    }

    if (a < 0) {
      int b = -a;
      sum += b;
      for (int i = 1; i <= sqrt(b); i++) {
        if ((b % i) == 0) {
          sum += i;
        }
      }
    } else {
      sum += a;
      for (int i = 1; i <= sqrt(a); i++) {
        if ((a % i) == 0) {
          sum += i;
        }
      }
    }
  } while (a == 0);

  print('tong cua uoc so la: ${sum}');
}

void main() {
  // chuyenDoiSoNguyenThanhSoNhiPhan();
  timUocSoCuaSoNguyen();
}
