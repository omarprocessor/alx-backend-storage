-- Task: List all bands with Glam rock as their main style, ranked by their longevity
-- The script computes lifespan as (2022 - formed) or (split - formed), whichever is applicable

SELECT band_name,
       CASE
           WHEN split IS NULL OR split = 0 THEN 2022 - formed
           ELSE split - formed
       END AS lifespan
FROM metal_bands
WHERE style = 'Glam rock'
ORDER BY lifespan DESC;
