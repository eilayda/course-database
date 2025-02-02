
# 📊 Online Course Rating Management System

## 📌 Project Overview
The **Online Course Rating Management System** is a database-driven platform that allows students to rate and review courses while enabling instructors to gather feedback for improvement. This system is designed to ensure data integrity, transparency, and ease of management for educational institutions.

## 🚀 Features
- **User Management**: Supports student and instructor roles with distinct functionalities.
- **Course Management**: Instructors can create and manage courses.
- **Rating & Review System**: Students can rate courses (1-5 stars) and provide feedback.
- **Data Integrity**: Enforces constraints like unique IDs, verified reviews, and mandatory comments for low ratings.
- **Scalability & Security**: Designed for future expansion and secure data management.

## 🏗️ Database Design
The project follows a **relational database model**, ensuring structured data storage and efficient retrieval. The **Entity-Relationship (ER) Model** includes:
1. **User_Info**: Stores user data (students and instructors).
2. **Instructor**: Additional details specific to instructors.
3. **Course**: Stores course-related information.
4. **Assigned_Course**: Tracks user-course enrollments.
5. **Rating**: Manages student reviews and ratings.

# 📊 Entity-Relationship Diagram
Below is the ER diagram representing the structure of the Online Course Rating Management System.
![erd_diagram](https://github.com/user-attachments/assets/d8550f80-e5b4-4ffb-8663-1934da307b52)

## ⚙️ CRUD Operations
The project supports the following **CRUD** operations:
- **Create**: Add users, courses, and reviews.
- **Read**: Retrieve course details, ratings, and student enrollments.
- **Update**: Modify user/course details and reviews.
- **Delete**: Remove users, courses, and outdated reviews.

## 📜 Implementation
- **SQL Scripts**: Includes scripts for database creation, table setup, and sample data insertion.
- **Triggers & Procedures**:
  - Prevent duplicate ratings.
  - Ensure only enrolled students can review courses.
  - Auto-generate unique identifiers.

## 📈 Use Cases
- List all courses offered by an instructor.
- Retrieve the average rating for a course.
- Find students enrolled in a specific course.
- Identify courses without reviews.
- Access reviews with low ratings for improvement.



