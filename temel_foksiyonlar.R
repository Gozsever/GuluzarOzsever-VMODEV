#Temel Fonksiyonlar Çalışması

#İlk önce veriyi okuduk
veri=read.csv("http://johnmuschelli.com/intro_to_r/data/Youth_Tobacco_Survey_YTS_Data.csv")

View(veri) #Tüm veriyi görmemizi sağlar

head(veri) #Tüm değişkenler için verinin ilk 6 satırını gösterir

dim(veri) #Veri setinin boyutunu görüntüleriz

names(veri) #Veri setinin sütun isimlerini verir

veri$Gender #Belirli bir sütunu alma

summary(veri) #Veri setinin özet istatistiklerini sunar

#Veri setindeki eksik değerleri kontrol etme
print("Eksik değerlerin sayısı:")
print(sum(is.na(veri)))

install.packages("dplyr")
library(dplyr)

#"Age" sütunu seçme ve gözterme
print("age sütunu:")
print(veri$Age)

#"Age" sütununda 18 yaşındanbüyük olanları filtreleme
print("18 yaşından büyük olanlar:")
print(filter(veri, Age > 18)) 

veri_yeniden_ad = rename(veri, year=YEAR)

names(veri_yeniden_ad)
names(veri)

#Education sütununu seçme ve sütunun ilk birkaç değerini görüntüleme
education_verisi <- veri$Education
print(head(education_verisi))      

install.packages("tibble")
library(tibble)

veri2 <- "http://johnmuschelli.com/intro_to_r/data/Youth_Tobacco_Survey_YTS_Data.csv"

#Veriyi yükleme ve tibble olarak atama
veri_tibble <- as_tibble(read.csv(veri2))

#veri setinin yapısını görüntüleme
print("Veri setinin yapısı:")
print(str(veri_tibble))

#Location sütununda California geçen satırları filtreleme
filtered_veri <- filter(veri_tibble, LocationDesc=="California")

print("Filtrelenmiş veri setinin yapısı:")
print(str(filtered_veri))

print("Filtrelenmiş veri setinin ilk birkaç satırı:")
print(head(filtered_veri))

#Year sütununa göre satırları sıralama
sıralı_veri <- arrange(veri_tibble,YEAR)

#Year sütununu 2 ile çarparak yeni bir sütun oluşturma
veri_tibble <- mutate(veri_tibble,Year_Double=YEAR*2)

#Fonksiyonu tanımlayalım
calculate_sqrt <- function(x) {
  sqrt(x)
}

veri2 <- "http://johnmuschelli.com/intro_to_r/data/Youth_Tobacco_Survey_YTS_Data.csv"
veri_tibble <- as_tibble(read.csv(veri2))

#Data_Value sütunundaki her değerin karekökünü hesaplayan fonksiyonu uygulama
veri_tibble <- mutate(veri_tibble,
                      sqrt_data_value=
                        calculate_sqrt(Data_Value))

#Yeni oluşturulan sütunu sıralama
sıralı_veri <- arrange(veri_tibble, sqrt_data_value)

print(head(sıralı_veri))

