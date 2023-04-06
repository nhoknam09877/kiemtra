-- create the database
CREATE DATABASE EmployeeDB;
GO
-- use the database
USE EmployeeDB;
GO
-- create the department table
CREATE TABLE Department (
    DepartId INT PRIMARY KEY,
    DepartName VARCHAR(50) NOT NULL,
    Description VARCHAR(100) NOT NULL
);
GO
-- create the employee table
CREATE TABLE Employee (
    EmpCode CHAR(6) PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Birthday SMALLDATETIME NOT NULL,
    Gender BIT DEFAULT 1,
    Address VARCHAR(100),
    DepartID INT,
    Salary MONEY,
    CONSTRAINT fk_Department FOREIGN KEY (DepartID) REFERENCES Department(DepartId)
);
GO
-- cau 1
-- insert into department table
INSERT INTO Department (DepartId, DepartName, Description)
VALUES 
    (101, 'Sales', 'Ban san pham va dich vu'),
    (102, 'Marketing', 'Quang ba cac san pham'),
    (103, 'Engineering', 'Thiet ke va xay dung san pham');
GO

-- insert into employee table
INSERT INTO Employee (EmpCode, FirstName, LastName, Birthday, Gender, Address, DepartID, Salary)
VALUES
    ('E10101', 'Nam', 'Anh', '2000-09-01', 1, 'Ha Noi', 101, 50000),
    ('E10102', 'Thanh', 'Phung', '1959-05-12', 0, 'Bac Ninh', 101, 55000),
    ('E10201', 'Thanh', 'Tam', '1985-07-23', 1, 'Ninh Binh', 102, 60000),
    ('E10202', 'Lung', 'Linh', '1998-10-15', 0, 'Hai Phong', 102, 65000),
    ('E10301', 'Quang', 'Thăng', '1979-03-07', 1, 'Da Nang', 103, 70000),
    ('E10302', 'Nguyen', 'Cong', '2003-1-28', 0, 'TP HCM', 103, 75000);
GO
--cau 2
UPDATE Employee
SET Salary = Salary * 1.1;
--cau3
ALTER TABLE Employee
ADD CONSTRAINT CK_Salary CHECK (Salary > 0);
