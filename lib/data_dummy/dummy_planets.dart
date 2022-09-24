import 'package:my_planets_app/data_model/planet.dart';

List<Planet> myPlanets = [
  Planet(
      id: 0,
      name: 'Merkurius',
      description:
          'Merkurius adalah planet terdekat dengan matahari dan planet terkecil di tata surya kita. Planet tersebut memiliki diameter sekitar 3.032 mil (4.880 kilometer) dan berukuran kurang dari setengah ukuran Bumi. Meskipun kecil, Merkurius mengelilingi matahari lebih cepat daripada planet lain di tata surya',
      rotation: '58 hari\n15 jam\n30 menit',
      revolution: '87,79 hari',
      liveable: false,
      image: 'assets/images/mercury.jpg',
      isFavourite: false),
  Planet(
      id: 1,
      name: 'Venus',
      description:
          'Venus adalah planet terdekat kedua dari Matahari setelah Merkurius. Planet ini mengorbit Matahari selama 224,7 hari Bumi. Venus tidak memiliki satelit alami dan dinamai dari dewi cinta dan kecantikan dalam mitologi Romawi.',
      rotation: '116 hari 18 jam',
      revolution: '225 hari',
      liveable: false,
      image: 'assets/images/venus.jpg',
      isFavourite: false),
  Planet(
      id: 2,
      name: 'Bumi',
      description:
          'Bumi adalah planet ketiga dari Matahari yang merupakan planet terpadat dan terbesar kelima dari delapan planet dalam Tata Surya. Bumi juga merupakan planet terbesar dari empat planet kebumian di Tata Surya. Bumi terkadang disebut dengan dunia atau Planet Biru.',
      rotation: '23 hari 56 menit',
      revolution: '365 hari',
      liveable: true,
      image: 'assets/images/earth.jpg',
      isFavourite: false),
  Planet(
      id: 3,
      name: 'Mars',
      description:
          'Mars adalah planet terdekat keempat dari Matahari. Namanya diambil dari dewa perang Romawi, Mars. Planet ini sering dijuluki sebagai "planet merah" karena tampak dari jauh berwarna kemerah-kemerahan. Ini disebabkan oleh keberadaan besi oksida di permukaan planet Mars.',
      rotation: '1 hari 37 menit',
      revolution: '687 hari',
      liveable: true,
      image: 'assets/images/mars.jpg',
      isFavourite: false),
  Planet(
      id: 4,
      name: 'Jupiter',
      description:
          'Jupiter atau Yupiter adalah planet terdekat kelima dari Matahari setelah Merkurius, Venus, Bumi, dan Mars. Planet ini juga merupakan planet terbesar di Tata Surya. Jupiter merupakan raksasa gas dengan massa seperseribu massa Matahari dan dua setengah kali jumlah massa semua planet lain di Tata Surya.',
      rotation: '9,9 jam',
      revolution: '12 tahun',
      liveable: false,
      image: 'assets/images/yupiter.jpg',
      isFavourite: false),
  Planet(
      id: 5,
      name: 'Saturnus',
      description:
          'Saturnus adalah planet keenam dari Matahari dan merupakan planet terbesar kedua di Tata Surya setelah Jupiter. Saturnus juga merupakan sebuah raksasa gas yang memiliki radius rata-rata sekitar 9 kali radius rata-rata Bumi.',
      rotation: '10 jam 34 menit',
      revolution: '29 tahun',
      liveable: false,
      image: 'assets/images/saturn.jpg',
      isFavourite: false),
  Planet(
      id: 6,
      name: 'Uranus',
      description:
          'Uranus adalah planet ketujuh dari Matahari. Uranus merupakan planet yang memiliki jari-jari terbesar ketiga sekaligus massa terbesar keempat di Tata Surya. Uranus juga merupakan satu-satunya planet yang namanya berasal dari tokoh dalam mitologi Yunani, dari versi Latinisasi nama dewa langit Yunani Ouranos.',
      rotation: '17 jam 14 menit',
      revolution: '84 tahun',
      liveable: false,
      image: 'assets/images/uranus.jpg',
      isFavourite: false),
  Planet(
      id: 7,
      name: 'Neptunus',
      description:
          'Neptunus merupakan planet terjauh (kedelapan) jika ditinjau dari Matahari. Planet ini dinamai dari dewa lautan Romawi. Neptunus merupakan planet terbesar keempat berdasarkan diameter (49.530 km) dan terbesar ketiga berdasarkan massa. Massa Neptunus tercatat 17 kali lebih besar daripada Bumi, dan sedikit lebih kecil daripada Uranus.',
      rotation: '16,1 jam',
      revolution: '165 tahun',
      liveable: false,
      image: 'assets/images/neptune.jpg',
      isFavourite: false),
  Planet(
      id: 8,
      name: 'Pluto',
      description:
          'Pluto adalah planet katai di sabuk Kuiper dan objek trans-Neptunus pertama yang ditemukan. Pluto merupakan planet katai terbesar dan bermassa terbesar kedua di Tata Surya dan benda terbesar kesembilan dan bermassa terbesar kesepuluh yang mengorbit Matahari secara langsung.',
      rotation: '6,4 hari',
      revolution: '248 tahun',
      liveable: false,
      image: 'assets/images/pluto.jpg',
      isFavourite: false),
  Planet(
      id: 9,
      name: 'Kepler 452b',
      description:
          'Kepler-452b adalah sebuah planet ekstrasurya yang mengorbit bintang serupa matahari. Eksoplanet ini terletak 1.402 tahun cahaya jauhnya dari bumi atau sekitar 430 parsec di konstelasi Cygnus. Eksoplanet ini telah diidentifikasi oleh Teleskop Luar Angkasa Hubble pada dipublikasikan pada tanggal 23 Juli 2015 oleh NASA.',
      rotation: 'Tidak ada data',
      revolution: '385 hari',
      liveable: true,
      image: 'assets/images/kepler452b.jpg',
      isFavourite: false),
  Planet(
      id: 10,
      name: 'Eris',
      description:
          'Eris adalah sebuah planet katai yang ditemukan pada hari Jumat, 29 Juli 2005 oleh tiga astronom dari Amerika Serikat, Profesor Mike Brown dan koleganya dari Institut Teknologi California, yang juga menemukan beberapa objek-objek serupa planet pada area Sabuk Kuiper.',
      rotation: '8 hari',
      revolution: '558 tahun',
      liveable: false,
      image: 'assets/images/eris.jpeg',
      isFavourite: false),
  Planet(
      id: 11,
      name: 'Proxima Centauri b',
      description:
          'Proxima Centauri b adalah sebuah eksoplanet yang mengorbit dalam zona layak huni dari bintang katai merah Proxima Centauri, bintang terdekat dengan Matahari. Planet ini terletak sekitar 4,2 tahun cahaya dari Bumi di konstelasi Centaurus.',
      rotation: 'Tidak ada data',
      revolution: '11 hari',
      liveable: true,
      image: 'assets/images/proximacentaurib.jpg',
      isFavourite: false),
];
