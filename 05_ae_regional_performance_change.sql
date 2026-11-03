WITH monthly_region AS (
    SELECT
        "Parent Org" AS region,
        reporting_month,
        100.0 * (
            SUM("A&E attendances Type 1") -
            SUM("Attendances over 4hrs Type 1")
        ) / NULLIF(SUM("A&E attendances Type 1"), 0)
          AS performance_pct
    FROM ae_monthly_2025_26
    WHERE reporting_month IN ('2025-04-01', '2026-03-01')
    GROUP BY "Parent Org", reporting_month
    HAVING SUM("A&E attendances Type 1") > 0
)
SELECT
    region,
    ROUND(MAX(CASE WHEN reporting_month = '2025-04-01'
        THEN performance_pct END), 2) AS april_2025_pct,
    ROUND(MAX(CASE WHEN reporting_month = '2026-03-01'
        THEN performance_pct END), 2) AS march_2026_pct,
    ROUND(
        MAX(CASE WHEN reporting_month = '2026-03-01'
            THEN performance_pct END) -
        MAX(CASE WHEN reporting_month = '2025-04-01'
            THEN performance_pct END),
        2
    ) AS change_percentage_points
FROM monthly_region
GROUP BY region
HAVING COUNT(DISTINCT reporting_month) = 2
ORDER BY change_percentage_points DESC;