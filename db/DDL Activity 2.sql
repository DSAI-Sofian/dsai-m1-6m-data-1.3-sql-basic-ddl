CREATE TABLE lesson.students (
    id INTEGER PRIMARY KEY,
    name VARCHAR,
    address VARCHAR,
    phone VARCHAR,
    email VARCHAR CHECK(CONTAINS(email, '@')),
    class_id INTEGER REFERENCES lesson.classes(id)
);


CREATE TABLE lesson.teachers (
    id INTEGER PRIMARY KEY,
    name VARCHAR,
    age INTEGER CHECK(age > 18 and age < 70),
    address VARCHAR,
    phone VARCHAR,
    email VARCHAR CHECK(CONTAINS(email, '@'))
);

CREATE TABLE lesson.classes (
    id INTEGER PRIMARY KEY,
    name VARCHAR,
    teacher_id INTEGER REFERENCES lesson.teachers(id)
);


COPY lesson.teachers FROM '\\wsl.localhost\Ubuntu\home\s_sofian\dsai\6m-data-1.3-sql-basic-ddl\data\teachers.csv' (AUTO_DETECT TRUE);

COPY lesson.students FROM '\\wsl.localhost\Ubuntu\home\s_sofian\dsai\6m-data-1.3-sql-basic-ddl\data\students.csv' (AUTO_DETECT TRUE);

COPY lesson.classes FROM '\\wsl.localhost\Ubuntu\home\s_sofian\dsai\6m-data-1.3-sql-basic-ddl\data\classes.csv' (AUTO_DETECT TRUE);

UPDATE lesson.students
SET email = 'linda.g@example.com'
WHERE id = 4

SELECT * FROM lesson.students;

COPY (SELECT * FROM lesson.students) TO '\\wsl.localhost\Ubuntu\home\s_sofian\dsai\6m-data-1.3-sql-basic-ddl\data\students_new.csv' WITH (HEADER 1, DELIMITER '|');

COPY (SELECT * FROM lesson.students) TO '\\wsl.localhost\Ubuntu\home\s_sofian\dsai\6m-data-1.3-sql-basic-ddl\data\students_new.json';

COPY (SELECT * FROM lesson.teachers) TO '\\wsl.localhost\Ubuntu\home\s_sofian\dsai\6m-data-1.3-sql-basic-ddl\data\teachers_new.csv' WITH (HEADER 1, DELIMITER '|');

COPY (SELECT * FROM lesson.teachers) TO '\\wsl.localhost\Ubuntu\home\s_sofian\dsai\6m-data-1.3-sql-basic-ddl\data\teachers_new.json';

COPY (SELECT * FROM lesson.classes) TO '\\wsl.localhost\Ubuntu\home\s_sofian\dsai\6m-data-1.3-sql-basic-ddl\data\classes_new.csv' WITH (HEADER 1, DELIMITER '|');

COPY (SELECT * FROM lesson.classes) TO '\\wsl.localhost\Ubuntu\home\s_sofian\dsai\6m-data-1.3-sql-basic-ddl\data\classes_new.json';

