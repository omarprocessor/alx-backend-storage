-- Task: Rank country origins of bands, ordered by the number of non-unique fans
-- This script computes the ranking based on the number of fans from the 'metal_bands' table.

SELECT origin, SUM(nb_fans) AS nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;
