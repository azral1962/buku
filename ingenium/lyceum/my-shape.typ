// Some definitions presupposed by pandoc's typst output.
#let blockquote(body) = [
  #set text( size: 0.92em )
  #block(inset: (left: 1.5em, top: 0.2em, bottom: 0.2em))[#body]
]

#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

// Some quarto-specific definitions.

#show raw.where(block: true): set block(
    fill: luma(230),
    width: 100%,
    inset: 8pt,
    radius: 2pt
  )

#let block_with_new_content(old_block, new_content) = {
  let d = (:)
  let fields = old_block.fields()
  fields.remove("body")
  if fields.at("below", default: none) != none {
    // TODO: this is a hack because below is a "synthesized element"
    // according to the experts in the typst discord...
    fields.below = fields.below.abs
  }
  return block.with(..fields)(new_content)
}

#let empty(v) = {
  if type(v) == str {
    // two dollar signs here because we're technically inside
    // a Pandoc template :grimace:
    v.matches(regex("^\\s*$")).at(0, default: none) != none
  } else if type(v) == content {
    if v.at("text", default: none) != none {
      return empty(v.text)
    }
    for child in v.at("children", default: ()) {
      if not empty(child) {
        return false
      }
    }
    return true
  }

}

// Subfloats
// This is a technique that we adapted from https://github.com/tingerrr/subpar/
#let quartosubfloatcounter = counter("quartosubfloatcounter")

#let quarto_super(
  kind: str,
  caption: none,
  label: none,
  supplement: str,
  position: none,
  subrefnumbering: "1a",
  subcapnumbering: "(a)",
  body,
) = {
  context {
    let figcounter = counter(figure.where(kind: kind))
    let n-super = figcounter.get().first() + 1
    set figure.caption(position: position)
    [#figure(
      kind: kind,
      supplement: supplement,
      caption: caption,
      {
        show figure.where(kind: kind): set figure(numbering: _ => numbering(subrefnumbering, n-super, quartosubfloatcounter.get().first() + 1))
        show figure.where(kind: kind): set figure.caption(position: position)

        show figure: it => {
          let num = numbering(subcapnumbering, n-super, quartosubfloatcounter.get().first() + 1)
          show figure.caption: it => {
            num.slice(2) // I don't understand why the numbering contains output that it really shouldn't, but this fixes it shrug?
            [ ]
            it.body
          }

          quartosubfloatcounter.step()
          it
          counter(figure.where(kind: it.kind)).update(n => n - 1)
        }

        quartosubfloatcounter.update(0)
        body
      }
    )#label]
  }
}

// callout rendering
// this is a figure show rule because callouts are crossreferenceable
#show figure: it => {
  if type(it.kind) != str {
    return it
  }
  let kind_match = it.kind.matches(regex("^quarto-callout-(.*)")).at(0, default: none)
  if kind_match == none {
    return it
  }
  let kind = kind_match.captures.at(0, default: "other")
  kind = upper(kind.first()) + kind.slice(1)
  // now we pull apart the callout and reassemble it with the crossref name and counter

  // when we cleanup pandoc's emitted code to avoid spaces this will have to change
  let old_callout = it.body.children.at(1).body.children.at(1)
  let old_title_block = old_callout.body.children.at(0)
  let old_title = old_title_block.body.body.children.at(2)

  // TODO use custom separator if available
  let new_title = if empty(old_title) {
    [#kind #it.counter.display()]
  } else {
    [#kind #it.counter.display(): #old_title]
  }

  let new_title_block = block_with_new_content(
    old_title_block, 
    block_with_new_content(
      old_title_block.body, 
      old_title_block.body.body.children.at(0) +
      old_title_block.body.body.children.at(1) +
      new_title))

  block_with_new_content(old_callout,
    block(below: 0pt, new_title_block) +
    old_callout.body.children.at(1))
}

// 2023-10-09: #fa-icon("fa-info") is not working, so we'll eval "#fa-info()" instead
#let callout(body: [], title: "Callout", background_color: rgb("#dddddd"), icon: none, icon_color: black, body_background_color: white) = {
  block(
    breakable: false, 
    fill: background_color, 
    stroke: (paint: icon_color, thickness: 0.5pt, cap: "round"), 
    width: 100%, 
    radius: 2pt,
    block(
      inset: 1pt,
      width: 100%, 
      below: 0pt, 
      block(
        fill: background_color, 
        width: 100%, 
        inset: 8pt)[#text(icon_color, weight: 900)[#icon] #title]) +
      if(body != []){
        block(
          inset: 1pt, 
          width: 100%, 
          block(fill: body_background_color, width: 100%, inset: 8pt, body))
      }
    )
}



#let article(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  lang: "en",
  region: "US",
  font: "libertinus serif",
  fontsize: 11pt,
  title-size: 1.5em,
  subtitle-size: 1.25em,
  heading-family: "libertinus serif",
  heading-weight: "bold",
  heading-style: "normal",
  heading-color: black,
  heading-line-height: 0.65em,
  sectionnumbering: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set heading(numbering: sectionnumbering)
  if title != none {
    align(center)[#block(inset: 2em)[
      #set par(leading: heading-line-height)
      #if (heading-family != none or heading-weight != "bold" or heading-style != "normal"
           or heading-color != black) {
        set text(font: heading-family, weight: heading-weight, style: heading-style, fill: heading-color)
        text(size: title-size)[#title]
        if subtitle != none {
          parbreak()
          text(size: subtitle-size)[#subtitle]
        }
      } else {
        text(weight: "bold", size: title-size)[#title]
        if subtitle != none {
          parbreak()
          text(weight: "bold", size: subtitle-size)[#subtitle]
        }
      }
    ]]
  }

  if authors != none {
    let count = authors.len()
    let ncols = calc.min(count, 3)
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 1.5em,
      ..authors.map(author =>
          align(center)[
            #author.name \
            #author.affiliation \
            #author.email
          ]
      )
    )
  }

  if date != none {
    align(center)[#block(inset: 1em)[
      #date
    ]]
  }

  if abstract != none {
    block(inset: 2em)[
    #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
    ]
  }

  if toc {
    let title = if toc_title == none {
      auto
    } else {
      toc_title
    }
    block(above: 0em, below: 2em)[
    #outline(
      title: toc_title,
      depth: toc_depth,
      indent: toc_indent
    );
    ]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}

#set table(
  inset: 6pt,
  stroke: none
)

