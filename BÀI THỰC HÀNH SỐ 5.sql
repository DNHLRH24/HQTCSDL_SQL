
/*5.1*/
SELECT LoaiHang.TenLoaiHang, COUNT(*) AS SoLuong
FROM ChiTietChungTu
INNER JOIN MatHang ON ChiTietChungTu.MaHang = MatHang.MaHang
INNER JOIN LoaiHang ON MatHang.MaLoaiHang = LoaiHang.MaLoaiHang
GROUP BY LoaiHang.TenLoaiHang
/*5.2*/
SELECT NhaSanXuat.TenNhaSX, COUNT(*) AS SoLuong
FROM ChiTietChungTu
INNER JOIN MatHang ON ChiTietChungTu.MaHang = MatHang.MaHang
INNER JOIN NhaSanXuat ON MatHang.MaNhaSX = NhaSanXuat.MaNhaSX
GROUP BY NhaSanXuat.TenNhaSX

/*5.3*/
SELECT TinhThanh.TenTinh, COUNT(*) AS SoLuong
FROM KhachHang
INNER JOIN ChungTuBanHang ON KhachHang.MaKhachHang = ChungTuBanHang.MaKhachHang
INNER JOIN PhieuThuTien ON ChungTuBanHang.SoChungTu = PhieuThuTien.SoChungTu
INNER JOIN TinhThanh ON KhachHang.MaTinh = TinhThanh.MaTinh
GROUP BY TinhThanh.TenTinh
/*5.4*/
SELECT NhomKhachHang.TenNhomKH, COUNT(*) AS SoLuong
FROM KhachHang
INNER JOIN NhomKhachHang ON KhachHang.MaNhomKH = NhomKhachHang.MaNhomKH
GROUP BY NhomKhachHang.TenNhomKH
/*5.5*/
SELECT ChungTuBanHang.SoChungTu, SUM(ChiTietChungTu.SoLuong * ChiTietChungTu.DonGia) AS TongTien
FROM ChungTuBanHang
INNER JOIN ChiTietChungTu ON ChungTuBanHang.SoChungTu = ChiTietChungTu.SoChungTu
GROUP BY ChungTuBanHang.SoChungTu
/*5.6*/
SELECT KhachHang.MaKhachHang, KhachHang.TenKhachHang, ISNULL (SUM(ChiTietChungTu.SoLuong * ChiTietChungTu.DonGia),0) AS TongTien
FROM KhachHang
FULL JOIN ChungTuBanHang ON KhachHang.MaKhachHang = ChungTuBanHang.MaKhachHang
LEFT JOIN ChiTietChungTu ON ChungTuBanHang.SoChungTu = ChiTietChungTu.SoChungTu
GROUP BY KhachHang.MaKhachHang, KhachHang.TenKhachHang

