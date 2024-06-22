
-- Tworzenie tabeli Category
CREATE TABLE Category (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255),
    IsActive BIT
);

-- Tworzenie tabeli Items
CREATE TABLE Items (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255),
    Description NVARCHAR(MAX),
    CategoryID INT,
    Price DECIMAL(10, 2),
    ImageURL NVARCHAR(MAX),
    IsActive BIT,
    FOREIGN KEY (CategoryID) REFERENCES Category(ID)
);

-- Tworzenie tabeli Stock
CREATE TABLE Stock (
    ID INT PRIMARY KEY IDENTITY(1,1),
    ItemsID INT,
    Quantity INT,
    FOREIGN KEY (ItemsID) REFERENCES Items(ID)
);

-- Tworzenie tabeli OrderStatus
CREATE TABLE OrderStatus (
    ID INT PRIMARY KEY IDENTITY(1,1),
    StatusName NVARCHAR(255),
    IsActive BIT
);

-- Tworzenie tabeli PaymentMethod
CREATE TABLE PaymentMethod (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255),
    IsActive BIT
);

-- Tworzenie tabeli Order
CREATE TABLE Orders (
    ID INT PRIMARY KEY IDENTITY(1,1),
    UserId NVARCHAR(255),
    CreateDate DATETIME,
    OrderStatusID INT,
    IsActive BIT,
    Name NVARCHAR(255),
    Email NVARCHAR(255),
    MobileNumber NVARCHAR(255),
    Address NVARCHAR(MAX),
    PaymentMethodID INT,
    IsPaid BIT,
    FOREIGN KEY (OrderStatusID) REFERENCES OrderStatus(ID),
    FOREIGN KEY (PaymentMethodID) REFERENCES PaymentMethod(ID)
);

-- Tworzenie tabeli Shoppingcard
CREATE TABLE Shoppingcard (
    ID INT PRIMARY KEY IDENTITY(1,1),
    UserId NVARCHAR(255),
    IsActive BIT
);

-- Tworzenie tabeli CartDetail
CREATE TABLE CartDetail (
    ID INT PRIMARY KEY IDENTITY(1,1),
    ShoppingCardID INT,
    ItemsID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (ShoppingCardID) REFERENCES Shoppingcard(ID),
    FOREIGN KEY (ItemsID) REFERENCES Items(ID)
);
