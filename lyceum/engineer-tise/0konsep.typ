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
  title: [Dari Desain Gadget ke Desain Peradaban],
  toc_title: [Table of contents],
  toc_depth: 3,
  cols: 1,
  doc,
)

Ini adalah usulan #emph[Rencana Isi Buku] yang menggabungkan visi filosofis Anda mengenai pemberdayaan 8 miliar manusia, kritik terhadap akademisasi engineering, dan kerangka kerja teknik futuristik yang terperinci dari sumber-sumber yang kita diskusikan (IEEE, #emph[Smart Engineering in the AI Era];).

Buku ini berfokus pada pergeseran paradigma dari #emph[Engineering Gadget] menjadi #emph[Rekayasa Peradaban (Civilization Engineering)];.

#horizontalrule

= Rencana Isi Buku: Rekayasa Masa Depan di Era AI
<rencana-isi-buku-rekayasa-masa-depan-di-era-ai>
#strong[Tema Inti:] Dari Jurnal Akademik ke Platform Pemberdayaan: Mendesain Ulang Peradaban untuk 8 Miliar Bintang

== BAGIAN I: PARADOKS KECERDASAN KOLEKTIF
<bagian-i-paradoks-kecerdasan-kolektif>
#emph[(Menetapkan konteks mengapa engineering abad ke-21 tidak bisa lagi beroperasi secara sporadis dan terisolasi, dan mengapa 8 miliar otak belum menyelesaikan masalah global.)]

#strong[Bab 1: Kebijaksanaan dan Krisis di Abad ke-21] 1.1. Manusia: Spesies Paling Cerdas dan Fragmentasi Solusi \* Potensi 8,118 miliar jiwa: Data populasi dan distribusi usia (Anak, Dewasa Muda, Senior, Lansia) sebagai sumber daya. \* Paradoks Kecerdasan: Mengapa 8 miliar otak belum mampu mengatasi masalah sistemik (fragmentasi kepentingan, bias kognitif). 1.2. Masalah Kemanusiaan Abad ke-21 yang Saling Terkait \* Isu-isu krusial: Perubahan iklim, kelangkaan air, ketimpangan ekonomi, ancaman pandemi, dan urbanisasi. \* Rekayasa Kegagalan: Mengapa solusi teknis (gadget) sering gagal tanpa dukungan sistem sosial, politik, dan finansial. 1.3. Definisi Ulang Engineering: Dari #emph[Ingenium] ke #emph[Integrator] \* Asal kata Engineering: Kecerdikan (#emph[Ingenium];) sebagai inti profesi. \* Peran fundamental engineering dalam membangun peradaban (air bersih, energi, infrastruktur).

#strong[Bab 2: Evolusi Insinyur: Dari Filsuf ke Arsitek Peradaban] 2.1. Tensi antara Ilmu "Lama" dan Kreasi Baru \* Kritik terhadap Pendidikan: Apakah sekolah hanya mengulang ilmu lama?. \* Proses Kreasi Engineer: Bagaimana prinsip fundamental (DNA Ilmu) digabungkan menjadi solusi inovatif (analogi Lego dan Kastil). 2.2. Pergeseran Peran: Filsuf Praktisi vs.~Penulis Jurnal \* Perbandingan engineer masa lalu (filsuf dengan gagasan yang dipraktikkan) dengan engineer masa kini (peneliti yang menulis jurnal). \* Publikasi ilmiah sebagai alat verifikasi, bukan substitusi dari rekayasa nyata. 2.3. Keharusan Multidisiplin \* Engineering Thinking (Rekayasa Pemikiran) harus diperluas ke Finansial, Sosial, Hukum, dan Politik (Holistic Systems Engineering). \* Kasus Sukses Integratif: Pembelajaran dari Transisi Energi Jerman (#emph[Energiewende];) dan Penanganan Banjir Belanda (#emph[Delta Works];).

#horizontalrule

