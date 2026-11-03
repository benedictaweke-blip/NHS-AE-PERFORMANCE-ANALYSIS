SELECT
    reporting_month,
    SUM("A&E attendances Type 1") AS total_attendances,
    ROUND(
        100.0 * (
            SUM("A&E attendances Type 1") -
            SUM("Attendances over 4hrs Type 1")
        ) / NULLIF(SUM("A&E attendances Type 1"), 0),
        2
    ) AS performance_pct
FROM ae_monthly_2025_26
GROUP BY reporting_month
ORDER BY performance_pct ASC;