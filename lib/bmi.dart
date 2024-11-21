String calculateCategory(double bmi) {
  if (bmi >= 40) {
    return "Obese (Class III)";
  } else if (bmi >= 35) {
    return "Obese (Class II)";
  } else if (bmi >= 30) {
    return "Obese (Class I)";
  } else if (bmi >= 25) {
    return "Overweight (Pre-obese)";
  } else if (bmi >= 18.5) {
    return "Normal range";
  } else if (bmi >= 17) {
    return "Underweight (Mild thinness)";
  } else if (bmi >= 16) {
    return "Underweight (Moderate thinness)";
  } else {
    return "Underweight (Severe thinness)";
  }
}

class Bmi {
  static (double, String) calculate({required int weightKg, required int heightCm}) {
    double heightM = heightCm / 100;
    double bmi = weightKg / (heightM * heightM);

    String category = calculateCategory(bmi);  // เรียกฟังก์ชันที่ใช้ตรวจสอบ category
    
    return (bmi,category);
  }
}