/*5.7*/
SELECT LH.MaLoaiHang,TenloaiHang, COUNT(MaHang) AS SoLuong
FROM LoaiHang LH 
INNER JOIN MatHang MH ON LH.MaLoaiHang = MH.MaLoaiHang
GROUP BY LH.MaLoaiHang,TenloaiHang
HAVING COUNT(MaHang) > 2
/*5.8*/
SELECT ChungTuBanHang.SoChungTu, PhieuThuTien.NgayLap, ChungTuBanHang.MaKhachHang,  SUM(PhieuThuTien.SoTien) AS TongTien
FROM ChungTuBanHang
LEFT JOIN  PhieuThuTien ON ChungTuBanHang.SoChungTu = PhieuThuTien.SoChungTu
GROUP BY ChungTuBanHang.SoChungTu, PhieuThuTien.NgayLap, ChungTuBanHang.MaKhachHang
/*5.9*/
SELECT MatHang.TenHang, SUM(ChiTietChungTu.SoLuong * ChiTietChungTu.DonGia) AS DoanhThu
FROM ChiTietChungTu
INNER JOIN MatHang ON ChiTietChungTu.MaHang = MatHang.MaHang
INNER JOIN NhaSanXuat ON MatHang.MaNhaSX = NhaSanXuat.MaNhaSX
WHERE NhaSanXuat.TenNhaSX = 'Hãng máy tính IBM'
GROUP BY MatHang.TenHang
/*5.10*/
SELECT MatHang.TenHang, SUM(ChiTietChungTu.SoLuong * ChiTietChungTu.DonGia) AS DoanhThu
FROM ChiTietChungTu
INNER JOIN MatHang ON ChiTietChungTu.MaHang = MatHang.MaHang
INNER JOIN ChungTuBanHang ON ChiTietChungTu.SoChungTu = ChungTuBanHang.SoChungTu
WHERE YEAR(ChungTuBanHang.NgayLapChungTu) = 2010
GROUP BY MatHang.TeNHang
HAVING SUM(ChiTietChungTu.SoLuong * ChiTietChungTu.DonGia) > 10000000
/*5.11*/
SELECT KhachHang.TenKhachHang, COUNT(*) AS SoLanMuaHang
FROM KhachHang
INNER JOIN ChungTuBanHang ON KhachHang.MaKhachHang = ChungTuBanHang.MaKhachHang
GROUP BY KhachHang.TenKhachHang
HAVING COUNT(*) > 1
/*5.12*/
SELECT TinhThanh.TenTinh, COUNT(*) AS SoLuong
FROM KhachHang
INNER JOIN ChungTuBanHang ON KhachHang.MaKhachHang = ChungTuBanHang.MaKhachHang
INNER JOIN PhieuThuTien ON ChungTuBanHang.SoChungTu = PhieuThuTien.SoChungTu
INNER JOIN TinhThanh ON KhachHang.MaTinh = TinhThanh.MaTinh
GROUP BY TinhThanh.TenTinh
HAVING COUNT(*) <= 1
/*5.13*/
SELECT ChungTuBanHang.SoChungTu, SUM(PhieuThuTien.SoTien) AS TongTien
FROM ChungTuBanHang
INNER JOIN PhieuThuTien ON ChungTuBanHang.SoChungTu = PhieuThuTien.SoChungTu
GROUP BY ChungTuBanHang.SoChungTu
HAVING SUM(PhieuThuTien.SoTien) > 1000000
/*5.14*/
SELECT LoaiHang.TenLoaiHang, SUM(ChiTietChungTu.SoLuong * ChiTietChungTu.DonGia) AS DoanhThu
FROM ChiTietChungTu
INNER JOIN MatHang ON ChiTietChungTu.MaHang = MatHang.MaHang
INNER JOIN LoaiHang ON MatHang.MaLoaiHang = LoaiHang.MaLoaiHang
GROUP BY LoaiHang.TenLoaiHang
HAVING SUM(ChiTietChungTu.SoLuong * ChiTietChungTu.DonGia) > 20000000
/*5.15*/
SELECT NhaSanXuat.TenNhaSX
FROM NhaSanXuat
LEFT JOIN MatHang ON NhaSanXuat.MaNhaSX = MatHang.MaNhaSX
WHERE MatHang.MaHang IS NULL
/*5.16*/
SELECT TinhThanh.TenTinh
FROM TinhThanh
LEFT JOIN KhachHang ON TinhThanh.MaTinh = KhachHang.MaTinh
WHERE KhachHang.MaKhachHang IS NULL
/*5.17*/
SELECT MatHang.TenHang
FROM MatHang
WHERE NOT EXISTS (
    SELECT *
    FROM ChiTietChungTu
    INNER JOIN ChungTuBanHang ON ChiTietChungTu.SoChungTu = ChungTuBanHang.SoChungTu
    WHERE MatHang.MaHang = ChiTietChungTu.MaHang
    AND MONTH(ChungTuBanHang.NgayLapChungTu) = 12
    AND YEAR(ChungTuBanHang.NgayLapChungTu) = 2010
)
/*5.18*/
SELECT MH.MaHang, tenhang, MaLoaiHang
FROM MatHang MH
WHERE MH.MaLoaiHang = (
    SELECT MaLoaiHang
    FROM MatHang
    WHERE MaHang = 'PC001')
/*5.19*/
SELECT *
FROM KhachHang
WHERE MaTinh IN (
    SELECT MaTinh
    FROM KhachHang
    WHERE TenKhachHang = N'Trần Nguyên Phong'
)

/*5.20*/
SELECT *
FROM KhachHang
WHERE MaNhomKH IN (
    SELECT MaNhomKH
    FROM KhachHang
    WHERE TenKhachHang = N'Nguyễn Thanh Bình' 
)

/*5.21*/
SELECT LoaiHang.TenLoaiHang, LoaiHang.MaLoaiHang, COUNT(MaHang) AS SoLuong
FROM MatHang
INNER JOIN LoaiHang ON MatHang.MaLoaiHang = LoaiHang.MaLoaiHang
GROUP BY LoaiHang.TenLoaiHang, LoaiHang.MaLoaiHang
HAVING COUNT(MaHang) >= all (
        SELECT COUNT(MaHang) AS SoLuong
        FROM MatHang
        GROUP BY MaLoaiHang)

/*5.22*/
SELECT NhaSanXuat.MaNhaSX, NhaSanXuat.TenNhaSX, COUNT(MaHang)AS SoLuong
FROM MatHang 
    INNER JOIN NhaSanXuat ON NhaSanXuat.MaNhaSX = MatHang.MaNhaSX
GROUP BY NhaSanXuat.MaNhaSX, NhaSanXuat.TenNhaSX
HAVING COUNT(MaHang) >= all (
        SELECT COUNT(MaHang) AS SoLuong
        FROM MatHang
        GROUP BY MaNhaSX)
/*5.22*/
SELECT TOP 1 WITH TIES
    NhaSanXuat.MaNhaSX,
    NhaSanXuat.TenNhaSX,
    COUNT(MaHang) AS SoLuong
FROM 
    MatHang
INNER JOIN 
    NhaSanXuat ON MatHang.MaNhaSX = NhaSanXuat.MaNhaSX
GROUP BY 
    NhaSanXuat.MaNhaSX, NhaSanXuat.TenNhaSX
ORDER BY 
    SoLuong DESC;

