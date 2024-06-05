--1.17--
UPDATE SINHVIEN_HOLE
SET NOISINH = 'Quảng Bình'
where masinhvien like N'%03'
--1.18--
delete from sinhvien_hole
WHERE MONTH(ngaysinh) BETWEEN 3 AND 10
AND YEAR(ngaysinh) = 1991;

--1.19--
DELETE FROM sinhvien_hole
WHERE YEAR(ngaysinh) = (
SELECT YEAR(ngaysinh) 
FROM sinhvien_hole 
WHERE masinhvien = N'KD02');
--1.20--
ALTER TABLE lop
ADD TongSoSinhVien INT NULL;

UPDATE lop
set tongsosinhvien=(
select count(*)
from sinhvien
where sinhvien.MaLop = lop.Malop