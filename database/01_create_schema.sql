-- Delete the clients table if it already exists
DROP TABLE IF EXISTS clients;

-- Create a new table named clients
CREATE TABLE clients (
    id INT PRIMARY KEY,
    nom TEXT,
    ville TEXT,
    age INT,
    email VARCHAR(100)
); 