This is use case 1 for genpact campus recruitment details and requirements are:
"Use Case 1: Banking Application""
You have to build a customer’s experience with Bank Accounts 

Admin Roles 

•	The admin's details will be in database first hand. 
•	The admin can login with username and password 
•	The admin should register a customer with the following details: 
Full name 
Address 
Mobile No 
Email id 
Type of account – Either Saving Account or Current Account 
Initial Balance (min 1000) 
Date of Birth 
Id proof 

•	As a result, the customer must be registered with the bank and an Account no should be generated for the customer’s account. A temporary password should also generate  

•	The admin should be able to add/delete/modify/see customer details, however the password and balance MUST NOT be visible to the admin 

Customer Roles 

•	Customer registration is done by admin. After regsitration the generated account no and password should be given by admin to customer. 
•	With the help of account no and password, the customer should be able to set up a new password. 
•	After the new password is set, the customer can log in with account no and password  
•	The customer should be able to logout 
•	After login customer should come to customer dashboard page where the created account is displayed along with balance 
•	Clicking on View will display last 10 transactions in increasing/decreasing order of date. 
•	Clicking on Deposit will open a dialogue box where customer can put the amount and click submit. The balance will increase and the transaction must be saved in the database  
•	Clicking on Withdraw will open a dialogue box where customer can put the amount and click submit. The balance will decrease and the transaction must be saved in the database 
•	The customer can maintain 0 balance, but not below that 
•	The customer should be able to close the account on solo basis – no admin required 
•	The customer can close the account only after withdrawing all the money. 

Bonus Functionality 
•	The customer should be able to download a PDF of last 10 transactions by clicking Print in the mini statement.  
Instructions: 
•	You have to use Eclipse IDE, Tomcat 9 Server, MySQL Server and MySQL Workbench 
•	Do not focus too much on UI, focus more on completing end-to-end functionality 
•	After initial analysis, have a quick session with mentors to clarify the requirements 
•	Prepare a BOM (Bill of Materials) i.e., a list of software & hardware to be used 
•	Design and implement a well-modularized code 
•	Design a normalized database schema 
•	Only authenticated users should be allowed to access the application
