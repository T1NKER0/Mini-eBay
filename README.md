# Mini-eBay

## Web / Android mobile application for the Mini-eBay system. This project includes a backend containing Servlets, classes, and a central database. The mobile application communicates with the backend via http (JSON).

### Usability
User login is implemented for both web and mobile platforms.

Products are classified by departments (e.g., Electronics, Computers, Books).

Users can sell a product classified by department. When registering the product, users include a product name, a description, a starting bid value, a picture, and a due date (web).

The system provides a search box with the capability to refine the search based on department. The default search is executed on the entire product database (web and mobile).

Search results are listed with the product description (name, department, and current bid) and a picture (web and mobile).

Once a user selects a product, the system presents a new activity with the complete product description, including a larger picture (web and mobile).

When a user intends to make a bid for a product, they must be logged into the system. They enter the bid value, and the system shows the highest bid for the product (web).

Every transaction performed on the mobile application is registered in the central database system (web and mobile).
 
### Project Architecture
An Android mobile application has been implemented for the mini eBay system developed for the first project. The project includes a backend containing Servlets, classes, and a central database. The mobile application communicates with the backend via HTTP (JSON).

The system provides an administrator role with the ability to add, modify, and remove users, products, and departments.
