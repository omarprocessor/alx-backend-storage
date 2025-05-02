-- Set custom delimiter to allow procedure definition
DELIMITER $$

-- Create stored procedure to compute and update a user's average score
CREATE PROCEDURE ComputeAverageScoreForUser (
    IN in_user_id INT -- Input: ID of the user
)
BEGIN
    DECLARE avg_score FLOAT; -- Variable to store calculated average

    -- Calculate the average score for the given user from the corrections table
    SELECT AVG(score)
    INTO avg_score
    FROM corrections
    WHERE user_id = in_user_id;

    -- Update the user's average_score in the users table
    UPDATE users
    SET average_score = avg_score
    WHERE id = in_user_id;
END$$

-- Restore default delimiter
DELIMITER ;
