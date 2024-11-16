CREATE DATABASE lab_courses;

-- 2
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50),
    course_code VARCHAR(10),
    credits INTEGER
);


CREATE TABLE professors (
    professor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);


CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    major VARCHAR(50),
    year_enrolled INTEGER
);


CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id),
    course_id INTEGER REFERENCES courses(course_id),
    professor_id INTEGER REFERENCES professors(professor_id),
    enrollment_date DATE
);

INSERT INTO courses (course_name, course_code, credits) VALUES
('Mathematics', 'MATH101', 4),
('Physics', 'PHYS201', 3),
('Computer Science', 'CS301', 5),
('Philosophy', 'PHIL101', 2),
('Chemistry', 'CHEM101', 4);

INSERT INTO professors (first_name, last_name, department) VALUES
('Alice', 'Smith', 'Mathematics'),
('Bob', 'Johnson', 'Physics'),
('Carol', 'Stevens', 'Computer Science'),
('David', 'Brown', 'Philosophy'),
('Eve', 'Williams', 'Chemistry');

INSERT INTO students (first_name, last_name, major, year_enrolled) VALUES
('John', 'Doe', 'Physics', 2021),
('Jane', 'Doe', 'Computer Science', 2020),
('Jim', 'Beam', 'Mathematics', 2022),
('Alice', 'Cooper', 'Philosophy', 2019),
('Bob', 'Marley', 'Chemistry', 2023);

INSERT INTO enrollments (student_id, course_id, professor_id, enrollment_date) VALUES
(1, 2, 2, '2021-09-01'),
(2, 3, 3, '2020-08-20'),
(3, 1, 1, '2022-01-15'),
(4, 4, 4, '2019-03-10'),
(1, 3, 3, '2021-09-15');


-- 3
SELECT students.first_name AS student_first_name, students.last_name AS student_last_name, courses.course_name, professors.last_name AS professor_last_name
FROM enrollments
JOIN students ON enrollments.student_id = students.student_id
JOIN courses ON enrollments.course_id = courses.course_id
JOIN professors ON enrollments.professor_id = professors.professor_id;

-- 4
SELECT students.first_name, students.last_name
FROM enrollments
JOIN students ON enrollments.student_id = students.student_id
JOIN courses ON enrollments.course_id = courses.course_id
WHERE courses.credits > 3;

-- 5
SELECT courses.course_name, COUNT(enrollments.student_id) AS student_count
FROM enrollments
JOIN courses ON enrollments.course_id = courses.course_id
GROUP BY courses.course_name;

-- 6
SELECT DISTINCT professors.first_name, professors.last_name
FROM enrollments
JOIN professors ON enrollments.professor_id = professors.professor_id;

-- 7
SELECT students.first_name, students.last_name
FROM enrollments
JOIN students ON enrollments.student_id = students.student_id
JOIN professors ON enrollments.professor_id = professors.professor_id
WHERE professors.department = 'Computer Science';

-- 8
SELECT courses.course_name, professors.last_name, courses.credits
FROM enrollments
JOIN courses ON enrollments.course_id = courses.course_id
JOIN professors ON enrollments.professor_id = professors.professor_id
WHERE professors.last_name LIKE 'S%';

-- 9
SELECT students.first_name,students.last_name
FROM enrollments
JOIN students ON enrollments.student_id = students.student_id
WHERE EXTRACT(YEAR FROM enrollments.enrollment_date) < 2022;

-- 10
SELECT courses.course_name
FROM courses
LEFT JOIN enrollments ON courses.course_id = enrollments.course_id
WHERE enrollments.enrollment_id IS NULL;
