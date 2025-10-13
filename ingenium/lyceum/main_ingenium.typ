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
  page-fill: color.hsl(45deg, 15%, 85%),  // ivory
  text-font: ("EB Garamond", "Libertinus Serif"),
  text-size: TEXT-SIZE,
  lang-name: "en",
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


= Contents

#outline(
  title: none,
  target: heading.where(level: 1),
  indent: auto,
)


//----------------------------------------------------------------------------//
//                                BODY-MATTER                                 //
//----------------------------------------------------------------------------//

#show: BODY-MATTER.with(TEXT-SIZE, "Chapter", ship-part-page: false)

= Introduction

#lorem(520)

$ e = m c^2 $

== Sub-Section

#lorem(530)

== Sub-Section

#lorem(530)

= Methodology

#lorem(750)

== Sub-Section

#lorem(730)


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


