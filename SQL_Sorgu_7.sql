-- While D�ng�s�: SQL sorgu dilinde, C# programlama dilinde oldu?u gibi belirli ko?ullara ba?l? olarak sorgu komutlar?n? tekrarlayabiliriz. While d�ng�s�, ko?ul do?ru oldu?u s�rece i�indeki kod blo?unu i?ler.

-- �rnek: 10'dan geriye do?ru yazd?ran bir while d�ng�s�
declare @sayi int
set @sayi = 10
while (@sayi > 0)
begin
    print(@sayi)
    set @sayi = @sayi - 1
end

-- Break Komutu: D�ng�y� sonland?rmak i�in kullan?l?r.

-- �rnek: 1'den 10'a kadar yazd?ran bir while d�ng�s�. Ancak d�ng� 5'e geldi?inde sona ersin
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

-- Stored Procedure (Sakl? Prosed�r): SQL sorgu dilinde birden fazla i?lemin tan?mland??? objelerdir. SP'ler iste?e ba?l? olarak parametre alabilirler. Insert, Update, Delete veya Select i?lemleri yap?labilir veya hepsini bir arada kullanabilirsiniz. Herhangi bir k?s?tlama yoktur.

-- SP'leri y�netme:
-- 1) Create Procedure
-- 2) Alter Procedure
-- 3) Drop Procedure

-- �rnek: Kategori bilgisine g�re �r�nleri listeleyen bir SP
create proc UrunleriListele(@catID int)
as
begin
    select * from Products where CategoryID=@catID
end

-- Alter Procedure: Olu?turulmu? olan SP'yi d�zenlemek veya g�ncellemek i�in kullan?l?r.
alter procedure UrunleriListele (@catID int , @supID int )
as
begin
    select * from Products where CategoryID=@catID and SupplierID=@supID
end

-- Drop Procedure: Olu?turulmu? olan SP'yi silmek i�in kullan?l?r.
Drop proc UrunleriListele

-- Functions (Fonksiyonlar): SQL sorgu dilinde, C# gibi kendini tekrarlayan komut sat?rlar?n? bir paket sistemi haline getirmek i�in kullan?l?r. Fonksiyonlar, SP'lerden en b�y�k fark? sorgu i�erisinde kullan?labilmeleridir.

-- 1) Geriye De?er D�nd�ren Fonksiyonlar:
-- �rnek: 2 Say?y? toplay?p sonucu geriye d�nd�ren bir fonksiyon
create function fnTopla(@sayi1 int , @sayi2 int)
returns int
as
begin
    return(@sayi1+@sayi2)
end

-- 2) Geriye Sorgu D�nd�ren Fonksiyonlar:
-- �rnek: M�?teri Id bilgisine g�re sipari?leri listeleyen bir fonksiyon
create function MusteriyeGoreSiparis (@musteriID nchar(5))
returns table
as
return
(
    select * from Orders where CustomerID=@musteriID
)

-- Datediff: Tarih bilgisine ba?l? kalarak iki tarih aras?ndaki fark? bulman?z? sa?lar. Bu fonksiyonu kullanmak i�in 3 farkl? parametreye ihtiyac?n?z var.

-- �rnek: ?ki tarih aras?ndaki fark? g�n, ay, y?l olarak ayr? ayr? hesaplayal?m
select DATEDIFF(DAY,'2013-03-18','2023-09-26') as 'G�n Fark?'
select DATEDIFF(MONTH,'2013-03-18','2023-09-26') as 'Ay Fark?'
select DATEDIFF(YEAR,'2013-03-18','2023-09-26') as 'Y?l Fark?'

-- Backup: SQL sorgu dili i�erisinde komut sat?r? arac?l???yla veritaban? yede?ini alabilirsiniz. Yedek alma i?leminde dosya ad?n?n '.bak' uzant?s?nda olmas? gerekmektedir.

-- �rnek: Veritaban?n? yedekleme
backup database NORTHWND to disk = 'C:\Users\sadullah.sener\Desktop\Yeni klas�r\TestDataBase_260923.bak'
