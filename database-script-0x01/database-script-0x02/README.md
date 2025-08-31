# ALX Airbnb Database – Seed Data (DML)

![Database](https://img.shields.io/badge/Database-MariaDB-blue)
![UUID](https://img.shields.io/badge/Primary%20Keys-UUID-green)
![DML](https://img.shields.io/badge/DML-Seed%20Data-orange)

## Overview

This repository contains the seed data for the **ALX Airbnb Database**.  
It demonstrates how the initial records are inserted into the database for testing and development purposes.

The database consists of six main entities:

- Users
- Properties
- Bookings
- Reviews
- Payments
- Messages

All primary keys are **UUIDs** to ensure uniqueness and maintain relational integrity.

---

## 1. Users

Users represent the participants in the system.  
Each user record contains:

- First Name
- Last Name
- Email (unique)
- Password hash
- Phone number
- Role (`guest`, `host`, `admin`)

**Note:** Users must be inserted first to satisfy foreign key relationships with other tables.

---

## 2. Properties

Properties are the listings in the system.  
Each property record includes:

- Host (linked to a user via `host_id`)
- Name
- Description
- Location
- Price per night
- Creation and update timestamps

---

## 3. Bookings

Bookings link users to properties for specific periods.  
Each booking includes:

- Property and user references
- Start and end dates
- Total price
- Status (`pending`, `confirmed`, `canceled`)
- Creation timestamp

---

## 4. Reviews

Reviews capture user feedback on properties.  
Each review includes:

- Property and user references
- Rating (1–5)
- Comment
- Creation timestamp

---

## 5. Payments

Payments are linked to bookings and record financial transactions.  
Each payment includes:

- Booking reference
- Amount
- Payment date
- Payment method (`credit_card`, `paypal`, `stripe`)

---

## 6. Messages

Messages allow users to communicate with each other.  
Each message includes:

- Sender and recipient references
- Message content
- Timestamp

---

## Important Notes

1. **UUIDs** are used for all primary keys.
2. Insert **users first**, then properties, bookings, reviews, payments, and messages to maintain foreign key integrity.
3. Unique constraints (like user email) must be respected to avoid insertion errors.
4. Timestamps are automatically set when records are created.
5. Foreign key checks can temporarily be disabled during bulk insertion but must be re-enabled afterward.

---

## Usage

This DML is intended for populating the database with initial data for testing, development, or demonstrations.

## Example Seeded Data

### Users

| ID (UUID) | First Name | Last Name | Email                     | Role  |
| --------- | ---------- | --------- | ------------------------- | ----- |
| UUID()    | John       | Doe       | john.doe@example.com      | guest |
| UUID()    | Jane       | Smith     | jane.smith@example.com    | host  |
| UUID()    | Alice      | Johnson   | alice.johnson@example.com | admin |

### Properties

| ID (UUID) | Host ID | Name             | Location | Price per Night |
| --------- | ------- | ---------------- | -------- | --------------- |
| UUID()    | UUID()  | Cozy Cottage     | Forest   | 100.00          |
| UUID()    | UUID()  | Beachfront Villa | Beach    | 300.00          |
| UUID()    | UUID()  | City Apartment   | City     | 150.00          |

### Bookings

| ID (UUID) | Property ID | User ID | Start Date | End Date   | Total Price | Status    |
| --------- | ----------- | ------- | ---------- | ---------- | ----------- | --------- |
| UUID()    | UUID()      | UUID()  | 2023-01-01 | 2023-01-07 | 700.00      | confirmed |
| UUID()    | UUID()      | UUID()  | 2023-02-15 | 2023-02-20 | 1500.00     | pending   |
| UUID()    | UUID()      | UUID()  | 2023-03-10 | 2023-03-12 | 300.00      | canceled  |

### Reviews

| ID (UUID) | Property ID | User ID | Rating | Comment                      |
| --------- | ----------- | ------- | ------ | ---------------------------- |
| UUID()    | UUID()      | UUID()  | 5      | Amazing stay!                |
| UUID()    | UUID()      | UUID()  | 4      | Very nice place, a bit noisy |
| UUID()    | UUID()      | UUID()  | 3      | It was okay, nothing special |

### Payments

| ID (UUID) | Booking ID | Amount  | Payment Date | Payment Method |
| --------- | ---------- | ------- | ------------ | -------------- |
| UUID()    | UUID()     | 700.00  | 2023-01-01   | credit_card    |
| UUID()    | UUID()     | 1500.00 | 2023-02-15   | paypal         |
| UUID()    | UUID()     | 300.00  | 2023-03-10   | stripe         |

### Messages

| ID (UUID) | Sender ID | Recipient ID | Message Body                                              |
| --------- | --------- | ------------ | --------------------------------------------------------- |
| UUID()    | UUID()    | UUID()       | Hello! I have a question about your property.             |
| UUID()    | UUID()    | UUID()       | Sure! What would you like to know?                        |
| UUID()    | UUID()    | UUID()       | Thanks for your review! Let me know if you need anything. |
