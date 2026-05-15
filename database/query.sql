How does halibut size vary by location and season

--- Average size of halibut caught
SELECT AVG(halibut_total_length_mm) as Avg_hal_length, location, season FROM Halibut
    JOIN Trawl USING (trawl_id)
    JOIN Site ON loc = location_abbreviation
    GROUP BY location, season
    ORDER BY season, AVG(halibut_total_length_mm) DESC;

