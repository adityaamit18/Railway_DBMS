-- Instead of using a schema, we'll prefix table names with "railway_system_"
-- and remove the schema-related commands.

DROP TABLE IF EXISTS railway_system_user_login;
CREATE TABLE IF NOT EXISTS railway_system_user_login (
	user_id TEXT PRIMARY KEY,
    user_password TEXT,
    first_name TEXT,
	last_name TEXT,
	sign_up_on DATE,
	email_id TEXT
);

DROP TABLE IF EXISTS railway_system_passenger;
CREATE TABLE IF NOT EXISTS railway_system_passenger (
	passenger_id TEXT PRIMARY KEY,
    user_password TEXT,
    first_name TEXT,
	last_name TEXT,
	sign_up_on DATE,
	email_id TEXT,
	contact TEXT
);

DROP TABLE IF EXISTS railway_system_train_type;
CREATE TABLE IF NOT EXISTS railway_system_train_type (
	train_type_id TEXT PRIMARY KEY,
    train_type TEXT,
    coaches_count TEXT,
	passenger_strength TEXT,
	train_count DATE
);

DROP TABLE IF EXISTS railway_system_stations;
CREATE TABLE IF NOT EXISTS railway_system_stations (
	station_id TEXT PRIMARY KEY,
    station_name TEXT,
	city TEXT,
	state TEXT
);

DROP TABLE IF EXISTS railway_system_train_details;
CREATE TABLE IF NOT EXISTS railway_system_train_details (
	train_id TEXT PRIMARY KEY,
    train_type_id TEXT REFERENCES railway_system_train_type (train_type_id),
    source_station_id TEXT REFERENCES railway_system_stations (station_id),
	destination_station_id TEXT REFERENCES railway_system_stations (station_id),
	duration_minutes INT,
	journey_start TIMESTAMP,
	journey_end TIMESTAMP,
	passenger_strength INT,
	is_available BOOLEAN
);

DROP TABLE IF EXISTS railway_system_journey;
CREATE TABLE IF NOT EXISTS railway_system_journey (
	journey_id TEXT PRIMARY KEY,
	passenger_id TEXT REFERENCES railway_system_passenger (passenger_id),
	train_id TEXT REFERENCES railway_system_train_details (train_id),
    booking_id TEXT,
	payment_id TEXT,
	payment_status TEXT,
	paid_on TIMESTAMP,
	booking_status TEXT,
	booked_on TIMESTAMP,
	seat_alloted TEXT,
	meal_booked BOOLEAN
);

DROP TABLE IF EXISTS railway_system_train_routes;
CREATE TABLE IF NOT EXISTS railway_system_train_routes (
	row_id INTEGER PRIMARY KEY AUTOINCREMENT,
	route_id TEXT,
	train_id TEXT REFERENCES railway_system_train_details (train_id),
    station_id TEXT REFERENCES railway_system_stations (station_id),
	order_number INT,
	halt_duration_minutes INT,
	estimated_arrival TIME,
	estimated_departure TIME
);
