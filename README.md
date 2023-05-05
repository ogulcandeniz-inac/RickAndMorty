Bu belge, Invio 2023 Çekirge Programı için İphone 14 Pro Max uyarlı yapmış olduğum Rick And Morty uygulamasının tanıtımını içermektedir.

Projeyi yaparken öğrendiğim bilgileri pekiştirmek ve başka insanlarla yararı dokunabilmesi adına bir Medium yazısıda yazdım. Buradaki linkten ulaşabilirsiniz. https://medium.com/@ogulcandeniz/ios-geliştirmeye-başlarken-öğrendiklerim-6760532b623a


- [ Teknik Beceriler ]
  - [ Mimari ](#mimari)
  - [ Kütüphane ](#kütüphane)
  - [ Uygulama ](#uygulama)
  - [ Splash ](#splash)
  - [ HomePage ](#homepage)
  - [ CharacterDetail ](#characterdetail)
  
  ###  Mimari
  
  MVC (Model-View-Controller) mimarisini kullanmaktadır.
  - Bu mimari, bir uygulamanın farklı bölümlerini mantıksal olarak birbirinden ayırır ve her birinin belirli bir sorumluluğu vardır.
  - Model-View-Controller (MVC), uygulamanın üç ana bileşeni olan Model, View ve Controller'ı ayırarak uygulama geliştirme sürecini daha organize hale getirir.
  - Model, uygulamanın verilerini ve iş mantığını içerir.
  - View, uygulamanın kullanıcı arayüzünü oluşturur.
  - Controller, kullanıcının View'deki etkileşimlerini alır ve Model üzerinde değişiklik yapar.
  
 ###  Kütüphane
  
  Kingfisher Açık Kaynak kodlu bir resim indirme ve önbellekleme kütüphanesi.
  - Kingfisher, özellikle performans ve kullanım kolaylığı konularında öne çıkmaktadır. Bu kütüphane, resimlerin indirilmesi, önbelleğe alınması, dönüştürülmesi ve yüklenmesi için gerekli olan tüm işlemleri otomatik olarak yapar. Ayrıca, özelleştirilebilir önbellek boyutları, önbellek temizleme stratejileri ve resim boyutu ayarlama gibi bir dizi özellik sunar.
  
###  Uygulama

###  Splash

- Splash (karşılama) sayfası.

- Splash (karşılama) sayfası. İlk öncelik olarak Welcome ile karşıladıktan sonra sayaç ile bir sonraki açılışta Hello yazmaktadır. 
- Rick And Morty başlık logosu scaleanimation, repetitiveanimation ile ayarlanmıştır.
- Welcome ve Hello Splash / Açılış sayfası scaleanimation, repetitiveanimation ile ayarlanmıştır. 

<img width="343" alt="Ekran Resmi 2023-04-24 21 12 22" src="https://user-images.githubusercontent.com/109241786/234081517-babe814c-cab2-4748-b170-0b2c6413339a.png">

###  HomePage
Ana sayfanın oluşturulması. Başlık, kayan yatay liste ve dikey listeden oluşmakadır.
- İki adet CollectionView ile oluşturulmuştur. Her iki CollectionView içinde ayrı ayrı CollectionViewCell oluşturulmuştur.
HorizontalListCollectionViewCell içerisindeki bilgiler https://rickandmortyapi.com/api/location adresinden tumLocationAl fonksiyonu ile alınmaktadır. Alınan veriler JSONDecoder ile düzenlenip Character Struct aktarılmakradır.
- CollectionViewCellHomePage ile oluşturulan dikey liste verilerini CollectionViewCellHomePage https://rickandmortyapi.com/api/character adresinden tumKategoriAl fonksiyonu ile Character struct aktarılır.
- Item tasarımları listenen karakterlerin cinsiyetlerine göre farklılık göstermektedir. Resimde görüldüğü gibi male sahip olanlar resimleri üstte ismi ve cinsiyet resmi altta, female sahip olanların resimleri altta isim ve cinsiyetleri üstte bulunmaktadır.
- HorizontalListCollectionView seçili lokasyon ile seçili olmayan lokasyonların tasarımları farklıdır. Seçilen lokasyon beyaz seçili olmayan lokasyon gri olarak kalmakta ve yeni bir lokasyon seçildikten sonra tekrar rengi gri dönmektedir.


<img width="343" alt="Ekran Resmi 2023-04-24 21 13 20" src="https://user-images.githubusercontent.com/109241786/234086056-bf630fba-2beb-43d1-b2ce-259acb595bf6.png">

###  CharacterDetail

Detay sayfasının eklenmesi.
- Tüm metinlerin yazı tipi Avenir.
- Resmin ebatları: 275x275 (dp*/pt**)
- Resmin yatay margin’leri: 50 (dp/pt)
- Resmin dikey margin’leri: 20 dp/pt. 
- Başlıklar: 22 (sp*/pt) ve bold
- Metinler: 22 (sp/pt) ve regular
- Satırların yatay margin’leri: 20 (dp/pt)
- Satırların dikey margin’leri: 5 (dp/pt)
Olarak ayarlanmıştır.

Uygulama yan döndürülmüş bir şekilde kullanılmaktadır. Bunu yapabilmek için 'Scroll View' kullanılmıştır ve ayarlanmış olan bilgilerde kayma veya bozulma olmamaktadır.

<img width="343" alt="Ekran Resmi 2023-04-24 21 13 56" src="https://user-images.githubusercontent.com/109241786/234092201-283f44f7-9e8b-4a5c-97df-80b45791580e.png">



