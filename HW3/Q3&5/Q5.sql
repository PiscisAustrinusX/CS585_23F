CREATE EXTENSION postgis;
CREATE TABLE places (
    id serial PRIMARY KEY,
    longitude double precision NOT NULL,
    latitude double precision NOT NULL,
    official_name text NOT NULL,
    type text NOT NULL,
    abbreviation text NOT NULL,
    address text NOT NULL,
    geom geography(POINT, 4326)
);

INSERT INTO places (longitude, latitude, official_name, type, abbreviation, address) VALUES
(-118.28544, 34.02023, 'Patsy and Forrest Shumway Fountain', 'Waterwork', 'WW1', 'Childs Way'),
(-118.28875, 34.0198, 'Seaver Science Library', 'Library', 'SSL', '910 Bloom Walk'),
(-118.28994, 34.01978, 'Hughes Aircraft Electrical Engineering Center (Ming Hsieh Department of Electrical and Computer Engineering)', 'Department', 'EEB', '3740 McClintock Ave Suite 100'),
(-118.29018, 34.01871, 'Parkside Restaurant and Grill', 'Restaurant', 'PKS', '3771 McClintock Ave'),
(-118.29057, 34.02261, 'Kaprileian Hall (USC Department of Mathematics)', 'Department', 'KAP', '3620 S Vermont Ave'),
(-118.28656, 34.02325, 'USC School of Cinematic Arts', 'Department', 'SCA', '900 W 34th St'),
(-118.28376, 34.02257, 'Waterwork near Gavin Herbert Plaza', 'Waterwork', 'WW2', '801 W 34th St'),
(-118.28318, 34.02152, 'Leavey Library', 'Library', 'LVL', '651 W 34th St'),
(-118.28238, 34.02108, 'Everybody Kitchen', 'Restaurant', 'EVK', '642 W 34th St'),
(-118.28412, 34.02064, 'Doheny Memorial Library', 'Library', 'DML', '3550 Trousdale Pkwy'),
(-118.28623, 34.02564, 'USC Village Honors Dining Hall', 'Restaurant', 'MHC', '3122 McClintock Ave'),
(-118.285, 34.0252, 'Fubon Fountain', 'Waterwork', 'WW3', '3301 S Hoover St'),
(-118.28055, 34.03416, 'Home', 'Home', 'HOME', '2140 Portland St');

-- Update the geom column with the geographic coordinates
UPDATE places SET geom = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)::geography;

-- Get the Convex Hull
SELECT ST_AsKML(ST_ConvexHull(ST_Collect(geom::geometry)))
FROM places;

-- Show the 4 nearest places from HOME
WITH Home AS (
    SELECT geom FROM places WHERE places.official_name = 'Home'
)

SELECT p.official_name, p.geom, ST_Distance(h.geom, p.geom) as distance
FROM places p, Home h
WHERE p.official_name <> 'Home'
ORDER BY distance ASC
LIMIT 4;