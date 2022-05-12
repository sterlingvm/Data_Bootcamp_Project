ALTER TABLE covid
DROP COLUMN index;

ALTER TABLE nutrition
DROP COLUMN index;

select * from covid
select * from nutrition

SELECT covid.*, nutrition."Alcoholic Beverages",nutrition."Animal Products",nutrition."Cereals - Excluding Beer",nutrition."Eggs",nutrition."Fish, Seafood",nutrition."Fruits - Excluding Wine",nutrition."Meat",nutrition."Milk - Excluding Butter",nutrition."Sugar & Sweeteners",nutrition."Treenuts",nutrition."Vegetable Oils",nutrition."Vegetables",nutrition."Vegetal Products",nutrition."Obesity",nutrition."Undernourished"
  FROM covid 
  INNER JOIN nutrition 
  ON covid."COUNTRY" = nutrition."COUNTRY"
  ORDER BY "COUNTRY";

