SELECT MaMayTinh, TenMayTinh, DonGia, SoLuong, thanhtien=SoLuong*DonGia, ngaynhap
FROM MAYTINH
WHERE MONTH(NgayNhap) = 1 AND YEAR(NgayNhap) = 2023;
---3---
SELECT TOP 4 MT.MaMayTinh, MT.TenMayTinh, MT.DonGia, MT.SoLuong, (MT.DonGia * MT.SoLuong) AS ThanhTien, MT.NgayNhap, LMT.TenLoaiMayTinh
FROM MAYTINH MT
 JOIN LOAIMAYTINH LMT ON MT.MaLoaiMayTinh = LMT.MaLoaiMayTinh
WHERE MT.TenMayTinh LIKE '%Core i3%'
ORDER BY ThanhTien DESC;
---4-- 
SELECT NCC.MaNhaCC, NCC.TenNhaCC, SUM(MT.SoLuong) AS SoLuongMayTinh
FROM NHACUNGCAP NCC
JOIN MAYTINH MT ON NCC.MaNhaCC = MT.MaNhaCC
GROUP BY NCC.MaNhaCC, NCC.TenNhaCC
HAVING SUM(MT.SoLuong) >= 1000;
--5--
SELECT 
    mt.MaMayTinh AS 'Mã máy tính',
    mt.TenMayTinh AS 'Tên máy tính',
    mt.DonGia AS 'Đơn giá',
	mt.manhacc 
FROM 
    MAYTINH mt
INNER JOIN 
    NHACUNGCAP ncc ON mt.MaNhaCC = ncc.MaNhaCC
WHERE 
    ncc.MaNhaCC = (
        SELECT MaNhaCC FROM MAYTINH WHERE MaMayTinh = 'HP01'
    )
---6---
--7-- 
DELETE FROM MAYTINH_2023
WHERE RIGHT(MaMayTinh, 2) = '01';

--8
CREATE VIEW MAYTINH_CAOCAP AS
SELECT TOP 5
    MT.MaMayTinh,
    MT.TenMayTinh,
    MT.DonGia,
    MT.SoLuong,
    (MT.DonGia * MT.SoLuong) AS ThanhTien,
    MT.MaNhaCC,
    LM.TenLoaiMayTinh
FROM
    MAYTINH MT
JOIN
    LOAIMAYTINH LM ON MT.MaLoaiMayTinh = LM.MaLoaiMayTinh
ORDER BY
    MT.DonGia DESC,
    MT.SoLuong DESC
---9----
CREATE PROCEDURE sp_MAYTINH_DONGIA
    @tugia MONEY,
    @dengia MONEY
AS
BEGIN
    IF @tugia > @dengia
    BEGIN
        PRINT 'Dữ liệu không hợp lệ';
        RETURN;
    END

    SELECT 
        MT.MaMayTinh,
        MT.TenMayTinh,
        MT.DonGia,
        MT.SoLuong,
        (MT.DonGia * MT.SoLuong) AS ThanhTien,
        MT.MaNhaCC,
        NCC.TenNhaCC
    FROM 
        MAYTINH MT
    JOIN 
        NHACUNGCAP NCC ON MT.MaNhaCC = NCC.MaNhaCC
    WHERE 
        MT.DonGia BETWEEN @tugia AND @dengia;
END
EXEC sp_MAYTINH_DONGIA @tugia = 600, @dengia = 800;

--10--
CREATE LOGIN user_22E1020014 WITH PASSWORD = '123456';

CREATE USER user_22E1020014 FOR LOGIN user_22E1020014;
GRANT CONNECT TO user_22E1020014;
GRANT SELECT, DELETE ON dbo.MAYTINH TO user_22E1020014;
GRANT EXECUTE ON sp_MAYTINH_DONGIA TO user_22E1020014;