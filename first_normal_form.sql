\c topmodelsql



-- First Normal Form (1NF)
-- The rules to follow are:

-- We must have no duplicate rows.
-- Each cell must only contain a single value.
-- Each value cannot be split down further.

CREATE TABLE models_1nf
(
    model_id SERIAL PRIMARY KEY,
    model_name VARCHAR(100),
    area VARCHAR(50),
    price_per_event FLOAT,
    category VARCHAR(100),
    agent VARCHAR(50),
    trait VARCHAR(60),
    rating INT, 
    next_event_date DATE, 
    revenue  FLOAT
);

INSERT INTO models_1nf
    (model_name, area, price_per_event, category, agent, trait, rating, next_event_date, revenue ) 
SELECT model_name, area, price_per_event, category, agent, trait, rating, next_event_date::DATE, revenue FROM models;

CREATE TABLE brands
(
    brand_id SERIAL PRIMARY KEY,
    brand_name TEXT
);

-- string_to_table ( string text, delimiter text [, null_string text ] ) → setof text

INSERT INTO brands
    (brand_name)
SELECT DISTINCT string_to_table(brand, ', ') AS brand_name 
FROM models 
ORDER BY brand_name ASC;



CREATE TABLE models_brands
(
    model_id INT REFERENCES models_1nf(model_id),
    brand_id INT REFERENCES brands(brand_id)
);

\echo "this table"
SELECT DISTINCT string_to_table(brand, ', ') AS brand_name, model_id
FROM models
JOIN brands ON brands.brand_name = models.brand_name;


SELECT * FROM models_1nf;

SELECT * FROM brands;

SELECT * FROM models_brands;





