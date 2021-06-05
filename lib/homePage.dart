import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Text(
              'BÜTÇEM',
            ),
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:20.0, left: 12, right: 12.0),
                child: Container(
                    child: Text('BÜTÇE PLANLAMA NEDİR?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white),
                        textAlign: TextAlign.center),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green
                ),),
              ),
              Container(
                child: Text(
                    'Kelime anlamı olarak “Gelecek dönemde elde edilecek gelirleri ve yapılacak harcamaları gösteren tablo” anlamına gelen bütçe; işletmelerin gelecek dönem faaliyetlerini ve ortaya çıkan sonuçları parasal olarak ifade eden plandır. İşletmeler, bütçelerini önceden hazırlayarak, gelecek dönemle ilgili kararları almayı ve tüm olası durumlara hazırlanmayı amaçlarlar. Bu sayede, planlanan bütçe ve gerçekleşen harcamalar karşılaştırılarak, bir sonraki dönem için daha doğru ve isabetli planlama yapma imkânı elde ederler. Örneğin; işletmenin bütçesi fazla ya da açık verdiyse, bu durumun nedeni araştırılıp çözüm bulunarak, sonraki dönemde bu duruma uygun bir hazırlık yapabilirler.Bütçe planlaması gelecek tarihlerde gerçekleşmesi beklenen olaylar ve durumlar tahmin edilerek hazırlandığından, şirket hedefleri ve amaçlarını en kapsayıcı şekilde hazırlanabilmesi için şirketin tüm bölümleri ile ortak bir şekilde hazırlanmalıdır. Tüm bölümlerin katılımıyla hazırlanan bir bütçe planlaması sayesinde, şirketin giderleri ve gelirleri ile ilgili daha detaylı bilgiye ulaşılabilir ve daha gerçekçi bir bütçe hazırlanabilir.'),
                width: 500,
                padding: EdgeInsets.all(40.0),
              ),
              Padding(
                padding: const EdgeInsets.only(right:8.0, left: 8.0),
                child: Container(child: Image.asset('assets/images/resim1.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0, left: 12, right: 12.0),
                child: Container(
                  child: Text('Biz Ne Sağlıyoruz?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.white),
                      textAlign: TextAlign.center),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green
                  ),),
              ),
              Center(
                child: Container(child: Text('''
- Şirketlere bütçe analizi ve yönetimleri konusunda hizmet sağlamak
- Gelir ve giderlerin analizini yapmak ve aylık olarak raporlamak
- Şirkete ait verileri raporlamak ve analiz etmek
- Aylık ve haftalık verileri kıyaslayıp raporlamak
- Kağıt ve makinelerle uğraşmadan hızlı ve kolay şekilde tarafınıza raporlar sunmak
- Şirketin analizine bağlı olarak kar/zarar durumu hakkında ayrıntılı bilgi vermek
'''), width: 500, padding: EdgeInsets.all(40.0)),
              )
            ],
          )),
    );
  }
}
