<TeXmacs|2.1.1>

<style|generic>

<\body>
  <documentclass*|12pt, a4paper|article>

  <usepackage*|utf8|inputenc> <usepackage|amsmath> <usepackage|graphicx>
  <usepackage*|a4paper, total=6in, 8in|geometry> <usepackage|hyperref>
  <usepackage|listings> <usepackage|xcolor> <usepackage|float>

  <definecolor|codegreen|rgb|0,0.6,0> <definecolor|codegray|rgb|0.5,0.5,0.5>
  <definecolor|codepurple|rgb|0.58,0,0.82>
  <definecolor|backcolour|rgb|0.95,0.95,0.92>

  <lstdefinestyle|mystyle|backgroundcolor=<with|color|backcolour|,
  commentstyle=><with|color|codegreen|, keywordstyle=><with|color|magenta|,
  numberstyle=<with|font-size|0.59|color|codegray|,
  stringstyle=<with|color|codepurple|, basicstyle=<with|font-size|0.71|font-family|tt|,
  breakatwhitespace=false, breaklines=true, captionpos=b, keepspaces=true,
  numbers=left, numbersep=5pt, showspaces=false, showstringspaces=false,
  showtabs=false, tabsize=2 >>>>> <lstset|style=mystyle>

  <title|Pemodelan Sistem LTI dengan Persamaan Diferensial Koefisien Konstan
  (LCCDE)> <author|Departemen Teknik Elektro><date|<date|>>

  <maketitle>

  <surround||<new-page>|<\table-of-contents|toc>
    \;
  </table-of-contents>>

  <section|Pendahuluan: Dari Sistem Fisik ke Model Matematis>

  Dalam studi Sinyal dan Sistem, salah satu tujuan utamanya adalah untuk
  memahami dan memprediksi perilaku sistem-sistem fisik. Sistem-sistem ini,
  baik berupa rangkaian listrik, sistem mekanik, maupun proses termal, pada
  dasarnya diatur oleh hukum-hukum fisika fundamental. Kemampuan kita untuk
  menganalisis dan merancang sistem-sistem tersebut bergantung pada kemampuan
  kita untuk menerjemahkan hukum-hukum fisika ini ke dalam bahasa matematika
  yang presisi. Persamaan diferensial, khususnya
  <with|font-shape|italic|Linear Constant-Coefficient Differential Equations>
  (LCCDE), berfungsi sebagai "bahasa universal" yang memungkinkan
  penerjemahan ini. LCCDE menyediakan kerangka kerja yang kuat untuk
  memodelkan hubungan antara sinyal masukan (input) dan sinyal keluaran
  (output) dari sebuah kelas sistem yang sangat luas dan penting.[1]

  Sebuah sistem waktu-kontinu yang dapat direpresentasikan oleh LCCDE
  memiliki bentuk matematis umum sebagai berikut [1, 2]:

  <\equation*>
    <big|sum><rsub|k=0><rsup|N>a<rsub|k>*<frac|d<rsup|k>*y<around|(|t|)>|d*t<rsup|k>>=<big|sum><rsub|m=0><rsup|M>b<rsub|m>*<frac|d<rsup|m>*x<around|(|t|)>|d*t<rsup|m>>
  </equation*>

  Di sini, <math|y<around|(|t|)>> adalah sinyal output sistem, dan
  <math|x<around|(|t|)>> adalah sinyal input. Koefisien <math|a<rsub|k>> dan
  <math|b<rsub|m>> adalah konstanta yang mendefinisikan karakteristik fisik
  dari sistem tersebut. Persamaan ini disebut <with|font-shape|italic|Linear>
  karena <math|y<around|(|t|)>>, <math|x<around|(|t|)>>, dan turunannya
  muncul secara linear. Persamaan ini disebut
  <with|font-shape|italic|Constant-Coefficient> karena nilai <math|a<rsub|k>>
  dan <math|b<rsub|m>> tidak berubah seiring waktu. Dua asumsi
  ini\Vlinearitas dan koefisien konstan\Vsangatlah fundamental. Asumsi-asumsi
  ini menyiratkan bahwa sistem yang dimodelkan adalah
  <with|font-shape|italic|Linear Time-Invariant> (LTI), sebuah properti yang
  secara drastis menyederhanakan analisis dan memungkinkan kita untuk
  menggunakan perangkat matematika yang mapan seperti aljabar linear dan
  transformasi Laplace.[3] Tanpa asumsi LTI, analisis sistem menjadi jauh
  lebih rumit dan seringkali memerlukan metode numerik yang kompleks.

  <subsection|Solusi Lengkap: Respon Alami dan Respon Paksa>

  Solusi total, <math|y<around|(|t|)>>, dari sebuah LCCDE selalu dapat
  diuraikan menjadi dua komponen yang berbeda secara konseptual dan fisis.[2,
  4, 5] Pemisahan ini bukan sekadar trik matematika, melainkan manifestasi
  dari prinsip superposisi yang berlaku pada sistem linear. Ini memungkinkan
  kita untuk menganalisis efek dari kondisi internal sistem dan efek dari
  stimulus eksternal secara terpisah, lalu menjumlahkan hasilnya untuk
  mendapatkan respons total.

  <\enumerate>
    <item><with|font-series|bold|Solusi Homogen
    (<math|y<rsub|h><around|(|t|)>>) atau Respon Alami>: Komponen ini adalah
    solusi dari persamaan diferensial ketika inputnya nol
    (<math|x<around|(|t|)>=0>). Respon alami merepresentasikan perilaku
    intrinsik sistem\Vbagaimana sistem melepaskan atau mendisipasikan energi
    yang tersimpan di dalamnya tanpa adanya gaya eksternal. Perilaku ini
    sepenuhnya ditentukan oleh karakteristik internal sistem, yang
    direpresentasikan oleh koefisien <math|a<rsub|k>> (misalnya, nilai
    resistor, induktor, dan kapasitor dalam sebuah rangkaian).[2, 6] Respon
    alami ini seringkali bersifat transien, artinya ia akan meluruh menuju
    nol seiring berjalannya waktu pada sistem yang stabil.

    <item><with|font-series|bold|Solusi Partikular
    (<math|y<rsub|p><around|(|t|)>>) atau Respon Paksa>: Komponen ini adalah
    solusi spesifik yang memenuhi persamaan diferensial untuk input
    <math|x<around|(|t|)>> yang diberikan. Respon paksa menggambarkan
    bagaimana sistem berperilaku di bawah pengaruh input eksternal setelah
    semua efek transien (respon alami) telah mereda. Bentuk dari respon paksa
    sangat bergantung pada bentuk sinyal input <math|x<around|(|t|)>>.[2, 7]
  </enumerate>

  Dengan demikian, solusi lengkap dari sistem adalah superposisi dari kedua
  respons ini:

  <\equation*>
    y<around|(|t|)>=y<rsub|h><around|(|t|)>+y<rsub|p><around|(|t|)>
  </equation*>

  Pemisahan ini memberikan intuisi rekayasa yang sangat kuat. Kita dapat
  menganalisis stabilitas internal sistem dengan memeriksa respon alaminya,
  dan secara terpisah, menganalisis kinerja
  <with|font-shape|italic|steady-state> sistem terhadap berbagai input dengan
  memeriksa respon paksa.

  <subsection|Kondisi Awal dan Sifat LTI>

  Sebuah LCCDE saja tidak cukup untuk mendefinisikan sebuah sistem LTI secara
  unik. Kita juga memerlukan informasi tambahan berupa kondisi awal. Untuk
  memastikan bahwa sistem yang dimodelkan oleh LCCDE benar-benar bersifat LTI
  dan kausal, kita memberlakukan <with|font-series|bold|kondisi awal diam>
  (<with|font-shape|italic|initial rest condition>).[8, 9] Kondisi ini
  menyatakan bahwa jika input ke sistem adalah nol untuk semua waktu sebelum
  <math|t<rsub|0>> (yaitu, <math|x<around|(|t|)>=0> untuk
  <math|t\<less\>t<rsub|0>>), maka output sistem juga harus nol untuk semua
  waktu sebelum <math|t<rsub|0>> (yaitu, <math|y<around|(|t|)>=0> untuk
  <math|t\<less\>t<rsub|0>>).[10] Secara fisis, ini berarti sistem tidak
  memiliki energi yang tersimpan sebelum input diterapkan. Dengan
  pemberlakuan kondisi ini, LCCDE secara unik mendefinisikan sebuah sistem
  LTI yang kausal.[8]

  <section|Analisis Sistem Orde Pertama: Rangkaian RC>

  Untuk memahami bagaimana LCCDE memodelkan sistem LTI dalam praktik, kita
  akan memulai dengan contoh yang paling fundamental: sistem orde pertama.
  Sistem orde pertama dicirikan oleh persamaan diferensial yang turunan
  tertingginya adalah turunan pertama. Contoh kanonis yang paling intuitif
  dan sering dijumpai dalam rekayasa elektro adalah rangkaian
  Resistor-Kapasitor (RC).[6, 11, 12]

  <subsection|Studi Kasus: Rangkaian RC sebagai Prototipe Sistem Orde
  Pertama>

  Perhatikan rangkaian RC seri sederhana yang ditunjukkan di bawah ini.
  Sistem ini memiliki satu elemen penyimpan energi, yaitu kapasitor. Input
  sistem adalah sumber tegangan <math|v<rsub|s><around|(|t|)>>, dan output
  yang kita amati adalah tegangan pada kapasitor,
  <math|v<rsub|c><around|(|t|)>>.

  <big-figure|<with|par-mode|center|<fcolorbox|black|lightgray|<rule|0pt|5cm><rule|8cm|0pt>><label|fig:rc-circuit>>|Rangkaian
  RC Seri sebagai Sistem LTI Orde Pertama>

  <subsubsection|Penurunan Model Matematis dari Prinsip Dasar>

  Kita dapat menurunkan model matematis untuk rangkaian ini langsung dari
  hukum-hukum dasar rangkaian listrik. Dengan menggunakan Hukum Tegangan
  Kirchhoff (KVL) pada loop, kita tahu bahwa jumlah tegangan dalam satu loop
  tertutup adalah nol, atau tegangan sumber sama dengan jumlah penurunan
  tegangan pada setiap komponen.[13, 14]\ 

  Selanjutnya, kita gunakan hubungan arus-tegangan (hukum konstitutif) untuk
  setiap komponen:

  <\enumerate>
    <item>Untuk resistor, hukum Ohm menyatakan:
    <math|v<rsub|R><around|(|t|)>=R\<cdot\>i<around|(|t|)>>.

    <item>Untuk kapasitor, arus yang mengalir sebanding dengan laju perubahan
    tegangan: <math|i<around|(|t|)>=C*<frac|d*v<rsub|c><around|(|t|)>|d*t>>.[15,
    16]
  </enumerate>

  Dengan menata ulang, kita mendapatkan LCCDE orde pertama yang memodelkan
  rangkaian RC [6, 7]:\ 

  Persamaan ini secara sempurna menggambarkan hubungan dinamis antara input
  <math|v<rsub|s><around|(|t|)>> dan output <math|v<rsub|c><around|(|t|)>>.

  <subsubsection|Menemukan Solusi Lengkap untuk Respon Undak (Step Response)>

  Sekarang, mari kita selesaikan persamaan ini untuk menemukan bagaimana
  sistem merespons input yang paling umum, yaitu fungsi undak
  (<with|font-shape|italic|step function>), di mana tegangan sumber tiba-tiba
  berubah dari 0 ke nilai konstan <math|V<rsub|s>> pada <math|t=0>. Jadi,
  <math|v<rsub|s><around|(|t|)>=V<rsub|s>*u<around|(|t|)>>. Kita akan
  menggunakan kondisi awal diam, yaitu <math|v<rsub|c><around|(|0|)>=0>.

  <paragraph|1. Solusi Homogen (Respon Alami)> Pertama, kita cari solusi
  homogen dengan mengatur input menjadi nol:
  <math|v<rsub|s><around|(|t|)>=0>.\ 

  Ini adalah <with|font-series|bold|persamaan karakteristik> dari sistem:
  <math|R*C*s+1=0>. Akarnya adalah <math|s=-<frac|1|R*C>>. Solusi homogennya
  adalah:\ 

  Besaran <math|R*C> disebut <with|font-series|bold|konstanta waktu> sistem,
  dilambangkan dengan <math|\<tau\>>.[6, 16]

  <paragraph|2. Solusi Partikular (Respon Paksa)> Selanjutnya, kita cari
  solusi partikular untuk input <math|v<rsub|s><around|(|t|)>=V<rsub|s>>
  untuk <math|t\<gtr\>0>. Karena input adalah konstan, kita asumsikan output
  juga akan menjadi konstan, <math|v<rsub|c*p><around|(|t|)>=K>.[7, 17]
  Substitusi ke LCCDE memberikan <math|K=V<rsub|s>>. Jadi, solusi
  partikularnya adalah <math|v<rsub|c*p><around|(|t|)>=V<rsub|s>>.

  <paragraph|3. Solusi Total dan Kondisi Awal> Solusi total adalah jumlah
  dari solusi homogen dan partikular:\ 

  Menggunakan kondisi awal <math|v<rsub|c><around|(|0|)>=0>, kita dapatkan
  <math|A=-V<rsub|s>>. Solusi akhir untuk respon undak dari rangkaian RC
  adalah [7, 17, 18]:\ 

  <subsubsection|Simulasi dan Visualisasi dengan Sympy>

  Proses analitis di atas dapat diverifikasi dan divisualisasikan dengan
  mudah menggunakan pustaka <with|font-family|tt|Sympy> di Python.

  <\lstlisting>
    \ import sympy as sym import numpy as np import matplotlib.pyplot as plt

    sym.init<rsub|p>rinting()

    t, R, C, Vs = sym.symbols('t R C Vs', real=True, positive=True) vc =
    sym.Function('vc')

    ode = sym.Eq(R * C * vc(t).diff(t) + vc(t), Vs) solution =
    sym.dsolve(ode, vc(t), ics=vc(0): 0)

    sol<rsub|n>umeric = solution.rhs.subs(R: 1000, C: 0.001, Vs: 5)

    # Plotting code would go here # For LaTeX, we show a placeholder for the
    plot.
  </lstlisting>

  <big-figure|<with|par-mode|center|<fcolorbox|black|lightgray|<rule|0pt|6cm><rule|10cm|0pt>><label|fig:rc-step-response>>|Respon
  Undak (Step Response) Rangkaian RC dengan R=1 k<math|\<Omega\>>, C=1 mF,
  dan Vs=5 V>

  Plot di atas secara visual mengkonfirmasi hasil analitis kita. Kurva
  menunjukkan tegangan kapasitor yang naik secara eksponensial dari 0 V
  menuju nilai <with|font-shape|italic|steady-state> 5 V.

  <section|Analisis Sistem Orde Tinggi: Rangkaian RLC>

  Sistem orde kedua dapat menunjukkan perilaku dinamis yang lebih kompleks,
  termasuk osilasi. Kehadiran dua elemen penyimpan energi yang independen,
  seperti induktor dan kapasitor, mengarah pada model persamaan diferensial
  orde kedua.[19, 20]

  <subsection|Studi Kasus: Rangkaian RLC sebagai Model Sistem Orde Kedua>

  Kita akan menggunakan rangkaian RLC seri sebagai contoh.

  <big-figure|<with|par-mode|center|<fcolorbox|black|lightgray|<rule|0pt|5cm><rule|8cm|0pt>><label|fig:rlc-circuit>>|Rangkaian
  RLC Seri sebagai Sistem LTI Orde Kedua>

  <subsubsection|Penurunan LCCDE Orde Kedua>

  Menerapkan KVL pada loop seri [19] dan mensubstitusikan hubungan
  arus-tegangan untuk setiap komponen menghasilkan LCCDE orde kedua [19, 21,
  22]:\ 

  <subsection|Persamaan Karakteristik: Jantung dari Respon Sistem>

  Untuk respon alami (<math|v<rsub|s><around|(|t|)>=0>), dengan mengasumsikan
  solusi <math|v<rsub|c*h><around|(|t|)>=A*e<rsup|s*t>>, kita mendapatkan
  <with|font-series|bold|persamaan karakteristik> [19, 23]:\ 

  Dalam bentuk standar, persamaan ini menjadi:

  <\equation*>
    s<rsup|2>+2*\<zeta\>*\<omega\><rsub|n>*s+\<omega\><rsub|n><rsup|2>=0
  </equation*>

  di mana <math|\<omega\><rsub|n>=<frac|1|<sqrt|L*C>>> adalah
  <with|font-series|bold|frekuensi natural tak teredam> dan
  <math|\<zeta\>=<frac|R|2>*<sqrt|<frac|C|L>>> adalah
  <with|font-series|bold|rasio redaman>.[24, 25] Akar-akarnya adalah:

  <\equation*>
    s<rsub|1,2>=-\<zeta\>*\<omega\><rsub|n>\<pm\>\<omega\><rsub|n>*<sqrt|\<zeta\><rsup|2>-1>
  </equation*>

  <subsection|Tiga Jenis Respon Natural>

  Berdasarkan nilai <math|\<zeta\>>, ada tiga kategori perilaku respon alami
  yang berbeda.

  <subsubsection|Respon <with|font-shape|italic|Overdamped> (Redaman
  Berlebih, <math|\<zeta\>\<gtr\>1>)>

  Menghasilkan dua akar riil, berbeda, dan negatif.[23, 26] Solusinya adalah
  jumlah dari dua fungsi eksponensial yang meluruh. Sistem kembali ke
  ekuilibrium secara perlahan tanpa osilasi.[27, 28]

  <subsubsection|Respon <with|font-shape|italic|Critically Damped> (Redaman
  Kritis, <math|\<zeta\>=1>)>

  Menghasilkan dua akar riil dan identik.[23, 26] Sistem kembali ke
  ekuilibrium secepat mungkin tanpa osilasi. Ini sering menjadi target desain
  yang ideal.[23, 27, 28]

  <subsubsection|Respon <with|font-shape|italic|Underdamped> (Redaman Kurang,
  <math|0\<less\>\<zeta\>\<less\>1>)>

  Menghasilkan sepasang akar kompleks konjugat.[23, 26] Sistem berosilasi
  dengan amplitudo yang meluruh secara eksponensial.[26, 29]

  <big-table|<with|par-mode|center| <tabular*|<tformat|<cwith|1|-1|1|1|cell-lborder|1ln>|<cwith|1|-1|1|1|cell-hyphen|t>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|1|1|cell-width|3cm>|<cwith|1|-1|2|2|cell-hyphen|t>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|-1|2|2|cell-width|2.5cm>|<cwith|1|-1|3|3|cell-hyphen|t>|<cwith|1|-1|3|3|cell-hmode|exact>|<cwith|1|-1|3|3|cell-width|3.5cm>|<cwith|1|-1|4|4|cell-hyphen|t>|<cwith|1|-1|4|4|cell-hmode|exact>|<cwith|1|-1|4|4|cell-width|4cm>|<cwith|1|-1|4|4|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|2|2|1|-1|cell-bborder|1ln>|<cwith|3|3|1|-1|cell-bborder|1ln>|<cwith|4|4|1|-1|cell-bborder|1ln>|<table|<row|<cell|<with|font-series|bold|Kondisi
  Redaman>>|<cell|<with|font-series|bold|Nilai
  <math|\<zeta\>>>>|<cell|<with|font-series|bold|Sifat
  Akar>>|<cell|<with|font-series|bold|Deskripsi Perilaku
  Fisis>>>|<row|<cell|<with|font-shape|italic|Overdamped>>|<cell|<math|\<zeta\>\<gtr\>1>>|<cell|Dua
  akar riil, berbeda, negatif>|<cell|Lambat, kembali ke setimbang tanpa
  osilasi>>|<row|<cell|<with|font-shape|italic|Critically
  Damped>>|<cell|<math|\<zeta\>=1>>|<cell|Dua akar riil, identik,
  negatif>|<cell|Paling cepat kembali ke setimbang tanpa
  osilasi>>|<row|<cell|<with|font-shape|italic|Underdamped>>|<cell|<math|0\<less\>\<zeta\>\<less\>1>>|<cell|Sepasang
  akar kompleks konjugat>|<cell|Berosilasi dengan amplitudo yang
  meluruh>>>>>>|Rangkuman Tiga Kasus Respon Natural>

  <subsection|Simulasi Komparatif dengan Sympy>

  Kita dapat menggunakan <with|font-family|tt|Sympy> untuk menyelesaikan dan
  memplot LCCDE orde kedua untuk tiga kasus redaman.

  <\lstlisting>
    \ import sympy as sym import numpy as np import matplotlib.pyplot as plt

    sym.init<rsub|p>rinting()

    t = sym.symbols('t', real=True) vc = sym.Function('vc') L<rsub|v>al,
    C<rsub|v>al = 1.0, 0.25 R<rsub|c>rit = 2 * np.sqrt(L<rsub|v>al /
    C<rsub|v>al)

    params = 'Overdamped (\<zeta\>=2.0)': R<rsub|c>rit * 2.0, 'Critically
    Damped (\<zeta\>=1.0)': R<rsub|c>rit, 'Underdamped (\<zeta\>=0.5)':
    R<rsub|c>rit * 0.5 ics = vc(0): 1, vc(t).diff(t).subs(t, 0): 0

    # Loop to solve each case for name, R<rsub|v>al in params.items(): ode =
    sym.Eq(L<rsub|v>al*C<rsub|v>al*vc(t).diff(t,2) +
    R<rsub|v>al*C<rsub|v>al*vc(t).diff(t) + vc(t), 0) sol = sym.dsolve(ode,
    vc(t), ics=ics) # Plotting code would be here
  </lstlisting>

  <big-figure|<with|par-mode|center|<fcolorbox|black|lightgray|<rule|0pt|6cm><rule|10cm|0pt>><label|fig:rlc-responses>>|Perbandingan
  Respon Alami Sistem RLC Orde Kedua untuk Tiga Kasus Redaman>

  <section|Kombinasi Sistem: Sistem Bertingkat (Cascade)>

  Dalam aplikasi rekayasa, sistem kompleks sering dibangun dengan
  menghubungkan beberapa subsistem secara berurutan (kaskade).[30, 31]

  <subsection|Menurunkan LCCDE Tunggal dari Sistem Cascade>

  Misalkan kita memiliki dua sistem orde pertama yang dihubungkan secara
  kaskade:[32]

  <\itemize>
    <item><with|font-series|bold|Sistem 1>:
    <math|<frac|d*w<around|(|t|)>|d*t>+a\<cdot\>w<around|(|t|)>=b\<cdot\>x<around|(|t|)>>

    <item><with|font-series|bold|Sistem 2>:
    <math|<frac|d*y<around|(|t|)>|d*t>+c\<cdot\>y<around|(|t|)>=d\<cdot\>w<around|(|t|)>>
  </itemize>

  Dengan mengeliminasi variabel perantara <math|w<around|(|t|)>>, kita dapat
  menurunkan satu LCCDE tunggal yang menghubungkan <math|y<around|(|t|)>>
  dengan <math|x<around|(|t|)>>:

  <\equation*>
    <frac|d<rsup|2>*y<around|(|t|)>|d*t<rsup|2>>+<around|(|a+c|)>*<frac|d*y<around|(|t|)>|d*t>+a*c\<cdot\>y<around|(|t|)>=b*d\<cdot\>x<around|(|t|)>
  </equation*>

  Hasilnya adalah sebuah LCCDE orde kedua tunggal, yang menunjukkan bahwa
  mengkombinasikan dua sistem orde pertama menghasilkan sebuah sistem orde
  kedua.

  <subsection|Simulasi dan Analisis dengan Sympy>

  Proses aljabar di atas dapat diotomatisasi dengan
  <with|font-family|tt|Sympy>.

  <\lstlisting|language=Python, caption=Kode Python untuk analisis sistem
  kaskade, label=lst:cascade>
    \ import sympy as sym

    sym.init<rsub|p>rinting()

    t, a, b, c, d = sym.symbols('t a b c d', real=True, positive=True) x, w,
    y = sym.symbols('x w y', cls=sym.Function)

    ode1 = sym.Eq(w(t).diff(t) + a*w(t), b*x(t)) ode2 = sym.Eq(y(t).diff(t) +
    c*y(t), d*w(t))

    w<rsub|e>xpr = sym.solve(ode2, w(t)) combined<rsub|o>de = ode1.subs(w(t),
    w<rsub|e>xpr).doit()

    # Solve for step response with numerical values a<rsub|v>al, b<rsub|v>al,
    c<rsub|v>al, d<rsub|v>al = 2, 1, 3, 1 x<rsub|s>tep = 1 ode<rsub|n>umeric
    = combined<rsub|o>de.subs(a: a<rsub|v>al, b: b<rsub|v>al, c: c<rsub|v>al,
    d: d<rsub|v>al, x(t): x<rsub|s>tep).doit() ics<rsub|c>ascade = y(0): 0,
    y(t).diff(t).subs(t, 0): 0 sol<rsub|c>ascade =
    sym.dsolve(ode<rsub|n>umeric, y(t), ics=ics<rsub|c>ascade)

    # Plotting code would be here
  </lstlisting>

  <big-figure|<with|par-mode|center|<fcolorbox|black|lightgray|<rule|0pt|6cm><rule|10cm|0pt>><label|fig:cascade-response>>|Respon
  Undak dari Dua Sistem Orde Pertama yang Dikaskadekan>

  <section|Rangkuman dan Poin Kunci>

  Catatan kuliah ini telah menjelajahi konsep fundamental pemodelan sistem
  LTI waktu-kontinu menggunakan LCCDE.

  <\enumerate>
    <item><with|font-series|bold|LCCDE sebagai Bahasa Universal>: LCCDE
    adalah alat matematis yang kuat untuk merepresentasikan berbagai sistem
    fisik di bawah asumsi linearitas dan time-invariance.

    <item><with|font-series|bold|Orde Sistem Menentukan Kompleksitas>: Orde
    dari LCCDE menentukan kompleksitas perilaku dinamisnya.

    <item><with|font-series|bold|Akar Persamaan Karakteristik adalah Kunci>:
    Perilaku transien dari sebuah sistem LTI sepenuhnya ditentukan oleh
    akar-akar dari persamaan karakteristiknya.

    <item><with|font-series|bold|Kaskade Meningkatkan Orde>: Menggabungkan
    sistem LTI secara seri (kaskade) akan menghasilkan sistem keseluruhan
    dengan orde yang lebih tinggi.

    <item><with|font-series|bold|Sympy sebagai Alat Bantu Analisis>: Pustaka
    <with|font-family|tt|Sympy> di Python adalah alat yang sangat kuat untuk
    derivasi simbolis, verifikasi solusi, dan visualisasi.
  </enumerate>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|2.1.2.2|4>>
    <associate|auto-11|<tuple|2.1.2.3|4>>
    <associate|auto-12|<tuple|2.1.3|4>>
    <associate|auto-13|<tuple|2|4>>
    <associate|auto-14|<tuple|3|4>>
    <associate|auto-15|<tuple|3.1|4>>
    <associate|auto-16|<tuple|3|4>>
    <associate|auto-17|<tuple|3.1.1|5>>
    <associate|auto-18|<tuple|3.2|5>>
    <associate|auto-19|<tuple|3.3|5>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-20|<tuple|3.3.1|5>>
    <associate|auto-21|<tuple|3.3.2|5>>
    <associate|auto-22|<tuple|3.3.3|5>>
    <associate|auto-23|<tuple|1|5>>
    <associate|auto-24|<tuple|3.4|5>>
    <associate|auto-25|<tuple|4|6>>
    <associate|auto-26|<tuple|4|6>>
    <associate|auto-27|<tuple|4.1|6>>
    <associate|auto-28|<tuple|4.2|6>>
    <associate|auto-29|<tuple|5|6>>
    <associate|auto-3|<tuple|1.2|3>>
    <associate|auto-30|<tuple|5|7>>
    <associate|auto-4|<tuple|2|3>>
    <associate|auto-5|<tuple|2.1|3>>
    <associate|auto-6|<tuple|1|3>>
    <associate|auto-7|<tuple|2.1.1|3>>
    <associate|auto-8|<tuple|2.1.2|4>>
    <associate|auto-9|<tuple|2.1.2.1|4>>
    <associate|fig:cascade-response|<tuple|5|6>>
    <associate|fig:rc-circuit|<tuple|1|3>>
    <associate|fig:rc-step-response|<tuple|2|4>>
    <associate|fig:rlc-circuit|<tuple|3|4>>
    <associate|fig:rlc-responses|<tuple|4|6>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||Rangkaian RC Seri
      sebagai Sistem LTI Orde Pertama>|<pageref|auto-6>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|2>||Respon Undak (Step
      Response) Rangkaian RC dengan R=1 k<with|mode|<quote|math>|\<Omega\>>,
      C=1 mF, dan Vs=5 V>|<pageref|auto-13>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3>||Rangkaian RLC Seri
      sebagai Sistem LTI Orde Kedua>|<pageref|auto-16>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4>||Perbandingan Respon
      Alami Sistem RLC Orde Kedua untuk Tiga Kasus
      Redaman>|<pageref|auto-25>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|5>||Respon Undak dari
      Dua Sistem Orde Pertama yang Dikaskadekan>|<pageref|auto-29>>
    </associate>
    <\associate|table>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||Rangkuman Tiga
      Kasus Respon Natural>|<pageref|auto-23>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Pendahuluan:
      Dari Sistem Fisik ke Model Matematis>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Solusi Lengkap: Respon Alami
      dan Respon Paksa <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Kondisi Awal dan Sifat LTI
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Analisis
      Sistem Orde Pertama: Rangkaian RC> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Studi Kasus: Rangkaian RC
      sebagai Prototipe Sistem Orde Pertama
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|2.1.1<space|2spc>Penurunan Model Matematis
      dari Prinsip Dasar <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|2tab>|2.1.2<space|2spc>Menemukan Solusi Lengkap
      untuk Respon Undak (Step Response) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|4tab>|1. Solusi Homogen (Respon Alami)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|2. Solusi Partikular (Respon Paksa)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|3. Solusi Total dan Kondisi Awal
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.15fn>>

      <with|par-left|<quote|2tab>|2.1.3<space|2spc>Simulasi dan Visualisasi
      dengan Sympy <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Analisis
      Sistem Orde Tinggi: Rangkaian RLC> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Studi Kasus: Rangkaian RLC
      sebagai Model Sistem Orde Kedua <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|2tab>|3.1.1<space|2spc>Penurunan LCCDE Orde Kedua
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Persamaan Karakteristik:
      Jantung dari Respon Sistem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Tiga Jenis Respon Natural
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|2tab>|3.3.1<space|2spc>Respon
      <with|font-shape|<quote|italic>|Overdamped> (Redaman Berlebih,
      <with|mode|<quote|math>|\<zeta\>\<gtr\>1>)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <with|par-left|<quote|2tab>|3.3.2<space|2spc>Respon
      <with|font-shape|<quote|italic>|Critically Damped> (Redaman Kritis,
      <with|mode|<quote|math>|\<zeta\>=1>)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>>

      <with|par-left|<quote|2tab>|3.3.3<space|2spc>Respon
      <with|font-shape|<quote|italic>|Underdamped> (Redaman Kurang,
      <with|mode|<quote|math>|0\<less\>\<zeta\>\<less\>1>)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      <with|par-left|<quote|1tab>|3.4<space|2spc>Simulasi Komparatif dengan
      Sympy <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Kombinasi
      Sistem: Sistem Bertingkat (Cascade)>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Menurunkan LCCDE Tunggal
      dari Sistem Cascade <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Simulasi dan Analisis dengan
      Sympy <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Rangkuman
      dan Poin Kunci> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>