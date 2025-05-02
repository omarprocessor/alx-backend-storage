-- Create the stored procedure to compute the weighted average score for all users
DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE total_score FLOAT DEFAULT 0;
    DECLARE total_weight INT DEFAULT 0;
    DECLARE weighted_score FLOAT;
    
    DECLARE done INT DEFAULT 0;
    DECLARE proj_id INT;
    DECLARE proj_weight INT;
    DECLARE proj_score FLOAT;
    DECLARE user_id INT;
    
    -- Declare a cursor to loop through all users
    DECLARE user_cursor CURSOR FOR 
        SELECT id FROM users;
        
    -- Handler for when the cursor is done
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN user_cursor;

    -- Loop through all users to compute the weighted average
    user_loop: LOOP
        FETCH user_cursor INTO user_id;
        IF done THEN
            LEAVE user_loop;
        END IF;
        
        -- Reset total_score and total_weight for each user
        SET total_score = 0;
        SET total_weight = 0;
        
        -- Declare another cursor to loop through each project assigned to the current user
        DECLARE project_cursor CURSOR FOR 
            SELECT p.id, p.weight, c.score 
            FROM projects p
            JOIN corrections c ON p.id = c.project_id
            WHERE c.user_id = user_id;

        -- Handler for when the cursor is done
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

        OPEN project_cursor;
        
        -- Loop through all projects for the user
        project_loop: LOOP
            FETCH project_cursor INTO proj_id, proj_weight, proj_score;
            IF done THEN
                LEAVE project_loop;
            END IF;
            
            -- Add the weighted score to total score
            SET weighted_score = proj_score * proj_weight;
            SET total_score = total_score + weighted_score;
            SET total_weight = total_weight + proj_weight;
        END LOOP;
        
        CLOSE project_cursor;
        
        -- Calculate and update the average weighted score for the user
        IF total_weight > 0 THEN
            UPDATE users 
            SET average_score = total_score / total_weight
            WHERE id = user_id;
        ELSE
            UPDATE users 
            SET average_score = 0
            WHERE id = user_id;
        END IF;
        
    END LOOP;
    
    CLOSE user_cursor;

END$$

DELIMITER ;
