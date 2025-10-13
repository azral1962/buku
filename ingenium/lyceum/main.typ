#import "@preview/lyceum:0.1.0": FRONT-MATTER, BODY-MATTER, APPENDIX, BACK-MATTER

#let TEXT-SIZE = 11pt

//----------------------------------------------------------------------------//
//                                FRONT-MATTER                                //
//----------------------------------------------------------------------------//

#show: FRONT-MATTER.with(
  // Document metadata
  title: (
    title: "Ingenium",
    subtitle: "The Hard Science",
    sep: " - "
  ),
  authors: (
    (
      given-name: "Armein Z. R.",
      name: "Langi",
      affiliation: "TISE Research Group",
      email: "armein@itb.ac.id",
      location: "Bandung, Indonesia",
    ), 
  ),
  editors: ("TISE Research Group", ),
  publisher: "TISE Publisher",
  location: "Bandung, Jawa Barat",
  affiliated: (
    illustrator: ("--", ),
    organizer: "--",
  ),
  keywords: ("rekayasa", "AI", "TISE", ),
  date: datetime.today(), // auto => datetime.today()
  // Document general format
  page-size: (width: 155mm, height: 230mm),
  page-margin: (inside: 30mm, rest: 25mm),
  page-binding: left,
  page-fill: white),  // ivory
  text-font: ("EB Garamond", "Libertinus Serif"),
  text-size: TEXT-SIZE,
  lang-name: "id",
)

// The lyceum auto-generates the title page

= Cetak Biru yang Belum Pernah Ada Sebelumnya

Jika Anda menjawab "seseorang yang membangun jembatan, mesin, atau
perangkat lunak," Anda hanya separuh benar. Jawaban itu adalah potret
profesi kita di abad ke-20---sebuah potret kesuksesan yang luar biasa,
di mana para spesialis teknis membangun tulang punggung peradaban modern
kita. Kita memecahkan masalah-masalah "jinak" dengan efisiensi yang
menakjubkan, mengangkat miliaran orang dari kemiskinan, dan
menghubungkan dunia dengan jaringan yang tak terbayangkan. Kita telah
membangun dunia.

Namun, kini kita berdiri di tengah paradoks yang membingungkan. Dengan
delapan miliar otak cerdas di planet ini, mengapa tantangan-tantangan
terbesar kita---perubahan iklim, ketidaksetaraan sistemik, krisis
kesehatan global---terasa semakin tak terpecahkan? Masalah-masalah
"pelik" ini menertawakan solusi-solusi terisolasi kita. Semakin keras
kita mencoba memperbaikinya dengan pola pikir lama, semakin kusut
jaringannya.

Buku ini berargumen bahwa profesi rekayasa berada di titik balik paling
signifikan dalam sejarahnya. Kemunculan Kecerdasan Buatan (AI) bukanlah
sekadar alat baru; ia adalah cermin yang memaksa kita untuk bercermin
pada esensi peran kita. AI dengan cepat mengotomatiskan "rekayasa
gawai"---desain komponen, optimasi rutin, dan tugas-tugas terdefinisi
dengan baik. Ini bukanlah ancaman, melainkan sebuah pembebasan. AI
membebaskan kapasitas intelektual kita dari kerumitan teknis agar kita
dapat naik ke tingkat abstraksi yang lebih tinggi, ke peran yang memang
seharusnya menjadi takdir kita: #strong[Arsitek Peradaban];.

Perjalanan dalam buku ini akan membawa Anda melintasi evolusi profesi
kita, bukan sebagai pelajaran sejarah, melainkan sebagai peta untuk masa
depan.

- #strong[Bagian Satu] akan membawa kita kembali ke asal-usul profesi
  kita, menemukan kembali semangat #emph[ingenium];---kecerdikan
  kreatif---yang diwujudkan oleh para filsuf-praktisi seperti Archimedes
  dan da Vinci. Kita akan melihat bahwa identitas asli kita bukanlah
  sebagai teknisi, melainkan sebagai pemikir sistem yang holistik.

- #strong[Bagian Dua] akan menelusuri bagaimana Revolusi Industri
  membentuk kita menjadi spesialis yang sangat efektif. Kita akan
  merayakan kemenangan luar biasa dari rekayasa abad ke-20, tetapi juga
  secara jujur menganalisis bagaimana spesialisasi ini menciptakan
  "silo-silo" disipliner yang kini menghambat kemampuan kita untuk
  mengatasi masalah-masalah pelik yang saling berhubungan.

- #strong[Bagian Tiga] adalah titik baliknya. Kita akan menyelami
  bagaimana AI secara fundamental mengakhiri era rekayasa tradisional.
  Dengan mengotomatiskan tugas-tugas lama, AI tidak menghapus profesi
  kita, tetapi justru mendorongnya untuk berevolusi, melahirkan
  paradigma baru "Smart Engineering" yang berfokus pada sistem adaptif,
  bukan objek statis.

- #strong[Bagian Empat] akan mendefinisikan secara konkret mandat baru
  kita. Di sini, kita akan menyusun perangkat keterampilan dan kerangka
  berpikir yang dibutuhkan oleh seorang Arsitek Peradaban---dari
  pemikiran sistem hingga rekayasa sosio-teknis---dan membayangkan
  bagaimana pendidikan dan organisasi profesi harus berubah untuk
  mendukung peran baru ini.

- #strong[Bagian Lima] akan mensintesis semuanya menjadi sebuah visi
  yang berani dan puitis. Kita akan menjelajahi bagaimana rekayasa dapat
  merancang "Teater Manusia"---sebuah platform pemberdayaan di mana
  potensi delapan miliar individu tidak lagi terbuang sia-sia, melainkan
  terhubung untuk membentuk "Galaksi Potensi Manusia" yang mampu
  mengatasi tantangan apa pun.

Buku ini adalah panggilan untuk bertindak. Sebuah undangan untuk beralih
dari sekadar membangun #emph[benda] menjadi merancang #emph[sistem] yang
lebih baik; dari mengoptimalkan komponen menjadi memberdayakan
kemanusiaan. Ini bukan lagi tentang cetak biru untuk sebuah mesin,
tetapi tentang cetak biru untuk bab peradaban berikutnya.

Pena ada di tangan kita. Halaman kosong menanti. Mari kita mulai
menulis.

Bandung, 5 Oktober 2025

Armein Z. R. Langi


// Show rule for the outline
#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}


= Daftar Isi

#outline(
  title: none,
  target: heading.where(level: 1),
  indent: auto,
)


= Pendahuluan: Pena Ada di Tangan Anda
<pendahuluan-pena-ada-di-tangan-anda>
Jika hidup Anda adalah sebuah buku, apakah Anda ingin membacanya?
Pertanyaan ini, yang sering kali diajukan sebagai pemicu refleksi
pribadi, dapat diperluas skalanya untuk mencakup takdir kolektif kita:
Jika peradaban kita adalah sebuah buku, apakah kita, sebagai para
insinyur---para pembangun dunianya---adalah penulis atau sekadar pembaca
pasif dari narasinya?.#super[1]

Kita berada di tengah sebuah paradoks yang mendalam. Di satu sisi,
peradaban modern adalah sebuah monumen kemenangan rekayasa. Dari air
bersih yang mengalir di keran kita hingga jaringan komunikasi global
yang menghubungkan miliaran orang dalam sekejap, kualitas hidup kita
ditopang oleh tulang punggung infrastruktur yang dirancang oleh para
insinyur.#super[3] Namun, di sisi lain, kita dihadapkan pada
tantangan-tantangan berskala peradaban yang belum pernah terjadi
sebelumnya---perubahan iklim, ketidaksetaraan sistemik, dan krisis
kesehatan global---yang tampaknya kebal terhadap solusi-solusi teknis
yang telah kita kuasai.#super[3] Solusi-solusi yang terisolasi, meskipun
brilian, sering kali gagal mengatasi sifat masalah yang saling terkait
dan kompleks ini, terkadang bahkan memperburuknya.#super[6]

Buku ini berargumen bahwa kita telah mencapai titik balik. Kemunculan
Kecerdasan Buatan (AI) bukan sekadar penambahan alat baru ke dalam kotak
peralatan insinyur; ia adalah kekuatan transformatif yang secara
fundamental menantang dan mendefinisikan ulang esensi dari profesi
rekayasa itu sendiri. Era AI tidak hanya mengubah #emph[alat] yang kita
gunakan, tetapi juga menuntut redefinisi radikal atas #emph[peran]
kita---dari pencipta objek dan sistem yang terisolasi menjadi arsitek
sadar dari sistem sosio-teknis yang kompleks yang membentuk peradaban.
Ini adalah panggilan untuk kembali ke akar filosofis profesi kita---ke
konsep #emph[ingenium];, atau kecerdikan kreatif---untuk secara sadar
dan sengaja "menulis" bab berikutnya dari kisah peradaban.#super[3]

Untuk memahami dan menavigasi pergeseran seismik ini, kita akan memulai
perjalanan melalui lima bagian. Pertama, kita akan menggali kembali
fondasi filosofis dari profesi ini, menemukan kembali identitas insinyur
sebagai seorang pemikir holistik. Kedua, kita akan menelusuri bagaimana
Revolusi Industri membentuk insinyur modern menjadi spesialis yang
sangat efektif, yang mencapai kemenangan luar biasa tetapi juga
menciptakan fragmentasi disipliner. Ketiga, kita akan menganalisis
bagaimana AI mengakhiri era rekayasa tradisional dan melahirkan
paradigma baru. Keempat, kita akan mendefinisikan secara konkret peran
baru yang muncul bagi insinyur sebagai "Arsitek Peradaban," menguraikan
metodologi dan keahlian yang dibutuhkan. Terakhir, kita akan mensintesis
argumen-argumen ini menjadi sebuah visi yang berani tentang bagaimana
rekayasa dapat menjadi kekuatan untuk memberdayakan potensi kolektif
umat manusia. Pena ada di tangan kita; halaman kosong menanti.

= Bagian I: Genesis Sang Arsitek - Menemukan Kembali Identitas Insinyur
<bagian-i-genesis-sang-arsitek---menemukan-kembali-identitas-insinyur>
Bagian ini meletakkan fondasi filosofis buku dengan membongkar pemahaman
modern tentang rekayasa dan kembali ke esensi kreatif dan pemecahan
masalahnya yang asli. Dengan menelusuri kembali akar profesi ke konsep
#emph[ingenium] dan mencontoh para pemikir polimatik di masa lalu, kita
akan membangun kembali identitas insinyur bukan sebagai teknisi,
melainkan sebagai pemikir sistem yang humanistik.

== Bab 1: Melampaui Mesin: Kembali ke #emph[Ingenium]
<bab-1-melampaui-mesin-kembali-ke-ingenium>
Pemahaman kontemporer tentang rekayasa sering kali secara keliru
mengikatnya pada produk paling ikoniknya: mesin. Namun, penelusuran
etimologis mengungkapkan kebenaran yang lebih dalam dan jauh lebih
memberdayakan. Kata "engineering" tidak berasal dari kata "engine"
(mesin), melainkan dari kata Latin #emph[ingenium];, yang berarti
"kecerdasan," "kreativitas," atau "kecerdikan".#super[3] Kata "engine"
itu sendiri juga berasal dari akar yang sama, pada awalnya merujuk pada
alat atau strategi cerdik apa pun, seperti mesin perang, sebelum
maknanya menyempit menjadi perangkat mekanis.#super[3]

