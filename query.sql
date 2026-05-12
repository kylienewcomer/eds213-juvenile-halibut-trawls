How does fish catch vary by location and season


--- Start by looking at average count of halibut by site and season
SELECT AVG(halibut_100m2) as Avg_hal_per_100m2, location, season FROM Trawl
    JOIN Site ON loc = location_abbreviation
    GROUP BY location, season
    ORDER BY season, AVG(halibut_100m2) DESC;

--- Average size of halibut caught
SELECT AVG(halibut_total_length_mm) as Avg_hal_length, location, season FROM Halibut
    JOIN Trawl USING (trawl_id)
    JOIN Site ON loc = location_abbreviation
    GROUP BY location, season
    ORDER BY season, AVG(halibut_total_length_mm) DESC;

--- Sites with most diversity
SELECT COUNT (DISTINCT common_name) as Unique_species, location FROM Species
    JOIN Trawl USING (trawl_id)
    JOIN Site ON loc = location_abbreviation
    GROUP BY location
    ORDER BY COUNT (DISTINCT common_name) DESC;
