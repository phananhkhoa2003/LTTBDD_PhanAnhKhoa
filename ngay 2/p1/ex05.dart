import 'dart:io';

import 'dart:math';

void main() {
  double a = 0, b = 0, c = 0;

  do {
    stdout.write('nhap h so a (akhac 0 ): ');
    String? input = stdin.readLineSync();
    if (input != null) {
      a = double.tryParse(input) ?? 0;
    }

    if (a == 0) {
      print('he so a phai khac 0. Vui lòng nhập lại');
      continue;
    }
    stdout.write('nhap h so b (b khac 0 ): ');
    String? inputb = stdin.readLineSync();
    if (inputb != null) {
      b = double.tryParse(inputb) ?? 0;
    }
    stdout.write('nhap h so c (c khac 0 ): ');
    String? inputc = stdin.readLineSync();
    if (inputc != null) {
      c = double.tryParse(inputc) ?? 0;
    }
  } while (a == 0);

  // hien thi phuong trinh
  print('phuong trinh : ${a}x^2 +${b}x + ${c} = 0');

  // Tính discriminant (delta)
  double delta = b * b - 4 * a * c;

  // Kiểm tra các trường hợp dựa trên giá trị của delta
  if (delta > 0) {
    // Hai nghiệm phân biệt
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print('Phương trình có hai nghiệm phân biệt:');
    print('Nghiệm 1: x1 = $x1');
    print('Nghiệm 2: x2 = $x2');
  } else if (delta == 0) {
    // Một nghiệm kép
    double x = -b / (2 * a);
    print('Phương trình có một nghiệm kép: x = $x');
  } else {
    // Không có nghiệm thực
    print('Phương trình vô nghiệm trong tập số thực.');
  }
}
