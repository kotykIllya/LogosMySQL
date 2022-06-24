CREATE DATABASE IF NOT EXISTS School;

USE School;

CREATE TABLE IF NOT EXISTS subject (
    subject_id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    coefficient FLOAT,
    PRIMARY KEY (subject_id)
);

CREATE TABLE IF NOT EXISTS classroom (
    classroom_id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    seats INT,
    PRIMARY KEY(classroom_id),
    subject_id INT UNIQUE,
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);

CREATE TABLE IF NOT EXISTS teacher (
    teacher_id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    dateOfBirth DATE NOT NULL,
    PRIMARY KEY(teacher_id),
    subject_id INT NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);

CREATE TABLE IF NOT EXISTS student (
    student_id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    dateOfBirth DATE NOT NULL,
    class VARCHAR(20),
    PRIMARY KEY(student_id)
);

CREATE TABLE IF NOT EXISTS teacher_student (
    teacher_id INT NOT NULL,
    student_id INT NOT NULL,
    CONSTRAINT id PRIMARY KEY (teacher_id, student_id),
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
)

# 1) Вивести всіх вчителів, які народилися пізніше ніж 1980 рік.
SELECT teacher.name, teacher.dateOfBirth FROM teacher WHERE teacher.dateOfBirth >= '1980-01-01';

# 2) Вивести всіх учнів, в яких ім’я НЕ починається на B.
SELECT student.student_id, student.name FROM student WHERE student.name NOT LIKE 'B%';

# 3) Відсортувати предмети за koef .
SELECT * FROM subject ORDER BY coefficient;

# 4) Вивести всю інформацію про найстаршого вчителя.
SELECT * FROM teacher WHERE dateOfBirth = (SELECT MIN(dateOfBirth) FROM teacher);

# 5) Вивести скільки аудиторій є у школі.
SELECT COUNT(*) FROM classroom;

# 6) Вивести загальну кількість місць у всіх аудиторіях в школі.
SELECT SUM(seats) FROM classroom;

# 7) Вивести всіх учнів, які народилися у році від 2000 до 2005.
SELECT * FROM student WHERE dateOfBirth BETWEEN '2000-01-01' AND '2005-12-31';

# 8) Перейменувати поле name у таблиці Вчитель на teacher_name
ALTER TABLE teacher RENAME COLUMN name to teacher_name;

# 9) Вивести всіх вчителів, які викладають фізику
SELECT teacher_name, subject.name FROM teacher INNER JOIN subject ON teacher.subject_id = subject.subject_id
        WHERE subject.name = 'Physics';

# 10) Вивести всіх учнів, яких вчить вчитель “Anna Robinson”
SELECT student.name, student.student_id FROM student INNER JOIN teacher ON student.student_id = teacher.teacher_id
         WHERE teacher.teacher_id = 4;

# 11) Вивести всіх вчителів, які вчать “Jon Nodtveit”
SELECT * FROM teacher INNER JOIN student ON teacher.teacher_id = student.student_id WHERE student.student_id = 'Jon Nodtveit';

# 12) Вивести аудиторію, у якій викладають біологію.
SELECT classroom.classroom_id, classroom.name, subject.name FROM classroom
    INNER JOIN subject ON classroom.subject_id = subject.subject_id WHERE subject.name = 'Mathematics';

# 13) Вивести аудиторію в якій викладає вчитель “Bob Henderson”.
SELECT classroom.classroom_id, classroom.name FROM classroom INNER JOIN teacher ON classroom.subject_id = teacher.subject_id
         WHERE teacher.teacher_name = 'Bob Henderson';

# 14) Вивести вчителі, який викладає у аудиторії для хімії.
SELECT * FROM teacher INNER JOIN classroom ON teacher.subject_id = classroom.subject_id WHERE teacher.subject_id = 1;



