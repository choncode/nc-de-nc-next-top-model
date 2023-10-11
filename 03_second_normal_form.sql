-- A table is in first normal form (1NF) if:

-- All columns contain only "atomic" values - no lists, arrays, nested or complex data types
-- There are no repeating groups.

-- A table is in second normal form (2NF) if:

-- It is already in 1NF.
-- All non-key columns are dependent on the full primary key.


\c topmodelsql

CREATE TABLE models_brands_2nf(
-- model_brand_id SERIAL PRIMARY KEY,
model_id INT REFERENCES models_1nf (model_id),
brand_id INT REFERENCES brands (brand_id),
PRIMARY KEY (model_id, brand_id)
);

INSERT INTO models_brands_2nf(
model_id,
brand_id
)
SELECT model_id, brand_id FROM models_brands_1nf;

SELECT * FROM models_brands_2nf;
