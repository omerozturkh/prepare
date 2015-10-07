Yeni başladığım projelerde her defasında adım adım yaptığım(aşağıdaki işlemler) ve bana çok sıkıcı gelen hazırlık evresini otomatiğe bağlayan, çalıştıktan sonra bana sadece dizine girip kod yazma işini bırakan bir bash scripti hazırladım. Hazırlarken daha bir hoşuma gitti ve bunu ileride seçeneklerle, parametrelerle daha da kullanışlı hale getirebileceğimi düşündüm. Şimdilik ilk hali bu şekilde.

* Dizinleri oluştur
* Dosyaları oluştur
* Bower ile gerekli componentleri kur
* Npm ile gerekli componentleri kur
* Grunt ve ya Gulp konfigurasyonunu ayarla
* ve çalıştır

### Kurulum

```shell
git clone git@github.com:muratbastas/prepare.git
```

*Not :* `test` dizini `frontend.sh` dosyası çalıştırılınca oluşan projenin örneğidir. Silebilirsiniz.

Bu frontend.sh dosyasını `$PATH` e ekleyerek ve ya `alias` yaparak tek komutla yeni bir proje oluşturabilirsiniz.

`$PATH`'e eklemek için
```
export PATH="/sh-dosyasinin-bulundugu-dizin:$PATH"
```

`alias` yapmak için
```
alias komutadi="source /sh-dosyasinin-bulundugu-dizin/frontend.sh"
```