== BAGIAN II: KERANGKA KERJA REKAYASA CERDAS DI ERA AI
<bagian-ii-kerangka-kerja-rekayasa-cerdas-di-era-ai>
#emph[(Menyajikan fondasi akademik dan metodologis untuk Smart Engineering yang berpusat pada manusia, berdasarkan kerangka kerja terpadu.)]

#strong[Bab 3: Smart Engineering: AI sebagai Benang Pembeda] 3.1. Fondasi Rekayasa Cerdas (#emph[Smart Engineering];) \* Evolusi dari teknik tradisional ke #emph[Smart Engineering] yang ditandai dengan integrasi sistem cerdas alami dan buatan. \* Peran AI sebagai penyatu yang meresap (permeative unifier) di seluruh siklus engineering. 3.2. Arsitektur Berlapis ASTF dan Validasi PICOC \* Model Hierarkis ASTF (Application, System, Technology, Fundamental Research) untuk mengelola kompleksitas. \* Metode PICOC Systematic (Population, Intervention, Control, Outcome, Context) untuk validasi berbasis bukti di setiap lapisan ASTF. 3.3. Implementasi: Simbiosis Ontologi, Prolog, dan Python \* Penggunaan triad teknologi (ontologi, Prolog, Python) sebagai rantai alat untuk AI yang digerakkan oleh pengetahuan (#emph[knowledge-driven AI];).

#strong[Bab 4: Inti Kognitif dan Pengukuran Nilai Holistik] 4.1. Siklus Kognitif PUDAL Engine \* PUDAL (Perceive, Understand, Decision-making & planning, Act-Response, Learning-evaluating) sebagai siklus kognitif Smart Artefacts. \* Perbedaan PUDAL dengan siklus kognitif lain (misalnya OODA loop) dan penyesuaiannya untuk sistem yang digerakkan AI. 4.2. PSKVE: Rekayasa Energi Multi-Dimensi \* Konseptualisasi #emph[energy] (energi) PSKVE: #strong[P];roduct, #strong[S];ervice, #strong[K];nowledge, #strong[V];alue, dan #strong[E];nvironmental. \* Model unik PSKVE sebagai sistem kuantifikasi nilai holistik yang melampaui metrik kinerja teknis tradisional. 4.3. Abstraksi Smart Engine (SEA) \* Konstruk teoritis yang menyatukan Core Engine (fisik), PUDAL (kognitif), dan PSKVE (nilai) menjadi satu kesatuan metodologis.

#horizontalrule

== BAGIAN III: MENGAKTIVASI GALAKSI MANUSIA
<bagian-iii-mengaktivasi-galaksi-manusia>
#emph[(Menerjemahkan kerangka kerja teknis ke dalam visi transformatif untuk pemberdayaan 8 miliar orang, fokus pada perubahan peran organisasi profesi.)]

#strong[Bab 5: Merekayasa Platform Kemanusiaan: Dari Paper ke Pemberdayaan] 5.1. Kritik Terhadap Fokus Akademik Tradisional \* Kebutuhan untuk bergeser dari "publish or perish" menjadi "empower or perish". \* Proposal agar organisasi seperti IEEE, yang memiliki \>400.000 anggota, memimpin perubahan paradigma ini. \* Visi baru: Mengalokasikan sumber daya (misalnya royalti standar) untuk #emph[Empowerment Fund] dan platform solusi terbuka. 5.2. Arsitektur "Human Galaxy" \* Visi "8 miliar star" yang bersinar otentik dan membentuk galaksi kolaborasi. \* Struktur #emph[Human Theater];: Platform digital yang mengkurasi dan menghubungkan potensi setiap individu berdasarkan fase usia. 5.3. Peran Otentik Setiap Generasi \* #strong[Anak-Anak (Nebula Pencipta):] Menyalakan imajinasi murni melalui #emph[Dream Forge];. \* #strong[Dewasa Muda (Quasar Energi):] Mengubah energi menjadi terobosan, fokus pada #emph[Impact Accelerator];. \* #strong[Senior (Bintang Pandu):] Memancarkan kestabilan pengetahuan, melalui #emph[Constellation Classroom];. \* #strong[Lansia (Lubang Hitam Bijak):] Menarik hikmah menjadi gravitasi kebijaksanaan melalui #emph[Quantum Council];.

