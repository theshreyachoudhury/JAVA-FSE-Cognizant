CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(100),
    AccountType VARCHAR2(20),
    Balance NUMBER(10,2)
);

INSERT INTO Accounts VALUES (101, 'Rahul Sharma', 'Savings', 50000);
INSERT INTO Accounts VALUES (102, 'Priya Singh', 'Savings', 25000);
INSERT INTO Accounts VALUES (103, 'Amit Verma', 'Current', 80000);
INSERT INTO Accounts VALUES (104, 'Neha Gupta', 'Savings', 40000);

COMMIT;

CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(100),
    Department VARCHAR2(50),
    Salary NUMBER(10,2)
);

INSERT INTO Employees VALUES (1,'Rohan','IT',50000);
INSERT INTO Employees VALUES (2,'Sneha','HR',45000);
INSERT INTO Employees VALUES (3,'Amit','IT',60000);
INSERT INTO Employees VALUES (4,'Pooja','Finance',55000);

COMMIT;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
AS
BEGIN

    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType='Savings';

    COMMIT;

END;
/

BEGIN
    ProcessMonthlyInterest;
END;
/

SELECT * FROM Accounts;

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus
(
    p_department IN VARCHAR2,
    p_bonus IN NUMBER
)

AS
BEGIN

    UPDATE Employees
    SET Salary = Salary + (Salary * p_bonus/100)
    WHERE Department = p_department;

    COMMIT;

END;
/

BEGIN

    UpdateEmployeeBonus('IT',10);

END;
/

SELECT * FROM Employees;

CREATE OR REPLACE PROCEDURE TransferFunds
(
    p_fromAccount IN NUMBER,
    p_toAccount IN NUMBER,
    p_amount IN NUMBER
)

AS

    v_balance NUMBER;

BEGIN

    SELECT Balance
    INTO v_balance
    FROM Accounts
    WHERE AccountID = p_fromAccount;

    IF v_balance >= p_amount THEN

        UPDATE Accounts
        SET Balance = Balance - p_amount
        WHERE AccountID = p_fromAccount;

        UPDATE Accounts
        SET Balance = Balance + p_amount
        WHERE AccountID = p_toAccount;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Transfer Successful');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');

    END IF;

END;
/

SET SERVEROUTPUT ON;

BEGIN

    TransferFunds(101,102,5000);

END;
/

SELECT * FROM Accounts;