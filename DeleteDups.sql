

WITH CTE AS(
   SELECT RecordId,
       RN = ROW_NUMBER()OVER(PARTITION BY RecordId ORDER BY RecordId)
   FROM Kobaches
)
SELECT * FROM CTE WHERE RN > 1
--DELETE FROM CTE WHERE RN > 1
