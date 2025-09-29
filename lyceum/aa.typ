// #import "@preview/lyceum:0.1.0": FRONT-MATTER
#import "@preview/lyceum:0.1.0": FRONT-MATTER, BODY-MATTER, APPENDIX, BACK-MATTER

#let TEXT-SIZE = 11pt

//----------------------------------------------------------------------------//
//                                FRONT-MATTER                                //
//----------------------------------------------------------------------------//

#show: FRONT-MATTER.with(
  // Document metadata
  title: (
    title: "Igneous Rocks",
    subtitle: "The Hard Science",
    sep: " - "
  ),
  authors: (
    (
      given-name: "Evelyn D.",
      name: "Crump",
      affiliation: "Rocks Hard Research Group",
      email: "crumped@rockshard.org.far",
      location: "Rich Mines, Faraway Country",
    ), (
      preffix: "Sir.",
      given-name: "Effie J.",
      name: "Hitchcock",
      suffix: "Jr.",
      affiliation: "Hard University",
      email: "hitchcockej@hard.edu.far",
      location: "Rockbridge, Faraway Country",
    ),
  ),
  editors: ("Cenhelm, Erwin", ),
  publisher: "Lyceum Publisher",
  location: "Lyceum City, Faraway Country",
  affiliated: (
    illustrator: ("Revaz Sopheap", ),
    organizer: "Darko Sergej",
  ),
  keywords: ("igneous", "rocks", "geology", ),
  date: datetime(year: 2024, month: 9, day: 13), // auto => datetime.today()
  // Document general format
  page-size: (width: 155mm, height: 230mm),
  page-margin: (inside: 30mm, rest: 25mm),
  page-binding: left,
  page-fill: color.hsl(45deg, 15%, 85%),  // ivory
  text-font: ("EB Garamond", "Libertinus Serif"),
  text-size: TEXT-SIZE,
  lang-name: "en",
)


Arsitektur #emph[Enterprise] (EA) dan manajemen proyek bekerja sama
untuk menyelaraskan inisiatif teknologi dengan tujuan bisnis melalui
serangkaian tahapan perencanaan, identifikasi kebutuhan, penentuan
prioritas, dan eksekusi yang terstruktur.

Berikut adalah penjelasan komprehensif mengenai bagaimana penyelarasan
ini dilakukan berdasarkan sumber:

=== 1. Peran Arsitektur #emph[Enterprise] dalam Penyelarasan Tujuan
<peran-arsitektur-enterprise-dalam-penyelarasan-tujuan>
EA berfungsi sebagai kerangka kerja untuk mengarahkan inisiatif
teknologi agar sesuai dengan sasaran strategis perusahaan.

