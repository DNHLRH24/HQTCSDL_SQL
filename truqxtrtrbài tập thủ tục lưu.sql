--c1
CREATE PROCEDURE InNgayThangNamHienTai
AS
BEGIN
    PRINT 'Ngày tháng năm hiện tại là: ' + CONVERT(varchar(10), GETDATE(), 103);
END;
EXEC InNgayThangNamHienTai;



--c2
CREATE PROCEDURE TinhDienTichVaChuViHinhChuNhat
    @ChieuDai float,
    @ChieuRong float
AS
BEGIN
    -- Tính diện tích
    DECLARE @DienTich float;
    SET @DienTich = @ChieuDai * @ChieuRong;

    -- Tính chu vi
    DECLARE @ChuVi float;
    SET @ChuVi = 2 * (@ChieuDai + @ChieuRong);

    -- In kết quả
    PRINT 'Diện tích của hình chữ nhật là: ' + CAST(@DienTich AS varchar(50));
    PRINT 'Chu vi của hình chữ nhật là: ' + CAST(@ChuVi AS varchar(50));
END;
EXEC TinhDienTichVaChuViHinhChuNhat @ChieuDai = 5, @ChieuRong = 3;

--3
create procedure sinhvien_malop2
(@malop nvarchar(15))
as
select masinhvien, hodem, ten, gioitinh, malop
from SINHVIEN
where malop=@malop
sinhvien_malop2 @malop='K45HDDL'

--5
CREATE PROCEDURE DanhSachSinhVien10
    @gioitinh bit = 0, 
    @noisinh nvarchar(250) = N'TT Huế'
AS 
BEGIN 
    SELECT masinhvien, hodem, ten, 
           CASE gioitinh WHEN 0 THEN N'Nữ' ELSE N'Nam' END AS gioitinh, 
           noisinh
    FROM SINHVIEN
    WHERE 
        gioitinh = @gioitinh
        AND noisinh = @noisinh;

    IF @gioitinh = 0 
        PRINT N'Giới tính: Nữ';
    ELSE 
        PRINT N'Giới tính: Nam';

    PRINT N'Nơi sinh: ' + @noisinh;
END;


EXEC DanhSachSinhVien10 @gioitinh = 0, @noisinh = N'Hà Nội';

 --6
 CREATE PROCEDURE HienThiSinhVienTheoThang
    @thang_bat_dau int,
    @thang_ket_thuc int
AS 
BEGIN 
    IF @thang_bat_dau > @thang_ket_thuc
    BEGIN
        PRINT N'Dữ liệu không hợp lệ. Tháng bắt đầu phải nhỏ hơn hoặc bằng tháng kết thúc.';
        RETURN;
    END

    SELECT masinhvien, hodem, ten, gioitinh, noisinh
    FROM SINHVIEN
    WHERE MONTH(ngaysinh) BETWEEN @thang_bat_dau AND @thang_ket_thuc;
END;
EXEC HienThiSinhVienTheoThang 3,7;

--3.8
CREATE PROCEDURE HienThiDiemSinhVien1
    @masinhvien nvarchar(50)
AS
BEGIN
    SELECT sv.masinhvien, sv.hodem, sv.ten, sv.ngaysinh,
           d.diemmon1, d.diemmon2, d.diemmon3,
           d.diemmon1 + d.diemmon2 + d.diemmon3 AS tongdiem
    FROM SINHVIEN sv
    INNER JOIN DIEMts d ON sv.masinhvien = d.masinhvien
    WHERE sv.masinhvien = @masinhvien;
END;

EXEC HienThiDiemSinhVien1 @masinhvien = N'DL01';


--3.9
CREATE PROCEDURE HienThiTongSoSinhVienTheoLop
    @tenlop nvarchar(100)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM LOP WHERE tenlop = @tenlop)
    BEGIN
        PRINT N'Tên lớp không tồn tại';
        RETURN;
    END

    SELECT l.malop, l.tenlop, COUNT(sv.masinhvien) AS tongsosv
    FROM LOP l
    LEFT JOIN SINHVIEN sv ON l.malop = sv.malop
    WHERE l.tenlop = @tenlop
    GROUP BY l.malop, l.tenlop;
END;
EXEC HienThiTongSoSinhVienTheoLop  N'Lớp K45QTKD';

--3.10
CREATE PROCEDURE ThemSinhVienMoi
    @masinhvien nvarchar(50),
    @hodem nvarchar(50),
    @ten nvarchar(50),
    @ngaysinh date,
    @gioitinh bit,
    @noisinh nvarchar(100),
    @malop nvarchar(10)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM SINHVIEN WHERE masinhvien = @masinhvien)
    BEGIN
        PRINT 'Mã sinh viên đã tồn tại.';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM LOP WHERE malop = @malop)
    BEGIN
        PRINT 'Mã lớp không tồn tại.';
        RETURN;
    END

    INSERT INTO SINHVIEN (masinhvien, hodem, ten, ngaysinh, gioitinh, noisinh, malop)
    VALUES (@masinhvien, @hodem, @ten, @ngaysinh, @gioitinh, @noisinh, @malop);

    PRINT 'Thêm sinh viên mới thành công.';
END;
EXEC ThemSinhVienMoi 
    @masinhvien = N'DL010',
    @hodem = N'Trịnh Quốc',
    @ten = N'Dân',
    @ngaysinh = '2004-02-28',
    @gioitinh = 1,
    @noisinh = N'Quảng Bình',
    @malop = N'K45000HDDL';
