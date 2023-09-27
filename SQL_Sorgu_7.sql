-- While Döngüsü: SQL sorgu dilinde, C# programlama dilinde oldu?u gibi belirli ko?ullara ba?l? olarak sorgu komutlar?n? tekrarlayabiliriz. While döngüsü, ko?ul do?ru oldu?u sürece içindeki kod blo?unu i?ler.

-- Örnek: 10'dan geriye do?ru yazd?ran bir while döngüsü
declare @sayi int
set @sayi = 10
while (@sayi > 0)
begin
    print(@sayi)
    set @sayi = @sayi - 1
end

-- Break Komutu: Döngüyü sonland?rmak için kullan?l?r.

-- Örnek: 1'den 10'a kadar yazd?ran bir while döngüsü. Ancak döngü 5'e geldi?inde sona ersin
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

-- Stored Procedure (Sakl? Prosedür): SQL sorgu dilinde birden fazla i?lemin tan?mland??? objelerdir. SP'ler iste?e ba?l? olarak parametre alabilirler. Insert, Update, Delete veya Select i?lemleri yap?labilir veya hepsini bir arada kullanabilirsiniz. Herhangi bir k?s?tlama yoktur.

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

-- Alter Procedure: Olu?turulmu? olan SP'yi düzenlemek veya güncellemek için kullan?l?r.
alter procedure UrunleriListele (@catID int , @supID int )
as
begin
    select * from Products where CategoryID=@catID and SupplierID=@supID
end

-- Drop Procedure: Olu?turulmu? olan SP'yi silmek için kullan?l?r.
Drop proc UrunleriListele

-- Functions (Fonksiyonlar): SQL sorgu dilinde, C# gibi kendini tekrarlayan komut sat?rlar?n? bir paket sistemi haline getirmek için kullan?l?r. Fonksiyonlar, SP'lerden en büyük fark? sorgu içerisinde kullan?labilmeleridir.

-- 1) Geriye De?er Döndüren Fonksiyonlar:
-- Örnek: 2 Say?y? toplay?p sonucu geriye döndüren bir fonksiyon
create function fnTopla(@sayi1 int , @sayi2 int)
returns int
as
begin
    return(@sayi1+@sayi2)
end

-- 2) Geriye Sorgu Döndüren Fonksiyonlar:
-- Örnek: Mü?teri Id bilgisine göre sipari?leri listeleyen bir fonksiyon
create function MusteriyeGoreSiparis (@musteriID nchar(5))
returns table
as
return
(
    select * from Orders where CustomerID=@musteriID
)

-- Datediff: Tarih bilgisine ba?l? kalarak iki tarih aras?ndaki fark? bulman?z? sa?lar. Bu fonksiyonu kullanmak için 3 farkl? parametreye ihtiyac?n?z var.

-- Örnek: ?ki tarih aras?ndaki fark? gün, ay, y?l olarak ayr? ayr? hesaplayal?m
select DATEDIFF(DAY,'2013-03-18','2023-09-26') as 'Gün Fark?'
select DATEDIFF(MONTH,'2013-03-18','2023-09-26') as 'Ay Fark?'
select DATEDIFF(YEAR,'2013-03-18','2023-09-26') as 'Y?l Fark?'

-- Backup: SQL sorgu dili içerisinde komut sat?r? arac?l???yla veritaban? yede?ini alabilirsiniz. Yedek alma i?leminde dosya ad?n?n '.bak' uzant?s?nda olmas? gerekmektedir.

-- Örnek: Veritaban?n? yedekleme
backup database NORTHWND to disk = 'C:\Users\sadullah.sener\Desktop\Yeni klasör\TestDataBase_260923.bak'
