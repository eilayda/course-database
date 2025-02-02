-- -- -- CRUD OPERATIONS

-- -- Create

-- Create a New User

INSERT INTO User_Info (user_id, name_user, email, password_user, role_user)
VALUES ('U022', 'David J. Malan', 'david@harvard.com', 'iloveCS50.2025', 'I');


-- Create a New Course

INSERT INTO Course (course_id, name_course, department, instructor_id) VALUES
('C000', 'Introduction to Math', 'Mathmetics', 'I001');
-- without procedure


CALL AddCourse('Introduction to AI Ethics', 'Artificial Intelligence', 'I003');

-- with procedure



-- -- Read

-- Read All Courses and Instructors

SELECT c.course_id, c.name_course, u.name_user AS instructor_name
FROM Course c
JOIN Instructor i ON c.instructor_id = i.instructor_id
JOIN User_Info u ON i.user_id = u.user_id;

-- Read All Ratings for a Specific Course

SELECT r.rating_id, r.user_id, r.rating_star, r.rating_comment
FROM Rating r
WHERE r.course_id = 'C001';

-- Read Students Assigned to a Specific Course

SELECT ac.user_id, u.name_user
FROM Assigned_Course ac
JOIN User_Info u ON ac.user_id = u.user_id
WHERE ac.course_id = 'C003';

SELECT user_id,name_user
FROM user_info
group by name_user asc;

-- -- Update

-- Update a User's Email

UPDATE User_Info
SET email = 'ezgi@bilal.com'
WHERE user_id = 'U001';

-- Update a Course Name

UPDATE Course
SET name_course = 'Advanced AI Ethics'
WHERE course_id = 'C003';

-- -- Delete

-- Delete a User

DELETE FROM User_Info
WHERE user_id = 'U016';

-- Delete All Ratings for a Specific Course

DELETE FROM Rating
WHERE course_id = 'C002';

ALTER TABLE Course
ADD Email varchar(255);


