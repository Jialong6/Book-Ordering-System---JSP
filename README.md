# Book Ordering System - JSP
***431W final project***  


## Introduction
This book ordering system is based on JSP/Servlet.  

## DataBase Design
This project is just a demo, and you could make any changes you want. My sql file is called. jsp_book.sql, and I put it on the root.  
* t_book - The table stores the id, name, author, publisher, publication time, isbn, price, pages, stock, catagory, language, etc.
* t_catalog - The table stores the category name, brief introduction, etc.
* t_comment - The table stores the short text comment, comment score, user id, etc.
* t_customer - The table stores the customer's id, name, pw, age, address, tel, email, etc.
* t_manager - The table stores the manager's id, name, pw, etc.
* t_order - The table stores the order id, order num, order time, etc.

## Functionalities Implemented
* Log in, assigned default account is admin, and the default pw is admin.
  * If not input the account, alert suggesting to input the username
  * If not input the pw, alert suggesting to input the pw
  * If account and pw not match, alert wrong account or wrong pw
* Change Password
  * If the user just logged in, the login name and the original pw part are prefilled.
  * One change button to confirm changes, and one reset button to reset all the changes the user made.
  * If the user input a wrong original pw, alert wrong pw.
  * If the user doesn’t input a pw in New password text box, alert new pw cannot be null.
* Manage Admin
  * Normal user cannot see the Admin Management page, but the super manager can see it. It shows all the manager’s account name, their corresponding password, and their corresponding roles.
  * The super manager can choose to delete one of the records by pressing the delete button.
  * The super manager can add a new customer or a super manager by pressing the add button, input a new account and pw, and select a role.


## Functionalities Preview


## Author
*  Jialong6