#set page(
  paper: "us-letter",
  margin: (x: 1.25in, y: 1.25in),
  numbering: "1",
)

#show: doc => article(
  title: [My SHAPE: Menemukan Profil Diri Untuk Komunikasi Diri],
  abstract: [Anda perlu melakukan tiga hal (1) Menyusun Profile Anda menggnakan berbagai instrumen, (2) menulis Priagam Diri, lalu (3) menulis Narasi Diri

],
  abstract-title: "Abstract",
  toc_title: [Table of contents],
  toc_depth: 3,
  cols: 1,
  doc,
)

= SHAPE: Kerangka Kerja untuk Pengembangan Pribadi dan Profesional
<shape-kerangka-kerja-untuk-pengembangan-pribadi-dan-profesional>
== Konsep
<konsep>
Tabel berikut berisi konseptual SHAPE.

#table(
  columns: (38%, 62%),
  align: (auto,auto,),
  [Komponen SHAPE], [Konsep Inti],
  [#strong[S] - Signature Strengths], [Pola pemikiran, perasaan, dan perilaku bawaan yang berkinerja tinggi yang mengarah pada keunggulan. Berakar pada psikologi positif.],
  [#strong[H] - Core Values & Intrinsic Motivations], [Prinsip-prinsip panduan yang tidak dapat dinegosiasikan dan pendorong internal yang memberikan energi dan kepuasan.],
  [#strong[A] - Aptitudes & Acquired Skills], [Bakat alami yang dikombinasikan dengan kompetensi, pengetahuan, dan keahlian yang diperoleh melalui pendidikan dan praktik.],
  [#strong[P] - Psychometric Profile], [Preferensi dan kecenderungan perilaku yang dapat diukur yang membentuk gaya kerja dan interaksi.],
  [#strong[E] - Narrative Identity & Post-Traumatic Growth], [Kisah hidup yang koheren yang membentuk identitas, dan pertumbuhan psikologis positif yang dihasilkan dari kesulitan.],
)
=== "Signature Strengths"
<signature-strengths>
Komponen 'S' adalah "Signature Strengths" (Kekuatan Khas), sebuah konsep yang mapan dari psikologi positif, terkait langsung dalam taksonomi bakat dan kekuatan.

Dua kerangka kerja yang sangat cocok untuk adaptasi ini adalah:

- #strong[CliftonStrengths (sebelumnya StrengthsFinder):] Asesmen ini mengidentifikasi 34 "tema bakat" (misalnya, Achiever, Strategic, Empathy, Developer) yang merupakan pola bawaan dari pemikiran, perasaan, dan perilaku.#super[18] Digunakan oleh lebih dari 90% perusahaan Fortune 500, CliftonStrengths menyediakan bahasa yang kuat dan berorientasi pada kinerja untuk apa yang disebut SHAPE sebagai karunia.#super[18]

- #strong[VIA Survey of Character Strengths:] Kerangka kerja ini mengidentifikasi 24 kekuatan karakter universal (misalnya, Kreativitas, Keberanian, Kebaikan, Kepemimpinan) yang merupakan fondasi dari kesejahteraan.#super[20] Ini menawarkan alternatif yang lebih berorientasi pada kebajikan dan humanistik.

=== H -- Dari "Heart" -\> "Core Values & Intrinsic Motivations"
<h-dari-heart---core-values-intrinsic-motivations>
Komponen "Hati"---yang mencakup gairah dan hasrat #super[2];---dapat diterjemahkan dengan mulus ke dalam konsep psikologis tentang motivasi intrinsik dan nilai-nilai inti (#emph[core values];). Alih-alih bertanya apa passion saya, pendekatan ini mengajukan pertanyaan-pertanyaan seperti:

- "Aktivitas apa yang membuat saya masuk ke dalam kondisi 'flow' (larut dalam pekerjaan)?"

- "Prinsip-prinsip apa yang tidak dapat saya negosiasikan dalam hidup dan pekerjaan saya?"

- "Masalah apa di dunia ini yang saya merasa terdorong untuk menyelesaikannya?"

Pertanyaan-pertanyaan ini menghubungkan komponen 'H' dengan teori-teori motivasi yang mapan, seperti Teori Penentuan Diri (#emph[Self-Determination Theory];) yang menekankan kebutuhan akan Otonomi, Kompetensi, dan Keterhubungan, serta latihan klarifikasi nilai yang umum digunakan dalam pembinaan (#emph[coaching];) dan terapi.

=== A -- Dari "Abilities" ke "Aptitudes & Acquired Skills"
<a-dari-abilities-ke-aptitudes-acquired-skills>
"Kemampuan" berfokus pada bakat alami yang dibawa sejak lahir.#super[5] Untuk membuat model ini lebih komprehensif dan praktis untuk pengembangan karir, adaptasi sekuler memperluas kategori ini.

'A' yang diadaptasi akan menjadi singkatan dari #strong[Aptitudes & Acquired Skills] (Bakat & Keterampilan yang Diperoleh). Ini tidak hanya mencakup bakat alami (#emph[aptitudes];) tetapi juga kompetensi, pengetahuan, dan keterampilan (#emph[acquired skills];) yang diperoleh melalui pendidikan, pelatihan, dan pengalaman. Perluasan ini membuat model tersebut jauh lebih relevan untuk menyusun CV, merencanakan pengembangan profesional, atau menganalisis kesiapan untuk suatu peran. Misalnya, seseorang mungkin memiliki #emph[bakat] alami untuk logika, yang kemudian mereka kembangkan menjadi #emph[keterampilan yang diperoleh] dalam pemrograman komputer.

=== P -- Dari "Personality" ke "Psychometric Profile"
<p-dari-personality-ke-psychometric-profile>
Tujuan untuk memahami mode interaksi yang disukai seseorang #super[4] sangat selaras dengan psikologi kepribadian modern. SHAPE merekomendasikan penggunaan alat psikometri yang tervalidasi dan mapan untuk mendapatkan "Profil Psikometrik" yang lebih akurat.

- #strong[Myers-Briggs Type Indicator (MBTI):] Menggambarkan 16 tipe kepribadian berdasarkan preferensi dalam empat dikotomi: arah energi (E/I), pengumpulan informasi (S/N), pengambilan keputusan (T/F), dan orientasi terhadap dunia luar (J/P).#super[21] MBTI menyediakan kosakata yang kaya untuk pemahaman diri dan dinamika tim.

- #strong[The Big Five (OCEAN):] Model yang divalidasi secara empiris yang menilai kepribadian pada lima spektrum: Keterbukaan (#emph[Openness];), Kehati-hatian (#emph[Conscientiousness];), Ekstraversi (#emph[Extraversion];), Keramahan (#emph[Agreeableness];), dan Neurotisisme (#emph[Neuroticism];).

- #strong[DISC Assessment:] Berfokus pada gaya perilaku di tempat kerja: Dominasi (#emph[Dominance];), Pengaruh (#emph[Influence];), Kestabilan (#emph[Steadiness];), dan Kepatuhan (#emph[Conscientiousness];).#super[24]

=== E -- Dari "Experiences" ke "Narrative Identity & Post-Traumatic Growth"
<e-dari-experiences-ke-narrative-identity-post-traumatic-growth>
Prinsip kuat "jangan sia-siakan luka" (#emph[never waste a hurt];) #super[13] dapat dibingkai ulang melalui konsep-konsep psikologis sekuler yang kuat.

- #strong[Identitas Naratif (#emph[Narrative Identity];):] Teori ini menyatakan bahwa individu membentuk identitas dengan merangkai peristiwa hidup mereka menjadi sebuah cerita yang koheren. Komponen 'E' yang diadaptasi mendorong individu untuk menganalisis kisah hidup mereka, mengidentifikasi titik balik, tantangan, dan kemenangan untuk memahami narasi pribadi mereka dan kebijaksanaan yang diperoleh darinya.

- #strong[Pertumbuhan Pasca-Trauma (#emph[Post-Traumatic Growth] - PTG):] Konsep dari psikologi positif ini menggambarkan perubahan psikologis positif yang dialami sebagai hasil dari perjuangan dengan krisis besar dalam hidup. PTG memberikan dasar ilmiah untuk gagasan bahwa pengalaman yang menyakitkan dapat menjadi sumber kekuatan, ketahanan, perspektif baru, dan rasa tujuan yang lebih dalam.

Kerangka kerja SHAPE ini bukan hanya alat untuk penemuan diri individu, tetapi juga menjadi kerangka kerja strategis yang kuat untuk manajemen bakat. Sebuah organisasi dapat menggunakannya untuk memetakan profil komprehensif seorang karyawan (Kekuatan, Nilai, Keterampilan, Kepribadian, Pengalaman) terhadap persyaratan peran, komposisi tim, dan jalur karir. Pendekatan holistik ini lebih unggul daripada asesmen satu dimensi (misalnya, hanya melihat keterampilan atau kepribadian) dan dapat mengarah pada keputusan perekrutan yang lebih baik, keterlibatan yang lebih tinggi, dan pengembangan kepemimpinan yang lebih efektif. Ini mengubah model dari alat pribadi menjadi kapabilitas organisasi yang strategis.

= Panduan Praktis untuk Penemuan Diri
<panduan-praktis-untuk-penemuan-diri>
Setelah memenjelaskan kerangka konseptual SHAPE, langkah selanjutnya adalah mengubahnya menjadi proses yang dapat ditindaklanjuti. Bagian ini menyediakan panduan praktis, termasuk rekomendasi alat asesmen dan proses langkah demi langkah untuk mensintesis hasilnya menjadi profil pribadi yang kohesif dan dapat digunakan.

== Panduan Instrumen Asesmen Sekuler
<panduan-instrumen-asesmen-sekuler>
Untuk setiap komponen dari kerangka kerja SHAPE yang telah diadaptasi, terdapat berbagai alat asesmen yang tervalidasi dan diakui secara luas. Tabel di bawah ini berfungsi sebagai panduan praktis untuk memilih instrumen yang tepat untuk setiap domain.

#table(
  columns: (20%, 20%, 20%, 20%, 20%),
  align: (auto,auto,auto,auto,auto,),
  [Komponen yang Diadaptasi], [Pertanyaan Kunci yang Dijawab], [Rekomendasi Asesmen], [Biaya & Akses], [Hasil yang Diberikan],
  [#strong[S] - Signature Strengths], ["Apa pola keunggulan bawaan saya?"], [Gallup's CliftonStrengths #super[18];], [Berbayar, asesmen online], [Laporan 5 atau 34 tema bakat teratas.],
  [], ["Apa kekuatan karakter terbaik saya?"], [VIA Character Strengths Survey #super[20];], [Gratis, registrasi online], [Daftar peringkat 24 kekuatan karakter.],
  [#strong[H] - Core Values & Motivations], ["Apa yang paling penting bagi saya?"], [Latihan Klarifikasi Nilai (misalnya, dari Brené Brown, Russ Harris)], [Gratis, tersedia online], [Daftar 2-3 nilai inti pribadi.],
  [], ["Apa yang mendorong dan memberi saya energi?"], [Tes Motivasi Intrinsik (misalnya, Self-Determination Theory questionnaires)], [Bervariasi, banyak yang gratis], [Wawasan tentang pendorong otonomi, kompetensi, dan keterhubungan.],
  [#strong[A] - Aptitudes & Acquired Skills], ["Apa bakat alami dan keterampilan yang telah saya kembangkan?"], [Tes Bakat (misalnya, tes penalaran diferensial) & Inventaris Keterampilan Pribadi], [Bervariasi, banyak yang gratis], [Identifikasi bakat kognitif dan daftar keterampilan teknis & lunak.],
  [#strong[P] - Psychometric Profile], ["Bagaimana preferensi kepribadian saya?"], [Myers-Briggs Type Indicator (MBTI) #super[21];], [Berbayar, sering melalui praktisi bersertifikat], [Profil 16 tipe kepribadian (misalnya, INTJ).],
  [], ["Di mana posisi saya pada spektrum sifat-sifat utama?"], [Big Five Personality Test (misalnya, IPIP-NEO) #super[26];], [Banyak versi gratis online], [Skor persentil pada 5 dimensi (OCEAN).],
  [], ["Bagaimana gaya perilaku saya di tempat kerja?"], [DISC Assessment #super[24];], [Berbayar, tersedia online], [Profil perilaku (Dominance, Influence, Steadiness, Conscientiousness).],
  [#strong[E] - Narrative Identity & Experiences], ["Apa kisah hidup saya dan pelajaran apa yang telah saya petik?"], [Latihan Penulisan Jurnal Naratif (misalnya, "Future Self" atau "Life Story" exercises)], [Gratis, dilakukan sendiri], [Narasi pribadi yang mengidentifikasi tema, titik balik, dan pertumbuhan.],
)
== Proses Sintesis: Mengintegrasikan Hasil Asesmen Anda menjadi Profil Pribadi yang Kohesif
<proses-sintesis-mengintegrasikan-hasil-asesmen-anda-menjadi-profil-pribadi-yang-kohesif>
Memiliki lima daftar hasil yang terpisah tidaklah cukup; kekuatan sesungguhnya dari kerangka kerja ini terletak pada sintesis---melihat bagaimana komponen-komponen ini saling berinteraksi dan saling menguatkan. Proses berikut memandu pengguna dalam mengintegrasikan data mereka menjadi satu narasi yang kuat.

- #strong[Langkah 1: Fondasi (S & H - Kekuatan & Nilai).] Mulailah dengan menganalisis #emph[Signature Strengths] dan #emph[Core Values] Anda. Ini adalah "mengapa" dan "bagaimana" Anda. Cari tumpang tindih dan sinergi. Apakah nilai Anda tentang "keadilan" selaras dengan kekuatan Anda dalam "Analitis"? Apakah hasrat Anda untuk "membantu orang lain bertumbuh" tercermin dalam kekuatan "Developer" Anda? Kombinasi ini membentuk inti dari identitas Anda.

- #strong[Langkah 2: Pemberdaya (A & P - Keterampilan & Kepribadian).] Selanjutnya, lapisi #emph[Acquired Skills] dan #emph[Psychometric Profile] Anda. Bagaimana kepribadian Anda (misalnya, Introvert) membentuk cara Anda menggunakan kekuatan "Developer" Anda---mungkin melalui pembinaan satu-satu yang mendalam daripada lokakarya kelompok besar? Keterampilan apa (misalnya, sertifikasi #emph[coaching];, keahlian dalam perangkat lunak manajemen proyek) yang telah Anda bangun untuk mendukung kekuatan dan nilai-nilai inti Anda? Langkah ini menghubungkan potensi bawaan Anda dengan kapabilitas nyata.

- #strong[Langkah 3: Konteks (E - Pengalaman).] Terakhir, gunakan #emph[Narrative Identity] Anda untuk memberikan konteks dan kedalaman. Bagaimana pengalaman masa lalu Anda, terutama tantangan, telah membentuk nilai-nilai Anda dan menempa kekuatan Anda? Mungkin pengalaman menyakitkan bekerja di bawah manajemen yang buruk telah memicu hasrat Anda untuk mengembangkan orang lain dengan cara yang benar. Atau, keberhasilan dalam memimpin proyek yang kompleks saat muda telah mengasah kekuatan "Strategic" Anda. Langkah ini memberikan makna pada perjalanan Anda.

Hasil akhir dari proses sintesis ini idealnya adalah dokumen satu halaman yang dapat disebut "Piagam Pribadi" atau "Profil Identitas Profesional." Dokumen ini harus merangkum profil SHAPE Anda yang terintegrasi dan mengartikulasikan pernyataan misi pribadi atau profesional yang jelas dan dapat ditindaklanjuti.

== Aplikasi dalam Praktik: Memanfaatkan Profil Anda
<aplikasi-dalam-praktik-memanfaatkan-profil-anda>
Profil SHAPE yang terintegrasi adalah alat yang dinamis, bukan artefak statis. Berikut adalah beberapa cara konkret untuk menerapkannya:

- #strong[Untuk Perencanaan Karir:] Gunakan profil Anda untuk mengidentifikasi peran pekerjaan, industri, dan budaya perusahaan yang paling sesuai. Alih-alih hanya mencocokkan keterampilan pada deskripsi pekerjaan, Anda dapat menilai keselarasan dengan nilai-nilai, kekuatan, dan preferensi kepribadian Anda. Gunakan bahasa dari profil Anda untuk menulis CV dan surat lamaran yang lebih menarik dan otentik, serta untuk menjawab pertanyaan wawancara seperti "Ceritakan tentang diri Anda" dengan narasi yang kuat dan koheren.

- #strong[Untuk Pengembangan Kepemimpinan:] Para pemimpin dapat menggunakan profil SHAPE mereka untuk mengembangkan gaya kepemimpinan yang otentik yang memanfaatkan kekuatan alami mereka. Misalnya, seorang pemimpin dengan kekuatan "Includer" dan "Empathy" dapat secara sadar membangun budaya tim yang aman secara psikologis. Selain itu, mereka dapat menggunakan kerangka kerja ini untuk lebih memahami, memotivasi, dan menugaskan anggota tim mereka, menempatkan orang pada peran di mana SHAPE unik mereka dapat bersinar, sehingga meningkatkan keterlibatan dan kinerja tim.

- #strong[Untuk Kepuasan Pribadi:] Di luar ranah profesional, profil SHAPE dapat memandu pilihan dalam kehidupan pribadi. Gunakan untuk memilih hobi, pekerjaan sukarela, atau proyek pribadi yang selaras dengan identitas inti Anda. Seseorang yang memiliki nilai "kreativitas" dan kekuatan "Ideation" mungkin akan menemukan kepuasan besar dalam bergabung dengan kelompok teater komunitas, sementara seseorang dengan kekuatan "Restorative" dan nilai "pelayanan" mungkin merasa terpanggil untuk menjadi mentor bagi pemuda berisiko. Ini memastikan bahwa energi Anda dihabiskan untuk kegiatan yang benar-benar memberi nutrisi dan memuaskan.

== Analisis Nilai Universal dari Konsep Diri yang Holistik
<analisis-nilai-universal-dari-konsep-diri-yang-holistik>
Transformasi kerangka kerja SHAPE menjadi model pengembangan diri sekuler mengungkapkan sebuah kebenaran yang lebih dalam: kebutuhan manusia yang universal akan pemahaman diri yang terintegrasi dan holistik. Dengan menempatkan model yang diadaptasi ini dalam lanskap kerangka kerja pengembangan pribadi yang lebih luas, kita dapat menghargai kontribusi uniknya.

== Perspektif Komparatif: Model SHAPE yang Diadaptasi di Samping Kerangka Kerja Lain
<perspektif-komparatif-model-shape-yang-diadaptasi-di-samping-kerangka-kerja-lain>
Kerangka kerja populer lainnya, seperti Ikigai (konvergensi dari apa yang Anda cintai, apa yang dunia butuhkan, apa yang Anda bisa dibayar, dan apa yang Anda kuasai), juga berusaha untuk memandu individu menuju kehidupan yang bertujuan. Namun, model SHAPE yang diadaptasi menawarkan beberapa keunggulan yang berbeda. Keuntungan utamanya terletak pada pendekatannya yang terstruktur, multi-segi, dan hubungannya yang langsung dengan serangkaian alat asesmen yang tervalidasi secara empiris. Sementara Ikigai lebih bersifat filosofis dan reflektif, SHAPE yang diadaptasi menyediakan proses yang sistematis dan berbasis data. Ia tidak hanya menanyakan "apa yang Anda kuasai?" tetapi juga menyediakan alat seperti CliftonStrengths untuk menjawabnya dengan kosakata yang presisi. Pendekatan modularnya memungkinkan analisis mendalam pada setiap domain (kekuatan, nilai, kepribadian, dll.) sebelum mensintesisnya menjadi satu kesatuan yang koheren, menjadikannya lebih dapat ditindaklanjuti bagi individu dan organisasi yang mencari proses pengembangan yang terstruktur.

== Sintesis Akhir: Kekuatan Abadi dari Pendekatan Terpadu
<sintesis-akhir-kekuatan-abadi-dari-pendekatan-terpadu>
Pada akhirnya, nilai abadi dari kerangka kerja SHAPE, baik dalam bentuk asli maupun yang diadaptasi, terletak pada sifatnya yang holistik dan integratif. Di dunia yang cenderung mereduksi individu menjadi label tunggal---"Saya seorang INTJ," "Saya seorang #emph[Achiever];," atau sekadar jabatan pekerjaan---SHAPE menolak penyederhanaan ini. Ia memaksa pemahaman diri yang lebih bernuansa dan multi-dimensi, mengakui bahwa seseorang lebih dari sekadar kepribadiannya, lebih dari sekadar keterampilannya, dan lebih dari sekadar pengalamannya. Identitas sejati terletak pada titik temu dari semua elemen ini.

Dengan memahami interaksi antara Kekuatan, Nilai, Keterampilan, Kepribadian, dan Pengalaman kita, kita dapat bergerak melampaui sekadar mengetahui #emph[apa] kita, menuju pemahaman mendalam tentang #emph[siapa] kita dan apa yang dapat kita tawarkan kepada dunia. Baik tujuannya adalah untuk melayani Tuhan dalam sebuah pelayanan atau untuk membangun karir dan kehidupan yang bermakna dalam konteks sekuler, prinsip dasarnya tetap sama. Penemuan diri yang otentik dan pemenuhan tujuan yang langgeng muncul dari keselarasan semua bagian dari diri kita yang unik dan kompleks. Kerangka kerja SHAPE, dalam bentuknya yang telah diterjemahkan, menawarkan peta jalan yang kuat dan praktis untuk perjalanan penting ini.

Berikut ini adalah panduan praktis yang dirancang khusus untuk mahasiswa agar dapat melakukan asesmen SHAPE secara mandiri, mensintesis hasilnya menjadi sebuah "Piagam Pribadi", dan menggunakannya untuk menyusun narasi perkenalan diri yang kuat.

== Perangkat Asesmen Mandiri (DIY SHAPE Toolkit)
<perangkat-asesmen-mandiri-diy-shape-toolkit>
Berikut adalah panduan langkah demi langkah untuk mengeksplorasi setiap komponen SHAPE menggunakan alat dan metode yang dapat Anda lakukan sendiri, sebagian besar gratis.

=== #strong[S -- #emph[Signature Strengths] (Kekuatan Khas)]
<s-signature-strengths-kekuatan-khas>
Kekuatan khas adalah pola pikir, perasaan, dan perilaku alami Anda yang paling produktif. Ini bukan hanya tentang apa yang Anda kuasai, tetapi aktivitas yang memberi Anda energi.

- #strong[Alat yang Direkomendasikan:]
  - #strong[VIA Character Strengths Survey:] Ini adalah asesmen online gratis dan sangat dihormati yang mengidentifikasi 24 kekuatan karakter universal Anda dalam urutan peringkat.\[1, 2\] Luangkan waktu sekitar 25 menit untuk menyelesaikannya dengan jujur.\[1\]
- #strong[Metode Refleksi Diri \[2\]:]
  - #strong[Analisis Energi:] Buat daftar aktivitas (akademis, hobi, sosial) selama seminggu terakhir. Tandai aktivitas mana yang membuat Anda merasa bersemangat dan kuat, dan mana yang membuat Anda lelah. Pola akan muncul.
  - #strong[Kemudahan Alami:] Pikirkan tentang keterampilan atau tugas yang Anda pelajari lebih cepat daripada teman-teman Anda.\[2\] Apa yang orang lain anggap sulit, tetapi bagi Anda terasa wajar?
  - #strong[Minta Umpan Balik:] Tanyakan kepada 3-5 teman, anggota keluarga, atau dosen yang mengenal Anda dengan baik: "Kapan Anda melihat saya dalam kondisi terbaik saya?" atau "Menurut Anda, apa kekuatan terbesar saya?".\[2\]

=== #strong[H -- #emph[Heart] (Hati: Nilai Inti & Motivasi Intrinsik)]
<h-heart-hati-nilai-inti-motivasi-intrinsik>
"Hati" adalah tentang apa yang benar-benar Anda pedulikan. Ini adalah kompas internal yang memandu keputusan Anda dan mendorong gairah Anda.\[3\]

- #strong[Metode Refleksi Diri:]
  - #strong[Latihan Klarifikasi Nilai:]
    + Cari daftar "nilai-nilai inti" secara online (contoh: integritas, kreativitas, stabilitas, petualangan, komunitas).
    + Lingkari semua yang terasa penting bagi Anda.
    + Kelompokkan nilai-nilai yang serupa dan coba persempit menjadi 5 nilai teratas.
    + Terakhir, paksa diri Anda untuk memilih 2-3 nilai yang paling fundamental, yang tidak bisa Anda negosiasikan dalam hidup Anda.\[2\]
  - #strong[Identifikasi Minat:] Apa yang Anda baca atau tonton di waktu luang? Topik apa yang bisa Anda diskusikan berjam-jam?.\[4\] Ini adalah petunjuk kuat tentang gairah Anda.

=== #strong[A -- #emph[Aptitudes & Acquired Skills] (Bakat & Keterampilan yang Diperoleh)]
<a-aptitudes-acquired-skills-bakat-keterampilan-yang-diperoleh>
Ini adalah inventaris dari kemampuan praktis Anda, baik bakat alami maupun keterampilan yang telah Anda pelajari dan kembangkan.\[5, 6\]

- #strong[Metode Inventaris Pribadi:]
  - #strong[Buat Dua Kolom:]
    + #strong[#emph[Hard Skills];] #strong[(Keterampilan Teknis):] Tulis semua keterampilan spesifik yang dapat diukur yang Anda peroleh dari kuliah, kursus, atau proyek. Contoh: analisis data dengan Python, desain grafis dengan Canva, riset kata kunci SEO, berbicara di depan umum, menulis laporan lab.\[2\]
    + #strong[#emph[Soft Skills];] #strong[(Keterampilan Non-Teknis):] Tulis keterampilan interpersonal yang Anda tunjukkan dalam kerja kelompok, organisasi mahasiswa, atau pekerjaan paruh waktu. Contoh: kepemimpinan, komunikasi, resolusi konflik, manajemen waktu, adaptabilitas.\[2\]
  - #strong[Tinjau Prestasi:] Lihat kembali proyek atau pencapaian yang paling Anda banggakan. Keterampilan apa yang Anda gunakan untuk mencapainya?.\[2\]

=== #strong[P -- #emph[Personality] (Kepribadian: Profil Psikometrik)]
<p-personality-kepribadian-profil-psikometrik>
Kepribadian adalah gaya unik Anda dalam berinteraksi dengan dunia. Memahaminya membantu Anda menemukan lingkungan kerja dan peran yang paling cocok.\[7\]

- #strong[Alat yang Direkomendasikan:]
  - #strong[Tes 16Personalities:] Ini adalah tes online gratis yang didasarkan pada kerangka kerja Myers-Briggs Type Indicator (MBTI).\[8, 9\] Tes ini akan memberi Anda profil empat huruf (misalnya, INFJ atau ESTP) dan deskripsi mendalam tentang preferensi Anda dalam mengarahkan energi, memproses informasi, membuat keputusan, dan mengatur hidup Anda.\[8\]
  - #strong[Penting:] Gunakan hasilnya sebagai cermin untuk refleksi, bukan sebagai label yang kaku. Baca deskripsi kekuatan dan kelemahan, dan lihat mana yang paling sesuai dengan pengalaman Anda.\[9\]

=== #strong[E -- #emph[Experiences] (Pengalaman: Identitas Naratif)]
<e-experiences-pengalaman-identitas-naratif>
Semua pengalaman hidup Anda---baik, buruk, akademis, pribadi---telah membentuk Anda dan memberi Anda kebijaksanaan yang unik.\[3, 10\]

- #strong[Metode Refleksi Diri:]
  - #strong[Buat Garis Waktu Kehidupan:] Gambarlah garis dari lahir hingga sekarang. Tandai 5-7 peristiwa penting (puncak dan lembah). Ini bisa berupa keberhasilan akademis, kegagalan dalam sebuah proyek, pengalaman pindah kota, atau tantangan pribadi.
  - #strong[Tanyakan "Apa yang Saya Pelajari?":] Untuk setiap peristiwa, tuliskan satu kalimat yang merangkum pelajaran utama yang Anda petik. Bagaimana pengalaman itu mengubah cara pandang atau keterampilan Anda?.\[2\]

== Menyusun Piagam Pribadi Anda
<menyusun-piagam-pribadi-anda>
Setelah mengumpulkan data dari setiap komponen, saatnya untuk mensintesisnya menjadi satu dokumen yang kohesif. Ini adalah "Piagam Pribadi" Anda---ringkasan satu halaman tentang siapa Anda.

#strong[Struktur Piagam Pribadi:]

+ #strong[Nama:] \[Nama Anda\]
+ #strong[Pernyataan Misi Pribadi (1-2 Kalimat):] #emph[Ini diisi terakhir.]
+ #strong[Kekuatan Khas (S):]
  - \[Kekuatan \#1 dari VIA\]
  - \[Kekuatan \#2 dari VIA\]
  - \[Kekuatan \#3 dari umpan balik teman\]
+ #strong[Nilai Inti & Gairah (H):]
  - Nilai Inti \#1: \[Contoh: Kreativitas\]
  - Nilai Inti \#2: \[Contoh: Keadilan\]
  - Saya bersemangat tentang: \[Contoh: Isu lingkungan, pengembangan komunitas\]
+ #strong[Keterampilan Utama (A):]
  - #emph[Hard Skills:]
  - #emph[Soft Skills:]
+ #strong[Profil Kepribadian (P):]
  - Tipe MBTI:
  - Gaya Kerja yang Disukai: \[Contoh: Kolaboratif, berorientasi pada gambaran besar, menyukai tantangan baru\]
+ #strong[Pelajaran Hidup Kunci (E):]
  - Dari \[Pengalaman \#1\], saya belajar \[Pelajaran \#1\].
  - Dari \[Pengalaman \#2\], saya belajar \[Pelajaran \#2\].

#strong[Cara Mensintesis:] Lihat koneksi antar bagian. Apakah kekuatan "Kreativitas" (S) Anda cocok dengan nilai "Inovasi" (H)? Apakah pengalaman memimpin proyek (E) telah mengasah keterampilan "Manajemen Proyek" (A) Anda? Setelah melihat gambaran besarnya, tulis #strong[Pernyataan Misi Pribadi] Anda. Contoh: "Menggunakan kekuatan analitis (S) dan keterampilan komunikasi (A) saya untuk memecahkan masalah yang kompleks (H) dan menciptakan solusi yang adil (H), dengan gaya yang kolaboratif dan penuh energi (P)."

== Menulis Narasi "Ceritakan tentang diri Anda"
<menulis-narasi-ceritakan-tentang-diri-anda>
Gunakan Piagam Pribadi Anda sebagai contekan untuk menjawab pertanyaan wawancara yang paling umum ini. Tujuannya adalah untuk menceritakan sebuah kisah yang koheren, bukan hanya daftar fakta.

#strong[Struktur Jawaban 3 Bagian (Sekitar 60-90 detik):]

+ #strong[Masa Kini (Hook):] Mulailah dengan siapa Anda saat ini.
  - #emph[Contoh:] "Saat ini, saya adalah mahasiswa tingkat akhir jurusan Teknik Informatika yang sangat antusias dengan persimpangan antara teknologi dan desain yang berpusat pada pengguna."
+ #strong[Masa Lalu (Menghubungkan Titik-Titik SHAPE):] Jelaskan bagaimana Anda sampai di sini, dengan menenun elemen-elemen dari Piagam Pribadi Anda.
  - #emph[Contoh:] "Perjalanan saya di bidang ini benar-benar dimulai dari hobi saya (H) dalam memecahkan teka-teki logika. Saya menemukan bahwa saya memiliki bakat alami (A) dalam berpikir sistematis, yang juga dikonfirmasi oleh hasil tes kekuatan saya yang menyoroti 'Analitis' dan 'Pemecah Masalah' (S). Saya kemudian menerapkan ini dalam sebuah proyek kuliah (E) di mana tim kami mengembangkan aplikasi untuk membantu mahasiswa mengelola waktu. Pengalaman itu mengajarkan saya betapa pentingnya kolaborasi---sesuatu yang sangat cocok dengan kepribadian saya sebagai seorang ENTP (P)---dan mengukuhkan keinginan saya untuk berkarir di bidang pengembangan perangkat lunak."
+ #strong[Masa Depan (Menghubungkan dengan Perusahaan):] Akhiri dengan menghubungkan kisah Anda dengan peran atau perusahaan yang Anda lamar.
  - #emph[Contoh:] "Itulah mengapa saya sangat tertarik dengan posisi Junior Developer di perusahaan ini. Saya melihat bagaimana nilai perusahaan dalam inovasi (H) sangat selaras dengan nilai saya, dan saya yakin keterampilan saya dalam pemrograman Java (A) serta kekuatan saya dalam belajar cepat (S) dapat memberikan kontribusi nyata bagi proyek-proyek Anda ke depan."

Dengan mengikuti panduan ini, Anda tidak hanya akan memiliki pemahaman yang lebih dalam tentang diri Anda, tetapi juga alat praktis untuk mengkomunikasikan nilai unik Anda kepada dunia.