#strong[Bab 6: Membangun Sistem Anti-Kesengsaraan (#emph[Anti-Misery System];)] 6.1. Teknologi untuk Koneksi Lintas Generasi \* #emph[Empathy Resonance Engine:] Mendeteksi emosi dan menghubungkan pengguna dengan mentor yang relevan. \* #emph[Supernova Collaboration:] Proyek wajib lintas generasi dan benua (misalnya, anak Kenya + insinyur Jerman + nenek Jepang merancang solusi kekeringan). 6.2. Ekonomi Baru: Human Capital Coin \* Sistem nilai yang diukur berdasarkan dampak sosial dan empati ("Koefisien Inspirasi" dan "Indeks Kolaborasi Lintas Usia"). \* Nilai mata digital yang dihitung berdasarkan #emph[Waktu yang Diinspirasi] (bukan waktu kerja). 6.3. #emph[Legacy Engineering];: Legasi Trauma Menjadi Energi Baru \* Transformasi pengalaman pahit menjadi energi baru melalui #emph[Black Hole → White Hole Portal];. \* Mekanisme untuk menyalurkan pengetahuan (pengetahuan teknis, kearifan sosial) ke dalam sistem politik/ekonomi yang adil.

#horizontalrule

== BAGIAN IV: MASA DEPAN ENGINEER: ARSITEK PERADABAN
<bagian-iv-masa-depan-engineer-arsitek-peradaban>
#emph[(Kesimpulan dan seruan untuk bertindak, menjelaskan bagaimana engineer abad ke-22 akan beroperasi dan berkolaborasi.)]

#strong[Bab 7: Pergeseran Peran: AI dan Batas Engineering] 7.1. Otomasi "Gadget Engineering" oleh AI \* AI akan mengambil alih desain rutin, simulasi, dan optimasi komponen (contoh: AI generatif merancang chip dan material). \* Implikasi: Pembebasan insinyur manusia untuk fokus pada masalah sistemik. 7.2. Engineer sebagai Arsitek Peradaban (#emph[Civilization Architects];) \* Fokus baru: Bio-Civilization Design (merancang ekosistem urban simbiosis) dan Neuro-Political Engineering (mitigasi polarisasi sosial). \* Kemampuan yang dibutuhkan: #emph[Policy Engineering];, #emph[Financial Engineering for Impact];, dan #emph[Political Ecosystem Mapping];. 7.3. Kurikulum Engineering Masa Depan \* Pentingnya melampaui STEM: Kurikulum wajib baru mencakup Filsafat Teknologi, Antropologi Digital, dan Diplomasi Sains-Teknologi.

#strong[Bab 8: Manifesto: Panggilan untuk Berkolaborasi] 8.1. Mengukur Keberhasilan Abad Baru \* Metrik kesuksesan: Penurunan indeks kesepian global, partisipasi anak dalam #emph[Dream Forge];, dan implementasi solusi hiper-lokal. \* Pertanyaan Etis: Engineer tidak hanya bertanya #emph["Bisakah kami membangunnya?"] tapi #emph["Haruskah kami membangunnya?"];. 8.2. Kunci Sinergi: Otak, Hati, dan Sistem \* Kekuatan 400.000 ahli IEEE dikalikan kolaborasi, dikalikan kebijakan progresif, sama dengan solusi skala planet. \* Menyambungkan Pengetahuan (peran IEEE), Memperkuat Empati Kolektif (peran humaniora), dan Mendesain Sistem yang Adil (peran politik/ekonomi). 8.3. Langkah Awal Menuju Galaksi Solusi \* #emph[Call to Action:] Membangun model baru yang membuat model lama usang. \* Visi Akhir: #strong[8 Miliar Supernova] yang tidak saling bersaing, tetapi menyulam aurora kolektif.