- #strong[Menetapkan Arah Bisnis dan Teknologi (Baseline ke Target):]
  Semua inisiatif harus dieksekusi sebagai bagian dari perpindahan dari
  arsitektur saat ini (#emph[baseline];) menuju arsitektur masa depan
  (#emph[target];) yang lebih baik. Arsitektur masa depan ini harus
  disesuaikan dengan #strong[tujuan ke mana #emph[enterprise] ini mau
  bergerak];.
- #strong[#emph[High Level] dan Acuan Implementasi:] EA bekerja pada
  tingkat yang tinggi (#emph[High Level];), yaitu memberikan arah.
  Dengan adanya arah yang jelas dari EA, ketika implementasi detail
  dilakukan, semua pihak memiliki acuan yang sama sehingga semua
  bergerak ke arah yang sama.
- #strong[Identifikasi Kesenjangan (#emph[Gap];):] Proses EA melibatkan
  representasi yang serupa antara #emph[baseline] dan #emph[target]
  untuk memudahkan identifikasi #strong[kesenjangan (#emph[gap];)] atau
  perbedaan. Kesenjangan inilah yang harus diidentifikasi untuk
  mendapatkan program-program atau inisiatif yang harus dilakukan.
- #strong[Inisiatif sebagai Perubahan:] Esensi dari program atau
  inisiatif adalah melakukan perubahan untuk mengimplementasikan
  perpindahan dari #emph[baseline] menuju #emph[target];. Program atau
  inisiatif ini kemudian dipecah menjadi #emph[Project];.

=== 2. Peran Manajemen Proyek dan #emph[Roadmap] dalam Eksekusi
<peran-manajemen-proyek-dan-roadmap-dalam-eksekusi>
Setelah inisiatif (program/proyek) diidentifikasi, manajemen proyek
(terutama melalui #emph[roadmap];) bertugas memastikan inisiatif
tersebut dieksekusi tepat waktu dan sesuai dengan prioritas bisnis.

==== Penentuan Waktu dan Prioritas dalam #emph[Roadmap]
<penentuan-waktu-dan-prioritas-dalam-roadmap>
- #strong[Roadmap Sebagai Alat Penempatan Waktu:] Daftar program atau
  #emph[project] dituangkan ke dalam #emph[roadmap] (pemetaan ke waktu)
  untuk menetapkan #strong[kapan] proyek tersebut akan dijalankan,
  termasuk tahun dan bulan keberapa.
- #strong[Prioritas Bisnis Sebagai Patokan Utama:] Pertimbangan pertama
  dalam menentukan kapan proyek sebaiknya dieksekusi adalah
  #strong[kebutuhan bisnis] (bisnis mintanya kapan). Proyek harus
  disesuaikan jika, misalnya, bisnis menargetkan tahun 2024 sudah harus
  menjalankan operasional baru dibantu aplikasi tertentu.
- #strong[Kompromi Sumber Daya:] Walaupun kepentingan bisnis diutamakan,
  inisiatif tidak harus selalu segera dituruti. Pihak teknologi (IT)
  harus mengajak kompromi karena keterbatasan sumber daya, anggaran
  (#emph[budget];), dan orang. Kompromi dicari untuk meratakan
  distribusi proyek, sambil tetap memperhatikan hal-hal yang tidak bisa
  ditawar (misalnya, keputusan rapat direksi atau kepentingan yang
  mendesak).
- #strong[Teknik Prioritas:] Untuk inisiatif yang fleksibel, teknik
  prioritas digunakan (seperti grafik #emph[Risk] dan #emph[Value];)
  untuk menentukan mana yang harus diutamakan. Prioritas tertinggi
  diberikan kepada proyek yang #strong[risikonya rendah (#emph[low
  risk];) tetapi memiliki nilai (#emph[value];) yang tinggi];.
- #strong[Dependensi:] Faktor penting lainnya adalah dependensi. Sebuah
  inisiatif mungkin terlihat tidak memiliki nilai besar, tetapi ia bisa
  menjadi #strong[kunci penyelesaian] inisiatif-inisiatif lain (seperti
  penataan akses atau platform #emph[open];) sehingga harus diutamakan.

==== Memastikan Dampak Bisnis (#emph[Business Impact];)
<memastikan-dampak-bisnis-business-impact>
Manajemen proyek tidak hanya berfokus pada hasil kerja
(#emph[deliverable];), tetapi juga pada dampak bisnis yang dihasilkan.

- #strong[#emph[Deliverable] vs.~#emph[Business Impact];:] Setiap proyek
  harus mendefinisikan #emph[deliverable] (misalnya, aplikasi yang
  teruji). Namun, tercapainya #emph[deliverable] #strong[tidak menjamin]
  keuntungan bagi bisnis.
- #strong[Integrasi ke dalam Dokumen EA:] Untuk mencegah terabaikannya
  dampak bisnis, disarankan agar dokumen EA yang berisi daftar inisiatif
  juga menyertakan #strong[deskripsi dampak (#emph[impact];) yang
  diharapkan];. Dampak ini bisa berupa penghematan waktu, percepatan
  layanan, atau efisiensi.
- #strong[Mencapai #emph[Impact];:] Adanya kolom dampak ini memaksa
  perusahaan untuk memikirkan mekanisme agar dampak bisnis benar-benar
  tercapai, misalnya melalui pelatihan operator atau memastikan dukungan
  dari pimpinan bisnis unit agar mereka mau mengubah kebiasaan kerja
  lama.

=== 3. Peran #emph[Project Management Office] (PMO)
<peran-project-management-office-pmo>
Setelah #emph[roadmap] dihasilkan oleh tim EA, eksekusinya dikelola
secara keseluruhan oleh #emph[Project Management Office] (PMO).

- #strong[Pengelolaan Seluruh Proyek:] PMO adalah unit organisasi
  permanen yang bertugas mengelola #strong[kumpulan seluruh proyek]
  (#emph[Collection of Project or programs];) di perusahaan, termasuk
  proyek yang berasal dari EA maupun proyek non-EA lainnya (misalnya,
  perpindahan kantor atau penataan ruangan).
- #strong[Koordinasi dan Sumber Daya:] PMO memiliki catatan semua proyek
  dan bertanggung jawab untuk melihat gambaran besar (portofolio),
  memastikan tidak ada proyek yang terhambat karena dependensi proyek
  lain yang belum selesai. PMO juga mengelola sumber daya dan menentukan
  #emph[Project Manager] yang tepat berdasarkan pengalaman dan
  pengetahuan manajemen proyek yang dimiliki.
- #strong[Kerangka Kerja Pelaksanaan:] PMO memastikan adanya
  #emph[Framework] manajemen proyek dan mencatat keberhasilan atau
  kegagalan setiap #emph[Project Manager];.

Dengan demikian, EA menyediakan #strong[arah strategis] yang didasarkan
pada tujuan bisnis, sementara manajemen proyek (melalui #emph[roadmap]
dan PMO) menyediakan #strong[mekanisme eksekusi] yang sistematis dan
terprioritas untuk mewujudkan perubahan tersebut menjadi dampak bisnis
nyata.
