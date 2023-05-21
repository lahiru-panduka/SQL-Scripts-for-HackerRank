SELECT
    IIF(grade < 8, NULL, name),
    Grade,
    marks
FROM students
JOIN Grades
    ON students.marks BETWEEN Min_mark AND Max_Mark
ORDER BY grade DESC, name;