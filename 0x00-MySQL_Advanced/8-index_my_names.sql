-- Create an index on the first character of the 'name' column
-- This improves performance for queries like: WHERE name LIKE 'a%'
CREATE INDEX idx_name_first
ON names(name(1));
