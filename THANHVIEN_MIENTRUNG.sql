USE [QLTHANHVIEN]
GO
/****** Object:  Table [dbo].[THANHVIEN]    Script Date: 6/3/2024 9:46:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THANHVIEN_MIENTRUNG](
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

