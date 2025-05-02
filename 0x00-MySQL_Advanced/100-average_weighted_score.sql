-- Create the stored procedure to compute the weighted average score for a user
DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE total_score FLOAT DEFAULT 0;
    DECLARE total_weight INT DEFAULT 0;
    DECLARE weighted_score FLOAT;
    
    -- Calculate the weighted score for each project assigned to the user
    DECLARE done INT DEFAULT 0;
    DECLARE proj_id INT;
    DECLARE proj_weight INT;
    DECLARE proj_score FLOAT;

    DECLARE project_cursor CURSOR FOR 
        SELECT p.id, p.weight, c.score 
        FROM projects p
        JOIN corrections c ON p.id = c.project_id
        WHERE c.user_id = user_id;

    -- Handler for when the cursor is done
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN project_cursor;
    
    read_loop: LOOP
        FETCH project_cursor INTO proj_id, proj_weight, proj_score;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Add the weighted score to total score
        SET weighted_score = proj_score * proj_weight;
        SET total_score = total_score + weighted_score;
        SET total_weight = total_weight + proj_weight;
    END LOOP;

    CLOSE project_cursor;
    
    -- Calculate the average weighted score
    IF total_weight > 0 THEN
        UPDATE users 
        SET average_score = total_score / total_weight
        WHERE id = user_id;
    ELSE
        UPDATE users 
        SET average_score = 0
        WHERE id = user_id;
    END IF;
    
END$$

DELIMITER ;
