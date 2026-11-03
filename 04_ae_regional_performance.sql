SELECT
    "Parent Org" AS region,
    SUM("A&E attendances Type 1") AS total_attendances,
    SUM("Attendances over 4hrs Type 1") AS over_4_hours,
    ROUND(
        100.0 * (
            SUM("A&E attendances Type 1") -
            SUM("Attendances over 4hrs Type 1")
        ) / NULLIF(SUM("A&E attendances Type 1"), 0),
        2
    ) AS four_hour_performance_pct
FROM ae_monthly_2025_26
GROUP BY "Parent Org"
HAVING SUM("A&E attendances Type 1") > 0
ORDER BY four_hour_performance_pct ASC;