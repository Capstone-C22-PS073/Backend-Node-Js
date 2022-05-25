-- Database : 'toursight_database'
CREATE DATABASE IF NOT EXISTS toursight_database;

-- CREATE USER 'ts_user'@'localhost' IDENTIFIED BY 'tsdatabase';
-- GRANT ALL ON toursight_database.* to 'mysql_user'@'localhost';
-- FLUSH PRIVILEGES;

USE toursight_database;

-- CREATE TABEL
CREATE TABLE IF NOT EXISTS `users` (
`id` INTEGER (12) NOT NULL AUTO_INCREMENT, 
`username` VARCHAR(20) UNIQUE, 
`email` VARCHAR(100) UNIQUE, 
`password` VARCHAR(100), 
`refresh_token` TEXT, 
`createdAt` DATETIME NOT NULL, 
`updatedAt` DATETIME NOT NULL, 
PRIMARY KEY (`id`)) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `toursight` (
`id` INTEGER NOT NULL AUTO_INCREMENT, 
`name` VARCHAR(100), 
`location` VARCHAR(200), 
`category` VARCHAR(50), 
`image` VARCHAR(200), 
`deskripsi` TEXT, 
PRIMARY KEY (`id`)) ENGINE=InnoDB;


--  Dummy Data
INSERT INTO `toursight` (`id`, `name`, `location`, `category`, `image`, `deskripsi`) VALUES
(1, 'Monumen Nasional (Monas)', 'Gambir, Kecamatan Gambir, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta', 'Monumen', 'images/monas.jpg', 'Populer dengan nama Monas atau Tugu Monas, landmark Indonesia satu ini sudah lama menjadi ikon kebanggaan masyarakat Indonesia. Memiliki tinggi 132 meter, monumen ini diprakarsai oleh presiden pertama Ir. Soekarno untuk mengenang perlawanan dan perjuangan rakyat Indonesia untuk merebut kemerdekaan.\r\nPembangunannya sendiri dimulai sejak 17 Agustus 1961 dan dibuka untuk umum pada tanggal 12 Juli 1975. Sejak saat itu, landmark Indonesia ini menjadi salah satu identitas dari Ibukota Jakarta. Ciri khas dari landmark ini adalah lapisan emas yang membentuk kobaran api pada puncak tugu megah ini.'),
(2, 'Tugu Jogja', 'Gowongan, Kec. Jetis, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55233', 'Monumen', 'images/tugujogja.jpg', 'Berlokasi di persimpangan Jalan Jenderal Sudirman dan Jalan Margo Utomo, Tugu Yogyakarta yang kerap disingkat menjadi Tugu Jogja ini telah lama menjadi salah satu ikon dari Kota Yogyakarta. \r\nNamun, landmark ikonik yang berdiri sekarang ternyata bukanlah tugu pertama yang berdiri di lokasi ini. Tugu yang berdiri kokoh sekarang ini dibangun oleh pemerintah Belanda setelah tugu sebelumnya yang bernama Tugu Golong-Gilig yang dibangun Hamengkubuwana I runtuh akibat gempa.\r\nSelain itu, tahukah kamu bahwa landmark populer ini tak hanya punya nilai sejarah namun juga magis? Tugu ini dibangun sebagai nilai simbolis dan merupakan garis yang bersifat magis menghubungkan laut selatan, kraton Jogja dan gunung Merapi.'),
(3, 'Candi Borobudur', 'Desa Borobudur, Kecamatan Borobudur, Kabupaten Magelang, Jawa Tengah', 'Monumen', 'images/borobudur.jpg', 'Landmark ini termasuk daftar tujuh keajaiban dunia, Candi Borobudur ini merupakan tempat beribadah umat agama Buddha.Candi Borobudur  melambangkan alam semesta dalam agama Buddha, terdapat 3 tingkatan dibedakan berdasarkan relief-relief candi, semesta dibagi menjadi tiga tingkat yaitu kamadhatu (dunia keinginan), rupadhatu (dunia berbentuk) dan arupadhatu (dunia tak terbentuk).\r\nBangunan Candi Borobudur sendiri dibangun pada abad ke-8 Masehi, Candi ini mulai diresmikan menjadi tempat wisata pada 15 Juli 1980.\r\nTahukah kamu, landmark ini termasuk sebagai Pusaka Budaya Dunia oleh UNESCO pada 1991, dan menjadi kebanggaan Indonesia.'),
(4, 'Candi Prambanan', 'Kelurahan Bokoharjo, kapanéwon Prambanan, Kabupaten Sleman, Daerah Istimewa Yogyakarta,dan di Desa Tlogo, Kecamatan Prambanan, Kabupaten Klaten, Jawa Tengah', 'Monumen', 'images/candiprambanan.jpg', 'Candi Prambanan merupakan candi Hindu terbesar di Indonesia sekaligus salah satu candi yang terindah di Asia Tenggara dan juga Situs Warisan Dunia UNESCO. Candi Prambanan terletak di 2 tempat yaitu di Kelurahan Bokoharjo dan di Desa Tlogo.\r\nMenurut prasasti Siwagrha, candi ini mulai dibangun pada sekitar tahun 850 masehi oleh Rakai Pikatan, dan terus dikembangkan dan diperluas oleh Balitung Maha Sambu, pada masa kerajaan Medang Mataram. Tetapi Sampai saat ini belum dapat dipastikan kapan candi ini dibangun dan atas perintah siapa.\r\nTahukah kamu? Candi Prambanan ini dihiasi relief yang menceritakan kisah Ramayana dan Krishnayana. Kisah Ramayana dimulai dari kelahiran Rama, penculikan Sinta (istri Rama) oleh Rahwana, upaya penyelamatan Sinta oleh Hanoman (panglima kera), pertemuan kembali Rama dan Sinta, hingga penyerahan tahta Rama kepada anaknya. Pemugarannya pun memakan waktu yang sangat panjang.'),
(5, 'Garuda Wisnu Kencana', 'Desa Ungasan, Kecamatan Kuta Selatan, Kabupaten Badung, Provinsi Bali', 'Monumen', 'images/garudawisnukencana.jpg', ' Garuda Wisnu Kencana ini merupakan landmark ikonik Bali, yang menggambarkan sosok Dewa Wisnu (Batara Wisnu) menunggangi tunggangannya Garuda sebagai symbol Amerta atau kebajikan yang abadi, dengan tinggi 121 meter.\r\nLandmark ikonik Bali ini, karya salah satu pematung asal Bali yaitu Nyoman Nuarta serta merupakan patung terbesar di dunia. Garuda Wisnu Kencana diangun pertama kali pada tahun 1997, tetapi pada tahun 1998 pembangunan sempat terhenti tetapi baru diresmikan pada 22 September 2018.'),
(6, 'Gedung Sate', 'Jl. Diponegoro No.22 Bandung, Provinsi Jawa Barat', 'Monumen', 'images/gedungsate.jpg', 'Gedung sate merupakan landmark ikon dari Kota Bandung yang sangat popular. Gedung Sate saat ini berfungsi sebagai Kantor Gubernur Kepala Daerah Propinsi Jawa Barat. Gedung Sate pada Zaman Kolonial Belanda dikenal dengan nama bangunan Gouvernements Bedrijven disingkat \"GB\" atau Pusat Instansi Pemerintahan.\r\nAwal bangunan dimulai dengan peletakan batu pertama pada tanggal 27 Juli 1920, oleh Nona Johanna Catherina Coops, dirancang oleh arsitek Belanda Ir. J. Gerber dari Jawatan Gedung-gedung Negara (landsgebouwendients), dibantu oleh sebuah tim yang terdiri dari: Kol. Genie (Purn.) V.L. Slor dari Genie Militair, Ir. E.H. De Roo dan Ir. G. Hendriks yang mewakili Burgerlijke Openbare Werken (B.O.W) atau DPU sekarang dan Gemeentelijk Bouwbedriff (Perusahaan bangunan Kotapraja) Bandung. Selama kurun waktu 4 tahun pada bulan September 1924 berhasil diselesaikan pembangunan induk bangunan utama Gouverments Bedrijven.\r\nPada dinding fasade depan Gedung Sate terdapat ornamen berciri tradisional, seperti pada bangunan candi-candi Hindu. Sedangkan ditengah-tengah bangunan induk Gedung Sate, tegak berdiri menara dengan atap bersusun atau yang disebut \"tumpang\" seperti Meru di Bali atau atap Pagoda. Bagian atasnya yang menjulang menyerupai tusukan sate, karenanya secara popular rakyat memberi nama gedung itu \"Gedung Sate\".'),
(7, 'Istana Maimun', 'Jln Brigjen Katamso, Kelurahan Sukaraja, Kecamatan Medan Maimun, Kota Medan, Provinsi Sumatera Utara', 'Monumen', 'images/istanamaimun.jpg', 'Istana Maimun adalah istana Kesultanan Deli yang merupakan salah satu ikon Kota Medan, Sumatra Utara. Nama Maimun sendiri diambil dari nama permaisuri sultan yang bernama Siti Maimunah. Kata maimun berasal dari bahasa Arab yang berarti berkah, dan menjadi bukti cinta sultan kepada permaisurinya.\r\nIstana Maimun dibangun atas perintah Sultan Deli, yaitu Sultan Ma’moen Al Rasyid. Pembangunan dimulai pada tahun 1888, dan selesai pada tahun 1891. Istana Maimun didesain oleh arsitek Capt. Theodoor van Erp, seorang tentara Kerajaan Belanda yang dibangun atas perintah Sultan Deli, Sultan Mamoen Al Rasyid.\r\nTahukah kamu? Istana Maimun ini menjadi saksi bisu pemerintahan empat Sultan Melayu yang menempatinya.'),
(8, 'Jam Gadang', 'Jl. Raya Bukittinggi - Payakumbuh, Benteng Ps. Atas, Kec. Guguk Panjang, Kota Bukittinggi, Sumatera Barat', 'Monumen', 'images/jamgadang.jpg', 'Landmark peninggalan era Hindia-Belanda tersebut seakan identik dengan Sumatera Barat. Monumen Jam Gadang berdiri setinggi 26 meter. Menara jam ini memiliki jam dengan ukuran besar di empat sisinya sehingga dinamakan Jam Gadang, sebutan bahasa Minangkabau yang berarti \"jam besar\". Landmark ini menjadi lokasi peristiwa penting pada masa sekitar kemerdekaan Indonesia, seperti pengibaran bendera merah putih (1945), Demonstrasi Nasi Bungkus (1950), dan pembunuhan 187 penduduk setempat oleh militer Indonesia atas tuduhan terlibat Pemerintahan Revolusioner Republik Indonesia (1959).\r\nJam Gadang dibangun pada 1926–1927 atas inisiatif Hendrik Roelof Rookmaaker, controleur atau sekretaris kota Fort de Kock (sekarang Kota Bukittinggi) pada masa pemerintahan Hindia Belanda.Jamnya merupakan hadiah dari Ratu Belanda Wilhelmina.'),
(9, 'Jembatan Ampera', 'Kota Palembang, Provinsi Sumatra Selatan', 'Monumen', 'images/jembatanampera.jpg', 'Jembatan Ampera (Amanat Penderitaan Rakyat) telah menjadi semacam lambang kota, terletak di tengah-tengah Kota Palembang, menghubungkan daerah Seberang Ulu dan Seberang Ilir yang dipisahkan oleh Sungai Musi. Jembatan Ampera merupakan ikon kota Palembang yang paling terkenal. Panjang Jembatan ini yaitu 1.177 m, lebar 22 m, tinggi 63 meter dan jarak antara menara 75 meter.\r\nJembatan Ampera dibangun pada tahun 1962 dengan biaya pembangunan yang diambil dari perampasan perang Jepang. Tak hanya itu, jembatan ini pun menggunakan tenaga ahli dari negara Jepang. Proses pembangunan jembatan ini memakan waktu tiga tahun.Sebelum dinamai Jembatan Ampera sempat diberi nama Jembatan Soekarno, tetapi Soekarno tidak berkenan lalu dinisiasilah nama Jembatan Ampera atau Amanat Penderitaan Rakyat.'),
(10, 'Masjid Raya Baiturrahman', 'Jl. Moh. Jam No.1, Kp. Baru, Kec. Baiturrahman, Kota Banda Aceh, Aceh', 'Monumen', 'images/masjidrayabaiturrahman.jpg', 'Masjid Raya Baiturrahman adalah simbol agama, budaya, semangat, kekuatan, perjuangan dan nasionalisme rakyat Aceh. Masjid Raya Baiturrahman memiliki 7 kubah dan 8 menara, termasuk yang tertinggi di Banda Aceh.\r\nMasjid Raya yang asli dibangun pada tahun 1612 di masa pemerintahan Sultan Iskandar Muda. Ada juga yang mengatakan bahwa Masjid Raya Baiturrahman yang asli dibangun lebih awal pada tahun 1292 oleh Sultan Alaidin Mahmudsyah. Masjid Kerajaan yang asli menampilkan atap jerami berlapis-lapis yang merupakan fitur khas arsitektur Aceh.Pada perang melanda dan Ketika Kolonial Hindia Belanda menyerang Kesultanan Aceh pada 10 April 1873, masyarakat Aceh menggunakan Masjid Raya yang asli sebagai benteng pertempuran, dan menyerang pasukan Royal Belanda dari dalam masjid.  \r\nTahukah kamu? Masjid Raya Baiturrahman selamat dari peristiwa Gempa dan Tsunami pada tanggal 26 Desember 2004 yang hanya mendapatkan sedikit kerusakan seperti beberapa dinding yang retak.'),
(11, 'Masjid Menara Kudus', 'Jl. Menara, Pejaten, Kauman, Kec. Kota Kudus, Kabupaten Kudus, Jawa Tengah', 'Monumen', 'images/menarakudus', 'Masjid Menara Kudus atau nama resmi  Masjid Al-Aqsa Manarat Qudus adalah masjid kuno yang dibangun oleh Sunan Kudus sejak tahun 1549 Masehi (956 Hijriah). Ada keunikan tersendiri dari masjid ini karena memiliki menara yang serupa bangunan candi serta pola arsitektur yang memadukan konsep budaya Islam dengan budaya Hindu-Buddhis sehingga menunjukkan terjadinya proses akulturasi dalam pengislaman Jawa.\r\nMasjid Menara Kudus ini memiliki lima pintu sebelah kanan, dan lima pintu sebelah kiri. Jendelanya semuanya ada 4 buah. Pintu besar terdiri dari 5 buah, dan tiang besar di dalam masjid yang berasal dari kayu jati ada 8 buah. Namun masjid ini tidak sesuai aslinya, lebih besar daripada semula karena pada tahun 1918-an telah direnovas. Di dalamnya terdapat kolam masjid, kolam yang merupakan padasan tersebut merupakan peninggalan kuno dan dijadikan sebagai tempat wudhu. Di dalam masjid terdapat dua bendera, yang terletak di kanan dan kiri tempat khatib membaca khutbah. Di serambi depan masjid terdapat gapura paduraksa, yang biasa disebut oleh penduduk sebagai \"Lawang Kembar\". Di komplek masjid juga terdapat pancuran untuk wudhu yang berjumlah delapan buah. Di atas pancuran itu diletakkan arca. Jumlah delapan pancuran, konon mengadaptasi keyakinan Buddha, yakni ‘Delapan Jalan Kebenaran’ atau Asta Sanghika Marga. Menara Kudus memiliki ketinggian 18 meter dengan bagian dasar berukuran 10 x 10 m. Di sekeliling bangunan dihias dengan piring-piring bergambar yang kesemuanya berjumlah 32 buah. Dua puluh buah di antaranya berwarna biru serta berlukiskan masjid, manusia dengan unta dan pohon kurma. Sementara itu, 12 buah lainnya berwarna merah putih berlukiskan kembang. \r\nSekarang, Masjid ini digunakan untuk tempat beribadah umat muslim, tetapi ada juga yang mengunjungi untuk berziarah ke makam Sunan Kudus yang berada di sisi Barat komplek masjid.'),
(12, 'Menara Siger', 'Jln. Lintas Sumatra, Bakauheni, Kec. Bakauheni, Kabupaten Lampung Selatan, Lampung', 'Monumen', 'images/menarasiger.jpg', 'Menara Siger adalah landmark yang juga menjadi titik nol Sumatra Gubernur Lampung Sjachroedin Z.P. dalam peresmian Menara Siger pada 30 April 2008, ia menyatakan optimistis Menara Siger akan mendorong kemajuan Lampung. Menara Siger terbangun di atas bukit sebelah barat Pelabuhan Bakauheni. Bangunan tersebut dilengkapi dengan sarana informasi mengenai peta wisata seluruh kabupaten/kota se-Lampung.\r\nSecara fisik, Menara Siger dibangun dengan memperhatikan ciri khas Komunitas Budaya Lampung Pepadun. Menara Siger dengan warna emas itu dilengkapi ruangan tempat wisatawan melihat Pelabuhan Bakauheni serta keindahan panorama laut dan alam sekitarnya.Siger sembilan adalah topi budaya adat pengantin wanita Lampung Pepadun. Menara Siger berupa bangunan berbentuk mahkota terdiri dari sembilan rangkaian yang melambangkan sembilan macam bahasa di Lampung. Menara Siger berwarna kuning dan merah, mewakili warna emas dari topi adat pengantin wanita. Bangunan ini juga berhiaskan ukiran corak kain tapis khas Lampung Saibatin. Payung tiga warna (putih-kuning-merah) menandai puncak menara. Payung ini sebagai simbol tatanan sosial. Dalam bangunan utama Menara Siger Prasasti Kayu Are sebagai simbol pohon kehidupan. Menara Siger tidak hanya berbentuk sebuah fisik bagunan, tetapi mencerminkan budaya masyarakat dan identitas komunitas budaya masyarakat Lampung pepadun sesuai dengan filosofi berpikir dan bertindak sesuai visi dan misi mewujudkan Lampung yang unggul dan bardaya saing.\r\nSekarang, Menara Siger merupakan landmark ikon kebanggan masyarakat komunitas budaya Lampung.'),
(13, 'Monumen Pancasila', 'Jl. Monumen Pancasila Sakti No.1, RW.9, Lubang Buaya, Kec. Cipayung, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta', 'Monumen', 'images/monumenpancasila.jpg', 'Monumen Pancasila dibangun atas gagasan Presiden ke-2 Indonesia, Soeharto. Monumen ini dibangun dengan tujuan mengingat perjuangan para Pahlawan Revolusi yang berjuang mempertahankan ideologi negara Republik Indonesia, Pancasila dari ancaman ideologi komunis.Dibangunnya monument ini untuk memperingati Gerakan 30 September 1965. \r\nMonumen Pancasila Sakti dibangun di atas areal tanah seluas 14,6 hektar pada pertengahan Agustus 1967, dan diresmikan pada 1 Oktober 1973 oleh Presiden Soeharto bertepatan dengan peringatan Kesaktian Pancasila.\r\nTahukah kamu? Sebelum menjadi sebuah museum sejarah, tempat ini merupakan tanah atau kebun kosong yang dijadikan sebagai tempat pembuangan terakhir para korban Gerakan 30 September 1965 (G30S).Di kawasan kebun kosong itu terdapat sebuah lubang sumur tua sedalam 12 meter yang digunakan untuk membuang jenazah para korban G30S. Sumur tua itu berdiameter 75 cm.'),
(14, 'Museum Fatahillah', 'Jl. Taman Fatahillah No. 1, Jakarta Barat, DKI Jakarta', 'Monumen', 'images/museumfatahillah.jpg', 'Museum Fatahillah memiliki nama resmi Museum Sejarah Jakarta dahulu merupakan Balai Kota Batavia yang dibangun pada tahun 1707-1710 atas perintah Gubernur Jenderal Joan van Hoorn. Bangunan ini menyerupai Istana Dam di Amsterdam, terdiri atas bangunan utama dengan dua sayap di bagian timur dan barat serta bangunan sanding yang digunakan sebagai kantor, ruang pengadilan, dan ruang-ruang bawah tanah yang dipakai sebagai penjara. Pada tanggal 30 Maret 1974, bangunan ini kemudian diresmikan oleh bapak Ali Sadikin sebagai Museum Sejarah Jakarta. \r\nSetelah Museum Sejarah Jakarta diresmikan pada tanggal 30 Maret 1974, maka seluruh koleksi dari Museum Djakarta Lama dipindahkan ke Museum Sejarah Jakarta dan ditambah dengan koleksi dari Museum Nasional.Sedari tahun 1999 Museum Sejarah Jakarta digagas bukan sekedar sebagai tempat untuk merawat dan memamerkan benda yang berasal dari masa penjajahan, tetapi harus bisa menjadi tempat bagi seluruh khalayak untuk menambah pengetahuan dan pengalaman tentang sejarah kota Jakarta, serta dapat dinikmati sebagai tempat rekreasi.'),
(15, 'Patung Surabaya', 'Jl. Diponegoro No.1-B, Darmo, Kec. Wonokromo, Kota SBY, Jawa Timur', 'Monumen', 'images/patungsurabaya.jpg', 'Patung Sura dan Baya merupakan landmark yang melambangkan Kota Surabaya. Landmark ini terdiri dari dua hewan yaitu ikan sura(hiu) dan baya(buaya). Tinggi landmark Suro dan Boyo itu mencapai 25,6 meter. Tinggi dudukan landmark 5 meter dan diameter 15 meter.\r\nSelain itu, simbol landmark suro dan boyo ini juga jadi simbol keberanian pemuda-pemuda Surabaya dalam mempertahankan wilayahnya dengan menentang bahaya.Landmark ini dibangun mulai 26 Februari 2019 dan selesai pada 10 Mei 2019.'),
(16, 'Pura Tanah Lot', 'Beraban, Kediri, Tabanan Regency, Bali', 'Monumen', 'images/puratanahlot.jpg', 'Pura Tanah Lot Bali adalah pura Hindu unik yang berdiri diatas formasi batu besar di pantai barat daya pulau Bali. Pura ini didesikan untuk Dewa Baruna atau Dewa Laut, perwujudan Tuhan (Umat Hindu menyebutnya Ida Sang Hyang Widhi ) yang memiliki tugas dan otoritas untuk menjaga lautan.\r\nMenurut masyarakat Bali, Pura Tanah Lot dibangun oleh seorang brahmana bernama Danghyang Niratha yang tadinya mengembara dari Pulau Jawa. Beliau berhasil menguatkan kepercayaan mayoritas warga Bali tentang ajaran agama Hindu di abad 16. Jadi, Pura Tanah Lot dipercaya tercipta dari kekuatan spiritual Danghyang Niratha yang memindahkan bongkahan batu besar ke tengah pantai dan menjadi tempat meditas beliau.'),
(17, 'Pura Ulun Danu Bratan', 'Danau Beratan, Candikuning, Baturiti, Tabanan Regency, Bali', 'Monumen', 'images/puraulun.jpg', 'Pura Ulun Danu Beratan atau Bratan Pura merupakan sebuah pura dan candi air besar di Bali, Indonesia. Kompleks candi ini terletak di tepi barat laut Danau Bratan di pegunungan dekat Bedugul, Kabupaten Tabanan. Candi ini sebenarnya digunakan untuk upacara persembahan untuk dewi Dewi Danu, dewi air, danau dan sungai. Danau Bratan merupakan salah satu danau penting dalam hal irigasi. Danau Bratan dikenal sebagai danau \"gunung suci\", kawasan ini sangat subur, terletak pada ketinggian 1.200 meter, dan beriklim sangat dingin.\r\nPendiri Pura tersebut diduga adalah I Gusti Agung Putu. Didirikan pada tahun saka 1556 (1634 Masehi) tetapi hingga saat ini belum ditemukan sumber pasti mengenai tahun pendirian Pura Ulun Danu.Pura ini dipelihara oleh empat “satakan” dari desa-desa di sekitar area Pura ini, yang terdiri dari: satakan Candi Kuning mewilayahi 5 bendesa adat, satakan Bangah mewilayahi 3 bendesa adat, satakan Antapan mewilayahi 4 bendesa adat, dan satakan Baturiti mewilayahi 6 bendesa adat.'),
(18, 'Rumah Gadang', 'Minangkabau, Sumatera Barat', 'Monumen', 'images/rumahgadang.jpg', 'Rumah Gadang adalah nama untuk rumah adat Minangkabau yang merupakan rumah tradisional dan banyak jumpai di Sumatra Barat, Indonesia. Rumah ini juga disebut dengan nama lain oleh masyarakat setempat dengan nama Rumah Bagonjong atau ada juga yang menyebut dengan nama Rumah Baanjuang.\r\nFungsi Rumah Gadang yaitu menjadi tempat kegiatan adat yang berlangsung pada waktu tertentu, dan dapat dijadikan rumah bagi penghuninya.Uniknya dari Rumah Gadang ini dibangun menggunakan pohon Juha yang kuat dan kokoh. Hal ini menyesuaikan dengan lingkungan alam di Sumatera Barat yang rawan akan gempa. Atap rumah ini terbuat dari ijuk yang melengkung dan runcing ke atas, sedangkan dinding rumahnya terbuat dari potongan anyaman bambu, ada juga motif ukiran yang digunakan untuk rumah Gadang seperti daun, bunga, buah-buahan, dan tumbuhan. Lalu jumlah kamar pun sesuai dengan jumlah perempuan yang akan tinggal didalamnya. Atap rumah Gadang sering disebut berbentuk mirip tanduk kerbau.'),
(19, 'Monumen Simpang Lima Gumul', 'Tugurejo, Kec. Ngasem, Kabupaten Kediri, Jawa Timur', 'Monumen', 'images/simpanglimagumulkediri.jpg', 'Monumen Simpang Lima Gumul adalah salah satu bangunan yang menjadi ikon Kabupaten Kediri yang bentuknya menyerupai Arc de Triomphe yang berada di Paris, Prancis. Landmark ini mulai dibangun pada tahun 2003 dan diresmikan pada tahun 2008, yang digagas oleh Bupati Kediri saat itu, Sutrisno.\r\nDidirikannya monumen ini dikarenakan terinspirasi dari Jongko Jojoboyo, raja dari Kerajaan Kediri abad ke-12 yang ingin menyatukan lima wilayah di Kabupaten Kediri.Selain sebagai ikon sebuah kota, saat ini SLG juga menjadi sentra (pusat) ekonomi dan perdagangan baru (Central Business District) di Kabupaten Kediri.'),
(20, 'Tugu Khatulistiwa', 'Jl. Khatulistiwa No.Kel, Batu Layang, Kec. Pontianak Utara, Kota Pontianak, Kalimantan Barat', 'Monumen', 'images/tugukhatulistiwa.jpg', 'Tugu Khatulistiwa menjadi salah satu ikon wisata Kota Pontianak dan selalu dikunjungi masyarakat. Setiap tanggal 21 - 23 Maret dan 3 September setiap tahunnya diperingati hari kulminasi matahari di tempat ini. Kulminasi adalah saat matahari tepat berada di atas garis khatulistiwa, sehingga benda-benda tegak yang berada di sekitar Tugu Khatulistiwa tidak berbayang.\r\nTugu Khatulistiwa dibuat pada masa pemerintahan Hindia Belanda sebagai penanda titik nol derajat garis khatulistiwa. Pada tahun 1928, tugu equator mulai dibangun dengan bentuk sederhana, yaitu berupa tonggak (lebih dikenal dengan patok) dengan tanda panah di atasnya. Pembangunan dilakukan oleh ahli geografi asal Belanda untuk menentukan garis equator. Lalu, tugu yang sederhana ini disempurnakan pada 1930 dengan mengganti tanda-tanda dengan lingkaran. Pada 1938, penyempurnaan tugu dilakukan oleh opsiter/architech bernama Silaban, sehingga bentuk tugu menjadi lebih baik. Berbeda dengan bentuk sebelumnya, hasil penyempurnaan bentuk tugu menjadi lebih rumit, bangunan terdiri dari empat tonggak kayu belian. Masing-masing berukuran 0,3 meter. Tinggi tonggak bagian depan (dua tonggak) 3,05 dari permukaan tanah. Sementara, tinggi tonggak bagian belakang sebagai bagian lingkaran dan anak panah penunjuk arah adalah 4,4 m.'),
(21, 'Tugu Muda', 'Jl. Pandanaran, Mugassari, Kec. Semarang Selatan, Kota Semarang, Jawa Tengah', 'Monumen', 'images/tugukhatulistiwa.jpg', 'Tugu Muda adalah sebuah landmark yang dibuat untuk mengenang jasa-jasa para pahlawan yang telah gugur dalam Pertempuran Lima Hari di Semarang. Tugu Muda ini menggambarkan tentang semangat berjuang dan patriotisme warga semarang, khususnya para pemuda yang gigih, rela berkorban dengan semangat yang tinggi mempertahankan Kemerdekaan Indonesia.\r\nLandmark ini didirikan untuk mengenang peristiwa Pertempuran Lima hari di Semarang. Peletakan batu pertama dilakukan pada tanggal 28 Oktober 1945, oleh Mr. Wongsonegoro (Gubernur Jawa Tengah) dan diresmikan pada tanggal 20 Mei 1953.\r\nTugu Muda berbentuk seperti lilin yang mengandung makna semangat juang para pejuang untuk mempertahankan kemerdekaan RI tidak akan pernah padam. Bentuk Tugu muda merupakan tugu yang berpenampang segi lima. Terdiri dari 3 (tiga) bagian yaitu landasan, badan dan kepala. Pasa sisi landasan tugu terdapat relief. Keseluruhan tugu dibuat dari batu. Untuk memperkuat kesan tugunya, dibuat kolam hias dan taman pada sekeliling tugu. Pada bagian kaki tugu terdapat relief dengan lima buah sangga pilar,yang kecuali dipergunakan untuk menggambarkan berbagai macam relief,juga dimaksudkan sebagai lambang Pancasila, yaitu Relief Hongerodeem(Menggambarkan kehidupan rakyat Indonesia pada zaman penjajahan), Relief Pertempuran(Menggambarkan gelora semangat), Relief Penyerangan(Menggambarkan perlawanan rakyat Indonesia), Relief Korban(Menggambarkan dalam pertempuran terdapat korban), dan Relief Kemenangan(Menggambarkan hasil jerih payah Rakyat Indonesia).'),
(22, 'Kue Dadar Gulung', 'Indonesia', 'Makanan', 'images\kuedadargulung.jpg', 'Kue dadar gulung merupakan makanan khas Indonesia dan Malaysia yang dapat digolongkan sebagai panekuk yang diisi dengan parutan kelapa yang dicampur dengan gula jawa cair. Isi ini disebut unti. Kulit dadar gulung identik dengan warna hijau karena diberi pewarna daun suji. Kulit dadar gulung yang berbentuk seperti telur dadar menjadi salah satu alasan mengapa makanan ini disebut kue dadar gulung.'),
(23, 'Kue Kastangel', 'Indonesia', 'Makanan', 'images\kuekastangel.jpg', 'Kue Kastangen kue keju adalah snack keju Belanda berbentuk stik. Karena hubungan kolonialnya dengan Belanda, kaasstengel juga banyak ditemukan di Indonesia . Nama mengacu pada bahan, bentuk dan asalnya; kaas adalah kata Belanda untuk "keju", sedangkan stengels berarti "tongkat". Tidak seperti kebanyakan kue, kaasstengels rasanya gurih dan asin, bukan manis. Di Indonesia kaasstengels , sama dengan nastar dan putri salju adalah kue kering yang populer saat hari raya, seperti Natal dan Lebaran.Adonan Kaasstengels terbuat dari campuran halus mentega atau margarin dengan kuning telur, dengan tambahan keju parut, kemudian dicampur dengan tepung, tepung maizena dan baking powder. Adonan digulung menjadi persegi panjang kecil, diolesi kuning telur, ditaburi cheddar parut, lalu dipanggang. [2] Ragi nutrisi dapat digunakan sebagai pengganti keju agar cocok untuk diet vegan.'),
(24, 'Kue Klepon', 'Jawa, Indonesia', 'Makanan', 'images\kueklepon.jpg', 'Kue Kelepon adalah sejenis makanan tradisional atau kue tradisional Indonesia yang termasuk ke dalam kelompok jajanan pasar. Makanan enak ini terbuat dari tepung beras ketan yang dibentuk seperti bola-bola kecil dan diisi dengan gula merah lalu direbus dalam air mendidih. Klepon yang sudah masak lalu dibalur oleh parutan kelapa agar melekat, sehingga klepon tampak berbalur parutan kelapa. Biasanya klepon diletakkan di dalam wadah yang terbuat dari daun pisang.Di Sumatra, Sulawesi, dan di Malaysia, klepon disebut "onde-onde", sedangkan di Jawa dan bagian lain di Indonesia penganan yang disebut onde-onde adalah bola tepung beras berisi adonan kacang hijau yang dibaluri biji wijen.'),
(25, 'Kue Lapis', 'Indonesia', 'Makanan', 'images\kuelapis.jpg', 'Kue lapis adalah makanan khas Indonesia. Kue ini biasanya terdiri dari dua warna yang berlapis-lapis, ini yang memberi nama kue ini. Kue ini dibuat dari tepung beras, tepung kanji, santan, gula pasir, garam dan pewarna. Kue ini dikukus setiap lapisannya sebelum kemudian lapisan di atasnya ditambahkan. Kue ini banyak ditemui di daerah-daerah di Indonesia.Pewarna yang digunakan untuk kue lapis bisa terdiri dari pewarna makanan buatan atau pewarna alami. Pewarna yang sering digunakan adalah pandan (hijau) dan sirup bunga mawar (merah).Terdapat dua jenis kue lapis dilihat dari cara pembuatannya, yaitu pembuatan lapisannya langsung pada saat proses memasak dalam satu loyang contohnya kue pepe dan kue lapis legit. Kedua, lapisannya disatukan di luar loyang, misalnya kue lapis surabaya dan kue lapis moka vla.'),
(26, 'Kue Lumpur',  'Indonesia', 'Makanan', 'images\kuelumpur.jpg', 'Kue lumpur adalah makanan ringan dengan bahan utama santan, kentang, tepung terigu, dan telur. Sebagai pewangi digunakan vanila dan sering kali diberi hiasan kismis dan kelapa muda iris di permukaannya.Kue ini tergolong kue basah sehingga tidak tahan disimpan lama.Diantara variasi kue lumpur yaitu : kue lumpur kentang, kue lumpur keju, kue lumpur kacang hijau, kue lumpur pisang, kue lumpur singkong, kue lumpur labu isi sayuran, kue lumpur jagung isi sayuran, kue lumpur palma, kue lumpur jagung nata de coco, kue lumpur ubi isi ragout, kue lumpur nangka, kue lumpur sukun, kue lumpur ubi, kue lumpur singkong isi kornet, kue lumpur sari laut dan kue lumpur tepung beras.'),
(27, 'Kue Putri Salju', 'Indonesia', 'Makanan', 'images\kueputrisalju.jpg', 'kue putri salju merupakan kue yang berasal yang juga populer di Austria serta Jerman. Kue ini sejenis kue kering yang berbentuk bulan sabit dan di atasnya diselimuti dengan gula halus seperti salju. Kue putri salju dibuat dari adonan tepung terigu, tepung maizena, mentega dan kuning telur yang dipanggang di dalam oven sampai matang dan di atasnya diselimuti dengan gula halus. Kue ini banyak digemari oleh orang-orang karena rasanya yang enak, gurih dan dingin ketika menggigitnya.Kue ini biasanya menjadi sajian khas pada hari raya, seperti Idulfitri, Natal, dan tahun baru Imlek.'),
(28, 'Kue Risoles', 'Indonesia', 'Makanan', 'images\kuerisoles.jpg', 'Risoles adalah pastri berisi daging, biasanya daging cincang, dan sayuran yang dibungkus dadar, dan digoreng setelah dilapisi tepung panir dan kocokan telur ayam.Hidangan ini juga dapat dipanggang di dalam oven, dan disajikan sebagai hors-doeuvre atau entrée ringan. Risoles berukuran kecil dapat dipakai sebagai hiasan untuk hidangan dari potongan besar daging unggas atau daging sapi.Isi risoles dapat berupa daging ayam, daging sapi, daging ikan, udang, jamur kancing, wortel, kentang, atau buncis. Adonan dadar dibuat dari campuran tepung terigu, kuning telur, mentega (margarin), dan air atau susu.Dua jenis risoles yang dikenal di Indonesia adalah risoles sayuran bercampur daging tumis, dan risoles berisi "Ragout". Bentuk kue ini persegi panjang seperti amplop. Risoles berbentuk segitiga umumnya berisi Ragout.Risoles dapat dimakan dengan saus kacang encer, sambal botol, atau cabai rawit.'),
(29, 'Kue Serabi', 'Indonesia', 'Makanan', 'Images\kueserabi.jpg', 'Kue Serabi merupakan jajanan pasar tradisional yang berasal dari Indonesia. Serabi berasal dari bahasa Jawa yang berinduk dasar dari kata "rabi" yang dalam bahasa Jawa berarti "kawin". Mungkin karena proses pembuatannya yang cukup sebentar dan tidak terlalu lama maka orang Jawa menyebutnya dengan kata "Serabi" (seperti waktu proses sekali kawin). Di Jawa Barat serabi dikenal dengan nama surabi atau sorabi. Di Jawa, serabi umumnya disajikan dengan isian gula atau manisan lainnya, tetapi di Tatar Sunda serabi disajikan dengan isian oncom dan asinan lainnya. Serabi biasanya dijajakan di pagi hari dan dimasak menggunakan tungku sehingga menghasilkan rasa yang khas. Kadang-kadang telur ayam yang telah dikocok ditambahkan ke atas adonan serabi yang sedang dimasak. Seiring dengan perkembangan zaman, banyak yang terus berinovasi dengan menambahkan berbagai topping seperti sosis, keju, maupun mayones yang tujuannya untuk mematahkan asumsi bahwa serabi adalah makanan yang terkesan rendahan. Tempat yang menyajikan serabi dengan berbagai variasi rasa tersebar di kota-kota besar seperti Jakarta, Bandung, dan Bogor.');