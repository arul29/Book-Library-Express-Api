-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2020 at 06:39 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `books_table`
--

CREATE TABLE `books_table` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url_img` text NOT NULL,
  `des` text NOT NULL,
  `status` varchar(30) NOT NULL,
  `genre` varchar(30) NOT NULL,
  `id_user` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books_table`
--

INSERT INTO `books_table` (`id`, `title`, `author`, `url_img`, `des`, `status`, `genre`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 'A Game of Thrones', 'George R.R. Martin', 'https://images-na.ssl-images-amazon.com/images/I/91dSMhdIzTL.jpg', 'A Game of Thrones adalah novel pertama dalam A Song of Ice and Fire, seri novel fantasi karya penulis Amerika George R. R. Martin. Novel ini pertama kali diterbitkan pada tanggal 1 Agustus 1996 dan telah memenangkan Locus Award 1997[2] dan dinominasikan untuk Nebula Award 1997 serta World Fantasy Award 1997.[2][3] Novelet Blood of the Dragon, yang menceritakan bab-bab Daenerys Targaryen dalam novel tersebut, memenangkan Hugo Award 1997 untuk kategori Novela Terbaik. Pada Januari 2011, novel tersebut masuk daftar New York Times Bestseller[4] dan memuncaki daftar tersebut pada Juli 2011.', 'Available', 'Fantasy', 0, '2019-10-27 00:00:00', '2019-11-28 18:37:34'),
(3, 'Harry Potter', 'J.K. Rowling', 'https://images-na.ssl-images-amazon.com/images/I/81iqZ2HHD-L.jpg', 'Harry Potter adalah lorem ipsum', 'Available', 'Fantasy', 0, '2019-11-13 00:00:00', '2019-11-13 00:00:00'),
(4, 'The Lord of The Rings', 'J. R. R. Tolkien', 'https://images-na.ssl-images-amazon.com/images/I/91rq1j7GYhL.jpg', 'The Lord of the Rings adalah novel kisah fantasi epik karangan J. R. R. Tolkien. Diterbitkan dalam tiga jilid pada tahun 1954 dan 1955, masing-masing jilid terdiri dari dua buku. Jilid pertama diberi judul The Fellowship of the Ring, jilid kedua The Two Towers dan jilid ketiga The Return of the King. Kisah ini ditulis dari tahun 1937 sampai 1949 dan menjadi salah satu karya sastra abad ke-20 yang paling populer dan diterjemahkan ke dalam 38 bahasa.', 'Available', 'Fantasy', 0, '2019-11-10 18:23:33', '2019-11-10 18:23:33'),
(5, 'One Piece', 'Eichiro Oda', 'https://vignette.wikia.nocookie.net/onepiece/images/0/0e/Volume_1.png/revision/latest?cb=20130115020528', 'One Piece (bahasa Jepang: ????? Hepburn: Wan P?su) adalah sebuah seri manga Jepang yang ditulis dan diilustrasikan oleh Eiichiro Oda. Manga ini telah dimuat di majalah Weekly Sh?nen Jump milik Shueisha sejak tanggal 22 Juli 1997, dan telah dibundel menjadi 91 volume tank?bon. Ceritanya mengisahkan petualangan Monkey D. Luffy, seorang anak laki-laki yang memiliki kemampuan tubuh elastis seperti karet setelah memakan Buah Iblis secara tidak disengaja. Dengan kru bajak lautnya, yang dinamakan Bajak Laut Topi Jerami, Luffy menjelajahi Grand Line untuk mencari harta karun terbesar di dunia yang dikenal sebagai \"One Piece\" dalam rangka untuk menjadi Raja Bajak Laut yang berikutnya.', 'Available', 'Action', 0, '2019-11-12 00:00:00', '2019-11-28 01:17:31'),
(6, 'Attack On Titan', 'Hajime Isayama', 'https://images-na.ssl-images-amazon.com/images/I/91M9VaZWxOL.jpg', 'Shingeki no Kyojin (bahasa Jepang: ?????, terj. har. \"Raksasa [yang] Menyerang\"), yang diterbitkan di Indonesia dengan judul Attack on Titan, adalah sebuah seri manga Jepang yang ditulis dan diilustrasikan oleh Hajime Isayama. Manga ini pertama kali dimuat dalam majalah Bessatsu Sh?nen Magazine terbitan Kodansha sejak tanggal 9 September 2009, dan telah dibundel menjadi 28 volume tank?bon hingga bulan April 2019. Ceritanya berlatar di dunia tempat umat manusia hidup di kota yang dikelilingi tembok besar, yang melindungi mereka dari makhluk pemakan manusia berukuran raksasa yang dikenal sebagai titan.', 'Available', 'Action', 0, '2019-11-12 00:00:00', '2019-11-12 00:00:00'),
(7, 'Weathering With You', 'Makoto Shinkai', 'https://i.redd.it/kco1fdcf90131.jpg', 'Weathering with You (bahasa Jepang: ???? Hepburn: Tenki no Ko, terj. har. \"Anak [Sang] Cuaca\") adalah sebuah film animasi drama romantis Jepang bergenre fantasi yang ditulis dan disutradarai oleh Makoto Shinkai, yang dikenal atas film karyanya pada tahun 2016 berjudul Your Name. Weathering with You berlatar di Jepang yang dilanda cuaca hujan yang sangat deras. Film ini mengisahkan tentang Hodaka Morishima, seorang remaja SMA yang pergi ke Tokyo dan berteman dengan seorang anak gadis yatim bernama Hina Amano, yang mampu memanipulasi cuaca. Film ini diproduksi oleh CoMix Wave Films, Genki Kawamura, dan Story Inc., sementara musiknya diciptakan oleh Radwimps. Film ini ditayangkan di Jepang pada tanggal 19 Juli 2019. Sebuah adaptasi novel yang ditulis oleh Shinkai, diterbitkan pada tanggal 18 Juli 2019, sehari sebelum penayangan film. Novel tersebut merupakan salah satu karya orisinalnya. Sebuah adaptasi manga yang diilustrasikan oleh Watari Kubota mulai dimuat berseri dalam majalah Afternoon terbitan Kodansha pada tanggal 25 Juli, enam hari setelah film ini diterbitkan. Film ini dipilih sebagai perwakilan Jepang untuk Film Internasional Terbaik pada acara Academy Awards ke-92.[7]', 'Available', 'Romance', 0, '2019-11-12 00:00:00', '2019-11-12 00:00:00'),
(8, 'Your Name', 'Makoto Shinkai', 'https://images-na.ssl-images-amazon.com/images/I/91%2BKaEhZKHL._SL1500_.jpg', 'Your Name. (bahasa Jepang: ????? Hepburn: Kimi no Na wa., harfiah: \"Namamu.\") adalah sebuah film animasi Jepang produksi tahun 2016 bertema fantasi untuk remaja yang ditulis dan disutradarai oleh Makoto Shinkai dan diproduksi oleh CoMix Wave Films.[3] Perancangan tokoh film ini dikerjakan oleh Masayoshi Tanaka, dan penggubahan musik dibuat oleh band rock asal Jepang Radwimps.Film ini dibuat berdasarkan novel karya Makoto Shinkai berjudul sama yang dirilis sebulan sebelum pemutaran perdananya tentang seorang siswi di pedesaan Jepang dan seorang siswa di Tokyo yang saling bertukar tubuh.[4] Film ini dibintangi oleh Ryunosuke Kamiki, Mone Kamishiraishi, Masami Nagasawa dan Etsuko Ichihara.', 'Available', 'Romance', 0, '2019-11-12 00:00:00', '2019-11-12 00:00:00'),
(20, 'Twilight', 'Stephenie Meyer', 'https://www.thoughtco.com/thmb/k9G79PT_RGXo5z_QmWKpTmKd4VQ=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/Twilight_book_cover-589fa4625f9b58819cb2e790.jpg', 'Twilight adalah novel roman karya Stephenie Meyer yang berkisah tentang hubungan asmara antara vampir dan manusia. Novel ini telah diadaptasi dalam bentuk layar lebar dengan judul yang sama. Novel ini menceritakan tentang Bella Swan seorang gadis asal Arizona yang pindah ke Forks untuk tinggal bersama ayahnya, Charlie Swan. Bella mendapat banyak perhatian dari para pemuda dan teman-teman baru di sekolah barunya, Forks High School.', 'Empty', 'Romance', 9, '2019-11-14 00:07:05', '2019-11-30 23:32:52'),
(21, 'Sherlock Holmes', 'Sir Arthur Conan Doyle', 'https://images-na.ssl-images-amazon.com/images/I/91743TsDedL.jpg', 'Sherlock Holmes (/????rl?k ?ho?mz/) adalah tokoh detektif fiksi rekaan Sir Arthur Conan Doyle, seorang pengarang dan dokter berkebangsaan Skotlandia. Holmes yang menyebut dirinya sebagai seorang \"detektif konsultan\" ini dikenal akan ketajaman penalaran logis, kemampuan menyamar, dan keterampilannya dalam menggunakan ilmu forensik untuk memecahkan berbagai kasus.', 'Available', 'Action', 0, '2019-11-14 21:42:50', '2019-11-14 21:42:50'),
(22, 'The Hobbit', 'J. R. R. Tolkien', 'https://images-na.ssl-images-amazon.com/images/I/91b0C2YNSrL.jpg', 'Sang Hobbit (Bahasa Inggris:The Hobbit) adalah sebuah buku novel fantasi yang ditulis oleh J. R. R. Tolkien dengan alur cerita laksana dongeng. Buku ini pertama kali diterbitkan di Inggris pada 21 September 1937. Walaupun buku ini merupakan karya yang mandiri, seringkali Sang Hobbit dilihat sebagai novel fantasi pendahulu dari karya Tolkien selanjutnya: Penguasa seluruh Cincin(The Lord of the Rings), sebuah buku novel fantasi yang banyak diperbincangkan dan ketiga serinya(trilogi) dipublikasikan pada tahun 1954 hingga 1955. Novel ini lalu di terjemahkan dan diterbitkan dalam Bahasa Indonesia pada tahun 2002 oleh penerbit gramedia menyusul sambutan yang baik atas penayangan film dan penjualan buku trilogi The Lord of the Rings.', 'Available', 'Fantasy', 0, '2019-11-14 21:44:12', '2019-11-28 17:36:05'),
(23, 'The Hunger Games', 'Suzanne Collins', 'https://www.thoughtco.com/thmb/kYI9bw-Ho0Gry0u4wv6Z7DWf6LI=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/HungergamesCover-56da6f485f9b5854a9de9638.jpg', 'Membunuh atau dibunuh. Itulah aturan sederhana dari acara tahunan Hunger Games. Di suatu masa depan, Amerika Utara musnah, lalu berdirilah negara Panem dengan Capitol sebagai ibukota. Awalnya, Capitol dikelilingi 13 distrik. Namun, suatu ketika terjadi pemberontakan melawan Capitol dan berakibat musnahnya Distrik 13. Sebagai pengingat akan kekuasaan ibukota, Capitol mengadakan acara televisi The Hunger Games setiap tahun di mana satu anak laki-laki dan satu anak perempuan berumur 12 hingga 18 tahun dari setiap distrik dipilih untuk bertarung sampai mati. Dua puluh empat peserta setiap tahun dan hanya akan ada satu pemenang. Katniss Everdeen dari distrik 12 mengorbankan dirinya untuk menggantikan posisi adiknya, Primrose, ketika nama adiknya yang terpilih. Bersama Peeta Mellark, peserta laki-laki dari distrik 12, Katniss pun mencoba segala hal dan mencari tahu sebanyaknya tentang bagaimana cara agar selamat di Hunger Games. Katniss menjadi incaran peserta lain di arena ketika ia berhasil mengambil banyak perhatian dari para sponsor.', 'Available', 'Action', 0, '2019-11-14 21:47:48', '2019-11-30 21:03:28'),
(24, 'The Cronicles of Narnia', 'C.C. Lewis', 'https://pro2-bar-s3-cdn-cf.myportfolio.com/da2d4941-6fcd-4c00-a8ae-c467fb1c60d8/b19bff62-eb57-453f-bcda-9388adaa6bfd_rw_1200.jpg?h=9e778aecca139d3fbded1146f74dc677', 'Empat Pevensie bersaudara: Lucy, Edmund, Peter dan Susan menemukan dunia ajaib Narnia ketika memasuki sebuah lemari di rumah seorang Profesor. Di Narnia, seekor berang-berang memberitahu mereka tentang ramalan yang mengatakan bahwa akan datang dua anak Adam dan dua anak Hawa yang akan mengalahkan Penyihir Putih, yang mengaku sebagai ratu Narnia, Jadis, dan mengisi empat takhta di istana Cair Paravel. Berang-berang juga menceritakan tentang raja Narnia sebenarnya, singa gagah bernama Aslan yang telah menghilang sekian lama, namun sekarang kembali lagi. Pevensie bersaudara tidak ingin terlibat dalam perang apa pun di Narnia, tapi terlambat, karena Edmund diam-diam kabur dan mengkhianati mereka dengan menemui Penyihir Putih. Setelah bertemu Aslan dan pasukannya, Pevensie bersaudara terpaksa harus menghadapi perang yang tak terhindarkan, dan menjadi raja dan ratu Narnia. Tapi beberapa tahun berlalu di bawah kepemimpinan mereka, ketika ratu Lucy dan yang lain menemukan kembali lemari yang membawanya datang ke Narnia.', 'Empty', 'Fantasy', 5, '2019-11-14 21:51:33', '2019-11-29 13:57:39'),
(25, 'The Walking Dead', 'Tony Moore', 'https://images-na.ssl-images-amazon.com/images/I/912o4OKU3bL.jpg', 'The Walking Dead adalah serial televisi horor pasca-apokaliptik Amerika yang dikembangkan oleh Frank Darabont untuk AMC, berdasarkan serial buku komik dengan nama yang sama oleh Robert Kirkman, Tony Moore, dan Charlie Adlard. Andrew Lincoln memerankan tokoh utama, deputi sherif Rick Grimes,[3] yang terbangun dari koma selama berbulan-bulan untuk menghadapi dunia pasca-apokaliptik yang dibanjiri oleh zombi, yang biasa disebut sebagai \"walker\".[4] Rick bersatu kembali dengan keluarganya dan menjadi pemimpin kelompok yang ia bentuk dengan penyintas lainnya. Bersama-sama mereka berjuang untuk bertahan hidup dan beradaptasi dengan dunia yang penuh dengan zombi dan beberapa manusia yang bahkan lebih berbahaya daripada zombi itu sendiri.[5] Hampir di sepanjang serial tersebut berlatar tempat di sekitar Atlanta, Georgia, dan Alexandria, Virginia.[4][6]', 'Empty', 'Horror', 5, '2019-11-14 21:55:11', '2019-11-29 16:25:27'),
(28, 'Divergent', 'Veronica Roth', 'https://kbimages1-a.akamaihd.net/d8d0bfe9-6469-4e32-9c13-f4beff397abe/1200/1200/False/four-a-divergent-collection-2.jpg', 'Divergent adalah novel fiksi ilmiah karya penulis Amerika Serikat Veronica Roth. Berlatar tempat di Chicago masa depan, novel ini merupakan seri pertama dalam trilogi Divergent. Divergent kerap dibanding-bandingkan dengan novel remaja sejenis seperti The Hunger Games dan The Maze Runner karena kesamaan tema dan target pembacanya. Roth berkata bahwa ide cerita Divergent muncul saat ia masih berkuliah. Plot utama novel ini adalah mengenai pembagian masyarakat ke dalam berbagai jenis faksi menurut kepribadian, mirip dengan novel Clans of the Alphane Moon (1964) karya Philip K. Dick.', 'Available', 'Action', 0, '2019-11-29 16:43:49', '2019-12-01 20:33:45');

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_book` int(11) NOT NULL,
  `borrow_at` datetime NOT NULL,
  `return_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`id`, `id_user`, `id_book`, `borrow_at`, `return_at`) VALUES
