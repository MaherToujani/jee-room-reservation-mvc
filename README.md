# JEE – Room Reservation Management (MVC)

Web application built with Java EE to manage **room reservations**.
This project demonstrates the use of Servlets, JSP, JDBC, and the MVC pattern.

## Project goal
Develop a JEE web application that manages room bookings and proves mastery of:
- Servlets
- JSP
- JDBC
- MVC architecture

## Features
### Home page
- Application presentation
- Navigation links to:
  - Room management
  - Reservation management

### Room management
- List rooms
- Add a room (name, capacity, equipment)
- Update a room
- Delete a room

### Reservation management
- List all reservations
- Add a reservation:
  - Room (selected from a list)
  - Date
  - Reason (motif)
  - Person name
- Check room availability for a given date
- Delete a reservation

## Technical constraints
- Must use Servlets, JSP, and JDBC
- Must respect MVC
- Database: MySQL or SQL Server
- Simple and clear UI

## Database schema (minimum)
### Table: Salle
- `Sal_Id` (INT)
- `Sal_Nom` (VARCHAR(50))
- `Sal_Capacite` (INT)
- `Sal_Equipement` (VARCHAR)

### Table: Reservation
- `Res_Id` (INT)
- `Sal_Id` (INT) — foreign key to `Salle(Sal_Id)`
- `Res_DateReservation` (DATE)
- `Res_Personne` (VARCHAR(50))

## Suggested project structure (MVC)
- `model/` (JavaBeans + DAO using JDBC)
- `controller/` (Servlets)
- `view/` (JSP pages)

## How to run (high level)
1. Create the database and tables (MySQL or SQL Server).
2. Configure DB connection parameters in the project.
3. Deploy on a servlet container (example: Apache Tomcat).
4. Open the home page and use the navigation links to manage rooms/reservations.

## License
Educational project.
