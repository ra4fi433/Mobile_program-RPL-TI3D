// Jobsheet 1
// MUHAMMAD RAAFI HARTYADI/RPL_TI3D/4.33.25.8.03
// MOBILE DEV Program

// latihan 1
// penampung variable data resto
// ----------------------String Type
String restaurant = "Electra Seafood";
String sejak = "2023";
String pemilik = "Mbok Yem";
String loc = "JL. Prof. Soedarto, SH, Tembalang";
String jam = "Buka (Buka/Tutup)";
// ----------------------String type

// ----------------------Map type(menu)
Map<String, int> makan = {
  'Kepiting rebus': 40000,
  'Nasi Goreng': 20000,
  'Udang Asam Manis': 50000,
  'Sate Cumi': 30000,
};

Map<String, int> minum = {'Es Jeruk': 5000, 'Es Teh': 2000, 'Es Jus': 6000};
// ----------------------Map type(menu)

// latihan 2
// rumus lingkaran
//-----deklarafi/definisi class lingkaran
class Circle {
  final double phi; //definsi data tipe double dalam rumus(phi)
  final double diameter; //definisi data tipe double untuk diameter lingkaran

  Circle(this.phi, this.diameter); //deklarasi penampung nilai
  // rumus lingkaran
  double get area => phi * (diameter * diameter) / 4; //---untuk luas
  double get radius => phi * diameter; //----untuk keliling
  // rumus lingkaran
}
//-----deklarasi/definisi class lingkaran

// harga diskon
//--------deklarasi class diskon
class Discount {
  final double discount; //deklarasi tipe data diskon (double)
  final double price; // deklarasi tipe data harga

  Discount(this.discount, this.price); //deklarasi penampung nilai diskon, harga

  double get diskon => price * (discount / 100); // rumus harga diskon
  double get hargaTotal =>
      price - diskon; // rumus harga total setelah mendapat diskon
}
//--------deklarasi class diskon

// rumus suhu
//--------deklarasi class rumus konversi suhu cecius
class Thermal {
  final double celcius; //deklarasi tipe data suhu celcius

  Thermal(this.celcius); // deklarasi penampung suhu c

  double get reamur => celcius * (4 / 5); // celcius ke reamur
  double get farenheit => ((9 / 5) * celcius) + 32; // celcius ke farenheit
}
//--------deklarasi class rumus konversi suhu cecius

void main() {
  print("# Latihan 1");
  // ----- print string
  print(
    "Restoran \t$restaurant \nSejak \n \t$sejak \nPemilik \n $pemilik \nAlamat: \n $loc \nStatus buka: \n\t $jam\n",
  );
  // ----- print string
  //-----print menu list
  print("Daftar menu :");

  // loop dengan forEach untuk mencetak dengan per baris
  makan.forEach((item, price) {
    print('\t $item: $price');
  });
  print("\nDaftar Minum :");
  minum.forEach((item, price) {
    print('\t $item: $price');
  });
  //-----print menu list

  print("\n# Latihan 2");

  // print rumus lingkaran-------------
  final myCirc = Circle(3.14, 14.0); // deklarasi phi dan diameter

  print('\n--- Circle Calculations ---');
  print(
    'phi: \n\t${myCirc.phi}\nDiamter: \n\t${myCirc.diameter}',
  ); // print phi dan diameter
  print('Luas: \n\t${myCirc.area}'); //cetak hasil luas lingkaran
  print('Keliling: \n\t${myCirc.radius}'); // cetak hasil keliling lingkaran
  // print rumus lingkaran-------------

  // print harga diskon----------------
  final hargaDiskon = Discount(10.0, 750000.0); // deklarasi diskon, harga

  print('\n--- Diskon Sepatu ---');
  print(
    '\tharga sepatu: ${hargaDiskon.price}\n diskon: ${hargaDiskon.discount}% \n ',
  ); //cetak harga awal dan diskon
  print(
    '\tDiskon(Rp): Rp ${hargaDiskon.diskon}\n Total Harga : Rp ${hargaDiskon.hargaTotal} ',
  ); //cetak harga diskon dan harga total
  // print harga diskon----------------

  // print rumus lingkaran-------------
  final suhu = Thermal(50.0); //deklarasi suhu dalam celcius

  print('\n--- Rumus Celcius ---');
  print(
    '\tsuhu celcius: ${suhu.celcius} derajat Celcius\n\tsuhu Reamur: ${suhu.reamur} Derajat reamur\n\tsuhu Farenheit: ${suhu.farenheit} derajat Farenheit',
  ); //cetak suhu celcius, suhu reamur, dan farenheit berdasar rumus konversi
  // print rumus lingkaran-------------
}
