CREATE TABLE Donation (
	Donation_id INT,
	Type VARCHAR(20),
	Item_name VARCHAR(30),
	Item_quantity INT, 
	Item_maker VARCHAR(60),
	Dollar_amount FLOAT, 
	Donor_id INT,
	PRIMARY KEY (Donation_id),
	FOREIGN KEY (Donor_id) REFERENCES Donor(Donor_id)
);

CREATE TABLE Essentials (
	Essential_id INT,
	Name VARCHAR(30),
	Quantity INT, 
	Maker VARCHAR(60),
	PRIMARY KEY (Essential_id)
);

CREATE TABLE Donor (
	Donor_id INT,
	Full_name VARCHAR(30),
	Age INT,
	Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
	Employer VARCHAR(30),
	Status VARCHAR(10),
	PRIMARY KEY (Donor_id)
);

CREATE TABLE Contribute (
	Volunteer_id INT,
	Event_id INT,
	Hours_worked FLOAT,
	PRIMARY KEY (Volunteer_id, Event_id),
	FOREIGN KEY (Volunteer_id) REFERENCES Volunteers(Volunteer_id),
	FOREIGN KEY (Event_id) REFERENCES Events(Event_id)
);

CREATE TABLE Events (
	Event_id INT,
	Date DATETIME,
	Location VARCHAR(50),
	PRIMARY KEY (Event_id)
);

CREATE TABLE Volunteers (
	Volunteer_id INT,
	Full_name VARCHAR(30),
	Age INT,
	Gender CHAR(1) CHECK (Gender IN (‘M’, ‘F’)), 
	Top_skill VARCHAR(30),
	Top_interest VARCHAR(30),
	PRIMARY KEY (Volunteer_id)
);

CREATE TABLE Distributes (
	Event_id INT,
	Essential_id INT,
	Num_taken INT,
	PRIMARY KEY (Event_id, Essential_id),
	FOREIGN KEY (Event_id) REFERENCES FoodPantry(Event_id),
	FOREIGN KEY (Essential_id) REFERENCES Essentials(Essential_id) 
);

CREATE TABLE FoodPantry (
	Event_id INT,
	Volunteers_needed INT,
	Num_communities_impacted INT,
	PRIMARY KEY (Event_id)
);

CREATE TABLE Branch (
	Branch_id INT PRIMARY KEY,
	Phone_number CHAR(12) CHECK (Phone_number LIKE ‘___-___-____’),
	Location VARCHAR(255)
);

CREATE TABLE Staff (
	Staff_id INT PRIMARY KEY,
	Full_name VARCHAR(255),
	Age INT,
	Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
	Pos VARCHAR(50),
	Dep VARCHAR(50)
);

CREATE TABLE Fundraiser (
	Event_id INT PRIMARY KEY,
	Num_donations INT,
	Amount_raised FLOAT
);

CREATE TABLE Clients (
	Client_id INT PRIMARY KEY,
	Full_name VARCHAR(255),
	Age INT,
	Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
	Has_children BOOLEAN,
	Income FLOAT
);

CREATE TABLE Works_For (
	Branch_id INT,
	Staff_id INT,
	PRIMARY KEY (Branch_id, Staff_id),
	FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id),
	FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id)
);

CREATE TABLE Stores (
	Branch_id INT,
	Essentials_id INT,
	PRIMARY KEY (Branch_id, Essentials_id),
	FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id)
	FOREIGN KEY (Essentials_id) REFERENCES Essentials(Essential_id)
);

CREATE TABLE Manages (
	Branch_id INT,
	Donation_id INT,
	PRIMARY KEY (Branch_id, Donation_id),
	FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id),
	FOREIGN KEY (Donation_id) REFERENCES Donation(Donation_id)
);

CREATE TABLE Makes (
	Donation_id INT,
	Donor_id INT,
	Date DATE,
	PRIMARY KEY (Donation_id, Donor_id),
	FOREIGN KEY (Donation_id) REFERENCES Donation(Donation_id),
	FOREIGN KEY (Donor_id) REFERENCES Donor(Donor_id)
);

CREATE TABLE Hosts (
	Branch_id INT,
	Event_id INT,
	PRIMARY KEY (Branch_id, Event_id),
	FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id),
	FOREIGN KEY (Event_id) REFERENCES Events(Event_id)
);

CREATE TABLE Runs (
	Staff_id INT,
	Event_id INT,
	PRIMARY KEY (Staff_id, Event_id),
	FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id),
	FOREIGN KEY (Event_id) REFERENCES Events(Event_id)
);

CREATE TABLE Go_To (
	Event_id INT,
	Client_id INT,
	PRIMARY KEY (Event_id, Client_id),
	FOREIGN KEY (Event_id) REFERENCES FoodPantry(Event_id),
	FOREIGN KEY (Client_id) REFERENCES Clients(Client_id)
);

CREATE TABLE Receive (
	Essentials_id INT,
	Client_id INT,
	Date DATE,
	PRIMARY KEY (Essentials_id, Client_id),
	FOREIGN KEY (Essentials_id) REFERENCES Essentials(Essentials_id),
	FOREIGN KEY (Client_id) REFERENCES Clients(Client_id)
);

CREATE TABLE Provide_To (
	Event_id INT,
	Donor_id INT,
	PRIMARY KEY (Event_id, Donor_id),
	FOREIGN KEY (Event_id) REFERENCES Fundraiser(Event_id),
	FOREIGN KEY (Donor_id) REFERENCES Donor(Donor_id)
);
