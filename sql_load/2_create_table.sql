CREATE TABLE public.sales(
    Model TEXT,
    Year INT,
    Region TEXT,
    Color TEXT,
    Fuel_Type TEXT,
    Transmission TEXT,
    Engine_Size_L NUMERIC(3, 1),
    Mileage_KM INT,
    Price_USD INT,
    Sales_Volume INT,
    Sales_Classification TEXT
)

SELECT * 
FROM sales