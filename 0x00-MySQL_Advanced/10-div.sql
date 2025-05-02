-- Create the SafeDiv function
-- Returns the result of a / b, or 0 if b is 0 to avoid division by zero
DELIMITER $$

CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
  -- If b is 0, return 0
  IF b = 0 THEN
    RETURN (0);
  END IF;
  -- Otherwise, return the result of a divided by b
  RETURN (a / b);
END$$

DELIMITER ;
