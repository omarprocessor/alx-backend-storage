-- Create a composite index on the first character of the 'name' column and the 'score' column
-- This improves performance for queries like: WHERE name LIKE 'a%' AND score < 80
CREATE INDEX idx_name_first_score
ON names(name(1), score);
