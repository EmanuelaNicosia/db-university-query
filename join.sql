use db_university;

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
select *
from students S join degrees D ON S.degree_id = D.id
where D.name = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
select *
from degrees D join departments DEP ON D.department_id = DEP.id
where level = 'magistrale' and DEP.name = 'Dipartimento di Neuroscienze';


-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato
select *
from courses C JOIN course_teacher CT on C.id = CT.course_id
WHERE CT.teacher_id = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
-- sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
select *
from students S 
join degrees D on S.degree_id = D.id
join departments DEP on D.department_id = DEP.id
ORDER BY S.surname, S.name;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
select *
from course_teacher CT 
join courses C on CT.course_id = C.id
join teachers T on CT.teacher_id = T.id;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica
select distinct T.id,T.name,T.surname from teachers T
join course_teacher CT on CT.teacher_id = T.id
join courses C on CT.course_id = C.id
join degrees D on C.degree_id = D.id
join departments DEP on D.department_id = DEP.id
WHERE DEP.name = 'Dipartimento di Matematica';

