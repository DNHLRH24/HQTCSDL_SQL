USE [QLTHANHVIEN]
GO
/****** Object:  Table [dbo].[HOSOVAYVON]    Script Date: 6/2/2024 10:11:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOSOVAYVON](
	[MaHoSo] [nvarchar](10) NOT NULL,
	[LaiSuat] [float] NULL,
 CONSTRAINT [PK_HOSOVAYVON] PRIMARY KEY CLUSTERED 
(
	[MaHoSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOSOVONVAY_THANHVIEN]    Script Date: 6/2/2024 10:11:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOSOVONVAY_THANHVIEN](
	[MaThanhVien] [nvarchar](10) NOT NULL,
	[MaHoSo] [nvarchar](10) NOT NULL,
	[SoVonVay] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THANHVIEN]    Script Date: 6/2/2024 10:11:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THANHVIEN](
	[MaThanhVien] [nvarchar](10) NOT NULL,
	[HoDem] [nvarchar](50) NULL,
	[Ten] [nvarchar](15) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [bit] NULL,
	[NoiSinh] [nvarchar](10) NULL,
 CONSTRAINT [PK_THANHVIEN] PRIMARY KEY CLUSTERED 
(
	[MaThanhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[HOSOVAYVON] ([MaHoSo], [LaiSuat]) VALUES (N'', NULL)
INSERT [dbo].[HOSOVAYVON] ([MaHoSo], [LaiSuat]) VALUES (N'HS01', 0.6)
INSERT [dbo].[HOSOVAYVON] ([MaHoSo], [LaiSuat]) VALUES (N'HS02', 0.4)
INSERT [dbo].[HOSOVAYVON] ([MaHoSo], [LaiSuat]) VALUES (N'HS03', 0.7)
INSERT [dbo].[HOSOVAYVON] ([MaHoSo], [LaiSuat]) VALUES (N'HS04', 0.6)
INSERT [dbo].[HOSOVAYVON] ([MaHoSo], [LaiSuat]) VALUES (N'HS05', 0.9)
INSERT [dbo].[HOSOVAYVON] ([MaHoSo], [LaiSuat]) VALUES (N'HS06', 0.7)
GO
INSERT [dbo].[HOSOVONVAY_THANHVIEN] ([MaThanhVien], [MaHoSo], [SoVonVay]) VALUES (N'TV01', N'HS01', 15)
INSERT [dbo].[HOSOVONVAY_THANHVIEN] ([MaThanhVien], [MaHoSo], [SoVonVay]) VALUES (N'TV01', N'HS02', 8)
INSERT [dbo].[HOSOVONVAY_THANHVIEN] ([MaThanhVien], [MaHoSo], [SoVonVay]) VALUES (N'TV02', N'HS01', 27)
INSERT [dbo].[HOSOVONVAY_THANHVIEN] ([MaThanhVien], [MaHoSo], [SoVonVay]) VALUES (N'TV03', N'HS01', 35)
INSERT [dbo].[HOSOVONVAY_THANHVIEN] ([MaThanhVien], [MaHoSo], [SoVonVay]) VALUES (N'TV04', N'HS06', 56)
INSERT [dbo].[HOSOVONVAY_THANHVIEN] ([MaThanhVien], [MaHoSo], [SoVonVay]) VALUES (N'TV05', N'HS06', 45)
INSERT [dbo].[HOSOVONVAY_THANHVIEN] ([MaThanhVien], [MaHoSo], [SoVonVay]) VALUES (N'TV06', N'HS03', 37)
INSERT [dbo].[HOSOVONVAY_THANHVIEN] ([MaThanhVien], [MaHoSo], [SoVonVay]) VALUES (N'TV07', N'HS04', 69)
INSERT [dbo].[HOSOVONVAY_THANHVIEN] ([MaThanhVien], [MaHoSo], [SoVonVay]) VALUES (N'TV08', N'HS04', 14)
INSERT [dbo].[HOSOVONVAY_THANHVIEN] ([MaThanhVien], [MaHoSo], [SoVonVay]) VALUES (N'TV09', N'HS06', 78)
GO
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [HoDem], [Ten], [NgaySinh], [GioiTinh], [NoiSinh]) VALUES (N'TV01', N'Nguyễn Thị', N'Huế', CAST(N'1993-08-05' AS Date), 0, N'Đà Nẵng')
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [HoDem], [Ten], [NgaySinh], [GioiTinh], [NoiSinh]) VALUES (N'TV02', N'Lê Văn', N'Lý', CAST(N'1992-09-21' AS Date), 1, N'TT Huế')
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [HoDem], [Ten], [NgaySinh], [GioiTinh], [NoiSinh]) VALUES (N'TV03', N'Lê Thị Hồng', N'Nga', CAST(N'1991-07-24' AS Date), 0, NULL)
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [HoDem], [Ten], [NgaySinh], [GioiTinh], [NoiSinh]) VALUES (N'TV04', N'Lương Nguyễn Nguyệt', N'Loan', CAST(N'1992-12-24' AS Date), 0, N'TT Huế')
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [HoDem], [Ten], [NgaySinh], [GioiTinh], [NoiSinh]) VALUES (N'TV05', N'Nguyễn Thanh', N'Lĩnh', CAST(N'1992-04-21' AS Date), 1, N'Đà Nẵng')
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [HoDem], [Ten], [NgaySinh], [GioiTinh], [NoiSinh]) VALUES (N'TV06', N'Võ Văn', N'Hậu', CAST(N'1992-09-21' AS Date), 1, N'Quảng Bình')
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [HoDem], [Ten], [NgaySinh], [GioiTinh], [NoiSinh]) VALUES (N'TV07', N'Võ Thị Thu', N'Hằng', CAST(N'1993-05-21' AS Date), 0, N'Hà Nội')
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [HoDem], [Ten], [NgaySinh], [GioiTinh], [NoiSinh]) VALUES (N'TV08', N'Trần Thị Khánh', N'Hòa', CAST(N'1992-06-24' AS Date), 0, NULL)
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [HoDem], [Ten], [NgaySinh], [GioiTinh], [NoiSinh]) VALUES (N'TV09', N'Đỗ Thị Ngọc ', N'Huyền', CAST(N'1991-03-29' AS Date), 0, N'Hà Nội')
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [HoDem], [Ten], [NgaySinh], [GioiTinh], [NoiSinh]) VALUES (N'TV10', N'Nguyễn Thị Diễm', N'Hương', CAST(N'1994-02-26' AS Date), 0, N'Hà Nội')
GO
ALTER TABLE [dbo].[HOSOVONVAY_THANHVIEN]  WITH CHECK ADD  CONSTRAINT [FK_HOSOVONVAY_THANHVIEN_HOSOVAYVON] FOREIGN KEY([MaHoSo])
REFERENCES [dbo].[HOSOVAYVON] ([MaHoSo])
GO
ALTER TABLE [dbo].[HOSOVONVAY_THANHVIEN] CHECK CONSTRAINT [FK_HOSOVONVAY_THANHVIEN_HOSOVAYVON]
GO
ALTER TABLE [dbo].[HOSOVONVAY_THANHVIEN]  WITH CHECK ADD  CONSTRAINT [FK_HOSOVONVAY_THANHVIEN_THANHVIEN] FOREIGN KEY([MaThanhVien])
REFERENCES [dbo].[THANHVIEN] ([MaThanhVien])
GO
ALTER TABLE [dbo].[HOSOVONVAY_THANHVIEN] CHECK CONSTRAINT [FK_HOSOVONVAY_THANHVIEN_THANHVIEN]
GO
