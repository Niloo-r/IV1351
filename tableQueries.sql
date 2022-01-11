CREATE TABLE instrument (
 instrument_ID INT NOT NULL,
 type_of_instrument VARCHAR(100) NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_ID);


CREATE TABLE price (
 price_id INT NOT NULL,
 lesson_price INT NOT NULL,
 lesson_type VARCHAR(100) NOT NULL
);

ALTER TABLE price ADD CONSTRAINT PK_price PRIMARY KEY (price_id);


CREATE TABLE student (
 student_ID INT NOT NULL,
 name VARCHAR(100) NOT NULL,
 adress VARCHAR(100) NOT NULL,
 contact_details VARCHAR(100) NOT NULL,
 personal_number VARCHAR(12) NOT NULL,
 instrument_ID INT NOT NULL,
 family_ID VARCHAR(100) NOT NULL,
 student_app INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_ID);


CREATE TABLE discount (
 discount_ID INT NOT NULL,
 student_ID INT NOT NULL
);

ALTER TABLE discount ADD CONSTRAINT PK_discount PRIMARY KEY (discount_ID);


CREATE TABLE instructor (
 instuctor_ID INT NOT NULL,
 name VARCHAR(100) NOT NULL,
 personal_number VARCHAR(12) UNIQUE ,
 adress VARCHAR(100),
 contact_details VARCHAR(100),
 instrument_ID INT NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instuctor_ID);


CREATE TABLE lesson (
 lesson_ID INT NOT NULL,
 date DATE NOT NULL,
 price_id_0 INT NOT NULL,
 instuctor_ID INT NOT NULL,
 skill_level VARCHAR(50) NOT NULL,
 time TIME(0) NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (lesson_ID);


CREATE TABLE rentingInstrument (
 student_ID INT NOT NULL,
 instrument_ID INT NOT NULL,
 numberOfInstrument CHAR(10),
 from_to_date CHAR(10) NOT NULL,
 instrument_price CHAR(10) NOT NULL
);

ALTER TABLE rentingInstrument ADD CONSTRAINT PK_rentingInstrument PRIMARY KEY (student_ID,instrument_ID);


CREATE TABLE student_lesson (
 student_ID INT NOT NULL,
 lesson_ID INT NOT NULL
);

ALTER TABLE student_lesson ADD CONSTRAINT PK_student_lesson PRIMARY KEY (student_ID,lesson_ID);


CREATE TABLE ensemble (
 lesson_ID_0 INT NOT NULL,
 maxNumber INT NOT NULL,
 minNumber INT NOT NULL,
 genre_ID VARCHAR(100)
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (lesson_ID_0);


CREATE TABLE groupLesson (
 lesson_ID_0 INT NOT NULL,
 minNumber INT NOT NULL,
 maxNumber INT NOT NULL
);

ALTER TABLE groupLesson ADD CONSTRAINT PK_groupLesson PRIMARY KEY (lesson_ID_0);


CREATE TABLE individualLesson (
 lesson_ID_0 INT NOT NULL
);

ALTER TABLE individualLesson ADD CONSTRAINT PK_individualLesson PRIMARY KEY (lesson_ID_0);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (instrument_ID) REFERENCES instrument (instrument_ID);


ALTER TABLE discount ADD CONSTRAINT FK_discount_0 FOREIGN KEY (student_ID) REFERENCES student (student_ID);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (instrument_ID) REFERENCES instrument (instrument_ID);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (price_id_0) REFERENCES price (price_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (instuctor_ID) REFERENCES instructor (instuctor_ID);


ALTER TABLE rentingInstrument ADD CONSTRAINT FK_rentingInstrument_0 FOREIGN KEY (student_ID) REFERENCES student (student_ID);
ALTER TABLE rentingInstrument ADD CONSTRAINT FK_rentingInstrument_1 FOREIGN KEY (instrument_ID) REFERENCES instrument (instrument_ID);


ALTER TABLE student_lesson ADD CONSTRAINT FK_student_lesson_0 FOREIGN KEY (student_ID) REFERENCES student (student_ID);
ALTER TABLE student_lesson ADD CONSTRAINT FK_student_lesson_1 FOREIGN KEY (lesson_ID) REFERENCES lesson (lesson_ID);


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (lesson_ID_0) REFERENCES lesson (lesson_ID);


ALTER TABLE groupLesson ADD CONSTRAINT FK_groupLesson_0 FOREIGN KEY (lesson_ID_0) REFERENCES lesson (lesson_ID);


ALTER TABLE individualLesson ADD CONSTRAINT FK_individualLesson_0 FOREIGN KEY (lesson_ID_0) REFERENCES lesson (lesson_ID);


