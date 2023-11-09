USE project_sql_course;

# 1. Create a script to populate the database
INSERT INTO student (student_name)
VALUES
('Student One'),
('Student Two'),
('Student Three');

INSERT INTO professor (professor_name)
VALUES
('Professor One'),
('Professor Two'),
('Professor Three');

INSERT INTO course (course_name, course_professor_id)
VALUES
('Math', 1),
('English', 2),
('Geography',3),
('Art', 1);

INSERT INTO grade (grade_value, grade_student_id, grade_course_id)
VALUES
(055.0, 1, 1),
(040.5, 1, 2),
(060.0, 1, 3),
(095.0, 1, 4),
(055.5, 2, 1),
(020.0, 2, 2),
(085.0, 2, 3),
(065.5, 2, 4),
(075.5, 3, 1),
(050.0, 3, 2),
(070.0, 3, 3),
(095.5, 3, 4);

# 2. Top grades for each student
SELECT s.student_name, MAX(g.grade_value) AS top_grade
FROM student s
JOIN grade g
ON s.student_id = g.grade_student_id
GROUP BY s.student_name;

#3. Sort students by course
SELECT c.course_name, s.student_name 
FROM course c
JOIN grade g
ON c.course_id = g.grade_course_id
JOIN student s
ON g.grade_student_id = s.student_id
ORDER BY c.course_name ASC, s.student_name ASC;

#4. Summary report of courses and grades
SELECT c.course_name, AVG(g.grade_value) AS grade_average
FROM course c
JOIN grade g
ON c.course_id = g.grade_course_id
GROUP BY c.course_name
ORDER BY grade_average ASC;

#5. Student and professor course in common
SELECT s.student_name, p.professor_name, COUNT(c.course_name) AS total_courses
FROM
student s
JOIN
grade g 
ON s.student_id = g.grade_student_id
JOIN
course c
ON g.grade_course_id = c.course_id
JOIN
professor p 
ON c.course_professor_id = p.professor_id
GROUP BY
s.student_name, p.professor_name
ORDER BY total_courses DESC;