Perbedaan ini sangat penting. Ini secara fundamental mengubah kerangka
profesi dari sekadar tentang membuat benda menjadi seni menerapkan
kecerdikan untuk memecahkan masalah manusia. Rekayasa, dalam esensinya,
adalah "proses kreatif menggunakan sains untuk menciptakan solusi," di
mana solusi tersebut dapat berupa jembatan, perangkat lunak, proses
kimia, atau memang, sebuah mesin.#super[3] Reduksi modern rekayasa
menjadi sinonim dengan teknologi atau mesin adalah sebuah penyimpangan
historis yang secara drastis membatasi potensi profesi. Ketika kita
mengembalikan fokus pada

#emph[ingenium];, kita menyadari bahwa rekayasa pada intinya adalah
aktivitas humanistik dan kreatif, bukan sekadar aktivitas teknis. Ini
menyiratkan bahwa peran insinyur sebagai "arsitek peradaban" bukanlah
sebuah peran baru yang radikal, melainkan sebuah pemulihan dan perluasan
dari makna asli profesi tersebut dalam konteks tantangan abad ke-21.

== Bab 2: Para Filsuf-Praktisi: Pelajaran dari Archimedes hingga da Vinci
<bab-2-para-filsuf-praktisi-pelajaran-dari-archimedes-hingga-da-vinci>
Sejarah dipenuhi dengan para pemikir agung yang mewujudkan semangat
#emph[ingenium];, bergerak dengan lancar antara penyelidikan teoretis
yang mendalam dan aplikasi praktis yang cerdik. Mereka adalah para
polimat yang tidak melihat adanya pemisahan antara sains, seni, dan
rekayasa. Mereka adalah para "filsuf-praktisi" orisinal, yang karyanya
menunjukkan bahwa inovasi terobosan sering kali lahir dari pemikiran
analogis dan koneksi lintas-domain yang tak terduga.#super[3]

#strong[Archimedes dari Syracuse] (sekitar 287--212 SM) adalah contoh
klasik. Ia bukan hanya seorang penemu praktis yang terkenal dengan
Sekrup Archimedes, penerapan tuas, dan perancangan mesin-mesin perang
inovatif untuk mempertahankan Syracuse dari Romawi. Ia juga merupakan
salah satu matematikawan dan fisikawan teoretis terbesar sepanjang masa,
yang meletakkan dasar-dasar hidrostatika dan statika, serta
mengantisipasi konsep-konsep kalkulus integral ribuan tahun sebelum
penemuan resminya.#super[13] Kemampuannya untuk beralih dari masalah
konkret (seperti menentukan kemurnian mahkota emas) ke prinsip-prinsip
universal (prinsip daya apung) menunjukkan perpaduan sempurna antara
pemecahan masalah praktis dan wawasan teoretis.#super[13]

Berabad-abad kemudian, #strong[Leonardo da Vinci] (1452--1519) menjadi
arketipe "Manusia Renaisans." Pengetahuannya yang tak terpuaskan
mendorongnya untuk menjelajahi anatomi, botani, geologi, dan optik,
bukan sebagai disiplin ilmu yang terpisah, tetapi sebagai bagian dari
penyelidikan holistik tentang cara kerja dunia. Studi anatominya yang
cermat---diperoleh melalui pembedahan mayat---secara langsung
menginformasikan realisme seninya yang tak tertandingi.#super[18]
Pengamatannya yang tajam terhadap penerbangan burung dan dinamika air
menginspirasi sketsa-sketsa rekayasanya yang visioner untuk mesin
terbang, parasut, dan sistem hidrolik.#super[18] Bagi Leonardo, tidak
ada batas yang jelas antara seni dan sains; keduanya adalah cara untuk
memahami dan merepresentasikan keindahan dan kompleksitas
alam.#super[18]

Para insinyur kuno lainnya, seperti para pembangun piramida Mesir dan
akuaduk Romawi, juga menunjukkan peran arsitektural ini. Mereka bukan
hanya ahli bangunan, tetapi juga manajer sistem skala besar yang
mengoordinasikan logistik material yang rumit, mengelola ribuan tenaga
kerja, dan menerapkan prinsip-prinsip matematika dan survei yang canggih
untuk mencapai presisi yang menakjubkan.#super[22] Kemampuan untuk
beroperasi di berbagai tingkat abstraksi---dari filosofis hingga
praktis, dari artistik hingga teknis---adalah ciri khas dari rekayasa
yang berdampak besar. Hal ini menimbulkan pertanyaan kritis: apakah
penekanan pendidikan rekayasa modern pada spesialisasi yang sempit
secara tidak sengaja menyaring jenis pemikiran polimatik yang paling
dibutuhkan untuk tantangan kompleks saat ini?

== Bab 3: Paradoks 8 Miliar Otak
<bab-3-paradoks-8-miliar-otak>
Di pertengahan tahun 2024, populasi manusia global mencapai sekitar
8,118 miliar jiwa.#super[3] Secara kolektif, spesies kita memiliki
kapasitas intelektual yang belum pernah terjadi sebelumnya. Secara
teori, seperti yang diamati dalam salah satu dokumen sumber, "8 miliar
otak ini mestinya mampu mengatasi masalah apapun".#super[3] Namun,
kenyataannya jauh lebih kompleks. Kita menghadapi serangkaian tantangan
global yang tampaknya semakin sulit diatasi: perubahan iklim yang
semakin cepat, ketidaksetaraan ekonomi yang mengakar, dan ancaman
kesehatan masyarakat yang terus-menerus.

Paradoks ini terletak pada inti krisis peradaban kita. Masalahnya bukan
terletak pada kurangnya kecerdasan atau bahkan kurangnya solusi teknis.
Sebaliknya, masalahnya terletak pada ketidaksesuaian mendasar antara
arsitektur masalah yang kita hadapi dan arsitektur solusi yang kita
terapkan. Tantangan-tantangan terbesar kita adalah apa yang oleh para
ahli teori desain Horst Rittel dan Melvin Webber disebut sebagai
#strong["Wicked Problems"] (Masalah Pelik).#super[26]

Masalah pelik, tidak seperti masalah "jinak" (#emph[tame];) dalam
matematika atau rekayasa tradisional, memiliki karakteristik yang secara
inheren menolak solusi yang sederhana dan linier #super[26];:

+ #strong[Tidak ada formulasi definitif:] Cara Anda mendefinisikan
  masalah menentukan solusinya. Apakah kemiskinan masalah ekonomi,
  pendidikan, atau politik? Jawabannya mengubah pendekatan
  Anda.#super[26]

+ #strong[Tidak ada aturan berhenti:] Anda tidak pernah benar-benar
  "menyelesaikan" masalah pelik seperti perubahan iklim; Anda hanya
  dapat mengintervensi dan mengelolanya secara berkelanjutan.#super[30]

+ #strong[Solusi tidak benar-atau-salah, tetapi baik-atau-buruk:] Tidak
  ada jawaban yang "benar" secara objektif. Setiap solusi menciptakan
  konsekuensi, dan penilaiannya bergantung pada perspektif pemangku
  kepentingan.#super[26]

+ #strong[Setiap masalah pelik pada dasarnya unik:] Solusi untuk satu
  komunitas atau konteks tidak dapat dengan mudah ditransfer ke yang
  lain.#super[27]

+ #strong[Setiap masalah pelik adalah gejala dari masalah lain:]
  Masalah-masalah ini saling terkait secara mendalam dalam jaringan
  sebab-akibat yang kompleks.#super[26]

Perubahan iklim adalah contoh utama dari masalah pelik. Ini bukan
sekadar masalah teknis tentang emisi karbon; ini terkait erat dengan
sistem ekonomi, perilaku konsumen, kebijakan politik, dan keadilan
sosial.#super[4] Demikian pula, kemiskinan dan ketidaksetaraan global
bukanlah masalah kekurangan sumber daya, tetapi masalah distribusi,
kekuasaan, dan struktur sosial yang kompleks.#super[5] Kegagalan kita
untuk membuat kemajuan yang signifikan pada masalah-masalah ini bukanlah
kegagalan intelektual, melainkan kegagalan sistemik dan imajinatif. Kita
terus menerapkan pola pikir rekayasa yang dirancang untuk masalah
"jinak"---yang terdefinisi dengan baik, terkotak-kotak, dan sebagian
besar bersifat teknis---pada masalah "pelik" yang bersifat
terdistribusi, saling berhubungan, dan secara fundamental bersifat
sosio-teknis.

= Bagian II: Era Struktur dan Spesialisasi - Insinyur sebagai Pembangun Dunia Modern
<bagian-ii-era-struktur-dan-spesialisasi---insinyur-sebagai-pembangun-dunia-modern>
Bagian ini menjelajahi bagaimana Revolusi Industri membentuk profesi
rekayasa modern, yang mengarah pada keberhasilan yang luar biasa dalam
memecahkan masalah yang terdefinisi dengan baik, tetapi juga menciptakan
fragmentasi disiplin yang sekarang menghambat kemajuan dalam masalah
sistemik. Profesionalisasi, meskipun penting untuk ketelitian dan skala,
juga membangun "silo" yang memisahkan para insinyur dari pemahaman
holistik yang diperlukan untuk tantangan abad ke-21.

== Bab 4: Revolusi dan Profesionalisasi
<bab-4-revolusi-dan-profesionalisasi>
Revolusi Industri pada abad ke-18 dan ke-19 berfungsi sebagai tungku
peleburan yang membentuk kembali rekayasa dari praktik para polimat
menjadi profesi yang terstruktur, terspesialisasi, dan terstandardisasi.
Pergeseran seismik dari tenaga manusia dan hewan ke tenaga mesin
menciptakan permintaan yang belum pernah terjadi sebelumnya akan
keahlian teknis yang mendalam, yang mengarah pada munculnya
disiplin-disiplin yang dapat diidentifikasi seperti rekayasa mesin dan
sipil.#super[35] Periode ini menyaksikan "profesionalisasi pekerjaan
penemuan dan desain," dengan insinyur muncul sebagai tipe penemu khusus
yang, melalui fokus dan kolaborasi, terbukti jauh lebih produktif
daripada penemu-pengrajin atau amatir di masa lalu.#super[38]

#strong[Isambard Kingdom Brunel] (1806--1859) berdiri sebagai raksasa
pada era ini, mungkin perwujudan puncak dari insinyur era Industri.
Brunel adalah seorang visioner sistemik yang tidak hanya merancang
objek-objek luar biasa tetapi juga membangun jaringan yang terintegrasi.
Proyek andalannya, Great Western Railway, bukan hanya sekumpulan rel dan
lokomotif; itu adalah sistem transportasi terpadu yang menghubungkan
London ke Bristol, yang membutuhkan desain inovatif untuk terowongan
(seperti Box Tunnel, yang terpanjang pada masanya), jembatan (seperti
Maidenhead Railway Bridge dengan lengkungan bata terdatar di dunia), dan
viaduk.#super[40] Visinya melampaui daratan; ia dengan terkenal
memperluas jalur kereta api "lebih jauh" dengan merancang serangkaian
kapal uap transatlantik---
#emph[SS Great Western];, #emph[SS Great Britain];, dan #emph[SS Great
Eastern];---yang masing-masing merupakan yang terbesar di dunia pada
saat peluncurannya dan merevolusi teknik kelautan.#super[42] Brunel
adalah seorang arsitek sistem pada masanya, mengintegrasikan berbagai
teknologi untuk mencapai tujuan besar.

