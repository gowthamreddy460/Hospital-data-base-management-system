-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-04-14 05:05:56.632

-- tables
-- Table: Bill
CREATE TABLE Bill (
    bill_id int  NOT NULL,
    patients_id int  NOT NULL,
    doctor_charge int  NOT NULL,
    room_charge varchar(45)  NOT NULL,
    no_of_days int  NOT NULL,
    CONSTRAINT Bill_pk PRIMARY KEY (bill_id)
);

-- Table: Patient_information
CREATE TABLE Patient_information (
    Patient_information_patient_id int  NOT NULL,
    first_name varchar(15)  NOT NULL,
    last_name varchar(15)  NOT NULL,
    address varchar(45)  NOT NULL,
    gender varchar(45)  NOT NULL,
    age int  NOT NULL,
    disease varchar(45)  NOT NULL,
    phone_number int  NOT NULL,
    register date  NOT NULL,
    Payments_payment_id int  NOT NULL,
    CONSTRAINT Patient_information_pk PRIMARY KEY (Patient_information_patient_id)
);

-- Table: Payments
CREATE TABLE Payments (
    payment_id int  NOT NULL,
    payment_date date  NOT NULL,
    payment_method text  NOT NULL,
    payment_amount decimal  NOT NULL,
    CONSTRAINT Payments_pk PRIMARY KEY (payment_id)
);

-- Table: appointments
CREATE TABLE appointments (
    appointment_id int  NOT NULL,
    Patient_information_Patient_information_patient_id int  NOT NULL,
    doctor_information_doctor_id int  NOT NULL,
    appointment_date varchar(45)  NOT NULL,
    disease varchar(45)  NOT NULL,
    Bill_bill_id int  NOT NULL,
    CONSTRAINT appointments_pk PRIMARY KEY (appointment_id)
);

-- Table: doctor_information
CREATE TABLE doctor_information (
    doctor_id int  NOT NULL,
    first_name varchar(15)  NOT NULL,
    last_name varchar(15)  NOT NULL,
    address varchar(45)  NOT NULL,
    phone_number int  NOT NULL,
    job_name varchar(45)  NOT NULL,
    CONSTRAINT doctor_information_pk PRIMARY KEY (doctor_id)
);

-- foreign keys
-- Reference: Patient_information_Payments (table: Patient_information)
ALTER TABLE Patient_information ADD CONSTRAINT Patient_information_Payments
    FOREIGN KEY (Payments_payment_id)
    REFERENCES Payments (payment_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: appointments_Bill (table: appointments)
ALTER TABLE appointments ADD CONSTRAINT appointments_Bill
    FOREIGN KEY (Bill_bill_id)
    REFERENCES Bill (bill_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: appointments_Patient_information (table: appointments)
ALTER TABLE appointments ADD CONSTRAINT appointments_Patient_information
    FOREIGN KEY (Patient_information_Patient_information_patient_id)
    REFERENCES Patient_information (Patient_information_patient_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: appointments_doctor_information (table: appointments)
ALTER TABLE appointments ADD CONSTRAINT appointments_doctor_information
    FOREIGN KEY (doctor_information_doctor_id)
    REFERENCES doctor_information (doctor_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

