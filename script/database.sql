-- Database : 'toursight'
CREATE DATABASE IF NOT EXISTS toursight;

USE toursight;

-- CREATE TABEL

CREATE TABLE IF NOT EXISTS `users` (
`id` INTEGER (12) NOT NULL AUTO_INCREMENT, 
`username` VARCHAR(20), 
`email` VARCHAR(100) UNIQUE, 
`password` VARCHAR(100), 
`refresh_token` TEXT, 
`createdAt` DATETIME NOT NULL, 
`updatedAt` DATETIME NOT NULL, 
PRIMARY KEY (`id`)) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS `landmark` (
`id_landmark` INTEGER NOT NULL AUTO_INCREMENT, 
`landmark_name` VARCHAR(100), 
`location` VARCHAR(200), 
`category` VARCHAR(50), 
`image` VARCHAR(200), 
`deskripsi` TEXT, 
`createdAt` DATETIME NOT NULL, 
`updatedAt` DATETIME NOT NULL, 
PRIMARY KEY (`id_landmark`)) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS `img` (
`id` INTEGER NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100),
`src` TEXT, 
PRIMARY KEY (id)) ENGINE=InnoDB;



-- CREATE DUMMY DATA

INSERT INTO users (username, email, password ) VALUES ('user1', 'user1@gmail.com', '12345678');
 

INSERT INTO landmark (landmark_name, location, category, image, deskripsi) VALUES ('Monumen Nasional (Monas)', 'Gambir, Kecamatan Gambir, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta', 'Monumen', '
images\\monas.jpg','Populer dengan nama Monas atau Tugu Monas, landmark Indonesia satu ini sudah lama menjadi ikon kebanggaan masyarakat Indonesia. Memiliki tinggi 132 meter, monumen ini diprakarsai oleh presiden pertama Ir. Soekarno untuk mengenang perlawanan dan perjuangan rakyat Indonesia untuk merebut kemerdekaan.
Pembangunannya sendiri dimulai sejak 17 Agustus 1961 dan dibuka untuk umum pada tanggal 12 Juli 1975. Sejak saat itu, landmark Indonesia ini menjadi salah satu identitas dari Ibukota Jakarta. Ciri khas dari landmark ini adalah lapisan emas yang membentuk kobaran api pada puncak tugu megah ini.');

INSERT INTO landmark (landmark_name, location, category, image, deskripsi) VALUES ('Tugu Jogja', 'Gowongan, Kec. Jetis, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55233', 'Monumen','images\\tugujogja.jpg','Berlokasi di persimpangan Jalan Jenderal Sudirman dan Jalan Margo Utomo, Tugu Yogyakarta yang kerap disingkat menjadi Tugu Jogja ini telah lama menjadi salah satu ikon dari Kota Yogyakarta. 
Namun, landmark ikonik yang berdiri sekarang ternyata bukanlah tugu pertama yang berdiri di lokasi ini. Tugu yang berdiri kokoh sekarang ini dibangun oleh pemerintah Belanda setelah tugu sebelumnya yang bernama Tugu Golong-Gilig yang dibangun Hamengkubuwana I runtuh akibat gempa.
Selain itu, tahukah kamu bahwa landmark populer ini tak hanya punya nilai sejarah namun juga magis? Tugu ini dibangun sebagai nilai simbolis dan merupakan garis yang bersifat magis menghubungkan laut selatan, kraton Jogja dan gunung Merapi.');