Seiring dengan meningkatnya kompleksitas dan spesialisasi, kebutuhan
akan standardisasi dan validasi keahlian menjadi sangat penting. Hal ini
mengarah pada pembentukan masyarakat profesional. Dimulai dengan Society
of Civil Engineers di Inggris pada tahun 1771, organisasi-organisasi
seperti American Society of Civil Engineers (ASCE, 1852), American
Society of Mechanical Engineers (ASME, 1880), dan akhirnya penggabungan
yang membentuk Institute of Electrical and Electronics Engineers (IEEE,
1963) didirikan.#super[3] Organisasi-organisasi ini memainkan peran
penting dalam menyusun pengetahuan, menetapkan standar etika, dan
menciptakan jalur yang dapat diandalkan untuk pendidikan dan sertifikasi
insinyur.#super[46]

Namun, profesionalisasi ini adalah pedang bermata dua. Di satu sisi, ia
menanamkan ketelitian, keamanan, dan skala yang belum pernah terjadi
sebelumnya ke dalam profesi, memungkinkan pembangunan infrastruktur
modern. Di sisi lain, ia menciptakan "penjaga gerbang" pengetahuan dan
memperkuat batas-batas disiplin. Seorang insinyur mesin dilatih untuk
berpikir seperti insinyur mesin, seorang insinyur sipil seperti insinyur
sipil. Proses yang sama yang menciptakan efisiensi yang luar biasa dalam
domain-domain tertentu juga menabur benih-benih fragmentasi yang membuat
masalah-masalah sistemik yang pelik di masa depan menjadi begitu sulit
untuk ditangani.

== Bab 5: Tulang Punggung Peradaban: Kemenangan Rekayasa Abad ke-20
<bab-5-tulang-punggung-peradaban-kemenangan-rekayasa-abad-ke-20>
Dipersenjatai dengan pendekatan yang terspesialisasi dan terstruktur
ini, profesi rekayasa memulai serangkaian pencapaian yang menakjubkan
sepanjang abad ke-20, secara dramatis dan tak terbantahkan meningkatkan
kualitas hidup manusia di seluruh dunia. Keberhasilan ini didasarkan
pada kemampuan yang luar biasa untuk memecah masalah-masalah besar dan
kompleks menjadi masalah-masalah yang lebih kecil dan "jinak" yang dapat
diselesaikan secara efisien dalam silo-silo disiplin. Model ini terbukti
sangat kuat selama masalah-masalah tersebut sebagian besar bersifat
teknis.

Dampak dari pendekatan ini terasa di setiap aspek kehidupan modern
#super[3];:

- #strong[Memecahkan Masalah Eksistensial:] Insinyur lingkungan dan
  sipil merancang sistem penyaringan air dan sanitasi yang, menurut
  Organisasi Kesehatan Dunia (WHO), telah mengurangi kematian akibat
  penyakit yang ditularkan melalui air hingga 60%. Sementara itu,
  insinyur pertanian mengembangkan irigasi presisi dan teknologi lainnya
  yang memicu Revolusi Hijau, menyelamatkan sekitar satu miliar orang
  dari kelaparan.#super[3]

- #strong[Membangun Fondasi Peradaban:] Insinyur sipil dan struktural
  membangun jaringan jalan, jembatan, dan bandara yang memungkinkan
  mobilitas global. Insinyur kelistrikan merancang dan membangun
  jaringan listrik yang memberi daya pada rumah, industri, dan seluruh
  ekonomi kita. Angka harapan hidup global meroket dari sekitar 32 tahun
  pada tahun 1950 menjadi lebih dari 73 tahun pada tahun 2023, sebagian
  besar berkat inovasi rekayasa dalam kesehatan masyarakat dan teknologi
  medis.#super[3]

- #strong[Memicu Revolusi Digital:] Dari penemuan transistor hingga
  pengembangan internet, insinyur komputer dan kelistrikan menciptakan
  infrastruktur konektivitas global. Jaringan serat optik, satelit, dan
  seluler yang mereka rancang telah mendemokratisasi akses ke informasi
  dan menciptakan peluang ekonomi yang tak terbayangkan satu abad yang
  lalu.#super[3]

- #strong[Meningkatkan Keamanan dan Keselamatan:] Gedung tahan gempa,
  sistem rem anti-lock (ABS) pada mobil, dan sistem navigasi canggih
  pada pesawat terbang adalah semua produk rekayasa yang telah secara
  drastis mengurangi kematian akibat bencana alam dan kecelakaan. Di
  Amerika Serikat saja, kematian akibat kecelakaan mobil per mil yang
  ditempuh telah turun lebih dari 80% sejak tahun 1950, sebagian besar
  berkat fitur-fitur keselamatan yang direkayasa.#super[3]

Kemenangan rekayasa abad ke-20 menciptakan persepsi yang kuat---baik di
dalam profesi maupun di masyarakat luas---bahwa setiap masalah pada
akhirnya dapat diselesaikan dengan keahlian teknis yang cukup. Pola
pikir ini, yang lahir dari keberhasilan dalam mengatasi masalah "jinak,"
akan segera diuji hingga batasnya ketika dihadapkan pada sifat masalah
"pelik" yang berbeda secara fundamental.

== Bab 6: Batas-Batas Optimasi: Ketika Solusi Teknis Gagal
<bab-6-batas-batas-optimasi-ketika-solusi-teknis-gagal>
Keberhasilan luar biasa dari rekayasa abad ke-20 menumbuhkan keyakinan
budaya yang mendalam pada kekuatan solusi teknis. Pola pikir ini, yang
oleh kritikus Evgeny Morozov disebut #strong["solusionisme teknologi,"]
adalah kecenderungan untuk "menyusun ulang semua situasi sosial yang
kompleks sebagai masalah yang terdefinisi dengan baik dengan solusi yang
dapat dihitung secara pasti".#super[7] Ini adalah penerapan pola pikir
"masalah jinak" pada "masalah pelik" yang secara inheren bersifat
sosio-teknis, dan sering kali mengarah pada kegagalan yang spektakuler
dan dapat dipelajari.

Studi kasus utama dalam solusionisme yang gagal adalah proyek
#strong[One Laptop Per Child (OLPC)];. Diluncurkan pada tahun 2005
dengan tujuan mulia untuk menyediakan laptop seharga \$100 bagi
anak-anak di negara berkembang, proyek ini merupakan sebuah keajaiban
rekayasa pada masanya. Namun, proyek ini sebagian besar gagal dalam
implementasinya karena mengabaikan konteks sosio-teknis yang
kompleks.#super[6] Kegagalan tersebut berakar pada serangkaian asumsi
yang salah: biaya laptop ternyata hampir dua kali lipat dari yang
dijanjikan; kurangnya infrastruktur seperti listrik dan konektivitas
internet yang andal membuat perangkat tersebut tidak dapat digunakan di
banyak area; tidak ada rencana yang memadai untuk dukungan teknis dan
perbaikan; dan yang paling penting, proyek tersebut memaksakan pandangan
dunia Barat tentang pembelajaran individualistis pada budaya komunal,
yang sering kali menimbulkan penolakan dari orang tua dan guru.#super[6]

Kegagalan OLPC bukanlah sebuah anomali. Sejarah proyek pembangunan
internasional dipenuhi dengan contoh-contoh serupa. Program Gyandoot di
India, yang bertujuan untuk menyediakan kios komputer di pedesaan, gagal
karena alasan yang sama dengan OLPC: kurangnya listrik dan konektivitas
yang andal.#super[56] Banyak proyek air bersih yang mahal gagal
meningkatkan hasil kesehatan secara signifikan karena mereka hanya
mengatasi masalah infrastruktur teknis (menyediakan air bersih) tanpa
mengubah perilaku kebersihan yang kompleks (seperti mencuci tangan) yang
merupakan pendorong utama penularan penyakit.#super[56]

Untuk mendiagnosis kegagalan-kegagalan ini, kita dapat beralih ke
#strong[teori sistem sosio-teknis];. Teori ini, yang berasal dari studi
tentang organisasi kerja, menyatakan bahwa setiap sistem yang berfungsi
terdiri dari elemen #strong[sosial] (manusia, budaya, norma, struktur
politik) dan elemen #strong[teknis] (alat, teknologi, proses) yang
saling bergantung.#super[29] Mengoptimalkan satu subsistem (teknis)
dengan mengabaikan yang lain (sosial) hampir selalu mengarah pada hasil
yang suboptimal atau kegagalan total sistem.#super[59] Kegagalan
solusionisme teknologi mengungkapkan titik buta budaya dalam rekayasa
modern: keyakinan implisit bahwa teknologi secara inheren netral dan
solusinya bersifat universal. Kegagalan-kegagalan ini bukanlah
penyimpangan, melainkan hasil yang dapat diprediksi dari penerapan model
mental yang salah pada kelas masalah yang salah. Kegagalan tersebut
bukan pada teknologi itu sendiri, tetapi pada

#emph[filsafat desain] yang memisahkannya dari konteks
manusianya---sebuah argumen kunci yang membenarkan pergeseran mendesak
menuju peran insinyur sebagai Arsitek Peradaban.

= Bagian III: Titik Balik AI - Akhir dari Rekayasa Seperti yang Kita Kenal
<bagian-iii-titik-balik-ai---akhir-dari-rekayasa-seperti-yang-kita-kenal>
Bagian ini menganalisis bagaimana Kecerdasan Buatan (AI) bukan hanya
alat inkremental lain, tetapi kekuatan transformatif yang secara
fundamental mengubah sifat pekerjaan rekayasa. Dengan mengotomatiskan
tugas-tugas desain tradisional dan memungkinkan pendekatan baru seperti
desain generatif, AI memaksa profesi ini untuk bergeser dari fokus pada
detail tingkat komponen ke arsitektur tingkat sistem, yang menandai
akhir dari rekayasa seperti yang kita kenal dan awal dari sesuatu yang
baru.

== Bab 7: Dari Otomasi ke Generasi: Kebangkitan Rekan Kerja AI
<bab-7-dari-otomasi-ke-generasi-kebangkitan-rekan-kerja-ai>
Peran Kecerdasan Buatan dalam rekayasa telah mengalami evolusi yang
pesat. Awalnya digunakan sebagai alat analitis untuk tugas-tugas seperti
simulasi dan optimasi, AI kini telah matang menjadi mitra kreatif yang
mampu menghasilkan solusi desain yang benar-benar baru. Pergeseran dari
otomatisasi ke generasi ini menandai perubahan mendasar dalam proses
rekayasa.

