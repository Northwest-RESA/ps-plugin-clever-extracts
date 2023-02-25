with crs_dis as (
    select '00' as code, 'Homeroom/advisory' as clever_subject, 'Local Course' as description from dual union all
    select '17' as code, 'PE and health' as clever_subject, 'HEALTH' as description from dual union all
    select '23' as code, 'English/Language Arts' as clever_subject, 'ENGLISH LANGUAGE ARTS' as description from dual union all
    select '26' as code, 'Science' as clever_subject, 'LIFE SCIENCES' as description from dual union all
    select '40' as code, 'Science' as clever_subject, 'PHYSICAL SCIENCES' as description from dual union all
    select '27' as code, 'Math' as clever_subject, 'MATHEMATICS' as description from dual union all
    select '35' as code, 'other' as clever_subject, 'PERSONAL, INTERPERSONAL, SOCIAL SKILLS, OTHER' as description from dual union all
    select '36' as code, 'PE and health' as clever_subject, 'PHYSICAL EDUCATION' as description from dual union all
    select '45' as code, 'Social studies' as clever_subject, 'SOCIAL SCIENCES' as description from dual union all
    select '50' as code, 'Arts and music' as clever_subject, 'VISUAL ARTS' as description from dual union all
    select '51' as code, 'Arts and music' as clever_subject, 'DANCE' as description from dual union all
    select '52' as code, 'Arts and music' as clever_subject, 'THEATRE ARTS' as description from dual union all
    select '53' as code, 'Arts and music' as clever_subject, 'MUSIC' as description from dual union all
    select '54' as code, 'Arts and music' as clever_subject, 'CHORUS' as description from dual union all
    select '55' as code, 'Language' as clever_subject, 'ENGLISH TO SPEAKERS OF OTHER LANGUAGES (ESOL)' as description from dual union all
    select '60' as code, 'Language' as clever_subject, 'ROMANCE LANGUAGES' as description from dual union all
    select '61' as code, 'Language' as clever_subject, 'GERMANIC, SLAVIC AND CLASSICAL LANGUAGES' as description from dual union all
    select '62' as code, 'Language' as clever_subject, 'ASIAN LANGUAGES' as description from dual union all
    select '63' as code, 'Language' as clever_subject, 'AFRICAN AND SEMITIC LANGUAGES' as description from dual union all
    select '64' as code, 'Language' as clever_subject, 'AMERICAN SIGN LANGUAGE' as description from dual union all
    select '65' as code, 'Language' as clever_subject, 'OTHER NATIVE SPEAKERS LANGUAGES' as description from dual union all
    select '66' as code, 'Language' as clever_subject, 'COMMONLY TAUGHT LANGUAGES' as description from dual union all
    select '67' as code, 'Language' as clever_subject, 'DUAL LANGUAGE IMMERSION' as description from dual union all
    select '70' as code, 'other' as clever_subject, 'PROFESSIONAL/CAREER PREPARATION (GRADES 9-12)' as description from dual union all
    select '71' as code, 'other' as clever_subject, 'GIFTED EDUCATION RESOURCE CLASSES' as description from dual union all
    select '80' as code, 'Science' as clever_subject, 'LIBRARY SCIENCE' as description from dual union all
    select '01' as code, 'Technology and engineering' as clever_subject, 'CTAE : AGRICULTURAL BUSINESS AND PRODUCTION TECHNOLOGY' as description from dual union all
    select '02' as code, 'Technology and engineering' as clever_subject, 'CTAE : AGRICULTURE SCIENCE AND TECHNOLOGY' as description from dual union all
    select '03' as code, 'Technology and engineering' as clever_subject, 'CTAE : CONSERVATION AND RENEWABLE NATURAL RESOURCES' as description from dual union all
    select '06' as code, 'Technology and engineering' as clever_subject, 'CTAE : BUSINESS, MARKETING, AND INFORMATION MANAGEMENT (GRADES 6-12)' as description from dual union all
    select '07' as code, 'Technology and engineering' as clever_subject, 'CTAE : BUSINESS, MARKETING, AND INFORMATION MANAGEMENT (GRADES 6-12)' as description from dual union all
    select '08' as code, 'Technology and engineering' as clever_subject, 'CTAE : BUSINESS, MARKETING, AND INFORMATION MANAGEMENT (GRADES 6-12)' as description from dual union all
    select '10' as code, 'Technology and engineering' as clever_subject, 'CTAE : COMMUNICATION TECHNOLOGIES' as description from dual union all
    -- 11 can be non - CTAE for certain course numbers. This could be taken into account for other purposes
    select '11' as code, 'Technology and engineering' as clever_subject, 'CTAE : INFORMATION TECHNOLOGY' as description from dual union all
    select '12' as code, 'Technology and engineering' as clever_subject, 'CTAE : HUMAN SERVICES' as description from dual union all
    select '13' as code, 'Technology and engineering' as clever_subject, 'CTAE : EDUCATION, TEACHER GENERAL (GRADES 9-12)' as description from dual union all
    select '20' as code, 'Technology and engineering' as clever_subject, 'CTAE : FAMILY AND CONSUMER SCIENCES' as description from dual union all
    select '21' as code, 'Technology and engineering' as clever_subject, 'CTAE : TECHNOLOGY EDUCATION' as description from dual union all
    select '25' as code, 'Technology and engineering' as clever_subject, 'CTAE : HEALTH SCIENCES' as description from dual union all
    select '28' as code, 'Technology and engineering' as clever_subject, 'CTAE : MILITARY SCIENCE (GRADES 9-12)' as description from dual union all
    select '29' as code, 'Technology and engineering' as clever_subject, 'CTAE : GOVERNMENT AND PUBLIC ADMINISTRATION' as description from dual union all
    select '32' as code, 'Technology and engineering' as clever_subject, 'CTAE : PROGRAM OF EDUCATION AND CAREER EXPLORATION/CAREER CONNECTION' as description from dual union all
    select '43' as code, 'Technology and engineering' as clever_subject, 'CTAE : PUBLIC SAFETY' as description from dual union all
    select '46' as code, 'Technology and engineering' as clever_subject, 'CTAE : CONSTRUCTION TECHNOLOGY' as description from dual union all
    select '47' as code, 'Technology and engineering' as clever_subject, 'CTAE : MECHANICAL OCCUPATIONS: AUTOMOTIVE TECHNOLOGY' as description from dual union all
    select '48' as code, 'Technology and engineering' as clever_subject, 'CTAE : PRECISION PRODUCTION OCCUPATIONS' as description from dual union all
    select '49' as code, 'Technology and engineering' as clever_subject, 'CTAE : MANUFACTURING SCIENCES' as description from dual
)

select * from crs_dis