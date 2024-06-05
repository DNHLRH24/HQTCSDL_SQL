---2--
select mathanhvien, CONCAT(HODEM, ' ' ,TEN)AS hoten, ngaysinh, gioitinh, noisinh
from thanhvien
where noisinh like N'%Huế%'
---3--
SELECT mathanhvien, CONCAT(HODEM, ' ' ,TEN)AS hoten, ngaysinh, gioitinh, noisinh
FROM THANHVIEN 
WHERE  YEAR(NGAYSINH)=1992 AND  MONTH(NGAYSINH) BETWEEN 3 AND 6
---4--
SELECT TOP 9
    TV.MaThanhVien,
    TV.HoDem + ' ' + TV.Ten AS HoTen,
    TV.NgaySinh,
    HVTV.MaHoSo,
    HVTV.SoVonVay
FROM
    dbo.HOSOVONVAY_THANHVIEN HVTV
 JOIN
    dbo.THANHVIEN TV ON HVTV.MaThanhVien = TV.MaThanhVien
 JOIN
    dbo.HOSOVAYVON HV ON HVTV.MaHoSo = HV.MaHoSo
ORDER BY
    HVTV.SoVonVay ASC;
----5---
SELECT TV.mathanhvien, CONCAT(HODEM, ' ' ,TEN)AS hoten
FROM THANHVIEN TV
LEFT JOIN HOSOVONVAY_THANHVIEN HVTV ON TV.MaThanhVien = HVTV.MaThanhVien
WHERE
    HVTV.MaThanhVien IS NULL;
---6----
ALTER TABLE dbo.HOSOVAYVON
ADD TongSoVonVay INT NULL;
UPDATE HV
SET HV.TongSoVonVay = ISNULL((SELECT SUM(SoVonVay) 
							FROM dbo.HOSOVONVAY_THANHVIEN 
							WHERE MaHoSo = HV.MaHoSo), 0)
FROM dbo.HOSOVAYVON HV;

---7---
---8--
DELETE FROM dbo.THANHVIEN_MIENTRUNG
WHERE HoDem LIKE N'Nguyễn%';
---9---
create view ThanhVienVayVonMax
as 
select top 5 with ties  tv.MaThanhVien,CONCAT(tv.Hodem,' ',tv.Ten) as HoTen,sum(hsvvtv.sovonvay) as TongSoVonVay
from THANHVIEN as tv
join HOSOVONVAY_THANHVIEN as hsvvtv on tv.MaThanhVien=hsvvtv.MaThanhVien
group by tv.MaThanhVien,CONCAT(tv.Hodem,' ',tv.Ten)
order by sum(hsvvtv.sovonvay) desc
---10---
create procedure sp_Thangsinh1 (@x int,@y int)
as 
	begin
		if @x > @y or (@x not between 1 and 12) or (@y not between 1 and 12)
		begin
		print N'Dữ liệu không hợp lệ'
		return
		end
		select * from THANHVIEN
		where month(THANHVIEN.NgaySinh) between @x and @y
	end
exec sp_Thangsinh1 2,6