Inti dari transformasi ini adalah #strong[desain generatif];, sebuah
proses di mana insinyur tidak lagi menggambar solusi secara manual,
melainkan mendefinisikan parameter, batasan, dan tujuan dari suatu
masalah. Algoritma AI kemudian secara mandiri mengeksplorasi ribuan atau
bahkan jutaan kemungkinan desain, sering kali menghasilkan bentuk-bentuk
organik yang sangat efisien dan berkinerja tinggi yang tidak mungkin
dibayangkan oleh manusia.#super[60] Pendekatan ini membalikkan proses
desain tradisional: alih-alih dimulai dengan model, ia dimulai dengan
tujuan.#super[60]

Penerapan desain generatif di industri sudah memberikan hasil yang luar
biasa:

- #strong[Autodesk] menggunakan desain generatif untuk merancang tata
  letak kantor barunya di Toronto. Tujuannya bukanlah tujuan teknis
  murni seperti meminimalkan jarak berjalan kaki, melainkan tujuan
  sosio-teknis yang kompleks: memaksimalkan "interaksi kebetulan" antar
  karyawan dari berbagai tim untuk mendorong inovasi. AI menghasilkan
  ribuan tata letak yang mungkin, yang kemudian ditinjau oleh arsitek
  manusia untuk dipilih.#super[62]

- #strong[Eaton];, sebuah perusahaan manajemen daya, menerapkan AI
  generatif untuk secara drastis mempercepat pengembangan produk.
  Hasilnya termasuk pengurangan waktu desain untuk perlengkapan
  pencahayaan otomatis sebesar 87% dan pengurangan berat penukar panas
  cair-ke-udara sebesar 80%, yang menunjukkan keuntungan ganda dalam hal
  kecepatan dan kinerja.#super[63]

- #strong[Rolls-Royce];, bekerja sama dengan para peneliti, menggunakan
  jenis jaringan saraf yang disebut #emph[variational autoencoders]
  untuk desain generatif bilah turbomachinery. Pendekatan ini berhasil
  mengurangi jumlah parameter yang dibutuhkan untuk mendefinisikan
  bentuk bilah yang kompleks dari sekitar 100 menjadi hanya 15, secara
  dramatis menyederhanakan dan mempercepat proses optimasi.#super[64]

Di luar desain mekanis, AI juga merevolusi #strong[penemuan material];.
Secara tradisional, menemukan material baru adalah proses coba-coba yang
lambat. Kini, model AI dapat memprediksi sifat-sifat senyawa yang belum
pernah disintesis dengan menganalisis database material yang sangat
besar, secara efektif menavigasi ruang kimia yang luas yang diperkirakan
mengandung lebih dari molekul untuk menemukan kandidat yang menjanjikan untuk aplikasi dalam
energi, elektronik, dan kedokteran.#super[65]

Pergeseran ini secara fundamental mengubah hubungan antara insinyur dan
desain. Nilai insinyur tidak lagi terletak pada kemampuan mereka untuk
menggambar geometri tertentu atau melakukan perhitungan yang rumit.
Sebaliknya, nilai mereka bergeser ke kemampuan untuk mengajukan
pertanyaan yang tepat, mendefinisikan ruang masalah secara akurat, dan
secara kritis mengevaluasi solusi yang dihasilkan AI dalam konteks dunia
nyata yang lebih luas. Insinyur beralih dari menjadi "penggambar" solusi
menjadi "kurator" tujuan dan "penentu batasan" untuk AI.

== Bab 8: Kematian Insinyur Gawai
<bab-8-kematian-insinyur-gawai>
Konsekuensi logis dari kebangkitan AI generatif adalah pergeseran nilai
dalam profesi rekayasa. Peran-peran yang berfokus pada desain rutin,
optimasi komponen, dan tugas-tugas yang terdefinisi dengan baik---yang
dapat kita sebut sebagai "rekayasa gawai"---akan semakin banyak
diotomatisasi. Seperti yang disimpulkan dengan tajam oleh salah satu
sumber, "enjinering gadget akan dilakukan oleh AI. Engineer masa depan
\[harus\] multi disiplin membangun peradaban".#super[3] Ini bukan
sekadar prediksi, tetapi pengamatan terhadap tren yang sudah
berlangsung.

AI unggul dalam tugas-tugas optimasi dalam batasan yang jelas. Merancang
braket yang lebih ringan, mengoptimalkan tata letak sirkuit untuk
efisiensi daya, atau menyempurnakan bentuk aerodinamis---semua ini
adalah masalah yang dapat dihitung yang sangat cocok untuk kemampuan AI.
Seiring dengan semakin canggih dan mudah diaksesnya alat-alat ini,
permintaan akan insinyur manusia yang tugas utamanya adalah melakukan
pekerjaan ini secara manual akan menurun.

Namun, ini bukanlah sebuah narasi kiamat bagi profesi ini. Sebaliknya,
ini adalah momen pembebasan. Otomatisasi rekayasa oleh AI bukanlah
sebuah ancaman, melainkan sebuah pembebasan kapasitas intelektual
manusia dari tugas-tugas yang dapat dihitung dan berulang. Hal ini
memungkinkan para insinyur untuk memfokuskan energi mereka pada
aspek-aspek pemecahan masalah yang secara unik bersifat manusiawi dan
tidak dapat diotomatisasi:

- #strong[Pemahaman Konteks:] Memahami kebutuhan, nilai, dan batasan
  sosial, budaya, dan politik yang kompleks dari suatu masalah.

- #strong[Negosiasi Pemangku Kepentingan:] Memfasilitasi dialog dan
  membangun konsensus di antara kelompok-kelompok dengan kepentingan
  yang sering kali bertentangan.

- #strong[Penilaian Etis:] Menimbang implikasi moral dari berbagai
  solusi teknologi dan membuat keputusan yang selaras dengan
  kesejahteraan manusia.

- #strong[Kreativitas Sistemik:] Membayangkan bagaimana berbagai sistem
  (teknis, sosial, ekonomi) dapat dihubungkan dengan cara-cara baru
  untuk menciptakan hasil yang lebih baik.

Pada dasarnya, AI mengambil alih #emph[perhitungan];, membiarkan manusia
untuk fokus pada #emph[penilaian];. Kebangkitan AI secara langsung
memaksa profesi rekayasa untuk menghadapi kelas masalah yang sebelumnya
cenderung dihindarinya atau ditanganinya dengan buruk: "masalah pelik"
yang bersifat sosio-teknis. Dengan demikian, disrupsi AI bukanlah akhir
dari rekayasa; ini adalah katalis yang diperlukan yang mendorong evolusi
profesi menuju peran yang lebih tinggi dan lebih berdampak sebagai
Arsitek Peradaban. Insinyur masa depan harus menjadi, seperti yang
dikatakan oleh salah satu sumber, "visioner yang dapat mendefinisikan
masalah yang bermakna, penghubung yang dapat menghubungkan alat, tim,
dan disiplin ilmu, dan pemimpin yang tidak hanya memimpin manusia tetapi
juga memimpin AI".#super[69]

== Bab 9: Munculnya "Smart Engineering"
<bab-9-munculnya-smart-engineering>
Sebagai respons terhadap meningkatnya kompleksitas sistem modern dan
kemampuan transformatif AI, sebuah paradigma baru telah muncul:
#strong["Smart Engineering."] Ini menandai pergeseran fundamental dari
rekayasa tradisional yang berfokus pada pembuatan artefak statis ke
perancangan sistem yang dinamis, adaptif, dan cerdas.#super[3] Smart
Engineering didefinisikan oleh "integrasi sistematis dari sistem cerdas
alami dan buatan… di seluruh siklus hidup rekayasa," yang bertujuan
untuk menciptakan sistem yang dapat "merasakan, belajar, beradaptasi,
dan berinteraksi" dengan lingkungannya.#super[3]

Prinsip-prinsip inti dari Smart Engineering meliputi integrasi yang erat
antara teknologi canggih seperti AI, Machine Learning (ML), Internet of
Things (IoT), dan analitik data waktu nyata.#super[70] Tujuannya adalah
untuk memaksimalkan kinerja sistem, mengurangi kesalahan manusia, dan
memungkinkan strategi proaktif seperti pemeliharaan prediktif. Hal ini
menuntut para insinyur untuk mengembangkan keahlian baru, khususnya
dalam "pemikiran tingkat sistem terintegrasi" dan "keterampilan
pemrosesan data interpretatif"---kemampuan untuk memahami dan bertindak
berdasarkan aliran data yang sangat besar yang dihasilkan oleh
sistem-sistem ini.#super[71]

Dua contoh utama yang menggambarkan kekuatan Smart Engineering adalah
Digital Twins dan Smart Grids:

- #strong[Digital Twins (Kembar Digital):] Ini adalah replika virtual
  dari aset atau sistem fisik---seperti mesin jet, turbin angin, atau
  seluruh pabrik---yang terus diperbarui dengan data waktu nyata dari
  sensor-sensor pada kembaran fisiknya.#super[72] Kembar digital
  memungkinkan organisasi untuk memantau kinerja, menjalankan simulasi
  skenario "bagaimana-jika" tanpa risiko, dan memprediksi kegagalan
  sebelum terjadi. Mereka mengubah aset statis menjadi sistem yang
  dinamis dan dapat dianalisis, memungkinkan optimasi dan pemeliharaan
  berkelanjutan sepanjang siklus hidup aset.#super[74]

- #strong[Smart Grids (Jaringan Listrik Cerdas):] Jaringan listrik
  tradisional adalah sistem satu arah yang kaku. Sebaliknya, jaringan
  listrik cerdas menggunakan teknologi digital, sensor, dan komunikasi
  dua arah untuk secara dinamis menyeimbangkan pasokan dan permintaan
  listrik secara waktu nyata.#super[77] Mereka adalah contoh klasik dari
  "sistem dari sistem" (
  #emph[system-of-systems];), di mana jutaan komponen independen (panel
  surya di atap, kendaraan listrik yang sedang diisi daya, pembangkit
  listrik skala besar, baterai) berinteraksi secara cerdas. Perilaku
  yang muncul dari sistem ini adalah jaringan yang lebih andal, efisien,
  dan mampu mengintegrasikan sumber energi terbarukan yang bersifat
  intermiten dengan lebih baik.#super[79]

Paradigma Smart Engineering secara fundamental mengubah tujuan rekayasa.
Tujuannya bukan lagi hanya untuk menciptakan produk yang
#emph[berfungsi] dengan andal dalam kondisi yang diharapkan. Sebaliknya,
tujuannya adalah untuk merancang sistem yang dapat #emph[belajar] dan
#emph[beradaptasi] dalam lingkungan yang dinamis dan tidak pasti.
Fokusnya bergeser dari keandalan statis ke ketahanan adaptif. Ini bukan
lagi tentang kesempurnaan pada saat peluncuran, tetapi tentang
menanamkan kemampuan untuk berevolusi dan meningkat seiring waktu.

= Bagian IV: Mandat yang Muncul - Insinyur sebagai Arsitek Peradaban
<bagian-iv-mandat-yang-muncul---insinyur-sebagai-arsitek-peradaban>
Bagian ini mendefinisikan secara konkret peran baru insinyur sebagai
"Arsitek Peradaban." Dengan mengotomatiskan tugas-tugas teknis tingkat
rendah, AI mendorong para insinyur untuk beroperasi pada tingkat
abstraksi yang lebih tinggi. Mandat yang muncul bukanlah untuk merancang
komponen-komponen yang lebih baik, melainkan untuk merancang sistem
sosio-teknis yang lebih baik. Bagian ini menguraikan metodologi,
perangkat keterampilan, dan reformasi kelembagaan yang diperlukan untuk
transisi ini.

