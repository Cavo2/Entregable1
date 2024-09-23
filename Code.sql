DROP DATABASE IF EXISTS first_task;
CREATE DATABASE first_task;
use first_task;

-- Crear la tabla Players
CREATE TABLE Players (
    ID_player INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    registration_Date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla Virtual_Items
CREATE TABLE Virtual_Items (
    ID_item INT PRIMARY KEY AUTO_INCREMENT,
    ID_player INT,
    item_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    category TEXT
);

-- Crear la tabla Achievements
CREATE TABLE Achievements (
    ID_achievement INT PRIMARY KEY AUTO_INCREMENT,
    achievement_name VARCHAR(100) NOT NULL,
    description TEXT,
    rewards TEXT,
    difficulty_level INT
);

-- Crear la tabla Financial_Transactions
CREATE TABLE Financial_Transactions (
    ID_transaction INT PRIMARY KEY AUTO_INCREMENT,
    ID_player INT,
    transaction_type ENUM('Deposit', 'Purchase') NOT NULL,
    date_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2),
    currency VARCHAR(10),
    payment_method VARCHAR(50),
    transaction_status ENUM('Pending', 'Completed', 'Failed') NOT NULL
);

-- Crear la tabla Achiev_Player
CREATE TABLE Achiev_Player (
    ID_achievement INT,
    ID_player INT,
    date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ID_achievement, ID_player, date)
);

-- Crear la tabla Support_and_Customer_Service
CREATE TABLE Support_and_Customer_Service (
    ID_ticket INT PRIMARY KEY AUTO_INCREMENT,
    ID_player INT,
    creation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    problem_category VARCHAR(50),
    problem_description TEXT,
    priority ENUM('Low', 'Medium', 'High') NOT NULL,
    ticket_status ENUM('Open', 'In Progress', 'Resolved', 'Closed') NOT NULL,
    support_agent_ID INT,
    last_updated_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



-- Agregar la clave foránea en Virtual_Items que referencia a Players
ALTER TABLE Virtual_Items
ADD CONSTRAINT FK_VirtualItems_Players
FOREIGN KEY (ID_player) REFERENCES Players(ID_player);

-- Agregar la clave foránea en Financial_Transactions que referencia a Players
ALTER TABLE Financial_Transactions
ADD CONSTRAINT FK_FinancialTransactions_Players
FOREIGN KEY (ID_player) REFERENCES Players(ID_player);

-- Agregar claves foráneas en Achiev_Player que referencian a Achievements y Players
ALTER TABLE Achiev_Player
ADD CONSTRAINT FK_AchievPlayer_Achievements
FOREIGN KEY (ID_achievement) REFERENCES Achievements(ID_achievement);

ALTER TABLE Achiev_Player
ADD CONSTRAINT FK_AchievPlayer_Players
FOREIGN KEY (ID_player) REFERENCES Players(ID_player);

-- Agregar la clave foránea en Support_and_Customer_Service que referencia a Players
ALTER TABLE Support_and_Customer_Service
ADD CONSTRAINT FK_Support_Player
FOREIGN KEY (ID_player) REFERENCES Players(ID_player);

