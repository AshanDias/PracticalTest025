CREATE DATABASE StudentManagementSystem;

USE StudentManagementSystem;

CREATE TABLE Students (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Mobile NVARCHAR(15) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    NIC NVARCHAR(20) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Address NVARCHAR(255) NOT NULL,
    ProfileImage NVARCHAR(MAX) NULL
);


INSERT INTO Students (FirstName, LastName, Mobile, Email, NIC, DateOfBirth, Address, ProfileImage)
VALUES 
('John', 'Doe', '0712345678', 'john.doe@example.com', '901234567V', '1990-01-01', '123 Main St, Colombo', NULL),
('Jane', 'Smith', '0723456789', 'jane.smith@example.com', '921234567V', '1992-02-02', '456 Side Rd, Kandy', NULL);