== Bab 10: Rekayasa Sistem, Bukan Hanya Benda
<bab-10-rekayasa-sistem-bukan-hanya-benda>
Peran insinyur masa depan yang paling penting adalah memperluas
"pemikiran rekayasa"---pendekatan yang ketat, sistematis, dan berbasis
bukti dalam pemecahan masalah---dari domain benda-benda fisik ke domain
sistem-sistem kompleks yang mencakup elemen sosial, ekonomi, dan
politik.#super[3] Ini adalah pergeseran dari merekayasa

#emph[benda] menjadi merekayasa #emph[sistem];.

Untuk menavigasi kompleksitas ini, para insinyur harus mengadopsi
kerangka kerja metodologis baru yang dirancang khusus untuk masalah yang
saling berhubungan dan dinamis:

- #strong[Systems Thinking (Pemikiran Sistem):] Ini adalah pendekatan
  holistik untuk analisis yang berfokus pada cara bagian-bagian penyusun
  suatu sistem saling berhubungan dan bagaimana sistem bekerja dari
  waktu ke waktu dan dalam konteks sistem yang lebih besar.#super[81]
  Alih-alih melihat rantai sebab-akibat linier, pemikiran sistem
  menekankan pada putaran umpan balik (

  #emph[feedback loops];), penundaan, dan hubungan non-linear yang
  sering kali menghasilkan perilaku yang tidak terduga dan berlawanan
  dengan intuisi. Menerapkan pemikiran sistem pada kebijakan publik,
  misalnya, dapat membantu mengidentifikasi konsekuensi yang tidak
  diinginkan dari suatu intervensi sebelum diimplementasikan.#super[83]

- #strong[System-of-Systems (SoS) Engineering:] Disiplin ini secara
  khusus menangani tantangan dalam merancang dan mengintegrasikan sistem
  yang terdiri dari sistem-sistem komponen yang independen secara
  operasional dan manajerial.#super[85] Contohnya termasuk sistem
  manajemen lalu lintas udara nasional (di mana maskapai penerbangan
  yang berbeda, bandara, dan pengontrol lalu lintas udara harus
  beroperasi bersama) atau jaringan listrik pintar.#super[87] SoS
  Engineering secara eksplisit mengakui bahwa Anda tidak dapat
  "mengontrol" sistem secara terpusat; sebaliknya, Anda harus merancang
  arsitektur dan insentif yang memungkinkan perilaku kolektif yang
  diinginkan muncul dari interaksi komponen-komponen
  independen.#super[85]

Pergeseran dari rekayasa objek ke rekayasa sistem ini juga merupakan
pergeseran dari kepastian ke probabilitas. Rekayasa tradisional, yang
berakar pada fisika Newtonian, sering kali beroperasi di dunia
sebab-akibat yang dapat diprediksi. Sebaliknya, sistem sosio-teknis yang
kompleks lebih menyerupai sistem biologis atau ekologis: mereka adaptif,
berevolusi, dan menunjukkan perilaku yang muncul yang tidak dapat
diprediksi hanya dengan menganalisis bagian-bagiannya.#super[85]
Akibatnya, insinyur tidak dapat lagi "mengontrol" sistem dengan cara
yang sama seperti mereka mengontrol mesin. Sebaliknya, mereka harus
belajar untuk "mempengaruhi," "mengarahkan," dan "membina" sistem menuju
keadaan yang diinginkan. Ini membutuhkan pola pikir yang lebih dekat
dengan seorang tukang kebun atau perencana kota daripada seorang pembuat
mesin---seseorang yang menanam benih, menetapkan batasan, dan
beradaptasi saat sistem tumbuh dan berubah secara organik.

#figure(
  align(center)[#table(
    columns: (20%, 20%, 20%, 20%, 20%),
    align: (auto,auto,auto,auto,auto,),
    [Dimensi], [#strong[Insinyur Kuno
    (Filsuf-Praktisi)];], [#strong[Insinyur Industri
    (Pembangun)];], [#strong[Insinyur Modern
    (Spesialis)];], [#strong[Arsitek Peradaban (Integrator)];],
    [#strong[Fokus Utama];], [Aplikasi prinsip-prinsip
    universal], [Infrastruktur fisik skala besar], [Optimasi komponen &
    subsistem], [Desain sistem sosio-teknis yang kompleks],
    [#strong[Keterampilan Inti];], [Geometri, mekanika,
    observasi], [Termodinamika, ilmu material], [Analisis, simulasi,
    komputasi], [Pemikiran sistem, kurasi data, etika, fasilitasi lintas
    disiplin],
    [#strong[Alat Dominan];], [Tuas, katrol, pena & kertas], [Mesin uap,
    baja, tabel logaritma], [CAD, perangkat lunak simulasi,
    komputer], [Platform AI, digital twins, model SoS, alat kolaborasi],
    [#strong[Metrik Sukses];], [Fungsi, keanggunan], [Skala, kecepatan,
    efisiensi], [Kinerja, keandalan, optimasi biaya], [Ketahanan,
    adaptabilitas, keberlanjutan, pemberdayaan manusia],
    [#strong[Hubungan dgn Masyarakat];], [Penasihat penguasa, pemecah
    masalah], [Agen transformasi ekonomi], [Penyedia solusi
    teknis], [Fasilitator & perancang bersama masa depan kolektif],
  )]
  , kind: table
  )

== Bab 11: Perangkat Keterampilan Sang Arsitek: Kurikulum untuk Masa Depan
<bab-11-perangkat-keterampilan-sang-arsitek-kurikulum-untuk-masa-depan>
Untuk memenuhi peran baru sebagai Arsitek Peradaban, pendidikan rekayasa
harus mengalami reformasi yang radikal. Tidak lagi cukup untuk
menghasilkan lulusan dengan keahlian teknis yang mendalam dalam satu
disiplin. Sebaliknya, kita harus mengembangkan apa yang semakin dikenal
sebagai #strong["profesional berbentuk T"] (#emph[T-shaped
professional];).#super[89] Dalam model ini, batang vertikal 'T' mewakili
keahlian disiplin yang mendalam (misalnya, dalam rekayasa kelistrikan
atau ilmu material). Namun, yang sama pentingnya adalah palang
horizontal, yang mewakili kemampuan untuk berkomunikasi dan
berkolaborasi secara efektif lintas disiplin, memahami bahasa dan
konteks bidang lain (seperti kebijakan, ekonomi, dan sosiologi), dan
menerapkan pemikiran sistem untuk mengintegrasikan berbagai perspektif
menjadi solusi yang koheren.#super[91]

Menciptakan profesional berbentuk T ini menuntut perombakan kurikulum
rekayasa. Kurikulum masa depan harus mengintegrasikan disiplin ilmu yang
secara tradisional dianggap "lunak" atau berada di luar lingkup
rekayasa, seperti filsafat teknologi, antropologi digital, ekologi
sistem kompleks, dan diplomasi sains.#super[3] Laporan-laporan seperti

#emph[Engineering Futures 2035] menyerukan fokus yang lebih kuat pada
"praktik rekayasa kontemporer dan konteks sosio-teknisnya," dengan
penekanan pada pemecahan masalah yang kompleks, pemikiran sistem, dan
kolaborasi interdisipliner.#super[94]

Lembaga-lembaga terkemuka sudah mulai memimpin jalan ini:

- #strong[MIT] telah memperkenalkan program-program baru seperti
  "Artificial Intelligence and Decision Making" (6-4) dan "Electrical
  Engineering with Computing" (6-5), yang secara inheren
  mengintegrasikan AI dan komputasi di seluruh disiplin ilmu
  tradisional. Kursus-kursus seperti "AI and Machine Learning for
  Engineering Design" secara eksplisit berfokus pada penerapan
  teknik-teknik canggih pada masalah-masalah dunia nyata yang
  kompleks.#super[97]

- #strong[Stanford University];, melalui inisiatif seperti "AI +
  Education," secara aktif mengeksplorasi dampak sosial dan etis dari
  teknologi, mendorong mahasiswa untuk mempertimbangkan tidak hanya
  "bagaimana" membangun sesuatu, tetapi juga "mengapa" dan "untuk
  siapa".#super[101]

Pergeseran yang paling mendasar, bagaimanapun, harus terjadi dalam
pedagogi itu sendiri. Kurikulum rekayasa masa depan harus dirancang di
sekitar "masalah pelik" sebagai unit pengorganisasian utamanya, bukan
disiplin teknis. Daripada mengambil mata kuliah "Termodinamika" dan
"Mekanika Fluida" secara terpisah, mahasiswa akan mengerjakan proyek
"Desain Sistem Energi Berkelanjutan untuk Komunitas Pedesaan." Proyek
semacam itu akan mengharuskan mereka untuk menarik dan mengintegrasikan
pengetahuan tidak hanya dari domain-domain teknis tersebut tetapi juga
dari ekonomi (analisis biaya-manfaat), sosiologi (penerimaan komunitas),
dan kebijakan publik (kerangka peraturan). Hanya melalui pembelajaran
berbasis masalah/proyek yang otentik dan interdisipliner inilah kita
dapat melatih keterampilan integratif yang dibutuhkan oleh Arsitek
Peradaban.

== Bab 12: Membangun Jembatan, Bukan Hanya Dinding: Peran Baru Organisasi Profesional
<bab-12-membangun-jembatan-bukan-hanya-dinding-peran-baru-organisasi-profesional>
Sama seperti pendidikan rekayasa, lembaga-lembaga yang mendukung profesi
ini---yaitu, organisasi profesional seperti IEEE---juga harus mengalami
transformasi yang mendalam. Secara historis, organisasi-organisasi ini
memainkan peran penting dalam menciptakan standar, memvalidasi keahlian,
dan menyebarkan pengetahuan melalui jurnal dan konferensi.#super[45]
Namun, dalam menghadapi masalah-masalah pelik, model yang secara tidak
sengaja memperkuat silo-silo disipliner ini menjadi kurang efektif.

Peran organisasi profesional harus berevolusi dari menjadi arsip
pengetahuan ("penerbit makalah") menjadi katalis untuk tindakan kolektif
("platform pemberdayaan").#super[3] Visi ini, yang diartikulasikan
dengan kuat dalam materi sumber, menyerukan pergeseran misi dari
"publish or perish" (terbitkan atau musnah) menjadi "empower or perish"
(berdayakan atau musnah). Kesuksesan tidak lagi diukur dari jumlah
kutipan dalam jurnal elit, tetapi dari dampak nyata yang terukur di
dunia.

Untuk mencapai hal ini, organisasi-organisasi ini dapat memimpin
pengembangan #strong["Global Solution Hub"];: platform kolaboratif di
mana warga dari seluruh dunia dapat melaporkan masalah-masalah nyata
yang mereka hadapi, dan para ahli dari berbagai disiplin ilmu dan
geografi dapat berkumpul untuk bersama-sama menciptakan solusi sumber
terbuka.#super[3] Dalam model ini, peran IEEE dan organisasi sejenisnya
adalah sebagai fasilitator, penyedia infrastruktur (baik digital maupun
etis), dan penghubung antara inovator teknis dan kebutuhan masyarakat
yang mendesak. Tagline mereka, seperti "Advancing Technology for
Humanity" milik IEEE, harus menjadi mandat operasional yang mendorong
setiap inisiatif, bukan hanya slogan yang aspirasional.#super[3]