/*5.23*/
SELECT TOP 1 WITH TIES
    TinhThanh.MaTinh,
    TinhThanh.TenTinh,
    COUNT(KhachHang.MaKhachHang) AS SoLuongKhachHang
FROM 
    TinhThanh
LEFT JOIN 
    KhachHang ON TinhThanh.MaTinh = KhachHang.MaTinh
GROUP BY 
    TinhThanh.MaTinh, TinhThanh.TenTinh
ORDER BY 
    SoLuongKhachHang DESC;

/*5.24*/
SELECT top 1 with ties MatHang.MaHang, MatHang.TenHang, SUM(ChiTietChungTu.SoLuong * ChiTietChungTu.DonGia) AS TongDoanhThu
FROM ChiTietChungTu
INNER JOIN MatHang ON ChiTietChungTu.MaHang = MatHang.MaHang
GROUP BY MatHang.MaHang, MatHang.TenHang
ORDER BY TongDoanhThu DESC

/*5.25*/
SELECT MatHang.MaHang, MatHang.TenHang,SUM(ChiTietChungTu.SoLuong * ChiTietChungTu.DonGia) AS TongDoanhThu
FROM MatHang
INNER JOIN  ChiTietChungTu ON ChiTietChungTu.MaHang = MatHang.MaHang
GROUP BY MatHang.MaHang, MatHang.TenHang
HAVING SUM(ChiTietChungTu.SoLuong * ChiTietChungTu.DonGia) > (
SELECT AVG(CONVERT(NUMERIC(18,2), TongDoanhThu)) AS MucTongDoanhThuTrungBinh
FROM (
    SELECT SUM(SoLuong * DonGia) AS TongDoanhThu
    FROM ChiTietChungTu
    GROUP BY MaHang
) AS DoanhThuMoiMatHang)

/*5.26*/
SELECT TOP 1 WITH TIES KH.MaKhachHang, KH.TenKhachHang, 
SUM(CTCT.SOLUONG*CTCT.DONGIA) AS TONGSOTIEN
FROM KHACHHANG AS KH
JOIN CHUNGTUBANHANG CTBH ON CTBH.MAKHACHHANG = KH.MAKHACHHANG
JOIN CHITIETCHUNGTU CTCT ON CTCT.SOCHUNGTU = CTBH.SOCHUNGTU
GROUP BY KH.MaKhachHang, KH.TenKhachHang
ORDER BY TONGSOTIEN DESC;

/*5.27*/
SELECT TOP 1 WITH TIES ctct.sochungtu, KH.MaKhachHang, KH.TenKhachHang, 
SUM(Soluong*dongia) AS TONGSOTIEN,
count(ctbh.sochungtu) as SOHANG
FROM chungtubanhang AS ctbh
LEFT JOIN chitietchungtu ctct ON CTCT.SOCHUNGTU = CTBH.SOCHUNGTU
LEFT JOIN KHACHHANG  KH  ON CTBH.MAKHACHHANG = KH.MAKHACHHANG
WHERE YEAR(NGAYLAPCHUNGTU) ='2010'
GROUP BY ctct.sochungtu, KH.MaKhachHang, KH.TenKhachHang
ORDER BY SUM(Soluong*dongia) DESC;

--5.28--
SELECT TOP 1 WITH TIES CTBH.SOCHUNGTU, SUM(SOTIEN) AS TIENDATHU
FROM CHUNGTUBANHANG AS CTBH
JOIN PHIEUTHUTIEN PTT ON CTBH.SOCHUNGTU = PTT.SOCHUNGTU
WHERE YEAR(CTBH.NGAYLAPCHUNGTU) =2010
GROUP BY CTBH.SOCHUNGTU
ORDER BY TIENDATHU DESC;

--5.29--
/*số chứng từ, ngày lập chứng từ, tên khách hàng và tổng số tiền hàng */
SELECT TABLE_Tien_Hang.SOCT, TABLE_Tien_Hang.NgayLapChungTu, TenKhachHang, 
		Tien_Hang
FROM
	(SELECT  C.SoChungTu SOCT, NgayLapChungTu, MaKhachHang, SUM(Soluong*Dongia) Tien_Hang
	 FROM ChungTuBanHang C LEFT JOIN ChiTietChungTu T
			ON C.SoChungTu = T.SoChungTu
	GROUP BY C.SoChungTu, NgayLapChungTu, MaKhachHang) AS TABLE_Tien_Hang
INNER JOIN
	(SELECT  C.SoChungTu SOCT, NgayLapChungTu, SUM(SoTien) Tien_Da_Thu
	FROM ChungTuBanHang C LEFT JOIN PhieuThuTien P
			ON C.SoChungTu = P.SoChungTu
	GROUP BY C.SoChungTu, NgayLapChungTu) AS TABLE_Da_Thu
ON TABLE_Tien_Hang.SOCT = TABLE_Da_Thu.SOCT
LEFT JOIN KhachHang K ON TABLE_Tien_Hang.MaKhachHang = K.MaKhachHang
WHERE Tien_Hang > Tien_Da_Thu
