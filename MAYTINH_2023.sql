USE [LQMAYTINH]
GO
/****** Object:  Table [dbo].[MAYTINH]    Script Date: 6/3/2024 5:31:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAYTINH](
	[MaMayTinh] [nvarchar](10) NOT NULL,
	[TenMayTinh] [nvarchar](50) NOT NULL,
	[DonGia] [money] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[NgayNhap] [date] NOT NULL,
	[MaLoaiMayTinh] [nvarchar](10) NOT NULL,
	[MaNhaCC] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_MAYTINH] PRIMARY KEY CLUSTERED 
(
	[MaMayTinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[MAYTINH] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'Acer01', N'Acer Core i3 2.6 GHz', 450.0000, 278, CAST(N'2022-07-29' AS Date), N'ACER', N'Hue')
INSERT [dbo].[MAYTINH] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'Acer02', N'Acer Core i7 3.6 GHz', 744.0000, 790, CAST(N'2023-01-14' AS Date), N'ACER', N'DN')
INSERT [dbo].[MAYTINH] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'Dell01', N'Dell core i3 2.6 GHz', 607.0000, 45, CAST(N'2022-12-21' AS Date), N'DELL', N'Hue')
INSERT [dbo].[MAYTINH] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'Dell02', N'Dell core i5 3.2 GHz', 791.0000, 620, CAST(N'2022-06-10' AS Date), N'DELL', N'QN')
INSERT [dbo].[MAYTINH] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'Dell03', N'Dell core i3 2.8 GHz', 620.0000, 150, CAST(N'2022-10-15' AS Date), N'DELL', N'Hue')
INSERT [dbo].[MAYTINH] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'HP01', N'HP Core i3 3.2 GHz', 354.0000, 547, CAST(N'2023-03-18' AS Date), N'HP', N'DN')
INSERT [dbo].[MAYTINH] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'HP02', N'HP Core i5 3.5 GHz', 450.0000, 900, CAST(N'2023-01-08' AS Date), N'HP', N'QN')
INSERT [dbo].[MAYTINH] ([MaMayTinh], [TenMayTinh], [DonGia], [SoLuong], [NgayNhap], [MaLoaiMayTinh], [MaNhaCC]) VALUES (N'HP03', N'HP Core i3 2.6 GHz', 352.0000, 89, CAST(N'2022-05-22' AS Date), N'HP', N'QN')
GO
ALTER TABLE [dbo].[MAYTINH]  WITH CHECK ADD  CONSTRAINT [FK_MAYTINH_LOAIMAYTINH] FOREIGN KEY([MaLoaiMayTinh])
REFERENCES [dbo].[LOAIMAYTINH] ([MaLoaiMayTinh])
GO
ALTER TABLE [dbo].[MAYTINH] CHECK CONSTRAINT [FK_MAYTINH_LOAIMAYTINH]
GO
ALTER TABLE [dbo].[MAYTINH]  WITH CHECK ADD  CONSTRAINT [FK_MAYTINH_NHACUNGCAP] FOREIGN KEY([MaNhaCC])
REFERENCES [dbo].[NHACUNGCAP] ([MaNhaCC])
GO
ALTER TABLE [dbo].[MAYTINH] CHECK CONSTRAINT [FK_MAYTINH_NHACUNGCAP]
GO
