case 
    when length(c.course_number) = 9 and substr(c.course_number, 1, 2 ) <> '00'
        then substr(c.course_number, 1, 2) || '0' || substr(c.course_number, 3, 4) || '00'
    when length(c.course_number) = 9 and substr(c.course_number, 1, 2) = '00' then 'Local Course Number' 
    else 'Not a Valide State Course' 
end  as state_course_number