Dalam paradigma baru ini, nilai terbesar dari sebuah organisasi
profesional tidak lagi terletak pada kemampuannya untuk
#emph[memvalidasi] keahlian individu melalui sertifikasi dan publikasi
yang dijaga ketat. Sebaliknya, nilainya terletak pada kemampuannya untuk
#emph[menggabungkan] keahlian yang beragam melalui platform kolaboratif
untuk menghasilkan tingkat kecerdasan kolektif yang lebih tinggi. Peran
mereka harus bergeser dari menjadi "penjaga gerbang" yang mempertahankan
batas-batas disiplin menjadi "pembangun jembatan" yang secara aktif
meruntuhkan silo-silo yang secara tidak sengaja telah mereka bantu
ciptakan selama satu abad terakhir.

= Bagian V: Cetak Biru Kosmik - Merekayasa Galaksi Potensi Manusia
<bagian-v-cetak-biru-kosmik---merekayasa-galaksi-potensi-manusia>
Bagian ini mensintesis argumen buku menjadi visi filosofis yang koheren
dan inspiratif. Dengan memanfaatkan metafora yang kaya dari materi
sumber, bagian ini memberikan kerangka kerja konseptual untuk ide-ide
yang paling aspirasional, menghubungkan peran teknis insinyur dengan
tujuan kemanusiaan yang tertinggi: pemberdayaan potensi kolektif 8
miliar manusia.

== Bab 13: Dari Solusi ke Pemberdayaan: Platform sebagai Teater Manusia
<bab-13-dari-solusi-ke-pemberdayaan-platform-sebagai-teater-manusia>
Tujuan akhir dari teknologi di abad ke-21 bukanlah untuk "memecahkan"
semua masalah manusia dari atas ke bawah, sebuah ambisi yang terbukti
sia-sia oleh solusionisme teknologi. Sebaliknya, tujuan yang lebih
tinggi dan lebih dapat dicapai adalah menciptakan "panggung"---sebuah
infrastruktur pemberdayaan---di mana 8 miliar manusia dapat memecahkan
masalah mereka sendiri, berkolaborasi, dan mewujudkan potensi otentik
mereka. Visi ini, yang disebut sebagai "Human Theater" dalam materi
sumber, membayangkan kembali teknologi sebagai fasilitator perkembangan
manusia.#super[3]

Arsitektur platform semacam itu akan dirancang secara sadar untuk
memanfaatkan dan menghubungkan kekuatan unik dari setiap tahap kehidupan
manusia #super[3];:

- #strong[Anak-anak (0-14 tahun):] Sebagai sumber imajinasi murni dan
  rasa ingin tahu, mereka akan menjadi "pemicu masalah," mengajukan
  pertanyaan-pertanyaan mendasar dan membayangkan dunia yang lebih baik.

- #strong[Dewasa Muda (15-35 tahun):] Dengan energi, inovasi, dan
  keberanian mereka, mereka akan menjadi "eksperimenter," dengan cepat
  membuat prototipe dan menguji solusi-solusi baru.

- #strong[Senior (36-65 tahun):] Memanfaatkan pengalaman, jaringan, dan
  pemahaman strategis mereka, mereka akan menjadi "arsitek sistem,"
  menskalakan solusi yang menjanjikan dan menavigasi kompleksitas
  implementasi.

- #strong[Lansia (\>65 tahun):] Sebagai penjaga kearifan, ketahanan, dan
  perspektif sejarah, mereka akan menjadi "reflektor," memberikan
  bimbingan, konteks etis, dan wawasan jangka panjang.

Visi ini menuntut penciptaan #strong[ekonomi nilai baru];. Alih-alih
mengoptimalkan produktivitas dan efisiensi yang diukur dalam jam kerja
atau output manufaktur, sistem ini akan menghargai kontribusi yang
secara unik bersifat manusiawi. Metrik seperti "koefisien inspirasi,"
"indeks kolaborasi lintas generasi," atau "jembatan generasi yang
dibangun" akan dihargai.#super[3] Teknologi seperti "AI Kurator
Kemanusiaan"---yang dirancang untuk mengidentifikasi potensi
tersembunyi, bukan untuk memaksimalkan keterlibatan---dan "Blockchain
Reputasi Kualitatif" dapat berfungsi sebagai infrastruktur untuk ekonomi
baru ini.#super[3]

Visi "Human Theater" secara fundamental menantang asumsi dasar dari
rekayasa dan kapitalisme: bahwa efisiensi adalah tujuan tertinggi.
Sebaliknya, ia mengusulkan bahwa tujuan tertinggi adalah
#emph[perkembangan manusia] dan #emph[penciptaan makna];. Ini adalah
pergeseran dari rekayasa #emph[sistem] ke rekayasa
#emph[ekosistem];---dari merancang mesin yang dapat diprediksi menjadi
membina lingkungan di mana hasil yang tidak terduga, kreatif, dan indah
dapat muncul. Ini adalah penerapan utama dari peran "Arsitek Peradaban":
tidak hanya membangun kota fisik, tetapi merancang ruang digital dan
sosial untuk perkembangan manusia.

== Bab 14: Arsitektur Kosmos Manusia: 8 Miliar Bintang Menjadi Satu Galaksi
<bab-14-arsitektur-kosmos-manusia-8-miliar-bintang-menjadi-satu-galaksi>
Visi "Human Theater" menemukan ekspresi puitisnya dalam metafora kosmik
yang disarankan oleh sumber: "bayangkan dunia diisi 8 miliar star… dan
menjadi galaxy".#super[3] Metafora ini menangkap esensi dari tujuan
akhir: bukan hanya untuk memberdayakan individu secara terpisah, tetapi
untuk menghubungkan potensi-potensi yang diberdayakan ini menjadi suatu
keseluruhan yang koheren dan sadar diri yang mampu mengatasi
tantangan-tantangan skala peradaban.

Visi puitis ini memiliki landasan akademis yang kuat dalam teori
#strong["kecerdasan kolektif"] dari filsuf Pierre Lévy. Lévy
mendefinisikan kecerdasan kolektif sebagai "kecerdasan yang
terdistribusi secara universal, terkoordinasi secara waktu nyata, dan
terus-menerus ditingkatkan" yang dimungkinkan oleh ruang
siber.#super[105] Dalam pandangannya, tujuannya adalah untuk membangun
sebuah ekosistem di mana "tidak ada yang tahu segalanya, semua orang
tahu sesuatu, \[dan\] semua pengetahuan berada dalam
kemanusiaan".#super[106] Platform yang dijelaskan sebelumnya---"Human
Theater"---adalah arsitektur rekayasa dari visi Lévy.

Dalam kosmos ini, teknologi memainkan peran "gaya gravitasi." Platform
AI, jaringan satelit global untuk konektivitas universal, dan alat
kolaborasi sumber terbuka adalah kekuatan tak terlihat yang menarik
"bintang-bintang" individu (manusia) ke dalam "konstelasi" (tim
pemecahan masalah) dan "galaksi" (gerakan sosial) yang
bermakna.#super[3] Proses "formasi bintang" ini bukanlah proses yang
pasif; platform ini secara aktif membantu individu bertransformasi dari
potensi mentah ("Nebula" imajinasi anak-anak) menjadi dampak yang
terwujud ("Quasar" energi dewasa muda atau "Bintang Pandu" kearifan
senior).#super[3]

Visi "Galaksi Manusia" ini menyiratkan sebuah model organisasi baru yang
melampaui struktur hierarkis tradisional (piramida perusahaan) dan
bahkan jaringan terdesentralisasi (internet saat ini). Ini membayangkan
sebuah sistem yang #emph[terdistribusi dan sadar diri];. Ini adalah
sebuah sistem di mana setiap "simpul" (setiap manusia) tidak hanya
terhubung, tetapi juga sadar akan peran uniknya dalam keseluruhan kosmos
dan secara aktif diberdayakan untuk berkontribusi pada kesehatan dan
evolusinya. Ini adalah implikasi akhir dari peran "Arsitek Peradaban":
untuk merekayasa sistem saraf bagi organisme super planet, memungkinkan
kesadaran dan tindakan kolektif pada skala yang dibutuhkan untuk
menavigasi masa depan kita bersama.

== Bab 15: Pena Ada di Tangan Anda: Menulis Bab Berikutnya Peradaban
<bab-15-pena-ada-di-tangan-anda-menulis-bab-berikutnya-peradaban>
Perjalanan kita telah membawa kita dari akar kata #emph[ingenium] ke
visi kosmik tentang galaksi manusia. Melalui lensa cerita, kita telah
melihat bagaimana narasi profesi rekayasa itu sendiri telah berevolusi:
dari "Kisah Pahlawan Tunggal" Archimedes, ke "Kisah Pembangun
Kekaisaran" Brunel, ke "Kisah Spesialis yang Efisien" dari insinyur abad
ke-20. Setiap cerita berhasil pada masanya, tetapi sekarang, di hadapan
masalah-masalah pelik dan kekuatan transformatif AI, narasi itu tidak
lagi memadai.

Konsep "identitas naratif"---gagasan bahwa kita memahami diri kita
sendiri dan dunia melalui cerita yang kita ceritakan---berlaku tidak
hanya untuk individu tetapi juga untuk profesi dan peradaban.#super[1]
Kisah yang sekarang perlu ditulis adalah "Kisah Arsitek Kolaboratif."
Ini adalah sebuah narasi di mana peran insinyur bukanlah sebagai
pahlawan penyendiri yang memberikan solusi dari atas, tetapi sebagai
fasilitator yang rendah hati dan integrator yang terampil. Ini adalah
sebuah cerita tentang pemberdayaan, bukan kontrol; tentang membina
ekosistem, bukan membangun mesin; tentang melepaskan kecerdasan
kolektif, bukan hanya menerapkan kecerdasan individu.

Buku ini adalah seruan untuk bertindak bagi para insinyur, pendidik, dan
pembuat kebijakan. Ini adalah sebuah tantangan untuk berhenti menjadi
"karakter minor dalam epik kita sendiri" dan mulai secara sadar dan
sengaja mengambil peran sebagai penulis bersama narasi masa depan umat
manusia.#super[1] Menulis cerita ini akan membutuhkan keberanian untuk
mempertanyakan asumsi-asumsi yang sudah mendarah daging, kerendahan hati
untuk belajar dari disiplin ilmu lain, dan imajinasi untuk membayangkan
sistem yang melayani perkembangan manusia, bukan hanya efisiensi teknis.

Pada akhirnya, kita kembali ke #emph[ingenium];. Kecerdikan terbesar
kita sebagai spesies tidak terletak pada kemampuan kita untuk merekayasa
mesin yang semakin canggih, tetapi pada kemampuan kita untuk merekayasa
sistem sosial dan teknis yang melepaskan kecerdikan dalam diri semua
orang. Kisah yang hebat tidak ditentukan oleh tidak adanya konflik,
tetapi oleh tantangan yang diatasi oleh sang pahlawan. Peradaban kita
menghadapi tantangan-tantangannya. Pena ada di tangan Anda. Halaman
kosong menanti. Apa yang akan Anda tulis?.#super[2];Ingenium: Rekayasa
Ulang Peran Insinyur sebagai Arsitek Peradaban di Era AI



