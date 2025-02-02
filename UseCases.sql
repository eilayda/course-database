
-- -- -- List Courses Below 3-Star Rating

SELECT c.course_id, c.name_course, AVG(r.rating_star) AS avg_rating, r.rating_comment
FROM Course c
JOIN Rating r ON c.course_id = r.course_id
GROUP BY c.course_id, c.name_course, r.rating_comment
HAVING avg_rating < 3;


-- -- --  Average Rating of a Course Only When It Has Received at Least Three Ratings

SELECT course_id, 
       AVG(rating_star) AS avg_rating
FROM Rating
GROUP BY course_id
HAVING COUNT(rating_id) >= 3;


-- -- -- Report of Courses Grouped by Department, Showing the Number of Ratings and Their Average Scores

SELECT c.department, 
       COUNT(r.rating_id) AS num_ratings, 
       AVG(r.rating_star) AS avg_rating
FROM Course c
LEFT JOIN Rating r ON c.course_id = r.course_id
GROUP BY c.department;

-- Use Case: List All Courses Offered by Instructors
SELECT 
    c.course_id,
    c.name_course AS Course_Name,
    i.name_user AS Instructor_Name
FROM 
    Course c
JOIN 
    User_Info i ON c.instructor_id = i.user_id
WHERE 
    i.role_user = 'I';

-- Use Case: Find Students Enrolled in a Specific Course
SELECT 
    u.name_user AS Student_Name,
    c.name_course AS Course_Name
FROM 
    Assigned_Course ac
JOIN 
    User_Info u ON ac.user_id = u.user_id
JOIN 
    Course c ON ac.course_id = c.course_id
WHERE 
    c.course_id = 'C101' -- Replace 'C101' with the desired course ID
AND 
    u.role_user = 'S';

-- Kurslar ve İncelemeleri Birleştir (Course + Rating)
SELECT c.course_id, c.name_course, AVG(r.rating_star) AS avg_rating, r.rating_comment
FROM Course c
JOIN Rating r ON c.course_id = r.course_id
GROUP BY c.course_id, c.name_course, r.rating_comment;

-- Bir Kullanıcının Kayıtlı Olduğu Kurslar (Assigned_Course + Course)
SELECT ac.user_id, c.course_id, c.name_course
FROM Assigned_Course ac
JOIN Course c ON ac.course_id = c.course_id
WHERE ac.user_id = 'U001';


-- Departmanlara Göre Kurs ve Eğitmen Bilgileri (Course + Instructor)
SELECT c.name_course, c.department, i.instructor_id, i.user_id
FROM Course c
JOIN Instructor i ON c.instructor_id = i.instructor_id;

-- Kullanıcının Değerlendirdiği Kurslar (Rating + Course)
SELECT r.user_id, c.name_course, r.rating_star, r.rating_comment
FROM Rating r
JOIN Course c ON r.course_id = c.course_id
WHERE r.user_id = 'U001';

-- En Çok Puan Alan Kurslar (Course + Rating)
SELECT c.course_id, c.name_course, AVG(r.rating_star) AS avg_rating
FROM Course c
JOIN Rating r ON c.course_id = r.course_id
GROUP BY c.course_id, c.name_course
ORDER BY avg_rating DESC
LIMIT 3;


-- Kayıt Tarihi Ekleme
UPDATE Assigned_Course
SET enroll_date = CURDATE() -- Bugünün tarihini ekler
WHERE user_id = 'U001' AND course_id = 'C002';

-- Tamamlama Tarihi Ekleme
UPDATE Assigned_Course
SET completion_date = '2025-01-15' -- Belirli bir tarih
WHERE user_id = 'U001' AND course_id = 'C002';

-- ikili bi sey varsa degistir
UPDATE tablo_adi
SET yeni_sutun = CASE
    WHEN baska_sutun = 'deger1' THEN 'yeni_deger1'
    WHEN baska_sutun = 'deger2' THEN 'yeni_deger2'
    ELSE 'varsayilan_deger'
END;
	

-- Trigger ile Kayıt Tarihini Otomatik Ekleme
DELIMITER $$

CREATE TRIGGER SetEnrollDate
BEFORE INSERT ON Assigned_Course
FOR EACH ROW
BEGIN
    SET NEW.enroll_date = CURDATE(); -- Otomatik olarak bugünün tarihini ekler
END$$

DELIMITER ;

-- Procedure ile Tamamlama Tarihi Güncelleme
DELIMITER $$

CREATE PROCEDURE UpdateCompletionDate(
    IN userID VARCHAR(9),
    IN courseID VARCHAR(9),
    IN completionDate DATE
)
BEGIN
    UPDATE Assigned_Course
    SET completion_date = completionDate
    WHERE user_id = userID AND course_id = courseID;
END$$

DELIMITER ;

CALL UpdateCompletionDate('U001', 'C002', '2025-01-15');

DELIMITER $$


-- Procedure: GetInstructorReviews
CREATE PROCEDURE GetInstructorReviews (
    IN p_instructor_id INT
)
BEGIN
    SELECT 
        r.rating_star,
        r.rating_comment,
        c.name_course
    FROM 
        Rating r
    JOIN 
        Course c ON r.course_id = c.course_id
    WHERE 
        c.instructor_id = p_instructor_id
    ORDER BY 
        r.rating_star DESC;
END;
DELIMITER $$ 

-- -- -- List of Courses the Student is Enrolled In, Along With Their Eligibility to Submit a Rating

SELECT ac.user_id, 
       c.course_id, 
       c.name_course, 
       CASE 
           WHEN EXISTS (
               SELECT 1 
               FROM Rating r 
               WHERE r.user_id = ac.user_id AND r.course_id = ac.course_id
           ) THEN 'Already Submitted'
           ELSE 'Eligible to Submit'
       END AS rating_status
FROM Assigned_Course ac
JOIN Course c ON ac.course_id = c.course_id;

-- -- -- List the Top 3 Rated Courses in Each Department

SELECT c.department, 
       c.course_id, 
       c.name_course, 
       COUNT(r.rating_id) AS num_ratings, 
       AVG(r.rating_star) AS avg_rating
FROM Course c
JOIN Rating r ON c.course_id = r.course_id
GROUP BY c.department, c.course_id, c.name_course
ORDER BY c.department, avg_rating DESC;

