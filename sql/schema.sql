CREATE TABLE machines (
    machine_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    line VARCHAR(50),
    ideal_cycle_time_sec NUMERIC(10, 2) 
);

CREATE TABLE shifts (
    shift_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    start_time TIME,
    end_time TIME
);

CREATE TABLE downtime_reasons (
    reason_code VARCHAR(20) PRIMARY KEY,
    description VARCHAR(100) NOT NULL,
    category VARCHAR(20)
);

CREATE TABLE production_runs (
    run_id SERIAL PRIMARY KEY,
    machine_id INTEGER NOT NULL REFERENCES machines(machine_id),
    shift_id INTEGER NOT NULL REFERENCES shifts(shift_id),
    run_date DATE NOT NULL,
    planned_time_min NUMERIC(6, 2) NOT NULL,
    runtime_min NUMERIC(6, 2) NOT NULL,
    total_units INTEGER NOT NULL,
    defect_units INTEGER NOT NULL
);