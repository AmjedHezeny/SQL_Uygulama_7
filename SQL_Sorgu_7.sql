-- While Döngüsü: SQL sorgu dilinde , C# programlama dilinde olduğu gibi belirli koşullara bağlı olarak sorgu komutlarını tekrarlayabiliriz. While döngüsü, koşul doğru olduğu sürece içindeki kod bloğunu işler.

-- Örnek: 10'dan geriye doğru yazdıran bir while döngüsü
declare @sayi int
set @sayi = 10
while (@sayi > 0)
begin
    print(@sayi)
    set @sayi = @sayi - 1
end

-- Break Komutu: Döngüyü sonlandırmak için kullanılır.

-- Örnek: 1'den 10'a kadar yazdıran bir while döngüsü. Ancak döngü 5'e geldiğinde sona ersin
declare @sayac int
set @sayac = 1
while (@sayac < 10)
begin
    print(@sayac)
    if (@sayac = 5)
    begin
        break
    end
    set @sayac = @sayac + 1
end

-- Stored Procedure (Saklı Prosedür): SQL sorgu dilinde birden fazla işlemin tanımlandığı objelerdir. SP'ler isteğe bağlı olarak parametre alabilirler. Insert, Update, Delete veya Select işlemleri yapılabilir veya hepsini bir arada kullanabilirsiniz. Herhangi bir kısıtlama yoktur.

-- SP'leri yönetme:
-- 1) Create Procedure
-- 2) Alter Procedure
-- 3) Drop Procedure

-- Örnek: Kategori bilgisine göre ürünleri listeleyen bir SP
create proc UrunleriListele(@catID int)
as
begin
    select * from Products where CategoryID=@catID
end

-- Alter Procedure: Oluşturulmuş olan SP'yi düzenlemek veya güncellemek için kullanılır.
alter procedure UrunleriListele (@catID int , @supID int )
as
begin
    select * from Products where CategoryID=@catID and SupplierID=@supID
end

-- Drop Procedure: Oluşturulmuş olan SP'yi silmek için kullanılır.
Drop proc UrunleriListele

-- Functions (Fonksiyonlar): SQL sorgu dilinde, C# gibi kendini tekrarlayan komut satırlarını bir paket sistemi haline getirmek için kullanılır. Fonksiyonlar, SP'lerden en büyük farkı sorgu içerisinde kullanılabilmeleridir.

-- 1) Geriye Değer Döndüren Fonksiyonlar:
-- Örnek: 2 Sayıyı toplayıp sonucu geriye döndüren bir fonksiyon
create function fnTopla(@sayi1 int , @sayi2 int)
returns int
as
begin
    return(@sayi1+@sayi2)
end

-- 2) Geriye Sorgu Döndüren Fonksiyonlar:
-- Örnek: Müşteri Id bilgisine göre siparişleri listeleyen bir fonksiyon
create function MusteriyeGoreSiparis (@musteriID nchar(5))
returns table
as
return
(
    select * from Orders where CustomerID=@musteriID
)

-- Datediff: Tarih bilgisine bağlı kalarak iki tarih arasındaki farkı bulmanızı sağlar. Bu fonksiyonu kullanmak için 3 farklı parametreye ihtiyacınız var.

-- Örnek: İki tarih arasındaki farkı gün, ay, yıl olarak ayrı ayrı hesaplayalım
select DATEDIFF(DAY,'2013-03-18','2023-09-26') as 'Gün Farkı'
select DATEDIFF(MONTH,'2013-03-18','2023-09-26') as 'Ay Farkı'
select DATEDIFF(YEAR,'2013-03-18','2023-09-26') as 'Yıl Farkı'

-- Backup: SQL sorgu dili içerisinde komut satırı aracılığıyla veritabanı yedeğini alabilirsiniz. Yedek alma işleminde dosya adının '.bak' uzantısında olması gerekmektedir.

-- Örnek: Veritabanını yedekleme
backup database NORTHWND to disk = 'C:\Users\sadullah.sener\Desktop\Yeni klasör\TestDataBase_260923.bak'