//----------------------------------------------------------------------------//
//                                  APPENDIX                                  //
//----------------------------------------------------------------------------//

#show: APPENDIX.with(TEXT-SIZE, "Appendix", ship-part-page: true)

= Tables of Properties

#lorem(50)


//----------------------------------------------------------------------------//
//                                BACK-MATTER                                 //
//----------------------------------------------------------------------------//

#show: BACK-MATTER.with(TEXT-SIZE, ship-part-page: false)

= #strong[Referensi]
  <works-cited>
  + integrate the previously generated Preface into i…

  + I wan to make a book from this material. Rewrite…

  + Pengertian dan Hubungan Engineering dengan Mesin - DeepSeek.pdf

  + Climate Change 2021: The Physical Science Basis - IPCC, accessed
    October 5, 2025, #link("https://www.ipcc.ch/report/ar6/wg1/")

  + Poverty, Prosperity, and Planet Report 2024 - World Bank, accessed
    October 5, 2025,
    #link("https://www.worldbank.org/en/publication/poverty-prosperity-and-planet")

  + A Blurry Vision: Reconsidering the Failure of the One Laptop Per
    Child Initiative | Writing Program - Boston University, accessed
    October 5, 2025,
    #link("https://www.bu.edu/writingprogram/journal/past-issues/issue-3/shah/")

  + The God That Failed: Evgeny Morozov's “To Save Everything, Click
    Here”, accessed October 5, 2025,
    #link("https://lareviewofbooks.org/article/the-god-that-failed-evgeny-morozovs-to-save-everything-click-here/")

  + pressbooks.bccampus.ca, accessed October 5, 2025,
    #link("https://pressbooks.bccampus.ca/engineeringinsociety/chapter/chapter-1/#:~:text=The%20term%20engineering%20is%20derived,%E2%80%9Cto%20contrive%2C%20devise%E2%80%9D.")

  + About our blog - Ingenium - Texas A&M University, accessed October
    5, 2025,
    #link("https://ingenium.engr.tamu.edu/about-ingenium-blog/")

  + The Hidden Meaning of "Engineer" --- And Why It Matters More Than
    Ever, accessed October 5, 2025,
    #link("https://spenglerindustries.com/the-hidden-meaning-of-engineer-and-why-it-matters-more-than-ever/")

  + Does engineering come from the word engine? -- Energy Zone, accessed
    October 5, 2025,
    #link("https://archive.imanengineer.org.uk/energyj15-zone/question/does-engineering-come-from-the-word-engine/index.html")

  + From Ingenium to Engineer - Wier & Associates, Inc., accessed
    October 5, 2025, #link("https://wierassociates.com/article06.html")

  + Archimedes - World History Encyclopedia, accessed October 5, 2025,
    #link("https://www.worldhistory.org/Archimedes/")

  + Archimedes: Ancient Greece's Master of Science and Engineering |
    Philosophical.chat, accessed October 5, 2025,
    #link("https://philosophical.chat/philosophy/philosophers-and-their-philosophies/archimedes-science-and-engineering/")

  + Archimedes - Wikipedia, accessed October 5, 2025,
    #link("https://en.wikipedia.org/wiki/Archimedes")

  + Who Was Archimedes? | His Life, Achievemtents, Eureka Moment And
    Death - HistoryExtra, accessed October 5, 2025,
    #link("https://www.historyextra.com/period/ancient-greece/archimedes-biography-life-death/")

  + Archimedes | Facts & Biography - Britannica, accessed October 5,
    2025, #link("https://www.britannica.com/biography/Archimedes")

  + Science and inventions of Leonardo da Vinci - Wikipedia, accessed
    October 5, 2025,
    #link("https://en.wikipedia.org/wiki/Science_and_inventions_of_Leonardo_da_Vinci")

  + Leonardo da Vinci - Wikipedia, accessed October 5, 2025,
    #link("https://en.wikipedia.org/wiki/Leonardo_da_Vinci")

  + da Vinci Inventions: Flying Machines, Weapons of War and Other
    Innovations, accessed October 5, 2025,
    #link("https://www.da-vinci-inventions.com/davinci-inventions")

  + Leonardo da Vinci's Inventions - Google Arts & Culture, accessed
    October 5, 2025,
    #link("https://artsandculture.google.com/story/leonardo-da-vinci-39-s-inventions/FwUhVre3jQevow?hl=en")

  + History of engineering - Wikipedia, accessed October 5, 2025,
    #link("https://en.wikipedia.org/wiki/History_of_engineering")

  + 7 Ancient Cultures That Were Masters of Engineering - WorldAtlas,
    accessed October 5, 2025,
    #link("https://www.worldatlas.com/ancient-world/7-ancient-cultures-that-were-masters-of-engineering.html")

  + The Remarkable Engineering Feat: How the Egyptians Built the …,
    accessed October 5, 2025,
    #link("https://medium.com/@blogcarloscruz/the-remarkable-engineering-feat-how-the-egyptians-built-the-pyramids-68aec182b469")

  + The Organization of Building Work and Construction of Siphons in …,
    accessed October 5, 2025,
    #link("https://www.arct.cam.ac.uk/system/files/documents/vol-2-1305-1322-gonzalez-t.pdf")

  + What's a Wicked Problem? | Wicked Problem - Stony Brook University,
    accessed October 5, 2025,
    #link("https://www.stonybrook.edu/commcms/wicked-problem/about/What-is-a-wicked-problem")

  + Wicked problem - Wikipedia, accessed October 5, 2025,
    #link("https://en.wikipedia.org/wiki/Wicked_problem")

  + Wicked problems: a mapping review of the literature - Taylor &
    Francis Online, accessed October 5, 2025,
    #link("https://www.tandfonline.com/doi/full/10.1080/13504509.2020.1859415")

  + Socio-technical systems theory | Centres and institutes | University
    of …, accessed October 5, 2025,
    #link("https://business.leeds.ac.uk/research-stc/doc/socio-technical-systems-theory")

  + 'Wicked Problems': Challenges That Defy Easy Solutions, accessed
    October 5, 2025,
    #link("https://realgoodcenter.jou.ufl.edu/theory/wicked-problems-challenges-that-defy-easy-solutions/")

  + What are Wicked Problems? | IxDF - The Interaction Design
    Foundation, accessed October 5, 2025,
    #link("https://www.interaction-design.org/literature/topics/wicked-problems")

  + Summary for Policymakers | Climate Change 2022: Impacts, Adaptation
    and Vulnerability, accessed October 5, 2025,
    #link("https://www.ipcc.ch/report/ar6/wg2/chapter/summary-for-policymakers/")

  + CLIMATE CHANGE 2023 - IPCC, accessed October 5, 2025,
    #link("https://www.ipcc.ch/report/ar6/syr/downloads/report/IPCC_AR6_SYR_SPM.pdf")

  + Poverty and Shared Prosperity 2022 - World Bank, accessed October 5,
    2025,
    #link("https://www.worldbank.org/en/publication/poverty-and-shared-prosperity")

  + High School Engineering/The Industrial Revolution - Wikibooks,
    accessed October 5, 2025,
    #link("https://en.wikibooks.org/wiki/High_School_Engineering/The_Industrial_Revolution")

  + Industrial Revolution - Wikipedia, accessed October 5, 2025,
    #link("https://en.wikipedia.org/wiki/Industrial_Revolution")

  + Industrial Revolution | Definition, History, Dates, Summary, & Facts
    | Britannica, accessed October 5, 2025,
    #link("https://www.britannica.com/event/Industrial-Revolution")

  + The Rise of the Engineer: Inventing the Professional Inventor During
    …, accessed October 5, 2025,
    #link("https://www.nber.org/system/files/working_papers/w29751/w29751.pdf")

  + The Rise of the Engineer: Inventing the Professional Inventor During
    the Industrial Revolution - Walker Hanlon, accessed October 5, 2025,
    #link("http://www.walkerhanlon.com/papers/hanlon_rise_of_the_engineer.pdf")

  + Isambard Kingdom Brunel: Engineering Icon | Institution of Civil
    Engineers (ICE), accessed October 5, 2025,
    #link("https://www.ice.org.uk/what-is-civil-engineering/meet-the-engineers/isambard-kingdom-brunel")

  + Isambard Kingdom Brunel - Wikipedia, accessed October 5, 2025,
    #link("https://en.wikipedia.org/wiki/Isambard_Kingdom_Brunel")

  + Isambard Kingdom Brunel | ASCE, accessed October 5, 2025,
    #link("https://www.asce.org/about-civil-engineering/history-and-heritage/notable-civil-engineers/isambard-kingdom-brunel")

  + Isambard Kingdom Brunel Legacy - Confinity, accessed October 5,
    2025,
    #link("https://www.confinity.com/legacies/isambard-kingdom-brunel")

  + Isambard Kingdom Brunel | Biography, Achievements, Structures …,
    accessed October 5, 2025,
    #link("https://www.britannica.com/biography/Isambard-Kingdom-Brunel")

  + Engineering professional societies - Creating technologies, accessed
    October 5, 2025, #link("http://www.creatingtechnology.org/prof.htm")

  + The Society of Engineers, accessed October 5, 2025,
    #link("https://www.theiet.org/membership/library-and-archives/the-iet-archives/iet-history/the-society-of-engineers")

  + The History of the Professional Engineer (PE) Designation and Why
    Certification Is Required, accessed October 5, 2025,
    #link("https://www.davron.net/the-history-of-the-professional-engineer-pe-designation-and-why-certification-is-required/")

  + The History - NCEES, accessed October 5, 2025,
    #link("https://ncees.org/wp-content/uploads/2022/09/2020_history_web_version.pdf")

  + To Save Everything, Click Here by Evgeny Morozov | Hachette Book
    Group, accessed October 5, 2025,
    #link("https://www.hachettebookgroup.com/titles/evgeny-morozov/to-save-everything-click-here/9781610393706/?lens=publicaffairs")

  + To Save Everything, Click Here | Summary, Quotes, FAQ, Audio -
    SoBrief, accessed October 5, 2025,
    #link("https://sobrief.com/books/to-save-everything-click-here")

  + From the Instructor, accessed October 5, 2025,
    #link("https://www.bu.edu/writingprogram/files/2011/10/Shah1011.pdf")

  + The spectacular failure of One Laptop Per Child - Philanthropy
    Daily, accessed October 5, 2025,
    #link("https://philanthropydaily.com/the-spectacular-failure-of-one-laptop-per-child/")

  + Morgan Ames on The Charisma Machine - CaMP Anthropology, accessed
    October 5, 2025,
    #link("https://campanthropology.org/2019/10/14/morgan-ames-on-the-charisma-machine/")

  + Cautions from one laptop per child in marketing technological
    innovation to LDCs - Sugar Labs People's web folders, accessed
    October 5, 2025,
    #link("http://people.sugarlabs.org/anish/Cautions_from_one_laptop_per_child_(LSERO).pdf")

  + Inside the digital society: lessons from little laptops - Parenting
    for a Digital Future, accessed October 5, 2025,
    #link("https://blogs.lse.ac.uk/parenting4digitalfuture/2021/01/13/one-laptop-per-child/")

  + Failure in international aid | GiveWell, accessed October 5, 2025,
    #link("https://www.givewell.org/international/technical/criteria/impact/failure-stories")

  + Systemic Approach to Failure Analysis: A Study of Sociotechnical
    Organization, accessed October 5, 2025,
    #link("https://www.researchgate.net/publication/357548350_Systemic_Approach_to_Failure_Analysis_A_Study_of_Sociotechnical_Organization")

  + Sociotechnical system - Wikipedia, accessed October 5, 2025,
    #link("https://en.wikipedia.org/wiki/Sociotechnical_system")

  + Sociotechnical attributes of safe and unsafe work systems - PMC -
    PubMed Central, accessed October 5, 2025,
    #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC4566878/")

  + Generative Design 101 - Formlabs, accessed October 5, 2025,
    #link("https://formlabs.com/blog/generative-design/")

  + Generative Design & The Role of AI Engineering - Applied Use Cases |
    Neural Concept, accessed October 5, 2025,
    #link("https://www.neuralconcept.com/post/generative-design-the-role-of-ai-engineering-applied-use-cases")

  + Case study: Autodesk's generative design artificial intelligence …,
    accessed October 5, 2025,
    #link("https://www.csemag.com/case-study-autodesks-generative-design-artificial-intelligence/")

  + Read Eaton's case study for generative AI examples in … - aPriori,
    accessed October 5, 2025,
    #link("https://www.apriori.com/resources/case-study/eatons-generative-ai-cuts-product-design-time-by-87/")

  + Case Study: Autoencoders As A Generative Design - Monolith AI,
    accessed October 5, 2025,
    #link("https://www.monolithai.com/case-studies/turbomachinery-autoencoders-rolls-royce")

  + Artificial Intelligence and Generative Models for Materials
    Discovery: A Review - arXiv, accessed October 5, 2025,
    #link("https://arxiv.org/html/2508.03278v1")

  + AI can transform innovation in materials design -- here's how |
    World Economic Forum, accessed October 5, 2025,
    #link("https://www.weforum.org/stories/2025/06/ai-materials-innovation-discovery-to-design/")

  + Material discovery and modeling acceleration via machine learning -
    AIP Publishing, accessed October 5, 2025,
    #link("https://pubs.aip.org/aip/apm/article/12/9/090601/3311142/Material-discovery-and-modeling-acceleration-via")

  + Scientific AI in Materials Science: a Path to a Sustainable and
    Scalable Paradigm - PMC, accessed October 5, 2025,
    #link("https://pmc.ncbi.nlm.nih.gov/articles/PMC7919383/")

  + Learning Software Engineering During the Era of AI | Raymond Fu |
    TEDxCSTU - YouTube, accessed October 5, 2025,
    #link("https://www.youtube.com/watch?v=w4rG5GY9IlA")

  + Smart Engineering: Harnessing Intelligent Systems for Enhanced
    Performance, accessed October 5, 2025,
    #link("https://ijisae.org/index.php/IJISAE/article/download/7587/6604/12952")

  + (PDF) The Smart Engineering Curriculum - ResearchGate, accessed
    October 5, 2025,
    #link("https://www.researchgate.net/publication/332688442_The_Smart_Engineering_Curriculum")

  + What is a Digital Twin, advantages and applications - Iberdrola,
    accessed October 5, 2025,
    #link("https://www.iberdrola.com/about-us/our-innovation-model/digital-twin")

  + Cheat sheet: What is Digital Twin? | IBM, accessed October 5, 2025,
    #link("https://www.ibm.com/think/topics/digital-twin")

  + Digital Twin Manufacturing: Applications, Benefits, and Industry
    Insights - Simio, accessed October 5, 2025,
    #link("https://www.simio.com/digital-twin-manufacturing-applications-benefits-and-industry-insights/")

  + Digital Twins in Manufacturing: 5 Benefits & Applications |
    Matterport, accessed October 5, 2025,
    #link("https://matterport.com/learn/digital-twin/manufacturing")

  + Digital Twin Technology: Applications and Benefits - Vass Company,
    accessed October 5, 2025,
    #link("https://vasscompany.com/en/insights/blogs-articles/digital-twin/")

  + Smart grids - IEA, accessed October 5, 2025,
    #link("https://www.iea.org/energy-system/electricity/smart-grids")

  + Smart Grid Case Studies - Meegle, accessed October 5, 2025,
    #link("https://www.meegle.com/en_us/topics/smart-grids/smart-grid-case-studies")

  + Analysis of the Smart Grid as a System of Systems - ResearchGate,
    accessed October 5, 2025,
    #link("https://www.researchgate.net/publication/328575908_Analysis_of_the_Smart_Grid_as_a_System_of_Systems")

  + Analysis of the Smart Grid as a System of Systems Abstract … -
    arXiv, accessed October 5, 2025,
    #link("https://arxiv.org/pdf/1810.11453")

  + Systems thinking for better social policy: a case study in financial
    wellbeing, accessed October 5, 2025,
    #link("https://www.cambridge.org/core/journals/journal-of-social-policy/article/systems-thinking-for-better-social-policy-a-case-study-in-financial-wellbeing/FBA3DB30C54DE2DC9F1A118910011AA7")

  + Implementation of Systems Thinking in Public Policy: A Systematic
    Review | MDPI, accessed October 5, 2025,
    #link("https://www.mdpi.com/2079-8954/11/2/64")

  + Systems thinking case study bank - GOV.UK, accessed October 5, 2025,
    #link("https://www.gov.uk/government/publications/systems-thinking-for-civil-servants/case-studies")

  + Systemic Thinking for Policy Making - OECD, accessed October 5,
    2025,
    #link("https://www.oecd.org/en/publications/systemic-thinking-for-policy-making_879c4f7a-en.html")

  + System of systems - Wikipedia, accessed October 5, 2025,
    #link("https://en.wikipedia.org/wiki/System_of_systems")

  + DoD Systems Engineering Guide For Systems of Systems 2008 | PDF -
    Scribd, accessed October 5, 2025,
    #link("https://www.scribd.com/document/7718432/DoD-systems-engineering-guide-for-systems-of-systems-2008")

  + (PDF) Systems of Systems Engineering - ResearchGate, accessed
    October 5, 2025,
    #link("https://www.researchgate.net/publication/282350448_Systems_of_Systems_Engineering")

  + SYSTEM OF SYSTEMS ENGINEERING, accessed October 5, 2025,
    #link("https://content.e-bookshelf.de/media/reading/L-572246-91e995f5b0.pdf")

  + Engineering sustainability markets : why T-shaped engineers need
    communication design - UBC Library Open Collections - The University
    of British Columbia, accessed October 5, 2025,
    #link("https://open.library.ubc.ca/soa/cIRcle/collections/52657/items/1.0064740")

  + T-Shaped Professional | Collegiate Employment Research Institute |
    Michigan State University, accessed October 5, 2025,
    #link("https://ceri.msu.edu/publication-collection/t-shaped-professional.html")

  + DEVELOPING FUTURE ENGINEERS WITH BROAD VIEWS AND DEEP SKILLS -- THE
    EMERGENCE OF A NEW T2-CAPABILITY PROFILE - UPCommons, accessed
    October 5, 2025,
    #link("https://upcommons.upc.edu/bitstreams/a2415772-068b-49bb-bef5-123f4fe9b327/download")

  + T-Shaped Professionals: The Past, Present, and Future of MyT-Me
    Development, accessed October 5, 2025,
    #link("https://openaccess-api.cms-conferences.org/articles/download/978-1-964867-19-9_0")

  + Strive to Become a T-shaped Software Engineer | by Liambaisley |
    Medium, accessed October 5, 2025,
    #link("https://medium.com/@liambaisley/strive-to-become-a-t-shaped-software-engineer-00edd3929c2f")

  + Transforming\_Engineering\_Educ, accessed October 5, 2025,
    #link("https://www.ucviden.dk/files/186643276/Transforming_Engineering_Education_2023.pdf")

  + Engineering Futures 2035 Engineering Education Programs …, accessed
    October 5, 2025,
    #link("https://www.aced.edu.au/downloads/Engineering%20Futures%202035%20R2%20report%20to%20ACED.pdf")

  + Aalborg Universitet Transforming Engineering Education Guerra, Aida
    \- Pure, accessed October 5, 2025,
    #link("https://pure.au.dk/ws/portalfiles/portal/424622289/Transforming_Engineering_Education_2023.pdf")

  + MIT Students Break New Ground in Engineering Design with AI and
    Machine Learning, accessed October 5, 2025,
    #link("https://hoodline.com/2025/09/mit-students-break-new-ground-in-engineering-design-with-ai-and-machine-learning/")

  + AI and machine learning for engineering design | MIT News …,
    accessed October 5, 2025,
    #link("https://news.mit.edu/2025/ai-machine-learning-for-engineering-design-0907")

  + FAQ about Fall 2024 Changes - MIT EECS, accessed October 5, 2025,
    #link("https://www.eecs.mit.edu/academics/undergraduate-programs/curriculum/faq-about-fall-2024-changes/")

  + Curriculum - MIT EECS, accessed October 5, 2025,
    #link("https://www.eecs.mit.edu/academics/undergraduate-programs/curriculum/")

  + AI + Education - Stanford Accelerator for Learning, accessed October
    5, 2025,
    #link("https://acceleratelearning.stanford.edu/initiative/digital-learning/ai-and-education/")

  + RFI: Advancing AI and Education - Stanford HAI, accessed October 5,
    2025,
    #link("https://hai.stanford.edu/assets/files/hai-stanford-accelerator-for-learning-rfi-response-advancing-ai-in-education.pdf")

  + Teaching in the AI Era, accessed October 5, 2025,
    #link("https://tlhub.stanford.edu/docs/teaching-in-the-ai-era/")

  + The future is already here: AI and education in 2025 - Stanford
    Accelerator for Learning, accessed October 5, 2025,
    #link("https://acceleratelearning.stanford.edu/story/the-future-is-already-here-ai-and-education-in-2025/")

  + (PDF) Collective Intelligence - ResearchGate, accessed October 5,
    2025,
    #link("https://www.researchgate.net/publication/338177538_Collective_Intelligence")

  + Collective Intelligence V Copyright | MonarchsFactory -
    WordPress.com, accessed October 5, 2025,
    #link("https://monarchsfactory.wordpress.com/2016/03/24/collective-intelligence-v-copyright/")

  + What Is Collective Intelligence? (Chapter 1) - Cambridge University
    Press, accessed October 5, 2025,
    #link("https://www.cambridge.org/core/books/culturalhistorical-perspectives-on-collective-intelligence/what-is-collective-intelligence/ED6DBEA4032697D3FAC84AEF7382B457")



= Citing This Book

The following is the _auto-generated_, self bibliography database entry for the *`hayagriva`*
manager:

#block(width: 100%)[
  #let self-bib = context query(<self-bib-entry>).first().value
  #set par(leading: 0.5em)
  #text(font: "Inconsolata", size: 9pt, weight: "bold")[
    #self-bib
  ]
]


