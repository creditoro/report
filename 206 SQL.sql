-- The citext module provides a case-insensitive character string type, citext. 
-- Essentially, it internally calls lower when comparing values. Otherwise, it behaves almost exactly like text.
-- Source: https://www.postgresql.org/docs/9.1/citext.html
CREATE EXTENSION citext;

-- Check if the given email is valid (follows the convention: 'all valid characters' @ 'all valid characters' . 'all valid characters')
CREATE DOMAIN email AS citext
    CHECK ( value ~
            '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$' );
			
-- Create roles in the system as enums			
CREATE TYPE role AS ENUM ('royalty_user', 'channel_admin', 'system_admin');

-- Create all tables in the database
-- Create users table
CREATE TABLE users
(
    identifier	UUID	NOT NULL,
    name		VARCHAR(512),
    email		email UNIQUE NOT NULL,
    phone		VARCHAR(256),
    password	VARCHAR(256),
    role		role NOT NULL,
    created_at	TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (identifier)
);
-- Create indexes on email and name on users table using btree
CREATE INDEX users_email_idx ON users USING btree (email);
CREATE INDEX users_name_idx ON users USING btree (name);


-- Create channels table
CREATE TABLE channels
(
    identifier	UUID NOT NULL,
    name		VARCHAR(512),
	icon_url	VARCHAR(512),
    PRIMARY KEY (identifier)
);
-- Create index on  name on channels table using btree
CREATE INDEX channels_name_idx ON channels USING btree (name);


-- Create people table
CREATE TABLE people
(
    identifier	UUID NOT NULL,
    phone		VARCHAR(256),
    email		email,
    name		VARCHAR(256),
    PRIMARY KEY (identifier)
);
-- Create index on  name on people table using btree
CREATE INDEX people_name_idx ON people USING btree (name);


-- Create productions table
CREATE TABLE productions
(
    identifier	UUID NOT NULL,
    title		VARCHAR(256) NOT NULL,
    created_at	TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    producer_id	UUID REFERENCES users (identifier),
    channel_id	UUID REFERENCES channels (identifier),
	description	TEXT,
    PRIMARY KEY (identifier)
);
-- Create indexes on title and identifier on productions table using btree
CREATE INDEX production_title_idx ON productions USING btree (title);
CREATE INDEX production_identifier_idx ON productions USING btree (identifier);


-- Create credits table
CREATE TABLE credits
(
	identifier		UUID NOT NULL,
    job				VARCHAR(256) NOT NULL,
    production_id	UUID REFERENCES productions (identifier),
    person_id		UUID REFERENCES people (identifier),
    PRIMARY KEY (identifier)
);
-- Create indexes on job and identifier on credits table using btree
CREATE INDEX credit_job_idx ON credits USING btree (job);
CREATE INDEX credit_identifier_idx ON credits USING btree (identifier);


-- SQL queries
-- Insert data into tables
INSERT INTO users (name, email, phone, password, role)
VALUES ('Peter Leasy', 'en@mail.dk', '88888888', 'S0m3Pa55W0rD', 'system_admin'); 

INSERT INTO channels (name, icon_url)
VALUES ('TV2', 'https://epg-images.tv2.dk/channellogos/logo/3.png'); 

INSERT INTO people (phone, email, name)
VALUES ('12312312', 'enAnden@mail.dk', 'Jakob Jakobsen'); 

INSERT INTO productions (title, producer_id, channel_id, description)
VALUES ('Bonderøven', '6ed67a28-f288-492b-8947-d9d0e9539608', '3ee08c85-466f-4577-addc-825815ae8ad1', 'Frank har bygget en stor æblepresser – men æblerne skal lige samles, inden den kan tages i brug. Og så er der alle de andre opgaver, der presser sig på! Det når at blive snestorm, før der laves æblesaft. Til gengæld er den iskold!'); 

INSERT INTO credits (job, production_id, person_id)
VALUES ('Lydmand', '3ee08c85-466f-4577-addc-825815ae8ad1', '99bed7ec-8bf5-4be9-8514-fce0a37b028b'); 


-- Get specific production from productions table
GET * FROM productions WHERE title='Bonderøven';

-- Get name from email
GET name FROM people WHERE email='enAnden@mail.dk';

UPDATE credits SET job='Producer' WHERE identifier='3e8a6e59-5e08-4f02-b752-276713771a8a';

-- Delete a credit
DELETE FROM people WHERE identifier='3e8a6e59-5e08-4f02-b752-276713771a8a';