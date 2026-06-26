CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Age NUMBER,
    Balance NUMBER(10,2),
    IsVIP VARCHAR2(5)
);

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    InterestRate NUMBER(5,2),
    DueDate DATE,
    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);

INSERT INTO Customers VALUES (101,'Rahul Sharma',65,15000,'FALSE');
INSERT INTO Customers VALUES (102,'Priya Singh',45,9000,'FALSE');
INSERT INTO Customers VALUES (103,'Amit Verma',70,25000,'FALSE');
INSERT INTO Customers VALUES (104,'Neha Gupta',30,8000,'FALSE');
INSERT INTO Customers VALUES (105,'Rohan Mehta',62,12000,'FALSE');

COMMIT;

INSERT INTO Loans VALUES (201,101,9.5,SYSDATE+20);
INSERT INTO Loans VALUES (202,102,10.0,SYSDATE+50);
INSERT INTO Loans VALUES (203,103,8.5,SYSDATE+15);
INSERT INTO Loans VALUES (204,104,11.0,SYSDATE+10);
INSERT INTO Loans VALUES (205,105,9.0,SYSDATE+25);

COMMIT;

SELECT * FROM Customers;

SET SERVEROUTPUT ON;

BEGIN

    FOR cust IN (
        SELECT CustomerID
        FROM Customers
        WHERE Age > 60
    )
    LOOP

        UPDATE Loans
        SET InterestRate = InterestRate - 1
        WHERE CustomerID = cust.CustomerID;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Interest rates updated successfully.');

END;
/
SELECT * FROM Loans;

SET SERVEROUTPUT ON;

BEGIN

    FOR cust IN (
        SELECT CustomerID
        FROM Customers
        WHERE Balance > 10000
    )
    LOOP

        UPDATE Customers
        SET IsVIP='TRUE'
        WHERE CustomerID=cust.CustomerID;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('VIP Customers Updated');

END;
/

SELECT * FROM Customers;

SET SERVEROUTPUT ON;

BEGIN

    FOR loan IN (
        SELECT LoanID,
               CustomerID,
               DueDate
        FROM Loans
        WHERE DueDate BETWEEN SYSDATE
                          AND SYSDATE+30
    )
    LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Customer '
            || loan.CustomerID
            || ' Loan '
            || loan.LoanID
            || ' Due on '
            || loan.DueDate
        );

    END LOOP;

END;
/