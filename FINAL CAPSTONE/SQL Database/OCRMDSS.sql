USE [OCRMDSS]
GO
/****** Object:  Table [dbo].[CustomersInfo]    Script Date: 8/11/2013 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomersInfo](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[businessLogo] [text] NULL,
	[businessName] [nvarchar](max) NOT NULL,
	[businessAddress] [text] NOT NULL,
	[businessTelNo] [nvarchar](15) NOT NULL,
	[businessLocalNo] [nvarchar](15) NULL,
	[businessCPNo] [nvarchar](20) NULL,
	[businessFaxNo] [nvarchar](15) NULL,
	[customerImage] [text] NULL,
	[customerLN] [nvarchar](50) NOT NULL,
	[customerFN] [nvarchar](50) NOT NULL,
	[customerEmail] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CustomersInfo] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Deliveries]    Script Date: 8/11/2013 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deliveries](
	[deliveryID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[detailID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[customerID] [int] NOT NULL,
	[productSerialNo] [nvarchar](50) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[productClass] [nvarchar](30) NOT NULL,
	[productUnitPrice] [decimal](18, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[amount] [decimal](18, 2) NOT NULL,
	[orderDate] [date] NOT NULL,
	[deliveryDate] [date] NOT NULL,
	[deliveryMode] [nvarchar](20) NOT NULL,
	[concerns] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Deliveries] PRIMARY KEY CLUSTERED 
(
	[deliveryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeesInfo]    Script Date: 8/11/2013 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesInfo](
	[employeeID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[employeeImage] [text] NULL,
	[employeeLN] [nvarchar](50) NOT NULL,
	[employeeFN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EmployeesInfo] PRIMARY KEY CLUSTERED 
(
	[employeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 8/11/2013 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedbackID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[customerID] [int] NULL,
	[feedbackCommSugg] [text] NOT NULL,
	[date] [datetime] NOT NULL,
	[status] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inquiry]    Script Date: 8/11/2013 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inquiry](
	[inquiryID] [int] IDENTITY(1,1) NOT NULL,
	[inquiryFN] [nvarchar](50) NOT NULL,
	[inquiryLN] [nvarchar](50) NOT NULL,
	[inquiryEmail] [nvarchar](50) NOT NULL,
	[inquiryContactNo] [nvarchar](50) NOT NULL,
	[inquiryMessage] [text] NOT NULL,
	[date] [datetime] NOT NULL,
	[status] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Inquiry] PRIMARY KEY CLUSTERED 
(
	[inquiryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 8/11/2013 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[inventoryID] [int] IDENTITY(1,1) NOT NULL,
	[productSerialNo] [nvarchar](50) NOT NULL,
	[existingStock] [int] NOT NULL,
	[producedStock] [int] NOT NULL,
	[warehouseStock] [int] NOT NULL,
	[batchNo] [int] NULL,
	[productStatus] [nvarchar](20) NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[inventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 8/11/2013 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NULL,
	[orderID] [int] NOT NULL,
	[productSerialNo] [nvarchar](50) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[productClass] [nvarchar](30) NOT NULL,
	[productUnitPrice] [decimal](18, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[amount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/11/2013 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[customerID] [int] NOT NULL,
	[orderDate] [date] NOT NULL,
	[deliveryDate] [date] NULL,
	[preferredDelivery] [date] NULL,
	[deliveryMode] [nvarchar](20) NOT NULL,
	[concerns] [nvarchar](max) NULL,
	[amount] [decimal](18, 2) NOT NULL,
	[validation] [nvarchar](20) NULL,
	[orderStatus] [nvarchar](20) NOT NULL,
	[readyForDelivery] [nvarchar](20) NULL,
	[deliveryStatus] [nvarchar](20) NOT NULL,
	[paymentStatus] [nvarchar](20) NULL,
	[paymentReceiptNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductClass]    Script Date: 8/11/2013 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductClass](
	[productClassID] [nvarchar](50) NOT NULL,
	[productClass] [nvarchar](30) NOT NULL,
	[productClassName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_ProductClass] PRIMARY KEY CLUSTERED 
(
	[productClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/11/2013 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productSerialNo] [nvarchar](50) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[productClassID] [nvarchar](50) NOT NULL,
	[productSubClassID] [nvarchar](50) NOT NULL,
	[productImage] [text] NULL,
	[productUnitPrice] [decimal](18, 2) NOT NULL,
	[productDescription] [text] NULL,
	[productCriticalLevel] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductSubClass]    Script Date: 8/11/2013 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSubClass](
	[productSubClassID] [nvarchar](50) NOT NULL,
	[productSubClass] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_ProductSubClass] PRIMARY KEY CLUSTERED 
(
	[productSubClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 8/11/2013 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[recordID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[amount] [decimal](18, 2) NOT NULL,
	[dateCreated] [date] NOT NULL,
	[cartStatus] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[recordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/11/2013 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[userPW] [nvarchar](50) NOT NULL,
	[userType] [int] NOT NULL,
	[validation] [nvarchar](20) NOT NULL,
	[approval] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Users_1] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CustomersInfo] ON 

INSERT [dbo].[CustomersInfo] ([customerID], [userName], [businessLogo], [businessName], [businessAddress], [businessTelNo], [businessLocalNo], [businessCPNo], [businessFaxNo], [customerImage], [customerLN], [customerFN], [customerEmail]) VALUES (1, N'belen', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Business/noImage.jpg', N'Deluxe Plastic Center', N'Valenzuela City', N'1111111', NULL, NULL, N'1111111', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/ContactPerson/noImage.jpg', N'Angeles', N'Belen', N'belen.angeles@yahoo.com')
INSERT [dbo].[CustomersInfo] ([customerID], [userName], [businessLogo], [businessName], [businessAddress], [businessTelNo], [businessLocalNo], [businessCPNo], [businessFaxNo], [customerImage], [customerLN], [customerFN], [customerEmail]) VALUES (2, N'linda', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Business/noImage.jpg', N'Cellpack Packaging', N'Valenzuela City', N'2222222', NULL, NULL, N'2222222', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/ContactPerson/noImage.jpg', N'Tan', N'Linda', N'linda.tan@yahoo.com')
INSERT [dbo].[CustomersInfo] ([customerID], [userName], [businessLogo], [businessName], [businessAddress], [businessTelNo], [businessLocalNo], [businessCPNo], [businessFaxNo], [customerImage], [customerLN], [customerFN], [customerEmail]) VALUES (3, N'gema', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Business/noImage.jpg', N'Jolly Plastic', N'Valenzuela City', N'3333333', NULL, NULL, N'3333333', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/ContactPerson/noImage.jpg', N'Sy', N'Gema', N'gema.sy@yahoo.com')
INSERT [dbo].[CustomersInfo] ([customerID], [userName], [businessLogo], [businessName], [businessAddress], [businessTelNo], [businessLocalNo], [businessCPNo], [businessFaxNo], [customerImage], [customerLN], [customerFN], [customerEmail]) VALUES (4, N'jackie', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Business/noImage.jpg', N'Techuat International Trading Corporation', N'Valenzuela City', N'8888888', NULL, NULL, N'7777777', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/ContactPerson/noImage.jpg', N'Go', N'Jackie', N'jackie.go@yahoo.com')
INSERT [dbo].[CustomersInfo] ([customerID], [userName], [businessLogo], [businessName], [businessAddress], [businessTelNo], [businessLocalNo], [businessCPNo], [businessFaxNo], [customerImage], [customerLN], [customerFN], [customerEmail]) VALUES (5, N'rcaneja1', NULL, N'Caneja Republic', N'Pasay City', N'536-1925', NULL, NULL, NULL, NULL, N'Caneja', N'Renalyn', N'rcaneja@ymail.com')
SET IDENTITY_INSERT [dbo].[CustomersInfo] OFF
SET IDENTITY_INSERT [dbo].[Deliveries] ON 

INSERT [dbo].[Deliveries] ([deliveryID], [orderID], [detailID], [userID], [customerID], [productSerialNo], [productName], [productClass], [productUnitPrice], [quantity], [amount], [orderDate], [deliveryDate], [deliveryMode], [concerns]) VALUES (1, 1, 1, 2, 1, N'0023', N'Yellow 1A', N'PP', CAST(20.00 AS Decimal(18, 2)), 2500, CAST(50000.00 AS Decimal(18, 2)), CAST(0x57370B00 AS Date), CAST(0x70370B00 AS Date), N'Deliver', N'None')
INSERT [dbo].[Deliveries] ([deliveryID], [orderID], [detailID], [userID], [customerID], [productSerialNo], [productName], [productClass], [productUnitPrice], [quantity], [amount], [orderDate], [deliveryDate], [deliveryMode], [concerns]) VALUES (3, 2, 3, 3, 2, N'0008', N'White', N'LDPE', CAST(20.00 AS Decimal(18, 2)), 1250, CAST(25000.00 AS Decimal(18, 2)), CAST(0x62370B00 AS Date), CAST(0x66370B00 AS Date), N'Deliver', N'None')
SET IDENTITY_INSERT [dbo].[Deliveries] OFF
SET IDENTITY_INSERT [dbo].[EmployeesInfo] ON 

INSERT [dbo].[EmployeesInfo] ([employeeID], [userName], [employeeImage], [employeeLN], [employeeFN]) VALUES (1, N'nisa', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Employees/noImage.jpg', N'Caballero', N'Nisa')
INSERT [dbo].[EmployeesInfo] ([employeeID], [userName], [employeeImage], [employeeLN], [employeeFN]) VALUES (2, N'michelle', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Employees/picture000.jpg', N'Hou', N'Michelle')
INSERT [dbo].[EmployeesInfo] ([employeeID], [userName], [employeeImage], [employeeLN], [employeeFN]) VALUES (3, N'lolita', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Employees/noImage.jpg', N'Hou', N'Lolita')
INSERT [dbo].[EmployeesInfo] ([employeeID], [userName], [employeeImage], [employeeLN], [employeeFN]) VALUES (4, N'merideth', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Employees/noImage.jpg', N'Orang', N'Merideth')
INSERT [dbo].[EmployeesInfo] ([employeeID], [userName], [employeeImage], [employeeLN], [employeeFN]) VALUES (5, N'tino', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Employees/noImage.jpg', N'Hao', N'Celestino')
INSERT [dbo].[EmployeesInfo] ([employeeID], [userName], [employeeImage], [employeeLN], [employeeFN]) VALUES (6, N'admin', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Employees/noImage.jpg', N'Hao', N'Celestino')
SET IDENTITY_INSERT [dbo].[EmployeesInfo] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([feedbackID], [userID], [customerID], [feedbackCommSugg], [date], [status]) VALUES (1, 3, 2, N'Still needs improvement.', CAST(0x0000A20500000000 AS DateTime), N'Read')
INSERT [dbo].[Feedback] ([feedbackID], [userID], [customerID], [feedbackCommSugg], [date], [status]) VALUES (2, 4, 3, N'Keep improving the quality of your products', CAST(0x0000A20D00000000 AS DateTime), N'Unread')
INSERT [dbo].[Feedback] ([feedbackID], [userID], [customerID], [feedbackCommSugg], [date], [status]) VALUES (3, 2, 1, N'Please be standard on the colors', CAST(0x0000A20F00000000 AS DateTime), N'Read')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Inquiry] ON 

INSERT [dbo].[Inquiry] ([inquiryID], [inquiryFN], [inquiryLN], [inquiryEmail], [inquiryContactNo], [inquiryMessage], [date], [status]) VALUES (1, N'Marjorie', N'Tan', N'marj_tan@ymail.com', N'09177828280', N'Do you buy plastic pellets already made?', CAST(0x0000A20500000000 AS DateTime), N'Read')
INSERT [dbo].[Inquiry] ([inquiryID], [inquiryFN], [inquiryLN], [inquiryEmail], [inquiryContactNo], [inquiryMessage], [date], [status]) VALUES (2, N'Grace', N'Ceniza', N'grace.ceniza@yahoo.com', N'09188364664', N'How much are you going to buy HDPE plastics?', CAST(0x0000A20500000000 AS DateTime), N'Read')
INSERT [dbo].[Inquiry] ([inquiryID], [inquiryFN], [inquiryLN], [inquiryEmail], [inquiryContactNo], [inquiryMessage], [date], [status]) VALUES (5, N'Kelvin', N'John', N'kjohn@yahoo.com', N'09177828280', N'What colors of PP plastic pellets you offer?', CAST(0x0000A20F00226DD8 AS DateTime), N'Unread')
SET IDENTITY_INSERT [dbo].[Inquiry] OFF
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (1, N'0001', 1250, 1250, 2500, 20130606, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (2, N'0002', 1250, 1250, 2500, 20130607, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (3, N'0003', 1250, 1250, 2500, 20130608, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (4, N'0004', 0, 0, 0, NULL, N'Soldout')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (5, N'0005', 0, 0, 0, NULL, N'Soldout')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (6, N'0006', 0, 0, 0, NULL, N'Soldout')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (7, N'0007', 1250, 1250, 2500, 20130610, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (8, N'0008', 1250, 1250, 2500, 20130614, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (9, N'0009', 1250, 1250, 2500, 20130615, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (10, N'0010', 1250, 1250, 2500, 20130614, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (11, N'0011', 1250, 1250, 2500, 20130616, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (12, N'0012', 1250, 1250, 2500, 20130617, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (13, N'0013', 1250, 1250, 2500, 20130618, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (14, N'0014', 1250, 1250, 2500, 20130618, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (15, N'0015', 1250, 1250, 2500, 20130618, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (16, N'0016', 1250, 1250, 2500, 20130619, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (17, N'0017', 1250, 1250, 2500, 20130621, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (18, N'0018', 1250, 1250, 2500, 20130621, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (19, N'0019', 1250, 1250, 2500, 20130625, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (20, N'0020', 1250, 1250, 2500, 20130625, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (21, N'0021', 1250, 1250, 2500, 20130625, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (22, N'0022', 1250, 1250, 2500, 20130626, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (23, N'0023', 1250, 1250, 2500, 20130627, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (24, N'0024', 1250, 1250, 2500, 20130628, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (25, N'0025', 1250, 1250, 2500, 20130628, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (26, N'0026', 1250, 1250, 2500, 20130629, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (27, N'0027', 1250, 1250, 2500, 20130629, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (28, N'0028', 1250, 1250, 2500, 20130630, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (29, N'0029', 1250, 1250, 2500, 20130630, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (30, N'0030', 1250, 1250, 2500, 20130630, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (31, N'0031', 1250, 1250, 2500, 20130701, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (32, N'0032', 1250, 1250, 2500, 20130702, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (33, N'0033', 1250, 1250, 2500, 20130702, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (34, N'0034', 1250, 1250, 2500, 20130702, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (35, N'0035', 1250, 1250, 2500, 20130702, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (36, N'0036', 1250, 1250, 2500, 20130703, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (37, N'0037', 1250, 1250, 2500, 20130703, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (38, N'0038', 1250, 1250, 2500, 20130703, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (39, N'0039', 1250, 1250, 2500, 20130704, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (40, N'0040', 1250, 1250, 2500, 20130705, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (41, N'0041', 1250, 1250, 2500, 20130705, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (42, N'0042', 1250, 1250, 2500, 20130705, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (43, N'0043', 0, 0, 0, NULL, N'Inactive')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (44, N'0044', 0, 0, 0, NULL, N'Inactive')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (45, N'0045', 1250, 1250, 2500, 20130706, N'Active')
INSERT [dbo].[Inventory] ([inventoryID], [productSerialNo], [existingStock], [producedStock], [warehouseStock], [batchNo], [productStatus]) VALUES (46, N'0001', 11250, 10000, 11250, 123456, N'Active')
SET IDENTITY_INSERT [dbo].[Inventory] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([detailID], [productID], [orderID], [productSerialNo], [productName], [productClass], [productUnitPrice], [quantity], [amount]) VALUES (1, 23, 1, N'0023', N'Yellow 1A', N'PP', CAST(20.00 AS Decimal(18, 2)), 2500, CAST(50000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([detailID], [productID], [orderID], [productSerialNo], [productName], [productClass], [productUnitPrice], [quantity], [amount]) VALUES (3, 8, 2, N'0008', N'White', N'LDPE', CAST(20.00 AS Decimal(18, 2)), 1250, CAST(25000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([detailID], [productID], [orderID], [productSerialNo], [productName], [productClass], [productUnitPrice], [quantity], [amount]) VALUES (4, 12, 3, N'0012', N'Trans 1A', N'hd-02', CAST(25.00 AS Decimal(18, 2)), 1000, CAST(25000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([orderID], [userID], [customerID], [orderDate], [deliveryDate], [preferredDelivery], [deliveryMode], [concerns], [amount], [validation], [orderStatus], [readyForDelivery], [deliveryStatus], [paymentStatus], [paymentReceiptNo]) VALUES (1, 2, 1, CAST(0x61370B00 AS Date), CAST(0x65370B00 AS Date), CAST(0x66370B00 AS Date), N'Deliver', N'None', CAST(50000.00 AS Decimal(18, 2)), N'Validated', N'Approved', N'Yes', N'Delivered', N'Unpaid', NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [customerID], [orderDate], [deliveryDate], [preferredDelivery], [deliveryMode], [concerns], [amount], [validation], [orderStatus], [readyForDelivery], [deliveryStatus], [paymentStatus], [paymentReceiptNo]) VALUES (2, 3, 2, CAST(0x62370B00 AS Date), CAST(0x66370B00 AS Date), CAST(0x65370B00 AS Date), N'Deliver', N'None', CAST(25000.00 AS Decimal(18, 2)), N'Validated', N'Pending', N'No', N'Pending', N'Unpaid', NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [customerID], [orderDate], [deliveryDate], [preferredDelivery], [deliveryMode], [concerns], [amount], [validation], [orderStatus], [readyForDelivery], [deliveryStatus], [paymentStatus], [paymentReceiptNo]) VALUES (3, 11, 5, CAST(0x6E370B00 AS Date), CAST(0x86370B00 AS Date), CAST(0x85370B00 AS Date), N'Delivery', N'Ayusin nyo buhay nyo!', CAST(25000.00 AS Decimal(18, 2)), N'Validated', N'Approved', N'Yes', N'Pending', N'Unpaid', NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[ProductClass] ([productClassID], [productClass], [productClassName]) VALUES (N'hd-02', N'HDPE', N'High Density Polyethylene')
INSERT [dbo].[ProductClass] ([productClassID], [productClass], [productClassName]) VALUES (N'pe-01', N'LDPE', N'Low Density Polyethylene')
INSERT [dbo].[ProductClass] ([productClassID], [productClass], [productClassName]) VALUES (N'pp-03', N'PP', N'Polypropylene')
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (1, N'0001', N'Trans 3A', N'pe-01', N'T3A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PEtrans3A.jpg', CAST(38.00 AS Decimal(18, 2)), N'Transparent', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (2, N'0002', N'Trans 2A', N'pe-01', N'T2A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PEtrans2A.jpg', CAST(35.00 AS Decimal(18, 2)), N'Transparent', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (3, N'0003', N'Trans 1A', N'pe-01', N'T1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PEtrans1A.jpg', CAST(29.00 AS Decimal(18, 2)), N'Transparent', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (4, N'0004', N'Red', N'pe-01', N'R1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PEred.jpg', CAST(25.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (5, N'0005', N'Blue', N'pe-01', N'B1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PEblue.jpg', CAST(25.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (6, N'0006', N'Green', N'pe-01', N'G1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PEgreen.jpg', CAST(25.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (7, N'0007', N'Yellow', N'pe-01', N'Y1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PEyellow.jpg', CAST(25.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (8, N'0008', N'White', N'pe-01', N'W1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PEwhite.jpg', CAST(20.00 AS Decimal(18, 2)), N'Opaque white', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (9, N'0009', N'Black', N'pe-01', N'BLK1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PEblack.jpg', CAST(20.00 AS Decimal(18, 2)), N'Black', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (10, N'0010', N'Trans 3A', N'hd-02', N'T3A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/HDtrans3A.jpg', CAST(35.00 AS Decimal(18, 2)), N'Transparent', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (11, N'0011', N'Trans 2A', N'hd-02', N'T2A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/HDtrans2A.jpg', CAST(30.00 AS Decimal(18, 2)), N'Transparent', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (12, N'0012', N'Trans 1A', N'hd-02', N'T1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/HDtrans1A.jpg', CAST(25.00 AS Decimal(18, 2)), N'Transparent', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (13, N'0013', N'White 3A', N'hd-02', N'W3A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/HDwhite3A.jpg', CAST(30.00 AS Decimal(18, 2)), N'Opaque white', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (14, N'0014', N'White 2A', N'hd-02', N'W2A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/HDwhite2A.jpg', CAST(25.00 AS Decimal(18, 2)), N'Opaque white', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (15, N'0015', N'White 1A', N'hd-02', N'W1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/HDwhite1A.jpg', CAST(22.00 AS Decimal(18, 2)), N'Opaque white', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (16, N'0016', N'Red 2A', N'hd-02', N'R2A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/HDred2A.jpg', CAST(25.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (17, N'0017', N'Red 1A', N'hd-02', N'R1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/HDred1A.jpg', CAST(20.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (18, N'0018', N'Blue 2A', N'hd-02', N'B2A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/HDblue2A.jpg', CAST(25.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (19, N'0019', N'Blue 1A', N'hd-02', N'B1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/HDblue1A.jpg', CAST(20.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (20, N'0020', N'Green 2A', N'hd-02', N'G2A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/HDgreen2A.jpg', CAST(25.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (21, N'0021', N'Green 1A', N'hd-02', N'G1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/HDgreen1A.jpg', CAST(20.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (22, N'0022', N'Yellow 2A', N'hd-02', N'Y2A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/HDyellow2A.jpg', CAST(25.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (23, N'0023', N'Yellow 1A', N'hd-02', N'Y1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/HDyellow1A.jpg', CAST(20.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (24, N'0024', N'Black', N'hd-02', N'BLK1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/HDblack.jpg', CAST(20.00 AS Decimal(18, 2)), N'Black', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (25, N'0025', N'Trans 3A', N'pp-03', N'T3A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPtrans3A.jpg', CAST(30.00 AS Decimal(18, 2)), N'Transparent', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (26, N'0026', N'Trans 2A', N'pp-03', N'T2A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPtrans2A.jpg', CAST(25.00 AS Decimal(18, 2)), N'Transparent', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (27, N'0027', N'Trans 1A', N'pp-03', N'T1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPtrans1A.jpg', CAST(20.00 AS Decimal(18, 2)), N'Transparent', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (28, N'0028', N'White 3A', N'pp-03', N'W3A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPwhite3A.jpg', CAST(30.00 AS Decimal(18, 2)), N'Opaque white', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (29, N'0029', N'White 2A', N'pp-03', N'W2A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPwhite2A.jpg', CAST(25.00 AS Decimal(18, 2)), N'Opaque white', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (30, N'0030', N'White 1A', N'pp-03', N'W1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPwhite1A.jpg', CAST(20.00 AS Decimal(18, 2)), N'Opaque white', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (31, N'0031', N'Red 3A', N'pp-03', N'R3A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPred3A.jpg', CAST(30.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (32, N'0032', N'Red 2A', N'pp-03', N'R2A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPred2A.jpg', CAST(25.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (33, N'0033', N'Red 1A', N'pp-03', N'R1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPred1A.jpg', CAST(23.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (34, N'0034', N'Blue 3A', N'pp-03', N'B3A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPblue3A.jpg', CAST(30.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (35, N'0035', N'Blue 2A', N'pp-03', N'B2A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPblue2A.jpg', CAST(25.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (36, N'0036', N'Blue 1A', N'pp-03', N'B1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPblue1A.jpg', CAST(23.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (37, N'0037', N'Green 3A', N'pp-03', N'G3A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPgreen3A.jpg', CAST(30.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (38, N'0038', N'Green 2A', N'pp-03', N'G2A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPgreen2A.jpg', CAST(25.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (39, N'0039', N'Green 1A', N'pp-03', N'G1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPgreen1A.jpg', CAST(23.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (40, N'0040', N'Yellow 3A', N'pp-03', N'Y3A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPyellow3A.jpg', CAST(30.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (41, N'0041', N'Yellow 2A', N'pp-03', N'Y2A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPyellow2A.jpg', CAST(25.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (42, N'0042', N'Yellow 1A', N'pp-03', N'Y1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPyellow1A.jpg', CAST(23.00 AS Decimal(18, 2)), N'Assorted color', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (43, N'0043', N'Silver', N'pp-03', N'S1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPsilver.jpg', CAST(20.00 AS Decimal(18, 2)), N'Metallic silver', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (44, N'0044', N'Black 2A', N'pp-03', N'BLK2A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPblackA.jpg', CAST(25.00 AS Decimal(18, 2)), N'Black', 500)
INSERT [dbo].[Products] ([productID], [productSerialNo], [productName], [productClassID], [productSubClassID], [productImage], [productUnitPrice], [productDescription], [productCriticalLevel]) VALUES (45, N'0045', N'Black 1A', N'pp-03', N'BLK1A', N'http://localhost:12345/FINAL%20CAPSTONE/assets/img/Products/PPblack1A.jpg', CAST(20.00 AS Decimal(18, 2)), N'Black', 500)
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'B1A', N'Blue 1A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'B2A', N'Blue 2A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'B3A', N'Blue 3A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'BLK1A', N'Black 1A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'BLK2A', N'Black 2A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'G1A', N'Green 1A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'G2A', N'Green 2A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'G3A', N'Green 3A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'R1A', N'Red 1A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'R2A', N'Red 2A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'R3A', N'Red 3A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'S1A', N'Silver 1A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'T1A', N'Trans 1A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'T2A', N'Trans 2A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'T3A', N'Trans 3A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'W1A', N'White 1A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'W2A', N'White 2A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'W3A', N'White 3A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'Y1A', N'Yellow 1A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'Y2A', N'Yellow 2A')
INSERT [dbo].[ProductSubClass] ([productSubClassID], [productSubClass]) VALUES (N'Y3A', N'Yellow 3A')
SET IDENTITY_INSERT [dbo].[ShoppingCart] ON 

INSERT [dbo].[ShoppingCart] ([recordID], [userID], [productID], [quantity], [amount], [dateCreated], [cartStatus]) VALUES (1, 2, 12, 12, CAST(300.00 AS Decimal(18, 2)), CAST(0x51370B00 AS Date), N'Pending')
INSERT [dbo].[ShoppingCart] ([recordID], [userID], [productID], [quantity], [amount], [dateCreated], [cartStatus]) VALUES (2, 3, 12, 12, CAST(300.00 AS Decimal(18, 2)), CAST(0x51370B00 AS Date), N'Pending')
INSERT [dbo].[ShoppingCart] ([recordID], [userID], [productID], [quantity], [amount], [dateCreated], [cartStatus]) VALUES (3, 4, 7, 510, CAST(12750.00 AS Decimal(18, 2)), CAST(0x66370B00 AS Date), N'Pending')
INSERT [dbo].[ShoppingCart] ([recordID], [userID], [productID], [quantity], [amount], [dateCreated], [cartStatus]) VALUES (5, 11, 12, 1000, CAST(25000.00 AS Decimal(18, 2)), CAST(0x6E370B00 AS Date), N'Checkout')
SET IDENTITY_INSERT [dbo].[ShoppingCart] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userID], [userName], [userPW], [userType], [validation], [approval]) VALUES (1, N'nisa', N'J8VIVUAek0k=', 2, N'Validated', N'Approved')
INSERT [dbo].[Users] ([userID], [userName], [userPW], [userType], [validation], [approval]) VALUES (2, N'belen', N'J8VIVUAek0k=', 1, N'Validated', N'Approved')
INSERT [dbo].[Users] ([userID], [userName], [userPW], [userType], [validation], [approval]) VALUES (3, N'linda', N'J8VIVUAek0k=', 1, N'Validated', N'Approved')
INSERT [dbo].[Users] ([userID], [userName], [userPW], [userType], [validation], [approval]) VALUES (4, N'gema', N'J8VIVUAek0k=', 1, N'Validated', N'Approved')
INSERT [dbo].[Users] ([userID], [userName], [userPW], [userType], [validation], [approval]) VALUES (5, N'michelle', N'J8VIVUAek0k=', 2, N'Validated', N'Approved')
INSERT [dbo].[Users] ([userID], [userName], [userPW], [userType], [validation], [approval]) VALUES (6, N'lolita', N'J8VIVUAek0k=', 4, N'Validated', N'Approved')
INSERT [dbo].[Users] ([userID], [userName], [userPW], [userType], [validation], [approval]) VALUES (7, N'merideth', N'J8VIVUAek0k=', 3, N'Validated', N'Approved')
INSERT [dbo].[Users] ([userID], [userName], [userPW], [userType], [validation], [approval]) VALUES (8, N'tino', N'J8VIVUAek0k=', 4, N'Validated', N'Approved')
INSERT [dbo].[Users] ([userID], [userName], [userPW], [userType], [validation], [approval]) VALUES (9, N'admin', N'J8VIVUAek0k=', 5, N'Validated', N'Approved')
INSERT [dbo].[Users] ([userID], [userName], [userPW], [userType], [validation], [approval]) VALUES (10, N'jackie', N'J8VIVUAek0k=', 1, N'Validated', N'Approved')
INSERT [dbo].[Users] ([userID], [userName], [userPW], [userType], [validation], [approval]) VALUES (11, N'rcaneja1', N'J8VIVUAek0k=', 1, N'Validated', N'Approved')
SET IDENTITY_INSERT [dbo].[Users] OFF
