
CREATE DATABASE IF NOT EXISTS CrimeManagement;
USE CrimeManagement;

DROP TABLE IF EXISTS Crime_Criminal, FIR, Crime, Criminal, Victim, Officer, PoliceStation;

CREATE TABLE PoliceStation (
    StationID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE Officer (
    OfficerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Rank VARCHAR(50),
    StationID INT,
    FOREIGN KEY (StationID) REFERENCES PoliceStation(StationID)
);

CREATE TABLE Victim (
    VictimID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Age INT,
    Address VARCHAR(150)
);

CREATE TABLE Criminal (
    CriminalID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Address VARCHAR(150),
    CrimeType VARCHAR(100),
    Status VARCHAR(50)
);

CREATE TABLE Crime (
    CrimeID INT PRIMARY KEY AUTO_INCREMENT,
    Date DATE,
    Location VARCHAR(100),
    CrimeType VARCHAR(100),
    Description TEXT
);

CREATE TABLE FIR (
    FIRID INT PRIMARY KEY AUTO_INCREMENT,
    CrimeID INT,
    OfficerID INT,
    VictimID INT,
    DateFiled DATE,
    FOREIGN KEY (CrimeID) REFERENCES Crime(CrimeID),
    FOREIGN KEY (OfficerID) REFERENCES Officer(OfficerID),
    FOREIGN KEY (VictimID) REFERENCES Victim(VictimID)
);

CREATE TABLE Crime_Criminal (
    CrimeID INT,
    CriminalID INT,
    FOREIGN KEY (CrimeID) REFERENCES Crime(CrimeID),
    FOREIGN KEY (CriminalID) REFERENCES Criminal(CriminalID),
    PRIMARY KEY (CrimeID, CriminalID)
);

-- Police Stations
INSERT INTO PoliceStation (Name, Location) VALUES ('Connaught Place PS', 'New Delhi');
INSERT INTO PoliceStation (Name, Location) VALUES ('MG Road PS', 'Bangalore');
INSERT INTO PoliceStation (Name, Location) VALUES ('T Nagar PS', 'Chennai');
INSERT INTO PoliceStation (Name, Location) VALUES ('Park Street PS', 'Kolkata');
INSERT INTO PoliceStation (Name, Location) VALUES ('Charminar PS', 'Hyderabad');

-- Officers
INSERT INTO Officer (Name, Rank, StationID) VALUES ('Rajesh Kumar', 'Inspector', 1);
INSERT INTO Officer (Name, Rank, StationID) VALUES ('Anita Sharma', 'Sub-Inspector', 2);
INSERT INTO Officer (Name, Rank, StationID) VALUES ('Vikram Reddy', 'Constable', 3);
INSERT INTO Officer (Name, Rank, StationID) VALUES ('Manpreet Singh', 'Inspector', 4);
INSERT INTO Officer (Name, Rank, StationID) VALUES ('Nandita Joshi', 'Sub-Inspector', 5);

-- Victims
INSERT INTO Victim (Name, Age, Address) VALUES ('Sunita Joshi', 34, 'Delhi');
INSERT INTO Victim (Name, Age, Address) VALUES ('Manoj Patel', 45, 'Ahmedabad');
INSERT INTO Victim (Name, Age, Address) VALUES ('Priya Menon', 29, 'Kochi');
INSERT INTO Victim (Name, Age, Address) VALUES ('Arun Bhatia', 39, 'Pune');
INSERT INTO Victim (Name, Age, Address) VALUES ('Neha Kapoor', 31, 'Noida');
INSERT INTO Victim (Name, Age, Address) VALUES ('Ramesh Yadav', 50, 'Varanasi');
INSERT INTO Victim (Name, Age, Address) VALUES ('Deepika Rao', 28, 'Bangalore');
INSERT INTO Victim (Name, Age, Address) VALUES ('Amit Deshmukh', 42, 'Nagpur');
INSERT INTO Victim (Name, Age, Address) VALUES ('Kiran Thakur', 37, 'Indore');
INSERT INTO Victim (Name, Age, Address) VALUES ('Sonal Chauhan', 26, 'Jaipur');

-- Criminals
INSERT INTO Criminal (Name, Age, Gender, Address, CrimeType, Status) VALUES ('Ravi Verma', 38, 'Male', 'Kanpur', 'Robbery', 'In Custody');
INSERT INTO Criminal (Name, Age, Gender, Address, CrimeType, Status) VALUES ('Ayesha Khan', 27, 'Female', 'Lucknow', 'Fraud', 'At Large');
INSERT INTO Criminal (Name, Age, Gender, Address, CrimeType, Status) VALUES ('Sundar Rajan', 41, 'Male', 'Chennai', 'Assault', 'In Custody');
INSERT INTO Criminal (Name, Age, Gender, Address, CrimeType, Status) VALUES ('Vikas Dubey', 35, 'Male', 'Bhopal', 'Murder', 'At Large');
INSERT INTO Criminal (Name, Age, Gender, Address, CrimeType, Status) VALUES ('Salma Sheikh', 30, 'Female', 'Mumbai', 'Cyber Crime', 'In Custody');
INSERT INTO Criminal (Name, Age, Gender, Address, CrimeType, Status) VALUES ('Rahul Mehra', 33, 'Male', 'Delhi', 'Kidnapping', 'In Custody');
INSERT INTO Criminal (Name, Age, Gender, Address, CrimeType, Status) VALUES ('Farhan Ali', 29, 'Male', 'Hyderabad', 'Extortion', 'At Large');
INSERT INTO Criminal (Name, Age, Gender, Address, CrimeType, Status) VALUES ("Nisha D'Souza", 25, 'Female', 'Goa', 'Drug Trafficking', 'In Custody');
INSERT INTO Criminal (Name, Age, Gender, Address, CrimeType, Status) VALUES ('Ajay Rathore', 40, 'Male', 'Jaipur', 'Arson', 'In Custody');
INSERT INTO Criminal (Name, Age, Gender, Address, CrimeType, Status) VALUES ('Kavita Iyer', 32, 'Female', 'Chennai', 'Bribery', 'At Large');

-- Crimes
INSERT INTO Crime (Date, Location, CrimeType, Description) VALUES ('2024-12-01', 'Delhi', 'Robbery', 'Bank robbery at SBI branch');
INSERT INTO Crime (Date, Location, CrimeType, Description) VALUES ('2025-01-15', 'Lucknow', 'Fraud', 'Online scam involving UPI');
INSERT INTO Crime (Date, Location, CrimeType, Description) VALUES ('2025-03-10', 'Chennai', 'Assault', 'Physical assault at a market');
INSERT INTO Crime (Date, Location, CrimeType, Description) VALUES ('2025-02-20', 'Bhopal', 'Murder', 'Suspected murder case in a hotel');
INSERT INTO Crime (Date, Location, CrimeType, Description) VALUES ('2025-04-05', 'Mumbai', 'Cyber Crime', 'Phishing and identity theft');
INSERT INTO Crime (Date, Location, CrimeType, Description) VALUES ('2025-04-12', 'Delhi', 'Kidnapping', 'Minor abducted from school');
INSERT INTO Crime (Date, Location, CrimeType, Description) VALUES ('2025-04-18', 'Hyderabad', 'Extortion', 'Demanding money from shopkeepers');
INSERT INTO Crime (Date, Location, CrimeType, Description) VALUES ('2025-05-01', 'Goa', 'Drug Trafficking', 'Seizure of illegal substances');
INSERT INTO Crime (Date, Location, CrimeType, Description) VALUES ('2025-05-10', 'Jaipur', 'Arson', 'Fire set intentionally in a warehouse');
INSERT INTO Crime (Date, Location, CrimeType, Description) VALUES ('2025-05-15', 'Chennai', 'Bribery', 'Government official caught taking bribe');

-- FIRs
INSERT INTO FIR (CrimeID, OfficerID, VictimID, DateFiled) VALUES (1, 1, 1, '2024-12-02');
INSERT INTO FIR (CrimeID, OfficerID, VictimID, DateFiled) VALUES (2, 2, 2, '2025-01-16');
INSERT INTO FIR (CrimeID, OfficerID, VictimID, DateFiled) VALUES (3, 3, 3, '2025-03-11');
INSERT INTO FIR (CrimeID, OfficerID, VictimID, DateFiled) VALUES (4, 4, 4, '2025-02-21');
INSERT INTO FIR (CrimeID, OfficerID, VictimID, DateFiled) VALUES (5, 5, 5, '2025-04-06');
INSERT INTO FIR (CrimeID, OfficerID, VictimID, DateFiled) VALUES (6, 1, 6, '2025-04-13');
INSERT INTO FIR (CrimeID, OfficerID, VictimID, DateFiled) VALUES (7, 2, 7, '2025-04-19');
INSERT INTO FIR (CrimeID, OfficerID, VictimID, DateFiled) VALUES (8, 3, 8, '2025-05-02');
INSERT INTO FIR (CrimeID, OfficerID, VictimID, DateFiled) VALUES (9, 4, 9, '2025-05-11');
INSERT INTO FIR (CrimeID, OfficerID, VictimID, DateFiled) VALUES (10, 5, 10, '2025-05-16');

-- Crime-Criminal Links
INSERT INTO Crime_Criminal (CrimeID, CriminalID) VALUES (1, 1);
INSERT INTO Crime_Criminal (CrimeID, CriminalID) VALUES (2, 2);
INSERT INTO Crime_Criminal (CrimeID, CriminalID) VALUES (3, 3);
INSERT INTO Crime_Criminal (CrimeID, CriminalID) VALUES (4, 4);
INSERT INTO Crime_Criminal (CrimeID, CriminalID) VALUES (5, 5);
INSERT INTO Crime_Criminal (CrimeID, CriminalID) VALUES (6, 6);
INSERT INTO Crime_Criminal (CrimeID, CriminalID) VALUES (7, 7);
INSERT INTO Crime_Criminal (CrimeID, CriminalID) VALUES (8, 8);
INSERT INTO Crime_Criminal (CrimeID, CriminalID) VALUES (9, 9);
INSERT INTO Crime_Criminal (CrimeID, CriminalID) VALUES (10, 10);
