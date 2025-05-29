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
('Michael', 'Johnson', '0734567890', 'michael.johnson@example.com', '931234567V', '1988-03-03', '789 Hill St, Galle', NULL),
('Emily', 'Davis', '0745678901', 'emily.davis@example.com', '941234567V', '1991-04-04', '321 Lake Rd, Jaffna', NULL),
('David', 'Brown', '0756789012', 'david.brown@example.com', '951234567V', '1989-05-05', '654 Park Ave, Matara', NULL),
('Sarah', 'Wilson', '0767890123', 'sarah.wilson@example.com', '961234567V', '1993-06-06', '987 River Rd, Negombo', NULL),
('Chris', 'Taylor', '0778901234', 'chris.taylor@example.com', '971234567V', '1994-07-07', '123 Garden St, Anuradhapura', NULL),
('Jessica', 'Anderson', '0789012345', 'jessica.anderson@example.com', '981234567V', '1990-08-08', '456 Ocean Rd, Trincomalee', NULL),
('Matthew', 'Thomas', '0711122233', 'matthew.thomas@example.com', '991234567V', '1987-09-09', '789 Sunset Blvd, Ratnapura', NULL),
('Ashley', 'Jackson', '0722233344', 'ashley.jackson@example.com', '001234567V', '1992-10-10', '321 Sunrise Rd, Badulla', NULL),
('Daniel', 'White', '0733344455', 'daniel.white@example.com', '011234567V', '1991-11-11', '654 Maple St, Polonnaruwa', NULL),
('Megan', 'Harris', '0744455566', 'megan.harris@example.com', '021234567V', '1993-12-12', '987 Birch Rd, Kurunegala', NULL),
('Andrew', 'Martin', '0755566677', 'andrew.martin@example.com', '031234567V', '1986-01-13', '123 Pine St, Hambantota', NULL),
('Laura', 'Thompson', '0766677788', 'laura.thompson@example.com', '041234567V', '1990-02-14', '456 Cedar Rd, Matale', NULL),
('James', 'Garcia', '0777788899', 'james.garcia@example.com', '051234567V', '1988-03-15', '789 Elm St, Vavuniya', NULL),
('Olivia', 'Martinez', '0788899900', 'olivia.martinez@example.com', '061234567V', '1991-04-16', '321 Spruce Rd, Jaffna', NULL),
('Joseph', 'Robinson', '0719988776', 'joseph.robinson@example.com', '071234567V', '1989-05-17', '654 Willow St, Galle', NULL),
('Sophia', 'Clark', '0728877665', 'sophia.clark@example.com', '081234567V', '1992-06-18', '987 Aspen Rd, Colombo', NULL);