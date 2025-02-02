drop schema if exists gunturke;
CREATE DATABASE gunturke;

USE gunturke;


CREATE TABLE User_Info (
    user_id VARCHAR(9) PRIMARY KEY,
    name_user VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    password_user VARCHAR(50) NOT NULL,
    role_user CHAR(1) NOT NULL

);


CREATE TABLE Instructor (
    instructor_id VARCHAR(9) PRIMARY KEY,
    user_id VARCHAR(9) NOT NULL,
    department VARCHAR(30) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User_Info(user_id)
);



CREATE TABLE Course (
    course_id VARCHAR(9) PRIMARY KEY,
    name_course VARCHAR(50) NOT NULL,
    department VARCHAR(30) NOT NULL,
    instructor_id VARCHAR(9) NOT NULL,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

CREATE TABLE Assigned_Course (
    assigned_id VARCHAR(9) PRIMARY KEY,
    user_id VARCHAR(9) NOT NULL,
    course_id VARCHAR(9) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User_Info(user_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Rating (
    rating_id VARCHAR(9) PRIMARY KEY,
    user_id VARCHAR(9) NOT NULL,
    course_id VARCHAR(9) NOT NULL,
    instructor_id VARCHAR(9) NOT NULL,
    rating_star INT NOT NULL CHECK (rating_star BETWEEN 1 AND 5),
    rating_comment VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES User_Info(user_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);



INSERT INTO User_Info (user_id, name_user, email, password_user, role_user) VALUES
('U001', 'Ezgi Su Bilal', 'bilale@mef.edu.tr', 'bubirsifredir123', 'S'),
('U002', 'Elif İlayda Güntürk', 'ilaydaofmidgard@gmail.com', 'püskevit', 'S'),
('U003', 'Charlie Brown', 'charlie@example.com', 'password123', 'S'),
('U004', 'Bruce Wayne', 'wayne@waynecorps.com', 'password123', 'S'),
('U005', 'Ethan Hunt', 'ethan@example.com', 'password123', 'S'),
('U006', 'Pedro Pascal', 'pedro@example.com', 'password123', 'S'),
('U007', 'Astarion Ancunin', 'bg3@example.com', 'password123', 'S'),
('U008', 'Hannah Davis', 'hannah@example.com', 'password123', 'S'),
('U009', 'Ian Curtis', 'ian@example.com', 'password123', 'S'),
('U010', 'Julia Roberts', 'julia@example.com', 'password123', 'S'),
('U011', 'Kevin Hart', 'kevin@example.com', 'password123', 'S'),
('U012', 'Laura Palmer', 'laura@example.com', 'password123', 'S'),
('U013', 'Michael Scott', 'michael@example.com', 'password123', 'S'),
('U014', 'Nina Simone', 'nina@example.com', 'password123', 'S'),
('U015', 'Oscar Wilde', 'oscar@example.com', 'password123', 'S'),
('U016', 'Dr. Osamu Dazai ', 'osamu.dazai@example.com', 'securepass', 'I'),
('U017', 'Dr. Utku Koç', 'koc.utku@example.com', 'securepass', 'I'),
('U018', 'Dr. Alan Turing', 'alan.turing@example.com', 'securepass', 'I'),
('U019', 'Dr. Grace Hopper', 'grace.hopper@example.com', 'securepass', 'I'),
('U020', 'Prof. Dr. Özgür Özlük', 'ozgur@ozluk.com', 'securepass', 'I'),
('U021', 'Dr. Tim Berners-Lee', 'tim.berners@example.com', 'securepass', 'I');


INSERT INTO Instructor (instructor_id, user_id, department) VALUES
('I001', 'U016', 'Computer Science'),
('I002', 'U017', 'Mathematics'),
('I003', 'U018', 'Artificial Intelligence'),
('I004', 'U019', 'Software Engineering'),
('I005', 'U020', 'Data Science'),
('I006', 'U021', 'Web Development');


INSERT INTO Course (course_id, name_course, department, instructor_id) VALUES
('C001', 'Introduction to Programming', 'Computer Science', 'I001'),
('C002', 'Simulation', 'Mathematics', 'I002'),
('C003', 'Machine Learning Basics', 'Artificial Intelligence', 'I003'),
('C004', 'Software Design Patterns', 'Software Engineering', 'I004'),
('C005', 'Data Visualization', 'Data Science', 'I005'),
('C006', 'Web Development Essentials', 'Web Development', 'I006'),
('C007', 'Database Systems', 'Computer Science', 'I001'),
('C008', 'Machine Scheduling', 'Mathematics', 'I002'),
('C009', 'Deep Learning Fundamentals', 'Artificial Intelligence', 'I003'),
('C010', 'Agile Software Development', 'Software Engineering', 'I004'),
('C011', 'Big Data Analytics', 'Data Science', 'I005'),
('C012', 'Advanced Front-End Development', 'Web Development', 'I006');

INSERT INTO Assigned_Course (assigned_id, user_id, course_id) VALUES
('A001', 'U001', 'C001'),
('A002', 'U002', 'C002'),
('A003', 'U003', 'C003'),
('A004', 'U004', 'C004'),
('A005', 'U005', 'C005'),
('A006', 'U006', 'C006'),
('A007', 'U007', 'C001'),
('A008', 'U008', 'C002'),
('A009', 'U009', 'C003'),
('A010', 'U010', 'C004'),
('A011', 'U011', 'C005'),
('A012', 'U012', 'C006'),
('A013', 'U013', 'C001'),
('A014', 'U014', 'C003'),
('A015', 'U015', 'C004');

	
INSERT INTO Rating (rating_id, user_id, course_id, instructor_id, rating_star, rating_comment) VALUES
('R001', 'U007', 'C001', 'I001', 3, 'Great course! Learned a lot. Hate the instructor.'),
('R002', 'U002', 'C002', 'I002', 4, 'Challenging but rewarding.'),
('R003', 'U003', 'C003', 'I003', 5, 'Well-structured and informative.'),
('R004', 'U004', 'C004', 'I004', 2,  NULL),
('R005', 'U005', 'C005', 'I005', 5, 'The instructor was fantastic!'),
('R006', 'U006', 'C006', 'I006', 4, 'Clear and concise explanations.'),
('R007', 'U007', 'C001', 'I001', 4, 'Good introduction to programming.'),
('R008', 'U008', 'C002', 'I002', 3, 'A bit difficult but worth it.'),
('R009', 'U009', 'C003', 'I003', 5, 'Excellent course on AI.'),
('R010', 'U010', 'C004', 'I004', 4, 'Loved the practical examples.'),
('R011', 'U011', 'C005', 'I005', 5, 'Highly recommend this course.'),
('R012', 'U012', 'C006', 'I006', 1,  NULL),
('R013', 'U013', 'C001', 'I001', 5, 'Very engaging and helpful.'),
('R014', 'U014', 'C003', 'I003', 5, 'Interesting and well-explained.'),
('R015', 'U015', 'C004', 'I004', 5, 'Really enjoyed the design patterns.');

-- -- --  TRIGGERS

-- Ensure that a user cannot rate the same course more than once.
DELIMITER $$

CREATE TRIGGER PreventDuplicateRatings
BEFORE INSERT ON Rating
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM Rating
        WHERE user_id = NEW.user_id 
          AND course_id = NEW.course_id
    ) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'A user cannot rate the same course more than once.';
    END IF;
END$$

DELIMITER ;


-- Auto-Incremental Trigger for User_Info Table

DELIMITER $$

CREATE TRIGGER auto_increment_user_id
BEFORE INSERT ON User_Info
FOR EACH ROW
BEGIN
    -- Get the maximum user_id from the table and increment it
    DECLARE max_id INT;
    SET max_id = (SELECT COALESCE(MAX(CAST(SUBSTRING(user_id, 2) AS UNSIGNED)), 0) FROM User_Info);
    
    -- Generate the new ID
    SET NEW.user_id = CONCAT('U', LPAD(max_id + 1, 3, '0'));
END$$

DELIMITER ;


-- Auto-Incremental Trigger for Instructor_Info Table
DROP TRIGGER auto_increment_instructor_id

DELIMITER $$

CREATE TRIGGER auto_increment_instructor_id
AFTER INSERT ON User_Info
FOR EACH ROW
BEGIN
    -- Declare variables
    DECLARE max_instructor_id INT;
    DECLARE new_instructor_id VARCHAR(10);
    
    -- Check if the role of the inserted user is "I"
    IF NEW.role_user = 'I' THEN
        -- Get the maximum instructor_id from the Instructor table and increment it
        SET max_instructor_id = (SELECT COALESCE(MAX(CAST(SUBSTRING(instructor_id, 2) AS UNSIGNED)), 0) FROM Instructor);
        
        -- Generate the new instructor ID
        SET new_instructor_id = CONCAT('I', LPAD(max_instructor_id + 1, 3, '0'));
        
        -- Insert the new instructor ID, user_id, and default department into the Instructor table
        INSERT INTO Instructor (instructor_id, user_id, department) 
        VALUES (new_instructor_id, NEW.user_id, 'Unknown');
    END IF;
END$$

DELIMITER ;


-- Auto-Incremental Trigger for Course Table
DELIMITER $$

CREATE TRIGGER auto_increment_course_id
BEFORE INSERT ON Course
FOR EACH ROW
BEGIN
    -- Get the maximum course_id from the table and increment it
    DECLARE max_id INT;
    SET max_id = (SELECT COALESCE(MAX(CAST(SUBSTRING(course_id, 2) AS UNSIGNED)), 0) FROM Course);

    -- Generate the new ID
    SET NEW.course_id = CONCAT('C', LPAD(max_id + 1, 3, '0'));
END$$

DELIMITER ;

-- Auto-Incremental Trigger for Rating Table
DELIMITER $$

CREATE TRIGGER auto_increment_rating_id
BEFORE INSERT ON Rating
FOR EACH ROW
BEGIN
    -- Get the maximum rating_id from the table and increment it
    DECLARE max_id INT;
    SET max_id = (SELECT COALESCE(MAX(CAST(SUBSTRING(rating_id, 2) AS UNSIGNED)), 0) FROM Rating);

    -- Generate the new ID
    SET NEW.rating_id = CONCAT('R', LPAD(max_id + 1, 3, '0'));
END$$

DELIMITER ;

-- No rating for unassigned course
DELIMITER //

CREATE TRIGGER prevent_invalid_rating
BEFORE INSERT ON Rating
FOR EACH ROW
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Assigned_Course
        WHERE user_id = NEW.user_id AND course_id = NEW.course_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User is not assigned to this course!';
    END IF;
END; //

DELIMITER ;

-- Auto-Incremental Trigger for Assigned_Course

DELIMITER $$

CREATE TRIGGER auto_increment_assigned_id
BEFORE INSERT ON Assigned_Course
FOR EACH ROW
BEGIN
    -- Get the maximum assigned_id from the table and increment it
    DECLARE max_id INT;
    SET max_id = (SELECT COALESCE(MAX(CAST(SUBSTRING(assigned_id, 2) AS UNSIGNED)), 0) FROM Assigned_Course);

    -- Generate the new assigned_id
    SET NEW.assigned_id = CONCAT('A', LPAD(max_id + 1, 3, '0'));
END$$

DELIMITER ;

-- -- PROCEDURES

-- Assign User to a Course

DELIMITER $$

CREATE PROCEDURE AssignUserToCourse(
    IN userID VARCHAR(9),
    IN courseID VARCHAR(9)
)
BEGIN
    -- Check if the user is already assigned to the course
    IF EXISTS (
        SELECT 1
        FROM Assigned_Course
        WHERE user_id = userID AND course_id = courseID
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User is already assigned to this course!';
    ELSE
        -- Assign the user to the course (assigned_id is auto-incremented by the trigger)
        INSERT INTO Assigned_Course (user_id, course_id)
        VALUES (userID, courseID);
    END IF;
END$$

DELIMITER ;

CALL AssignUserToCourse('U016', 'C002');

SELECT * FROM Assigned_Course;


-- Adding a New Course
DELIMITER $$

CREATE PROCEDURE AddCourse(
    IN courseName VARCHAR(50),
    IN departmentName VARCHAR(30),
    IN instructorID VARCHAR(9)
)
BEGIN
    -- Insert a new course; course_id will be auto-generated by the trigger
    INSERT INTO Course (name_course, department, instructor_id)
    VALUES (courseName, departmentName, instructorID);
END$$

DELIMITER ;

CALL AddCourse('Cloud Computing', 'Computer Science', 'I001');


-- Create a Trigger for Valid Rating

-- DELIMITER $$
CREATE TRIGGER ValidateRatings
BEFORE INSERT ON Rating
FOR EACH ROW
BEGIN
    IF NEW.rating_star < 1 OR NEW.rating_star > 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Rating must be between 1 and 5.';
    END IF;
END;
$$

DELIMITER ;

SELECT 
    u.name_user AS Student_Name,
    COUNT(ac.course_id) AS Total_Courses
FROM 
    User_Info u
JOIN 
    Assigned_Course ac ON u.user_id = ac.user_id
WHERE 
    u.role_user = 'S'
GROUP BY 
    u.name_user
ORDER BY 
    Total_Courses DESC;




