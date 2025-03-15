use db_university;

-- 1. Selezionare tutti gli studenti nati nel 1990
select *
from students
where date_of_birth >= '1990-01-01' AND date_of_birth < '1991-01-01';

select *
from students
where date_of_birth between '1990-01-01' AND '1991-01-01';

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti
select *
from courses
where cfu > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
select *
from students
where TIMESTAMPDIFF(year, date_of_birth, now() ) > 30;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea
select *
from courses
where period = 'I semestre' AND year = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020
select *
from exams
where date = '2020-06-20' AND hour > '14:00:00';

-- 6. Selezionare tutti i corsi di laurea magistrale
select *
from degrees
where level = 'magistrale';

-- 7. Da quanti dipartimenti è composta l'università?
select count(*) 
from departments;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono
select count(*)
from teachers
where phone is NULL;

-- 1. Contare quanti iscritti ci sono stati ogni anno
select year(enrolment_date), count(*)
from students
group by year(enrolment_date)
order by year(enrolment_date) asc;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT office_address, count(*) FROM db_university.teachers
group by office_address;
-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT exam_id,AVG(vote) FROM db_university.exam_student
group by exam_id;
-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT department_id, count(*) FROM db_university.degrees
group by department_id;

