// #import "@preview/lyceum:0.1.0": FRONT-MATTER
#import "@preview/lyceum:0.1.0": FRONT-MATTER, BODY-MATTER, APPENDIX, BACK-MATTER

#let TEXT-SIZE = 11pt

//----------------------------------------------------------------------------//
//                                FRONT-MATTER                                //
//----------------------------------------------------------------------------//

#show: FRONT-MATTER.with(
  // Document metadata
   title: (
    title: "Kisah Hidupmu, Mahakaryamu",
    subtitle: "Kekuatan Cerita Personal",
    sep: " - "
  ),
  
  authors: (
    (
      given-name: "Armein Z. R.",
      name: "Langi",
      affiliation: "TISE Research Group, STEI, ITB",
      email: "armein@itb.ac.id",
      location: "Bandung, Jawa arat",
    ), 
  ),
  editors: ("Cenhelm, Erwin", ),
  publisher: "Lyceum Publisher",
  location: "Lyceum City, Faraway Country",
  affiliated: (
    illustrator: ("Revaz Sopheap", ),
    organizer: "Darko Sergej",
  ),
  keywords: ("Storytelling", "Pengembangan Diri", "Perencanaan Hidup", "Narasi Personal", "Psikologi Naratif", "Tujuan Hidup", "Transformasi Diri", ),
  date: datetime(year: 2025, month: 9, day: 30), // auto => datetime.today()
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

= Pengantar

Selamat datang, para pahlawan dari cerita Anda sendiri.

Di tangan Anda saat ini bukan sekadar buku. Ini adalah undangan—sebuah panggilan untuk melihat kehidupan Anda tidak lagi sebagai serangkaian peristiwa acak, melainkan sebagai sebuah epik yang agung, dengan Anda sebagai tokoh utamanya.

Sejak kecil, kita dibesarkan dengan cerita. Dongeng sebelum tidur, film yang menginspirasi, atau kisah perjuangan para tokoh dunia. Cerita memiliki kekuatan luar biasa untuk menyentuh hati, mengubah pikiran, dan menggerakkan tindakan. Ia adalah bahasa universal yang dipahami oleh jiwa kita.

Lalu, mengapa kita tidak menggunakan kekuatan dahsyat ini untuk merancang kehidupan kita sendiri?

Sering kali kita terjebak dalam narasi yang ditulis oleh orang lain atau oleh keadaan: ekspektasi keluarga, tekanan sosial, atau kegagalan masa lalu yang terus menghantui. Kita lupa bahwa pena itu sebenarnya ada di tangan kita. Kita memiliki kekuatan untuk memulai babak baru, memperkenalkan karakter pendukung yang hebat, menghadapi naga-naga ketakutan kita, dan menulis akhir yang kita impikan.

Setiap individu memiliki cerita unik yang membentuk siapa diri mereka. Namun, hanya sedikit yang menyadari bahwa mereka bisa menjadi penulis sadar dari kisah hidup mereka sendiri. Buku ini mengeksplorasi metodologi *storytelling* (bercerita) sebagai alat transformatif untuk pengembangan diri dan perencanaan hidup. Dengan memahami elemen-elemen naratif fundamental—seperti karakter, konflik, klimaks, dan resolusi—pembaca akan dipandu untuk merefleksikan masa lalu, memahami masa kini, dan secara proaktif merancang masa depan yang mereka inginkan. Pendekatan ini mengubah perencanaan hidup dari sekadar rangkaian target menjadi sebuah perjalanan heroik yang bermakna, di mana setiap tantangan adalah bagian dari alur cerita menuju pertumbuhan dan pemenuhan diri. Buku ini menyajikan kerangka kerja praktis untuk mengidentifikasi plot utama dalam hidup, menulis ulang narasi yang membatasi, dan membangun sebuah mahakarya kehidupan yang otentik dan memuaskan.


Buku ini lahir dari keyakinan bahwa cara paling ampuh untuk menjalani kehidupan yang luar biasa adalah dengan menjadi sadar akan cerita yang kita jalani setiap hari. Di dalamnya, kita akan belajar bersama cara membedah masa lalu untuk menemukan kekuatan, menafsirkan tantangan masa kini sebagai plot yang mendebarkan, dan yang terpenting, menyusun visi masa depan sebagai sebuah mahakarya yang layak diperjuangkan.

Ini bukan tentang menciptakan fiksi. Ini tentang menemukan kebenaran terdalam dari diri Anda dan menyajikannya dalam alur yang paling memberdayakan.

Mari kita mulai perjalanan ini. Mari kita ambil pena itu dan mulai menulis. Sebab, kisah hidup Anda adalah mahakarya yang menunggu untuk diwujudkan.

Selamat membaca dan selamat berkarya.


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

#include "kisah.typ"



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


