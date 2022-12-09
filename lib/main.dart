import 'dart:math';

import 'package:flutter/material.dart';
import 'constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.blue[800],
              title: Text(
                "DOĞRU MU YANLIŞ MI ?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  List<String> sorular = [
    "Titanic gelmiş geçmiş en büyük gemidir",
    "Dünyadaki tavuk sayısı insan sayısından fazladır",
    "Kelebeklerin ömrü bir gündür",
    "Dünya düzdür",
    "Kaju fıstığı aslında bir meyvenin sapıdır",
    "Fatih Sultan Mehmet hiç patates yememiştir",
    "Fransızlar 80 demek için, 4 - 20 der",
    "I. Selim veya bilinen adıyla Yavuz Sultan Selim küpe takardı",
    "Havaya atılan bir madeni paranın tura gelme olasılığı 1/2'dir",
    "Q klavyede Q harfinin sağ yanında W harfi vardır",
    "-2 sayısı çift sayıdır",
    "Muğla Marmara Bölgesi'ndedir",
    "Türkiye Birleşmiş Milletler üyesidir",
    "ABD, NATO üyesidir.",
    "12 Eylül darbesi 1982 yılında gerçekleşmiştir",
    "Bursa, Marmara Bölgesi'ndedir",
    "Bütün rakamların çarpımı 0'dır",
    "Kurt kelimesi 1 hecelidir",
    "Noktainazar, trafik polisi anlamına gelen bir gelimedir",
    "Hakkari, Güneydoğu Anadolu Bölgesi'ndedir",
    "Kuzey İrlanda Birleşik Krallık'a bağlıdır.",
    "Trakya 3 heceli bir kelimedir.",
    "Kadınlarda 23, erkeklerde 46 kromozom bulunur",
    "İtalyada Bir Türk Sevdim isimli romandaki Türk'ün adı Mehmet'tir",
    "Balonla Beş Hafta kitabında gezilen kıta Asya'dır",
    "Uruguay'ın resmi adı Uruguay Doğu Cumhuriyeti'dir",
    "Su, deniz seviyesinde 100°C 'nin altında buharlaşabilir",
    "Karbonatın yapısında karbon bulunmaz",
    "Sadakatsiz dizisi bir İngiliz yapımı Doctor Who dizisinden uyarlanmıştır",
    "Fransanın bayrağı soldan sağa Mavi, Beyaz ve Kırmızı renklerden oluşur",
    "Harry Potter, İngiliz yazar Joanne Kathleen Rowling tarafından yazılmış 8 fantastik romandan oluşan bir seridir",
    "Voleybol 14 kişiyle oynanır",
    "Turgut Özal'dan önceki cumhurbaşkanı Süleyman Demirel'dir",
    "Su periyodik tabloda bulunan bir element değildir",
    "Güney Afrika'nın üç başkenti vardır",
    "Eurovision'da Türkiye'yi ilk olarak, Petrol şarkısıyla Ajda Pekkan temsil etmiştir",
    "Facebook Harvard Üniversitesi'nde kurulmuştur",
    "Kuala Lumpur Moğolistan'ın başkentidir",
    "Türkiye'de Barış ismini ilk olarak Barış Manço almıştır",
    "Cülus bahşişi ilk kez Fatih Sultan Mehmet zamanında yasaklanmıştır",
    "Bir trilyonda 10 adet sıfır vardır.",
    "Kakalak bir kuş türüdür",
    "Çakmak kibritten önce üretilmiştir",
    "İnsan DNA'sı %50 oranında muz DNA'sı ile aynıdır.",
    "Çizgi film karakteri Tweety'nin cinsiyeti kadındır.",
    "Türkiye'deki dağlar volkanizma etkisiyle oluşmuştur.",
    "Bilecik Söğüt, Osmanlı İmparatorluğu başkentlerinden birisidir",
    "Pi sayısı, Aristoteles Sabitidir",
    "Mustafa Kemal Atatürk'ün kendinden başka 4 kardeşi daha vardır",
    "Türkiye Cumhuriyet'i 29 Ekim 1920'de kurulmuştur",
    "İstiklal Marşı 10 kıtadan oluşup hepsi 4 dizeliktir. Ancak son kıta 5 dizeden oluşmaktadır",
    "Brad Pitt, Oscar ödülü kazanamamıştır",
    "İki Şehrin Hikayesi (A Tale of Two Cities) tüm zamanların en çok satılan kitabıdır",
    "Game of Thrones evreninde geçen Valar Dohaeris aslında Tüm İnsanlar Hizmet Etmeli demektir",
    "Sistine Şapeli'ndeki freskler Leonardo da Vinci'nin eseridir",
    "Hindistan'da 9 bine yakın üniversite vardır",
    "Amerika en büyük eyaleti Alaska'yı Rusya'dan satın almıştır",
    "Kişinin gerçekte herhangi bir rahatsızlığı bulunmamasına rağmen hastaymış gibi davranmasına Dunning-Kruger Sendromu adı verilir",
    "Napolyon'un son yenilgisi, Akkâ Kalesi'ni koruyan Osmanlı komutanı Cezzar Ahmet Paşa’ya karşı olmuştur",
    "Türkiye’nin ilk uçak fabrikası, 6 Ekim 1926 tarihinde kurulmuştur",
    "Denizcilikte düzgün sarılmış halat yumağına ‘Kropi’ denir",
    "Karadeniz Bölgesi’nde yer alan Ordu ilinin eski adı Halipya idi",
    "Neil Armstrong'un Ay'a ayak bastığı ve Ay yüzeyine yapılan insanlı ilk uzay uçuşunun adı Apollo 15’tir",
    "2016 yılında Fransa'da düzenlenen son Avrupa Futbol Şampiyonası'nı kazanan ülke Portekiz’dir",
    "Fransa bayrağında bulunan üç renk; özgürlük, eşitlik ve kardeşliği temsil etmektedir",
    "Fransız kimyager Pasteur’e insanlığa olan katkılarından dolayı Mecidiye Nişanı gönderen Osmanlı padişahı V. Murad’dır",
  ];//66 tane soru
  List<bool> cevaplar = [
    false,true,false,false,true,true,
    true,true,true,true,true,false,
    true,true,false,true,true,true,
    false,false,true,false,false,true,
    false,true,true,false,false,true,
    false,false,false,true,true,false,
    true,false,true,true,false,false,
    true,true,false,true,true,false,
    true,false,true,true,true,true,
    false,true,true,false,false,true,
    false,false,false,true,true,false
  ];

  int soruIndex = Random().nextInt(66);
  int trueSkor = 0, falseSkor = 0;


  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: ()
              {
                setState(() {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // return object of type Dialog
                      return AlertDialog(
                        title: new Text("Şu anki Skorunuz"),
                        content: new Text("Doğru Sayısı : $trueSkor\nYanlış Sayısı : $falseSkor"),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          new ElevatedButton(
                            child: new Text("Tamam, teşekkürler :) "),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                });


              },
              child: ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.yellow,
                ),
                title: Text(
                  "Puanımı Göster",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                sorular[soruIndex],
                //'Bilgi Testi Soruları',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 7,
          runSpacing: 7,
          //direction: Axis.vertical,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red[400],
                      ),
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        setState(() {
                          cevaplar[soruIndex] == false
                              ? {secimler.add(kDogruIconu), trueSkor++}
                              : {secimler.add(kYanlisIconu), falseSkor++};

                          soruIndex = Random().nextInt(66);
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(12),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green[400],
                          ),
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            setState(() {
                              cevaplar[soruIndex] == true
                                  ? {secimler.add(kDogruIconu), trueSkor++}
                                  : {secimler.add(kYanlisIconu), falseSkor++};
                              soruIndex = Random().nextInt(66);
                            });
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}
