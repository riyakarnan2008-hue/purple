SELECT
    p.Product_ID,
    p.Product_Name,
    c.Customer_Name,
    r.Review_Text,
    rt.Rating,
    r.Review_Date
FROM PurpleProduct p
JOIN PurpleReview r
    ON p.Product_ID = r.Product_ID
JOIN PurpleCustomer c
    ON r.Customer_ID = c.Customer_ID
JOIN PurpleRating rt
    ON r.Review_ID = rt.Review_ID;


SELECT
    p.Product_ID,
    p.Product_Name,
    AVG(rt.Rating) AS Average_Rating
FROM PurpleProduct p
JOIN PurpleReview r
    ON p.Product_ID = r.Product_ID
JOIN PurpleRating rt
    ON r.Review_ID = rt.Review_ID
GROUP BY p.Product_ID, p.Product_Name;


SELECT
    p.Product_ID,
    p.Product_Name,
    AVG(rt.Rating) AS Average_Rating
FROM PurpleProduct p
JOIN PurpleReview r
    ON p.Product_ID = r.Product_ID
JOIN PurpleRating rt
    ON r.Review_ID = rt.Review_ID
GROUP BY p.Product_ID, p.Product_Name
HAVING AVG(rt.Rating) >= 4
ORDER BY Average_Rating DESC;

SELECT * FROM PurpleRating;

RATING_ID  REVIEW_ID  RATING
1          1          5
2          2          4
3          3          5
4          4          3
5          5          5
