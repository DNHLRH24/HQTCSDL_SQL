USE QUANLYBANHANG
SELECT LH.TENLOAIHANG, COUNT (MH.MALOAIHANG) AS 'SỐ LƯỢNG LOẠI HÀNG'
FROM MATHANG MH INNER JOIN LOAIHANG LH 
ON MH.MALOAIHANG=LH.MALOAIHANG
GROUP BY TENLOAIHANG

/*5.2*/
SELECT nsx.manhasx, nsx.tennhasx, COUNT(mh.mahang) as 'số lượng mặt hàng'
FROM nhasanxuat as nsx
LEFT JOIN mathang as mh ON nsx.manhasx = mh.manhasx
GROUP BY nsx.manhasx, nsx.tennhasx;
