-- Create the view need_meeting
-- The view lists all students who:
-- 1. Have a score strictly less than 80.
-- 2. Have no last_meeting date or their last meeting was more than 1 month ago.
CREATE VIEW need_meeting AS
SELECT name
FROM students
WHERE score < 80
AND (last_meeting IS NULL OR last_meeting < CURDATE() - INTERVAL 1 MONTH);
