use icic;

------------------------------------------------------------------------------------------------------------------------
#1 ) Find an employee’s whose id is 52 and branch name is icicp ?

SELECT E.FIRST_NAME,E.DEPARTMENT_ID,
B.BRANCH_NAME,E.EMPLOYEE_ID
FROM EMPLOYEES AS E
JOIN BANK_DETAILS AS B
ON B.DEPARTMENT_ID=E.DEPARTMENT_ID
WHERE E.EMPLOYEE_ID = 52 AND B.BRANCH_NAME='ICIC_P';
------------------------------------------------------------------------------------------------------------------------
# 2 ) Write a query to fetch all the details who doesn’t belong to mumbai,
#pune, delhi . [table_name:Bank details]

SELECT *
FROM BANK_DETAILS
WHERE ADDRESS NOT IN('MUMBAI','PUNE','DELHI');
-------------------------------------------------------------------------------------------------------------------------
#3 ) Find details department name, address, branch code, dept _id, city of the account no 18190.

SELECT D.DEPARTMENT_ID,D.DEPARTMENT_NAME,
B.ADDRESS,C.City,B.BRANCH_CODE
FROM departments AS D
INNER JOIN CUSTOMER AS C
ON D.ACCOUNT_NO=C.Account_No
INNER JOIN bank_details AS B
ON D.DEPARTMENT_ID=B.DEPARTMENT_ID
WHERE D.ACCOUNT_NO=18190;
---------------------------------------------------------------------------------------------------------------------------
#4 ) Find department id, department name, job id whose only work in Loan, HR, admin.


SELECT D.DEPARTMENT_ID,D.DEPARTMENT_NAME,J.JOB_ID
FROM DEPARTMENTS AS D
INNER JOIN JOB_DETAILS AS J
ON D.DEPARTMENT_ID=J.DEPARTMENT_ID
WHERE D.DEPARTMENT_NAME IN ('LOAN','HR','ADMIN');
------------------------------------------------------------------------------------------------------------------------------

#5) Find the type_account, state account number whose atm no 422748663.


SELECT A_T.TYPE_ACCOUNT,B_D.STATE,A_T.ACCOUNT_NO
FROM ACCOUNT_TYPE AS A_T
INNER JOIN CUSTOMER AS C
ON C.ACCOUNT_NO=A_T.ACCOUNT_NO
INNER JOIN BANK_DETAILS AS B_D
ON B_D.BRANCH_CODE=C.BRANCH_CODE
WHERE ATM_NO = 422748663 ;
-------------------------------------------------------------------------------------------------------------------------------
#6) Create a view with that show address, branch name, department name, first name. phone no.

CREATE VIEW VIEW_EMPLOYEE AS
SELECT
B_D.ADDRESS,B_D.BRANCH_NAME,D.DEPARTMENT_NAME,C.FIRST_NAME,C.PHONE_NO
FROM DEPARTMENTS AS D
INNER JOIN BANK_DETAILS AS B_D
ON B_D.DEPARTMENT_ID=D.DEPARTMENT_ID
INNER JOIN CUSTOMER AS C
ON B_D.BRANCH_CODE=C.BRANCH_CODE;

select * from view_employee;

-----------------------------------------------------------------------------------------------------------------------------------

#7) Create view city, department name whose opening date is less than 24 May 04

CREATE VIEW VIEW_CITY AS
SELECT C.CITY , D.DEPARTMENT_NAME,E.HIRE_DATE
FROM DEPARTMENTS AS D
INNER JOIN EMPLOYEES AS E
ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
INNER JOIN CUSTOMER AS C
ON C.ACCOUNT_NO=D.ACCOUNT_NO
WHERE HIRE_DATE > '2004-05-24';
-----------------------------------------------------------------------------------------------------------------------------------

# 8) Create view only job id for clerk, manager, an accountant with all detail and name it employee job_deatils


CREATE VIEW EMPLOYEE_JOB_DETAILS AS
SELECT
A_T.ACCOUNT_NO ,
A_T.TYPE_ACCOUNT ,
A_T.MANAGER_ID ,
A_T.DEPARTMENT_NAME, 
A_T.OPENING_DATE,
D.DEPARTMENT_ID,
D.EMPLOYEE_ID,
B_D.BRANCH_CODE,
B_D.ADDRESS,
B_D.BRANCH_NAME,
B_D.STATE,
J_D.JOB_ID,
E.First_name,
E.Email,
E.Hire_Date,
E.Phone_no,
E.Salary,
C.ATM_NO,
C.Exp_date,
C.Pin_No,
C.City
FROM ACCOUNT_TYPE AS A_T
INNER JOIN DEPARTMENTS AS D
ON A_T.ACCOUNT_NO=D.ACCOUNT_NO
INNER JOIN BANK_DETAILS AS B_D
ON B_D.DEPARTMENT_ID=D.DEPARTMENT_ID
INNER JOIN JOB_DETAILS AS J_D
ON J_D.BRANCH_CODE=B_D.BRANCH_CODE
INNER JOIN EMPLOYEES AS E
ON E.JOB_ID=J_D.JOB_ID 
INNER JOIN CUSTOMER AS C
ON E.EMPLOYEE_ID=C.EMPLOYEE_ID
WHERE J_D.JOB_ID IN ('FI_ACCOUNT','ST_CLERK','ST_MAN');
-----------------------------------------------------------------------------------------------------------------------------------------
# 9) In the Customer table change the atm_no 423295535 with 42321992.

UPDATE CUSTOMER
SET ATM_NO =42321992
WHERE ATM_NO =423295535 ;
------------------------------------------------------------------------------------------------------------------------------------
#10) In the Account_type table change all sales account into admin

SET SQL_SAFE_UPDATES=0;
UPDATE ACCOUNT_TYPE
SET DEPARTMENT_NAME = 'ADMIN'
WHERE DEPARTMENT_NAME = 'SALES';