(5, 10, 23, '2019-11-29 11:09:42', '2019-11-29 11:10:02'),
(7, 5, 25, '2019-11-29 14:03:38', '2019-11-29 16:24:30'),
(8, 5, 25, '2019-11-29 16:25:27', NULL),
(9, 5, 28, '2019-11-29 16:58:02', '2019-11-29 16:58:36'),
(10, 9, 28, '2019-11-30 23:32:36', '2019-11-30 23:38:34'),
(11, 9, 20, '2019-11-30 23:32:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(200) NOT NULL,
  `name` varchar(50) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `name`, `role`) VALUES
(1, 'arul@mail.com', '$2a$10$sD0.KwMEPZ5.mx3UNJGTzOA05vtGyyv1y9TAxOsqOWN5nflyDz9au', 'Andi Khair', 'admin'),
(2, 'andi@mail.com', '$2a$10$uCm5qqMSHdHuxir7wTlJU.wXh8bPTkZeH0OP5kZwUmuev/hKKOukS', 'Andi ', 'user'),
(3, 'andi1@mail.com', '$2a$10$xKZgZGid20nUvcwwrgS/DeIW3u5Chzp98ICgVZQuZzXneWpiH9kta', 'Andi ', 'user'),
(4, 'andi2@mail.com', '$2a$10$GHIqsRzidsWV./X.OGxAe.yg.ukvy9keF3iywlB/z1RyHeuvvKfQ6', 'Andi ', 'admin'),
(5, 'user@gmail.com', '$2a$10$gjQUidSRnj7pGbmS6GgKIenMYSx13mXM6m7rkUwJdVRFnBq1XyZJ.', 'SAYA USER', 'user'),
(6, 'admin@gmail.com', '$2a$10$Hr4OcoI4sxEjo63LfhsfKeQnU8an6y6PBi2642nkV8j6cwXYC2ia.', 'SAYA ADMIN', 'admin'),
(7, 'andi@gmail.com', '$2a$10$0ZMBscqt3Xzt.0EJpZ/ryOnWaz/4ReocqgQhhd1SeF/1gGN5hb.n2', 'andi', 'user'),
(8, 'kenzo@gmail.com', '$2a$10$mDCdaFPqE2Qm6qZY68o4uenNPVPdDzhm8xxKeWtvSCEsvhlCbo6sS', 'KENZO KILLER', 'user'),
(9, 'user2@gmail.com', '$2a$10$IEVdZ3.0V22rRM94o4ZL9.voqu/.P/H5R4GjNcOKRYPaYieZPH5lW', 'SAYA USER 2', 'user'),
(10, 'arul123@gmail.com', '$2a$10$obAdQIWyi9cIbgG29htC9uUym5gP7JNA/DjON4sblfH/KCq9QeY2u', 'Andi Mashdarul', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_book` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `id_user`, `id_book`) VALUES
(1, 5, 4),
(2, 5, 6),
(6, 10, 25),
(7, 5, 8),
(8, 5, 20),
(14, 9, 5),
(15, 9, 6),
(16, 9, 25),
(17, 9, 21);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books_table`
--
ALTER TABLE `books_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books_table`
--
ALTER TABLE `books_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
