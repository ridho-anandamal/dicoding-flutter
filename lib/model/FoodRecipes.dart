// ignore_for_file: file_names

class FoodRecipes {
  late String title;
  late String imageCover;
  late String shortDescription;
  late List<String> description;
  late String articleSource;
  late List<String> tags;
  late List<String> ingredients;
  late List<Object> steps;

  FoodRecipes(
      {required this.title,
      required this.imageCover,
      required this.shortDescription,
      required this.description,
      required this.articleSource,
      required this.tags,
      required this.ingredients,
      required this.steps});
}

var foodRecipesList = [
  FoodRecipes(
    title: 'Resep Sate Ayam Ponorogo',
    imageCover: 'images/sate-ayam-ponorogo.jpg',
    shortDescription:
        'Kelezatan sate ayam Ponorogo yang terkenal ini ternyata bisa kita sajikan sendiri di rumah.',
    description: [
      'Dari sekian banyak jenis sate di Indonesia, sate ayam Ponorogo jadi salah satu sajian yang wajib dicoba. Ada kedai sate di sana yang jadi langganan para pejabat hingga presiden. Rasanya memang bikin rindu!',
      'Pada dasarnya bumbu yang digunakan untuk membuat sate ayam Ponorogo tidaklah banyak berbeda. Bumbu yang digunakan adalah bumbu kacang. Perbedaannya terletak ada potongan sate yang tidak setebal sate maranggi. Daging disayat tipis seperti fillet sehingga lebih mudah matang dan menyerap bumbu. Sebelum dibakar, dagingnya juga dimarinasi atau dibacem terlebih dahulu hingga bumbunya menyerap dengan sempurna. Untuk bumbu kacangnya, kita bisa membuat dengan resep yang tak jauh berbeda dengan satu ayam Madura.',
      'Tanpa berlama-lama lagi, yuk kita langsung ke dapur untuk mencoba memasaknya!',
    ],
    tags: [
      'ARISAN',
      'AYAM',
      'BUKA PUASA',
      'GURIH',
      'JAWA TENGAH',
      'KOMPOR',
      'MANIS',
      'MASAKAN UTAMA',
      'TIDAK PEDAS',
    ],
    ingredients: [
      '500g ayam kampung, ambil dagingnya.',
      '4 buah lontong, iris 1 cm',
      '2 sdm bawang merah goreng',
      '5 butir bawang merah',
      '2 siung bawang putih',
      '2 butir kemiri, sangrai',
      '1 cm lengkuas',
      '½ sdt ketumbar butir, haluskan',
      '¼ sdt jintan',
      '¼ sdt gula merah',
      '¼ sdt garam',
      '4 sdm minyak ayam (100 gram kulit ayam, masak dengan api kecil)',
      '4 sdm Bango Kecap Manis',
      '1 sdm gula merah',
      '100 gr kacang tanah goreng',
      '1 sdt garam',
      '3 buah cabai merah keriting',
      '300 ml air ',
      '2 butir kemiri, sangrai',
      '1 sdt gula merah',
      '1 siung bawang putih',
    ],
    steps: [
      'Iris daging ayam dan potong berbentuk dadu. Haluskan bumbu perendam, lalu lumuri seluruh permukaan daging ayam. Diamkan kurang lebih selama 20 menit hingga 1 jam.',
      'Daging ayam yang telah dibumbui dimasukkan ke dalam tusukkan sate. Sisihkan',
      'Siapkan pembakaran, lalu bakar sate ayam. Sesekali balur daging dengan sisa bumbu pencelup. Setelah matang merata, angkat.',
      'Kita siapkan bumbu kacang. Pertama, haluskan atau blender kacang yang telah digoreng, kemiri, dan cabai merah keriting.',
      'Siapkan panci kecil. Masukkan air, garam gula merah, dan kacang beserta cabai yang telah dihaluskan.',
      'Masak hingga mengental, lalu angkat. Siram sate ayam Ponorogo dengan saus kacang. Taburkan bawang merah goreng di atasnya. Sajikan selagi hangat dengan lontong.'
    ],
    articleSource:
        'https://www.masakapahariini.com/resep/resep-sate-ayam-ponorogo/',
  ),
  FoodRecipes(
    title: 'Resep Ayam Opor Tanpa Santan',
    imageCover: 'images/opor-ayam.jpg',
    shortDescription:
        'Menu beken saat Lebaran ini bisa dibuat sehat tanpa mengurangi kelezatannya.',
    description: [
      'Menu ayam opor sudah menjadi tradisi tersendiri untuk disajikan saat Lebaran. Dari beragam masakan Lebaran yang serba santan dan daging, pastinya ada dong satu saja yang bisa kita modifikasi agar lebih sehat. Nah sekaligus meneruskan pola hidup sehat selama Ramadhan, bagaimana kalau aku bagi resep ayam opor tanpa santan berikut ini? Yuk, kita coba masak untuk Idul Fitri tahun ini!',
      'Apa saja sih yang biasa tersedia di meja makan rumahmu saat Lebaran? Di rumahku biasanya selalu ada menu-menu klasik. Sebut saja contohnya ketupat, rendang daging, kari daging dan kentang, ati ayam, sayur cabai hijau dan tahu, dan pastinya ayam opor. Dalam rangka ingin menjaga pola makan yang baik setelah sebulan berpuasa, beberapa tahun terakhir ini aku telah mengajak keluargaku agar tetap bisa konsisten sesudahnya. Ramadhan benar-benar bisa mengajarkan banyak hal, termasuk di antaranya adalah hidup sehat.',
      'Momen memulainya kembali tentunya adalah di saat Lebaran. Meski ada saja suara keberatan, akhirnya aku berkesempatan untuk membuat resep ayam opor tanpa santan sebagai pengganti yang biasanya. Biarpun tanpa santan, resep opor ayam bisa tetap lezat untuk dinikmati kok teman-teman. Dengan paduan bumbu dan rempah yang tepat, rasa gurih dan berisi dari santan tetap bisa terimbangi bahkan oleh susu cair rendah lemak. Suara-suara keberatan tadipun berangsur-angsur menghilang. Ah, bangga sekali rasanya bisa memasak yang enak untuk keluarga tercinta!',
      'Susu cair rendah lemak menjadi pengganti santan yang pas. Rupa-rupanya, bahan yang satu ini sangat cocok untuk berbagai menu tradisional — bahkan seperti resep ayam opor ini. Penasaran cara memasaknya? Dengan berbekal Royco Kaldu Ayam, yuk kita coba masak bersama opor ayam sehat untuk Idul Fitri tahun ini!',
    ],
    tags: [
      'ARISAN',
      'AYAM',
      'BUKA PUASA',
      'GURIH',
      'IDUL ADHA',
      'IDUL FITRI',
      'KOMPOR',
      'MASAKAN UTAMA',
      'REBUS',
      'SAHUR',
      'SEHAT',
      'TIDAK PEDAS',
      'TUMIS',
    ],
    ingredients: [
      '300g ayam, potong 4 bagian',
      '750ml susu cair rendah lemak',
      '2 batang serai, memarkan',
      '5 lembar daun jeruk purut',
      '3 lembar daun salam',
      '4 sdm minyak sayur',
      '5 siung bawang putih',
      '10 siung bawang merah',
      '3 batang lengkuas',
      '3 buah kencur',
      '6 buah kemiri, sangrai',
      '3 sdt ketumbar butiran, sangrai',
      '½ sdt jintan, sangrai',
      '2 sdm gula merah, sisir',
      '2 sdt lada putih butiran',
      '2 sdt Royco Kaldu Ayam',
    ],
    steps: [
      'Siapkan bahan-bahan bumbu halus termasuk Royco Kaldu Ayam, lalu haluskan dengan diulek atau gunakan food processor.',
      'Panaskan minyak lalu tumis bumbu halus, serai, daun jeruk, dan daun salam. Masak hingga harum.',
      'Masukkan susu cair rendah lemak dan ayam. Masak di atas api sedang hingga ayam menjadi matang.',
      'Aduk sesekali hingga mendidih. Kecilkan api, lanjutkan memasak hingga kuah agak berminyak.',
      'Opor ayam tanpa santan siap disajikan dengan taburan bawang merah goreng dan nasi putih ataupun ketupat.'
    ],
    articleSource:
        'https://www.masakapahariini.com/resep/resep-ayam-opor-tanpa-santan/',
  ),
  FoodRecipes(
    title: 'Resep Es Leci Yogurt Creamy',
    imageCover: 'images/leci-yougurt.jpg',
    shortDescription:
        'Es leci yogurt yang asam manis bisa menyegarkan akhir pekan di rumah.',
    description: [
      'Es leci yoghurt creamy adalah opsi yang tepat saat kamu menginginkan minuman dingin di akhir pekan. Perpaduan buah leci, yoghurt, dan jus leci menyatukan rasa manis, asam, dan segar. Untuk rasa yang maksimal, sebaiknya sajikan selagi dingin.',
      'Ada banyak jenis es leci yang bisa ditemui di restoran maupun kafe. Di resep ini, aku berbagi satu varian es leci yang menyerupai milkshake dengan tekstur yang kental. Supaya lebih praktis, aku pakai buah leci kalengan yang akan menjadi isian sekaligus topping. Sedangkan jusnya, aku gunakan Buavita Lychee yang tidak hanya memperkuat rasa leci melainkan juga mengandung vitamin C serta memberi kesegaran. Untuk yoghurt, aku gunakan rasa yang plain. ',
      'Kali ini, kita tidak akan menggunakan es batu dalam resep. Maka, simpan semua bahan di kulkas untuk memberi rasa dingin. Langsung kita siapkan saja bahan-bahannya! Untuk berikutnya, kamu juga bisa mencoba resep minuman lain yang tidak kalah segar seperti guava greetings jus jambu segar dan es kelapa muda jelly jeruk.',
    ],
    tags: [
      'ARISAN',
      'ASAM',
      'BUKA PUASA',
      'IDUL ADHA',
      'IDUL FITRI',
      'IMLEK',
      'MANIS',
      'MASAKAN INTERNASIONAL',
      'MASAKAN PERKAWINAN',
      'MINUMAN',
      'NATAL',
      'PRAKTIS DAN MUDAH',
      'SAHUR',
      'TAHUN BARU',
      'TIDAK DIMASAK',
      'TIDAK PEDAS',
      'ULANG TAHUN',
      'VALENTINE',
    ],
    ingredients: [
      '200g buah leci kalengan',
      '500ml Buavita Lychee',
      '300g yoghurt',
    ],
    steps: [
      'Ambil 100 g buah leci, cincang halus. Sisihkan.',
      'Panaskan minyak lalu tumis bumbu halus, serai, daun jeruk, dan daun salam. Masak hingga harum.',
      'Masukkan Buavita Lychee dan yoghurt ke dalam blender. Proses hingga halus.',
      'Aduk rata bersama leci cincang. Tuang ke dalam gelas saji yang sudah diisi dengan leci utuh. Sajikan.',
    ],
    articleSource:
        'https://www.masakapahariini.com/resep/resep-es-leci-yogurt-creamy/',
  ),
  FoodRecipes(
    title: 'Resep Pizza Tahu',
    imageCover: 'images/pizza-tahu.jpg',
    shortDescription:
        'Pizza tahu begitu sederhana dan kaya rasa serta begitu mudah dibuatnya.',
    description: [
      'Pizza Tahu yang satu ini bisa menjadi pemberi semangat untuk kamu mencoba resep-resep unik bergaya Barat di dapur. Tidak semua resep dari Barat itu sulit dan bahan-bahannya susah. Buktinya resep yang satu ini memiliki gaya ketimuran dan bisa dimasak siapa saja. Bahkan kalau dari tingkat kesulitan dan kekayaan bahan, acapkali masakan tradisional Indonesia yang menjadi juaranya.',
      'Pertama-tama, tidak perlu membayangkan sulitnya menyiapkan adonan roti untuk pizza. Dengan resep ini, kamu bisa membuatnya sekaligus jadi semua. Hanya saja bila kamu ingin menggunakan roti pizza, kamu bisa cukup mempersiapkan toppingnya dan membeli adonan pizza siap panggang. Tentunya ada sedikit perubahan dari cara memasaknya, tapi tentunya bukan hal yang mustahil untuk para pemula di dapur untuk membuatnya. Jadikanlah resep menarik ini sebagai pemberi semangatmu memasak untuk keluarga tercinta.',
    ],
    tags: [
      'ARISAN',
      'BUKA PUASA',
      'GURIH',
      'KOMPOR',
      'MASAKAN INTERNASIONAL',
      'MASAKAN UTAMA',
      'PANGGANG',
      'REBUS',
      'SAYURAN',
      'SEHAT',
      'TAHUN BARU',
      'TIDAK PEDAS',
      'ULANG TAHUN',
      'VALENTINE',
      'VEGETARIAN',
    ],
    ingredients: [
      '100g tahu sutera, potong dadu',
      '30g bawang bombay, iris tipis',
      '20g paprika merah, potong dadu',
      '20g paprika hijau, potong dadu',
      '10g tepung tapioka',
      '200g telur ayam ukuran sedang',
      '50ml susu cair',
      '150g keju, parut',
      '1s dt Royco Kaldu Ayam',
      '30g margarin',
    ],
    steps: [
      'Campurkan telur, Royco Kaldu Ayam, susu segar, dan tepung tapioka. Aduk rata.',
      'Panaskan margarin, tambahkan telur yang sudah dicampur. Masak dengan api kecil.',
      'Masukkan tahu Jepang, paprika merah, bawang bombay, dan paprika hijau.',
      'Tutup panci dan tunggulah hingga benar-benar matang.',
      'Taburkan keju parut sesudahnya lalu siap untuk disantap.',
    ],
    articleSource: 'https://www.masakapahariini.com/resep/resep-pizza-tahu/',
  ),
];
