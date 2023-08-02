--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(15) NOT NULL,
    star_id integer,
    is_near_earth boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    stars integer,
    black_holes integer,
    mass numeric(20,2) NOT NULL,
    description text,
    is_spiral boolean,
    name character varying(15) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    craters integer,
    mass numeric(20,2) NOT NULL,
    was_visited boolean,
    name character varying(15) NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    moons integer,
    rings integer,
    mass numeric(20,2) NOT NULL,
    has_life boolean,
    name character varying(15) NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    planets integer,
    comets integer,
    mass numeric(20,2) NOT NULL,
    description text,
    has_planets boolean,
    name character varying(15) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1, false);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 1, false);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 1, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 322334, 243, 27947331.98, 'The closest large galaxy to the Milky Way', true, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 9439941, 785, 8828239812.12, 'A famous galaxy system that is in process of merging its galaxies', true, 'Messier 51');
INSERT INTO public.galaxy VALUES (4, 779941, 237, 232357812.43, 'Spiral galaxy located in thhe constellation Ursa Major', true, 'Pinwheel');
INSERT INTO public.galaxy VALUES (5, 92384, 13, 12571232.53, 'Smaller companion to the Andromeda and Milky Way galaxies', true, 'Triangulum');
INSERT INTO public.galaxy VALUES (6, 6712, 21, 993438.70, 'Resembles a wide-brimmed hat', true, 'Sombrero Galaxy');
INSERT INTO public.galaxy VALUES (1, 832345, 21, 233225235.20, 'The galaxy we live in', true, 'Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 768, 7.50, true, 'The Moon', 1);
INSERT INTO public.moon VALUES (2, 57, 75.23, false, 'Fobos', 2);
INSERT INTO public.moon VALUES (3, 7, 15.23, false, 'Deimos', 2);
INSERT INTO public.moon VALUES (4, 27, 35.00, false, 'Europa', 5);
INSERT INTO public.moon VALUES (5, 60, 32.84, false, 'Io', 5);
INSERT INTO public.moon VALUES (6, 23, 92.29, false, 'Ganymede', 5);
INSERT INTO public.moon VALUES (7, 3, 33.90, false, 'Callisto', 5);
INSERT INTO public.moon VALUES (8, 79, 92.20, false, 'Amalthea', 5);
INSERT INTO public.moon VALUES (9, 19, 42.20, false, 'Himalia', 5);
INSERT INTO public.moon VALUES (10, 22, 55.63, false, 'Elara', 5);
INSERT INTO public.moon VALUES (11, 2, 75.30, false, 'Pasiphae', 5);
INSERT INTO public.moon VALUES (12, 7, 25.10, false, 'Sinope', 5);
INSERT INTO public.moon VALUES (13, 14, 68.30, false, 'Lysithea', 5);
INSERT INTO public.moon VALUES (14, 47, 28.12, false, 'Titan', 6);
INSERT INTO public.moon VALUES (15, 72, 88.12, false, 'Rhea', 6);
INSERT INTO public.moon VALUES (16, 12, 87.77, false, 'Iapetus', 6);
INSERT INTO public.moon VALUES (17, 245, 127.28, false, 'Dione', 6);
INSERT INTO public.moon VALUES (18, 41, 54.25, false, 'Tethys', 6);
INSERT INTO public.moon VALUES (19, 29, 41.35, false, 'Enceladus', 6);
INSERT INTO public.moon VALUES (20, 95, 74.54, false, 'Mimas', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 5, 2, 734.57, false, 'Kepler-90b', 7);
INSERT INTO public.planet VALUES (2, 2, 0, 253.97, false, 'Mars', 1);
INSERT INTO public.planet VALUES (3, 0, 0, 93.97, false, 'Mercury', 1);
INSERT INTO public.planet VALUES (4, 0, 0, 134.52, false, 'Venus', 1);
INSERT INTO public.planet VALUES (5, 79, 23, 876.22, false, 'Jupiter', 1);
INSERT INTO public.planet VALUES (6, 82, 78, 682.75, false, 'Saturn', 1);
INSERT INTO public.planet VALUES (7, 14, 13, 724.50, false, 'Neptune', 1);
INSERT INTO public.planet VALUES (8, 27, 5, 434.57, false, 'Uranus', 1);
INSERT INTO public.planet VALUES (1, 1, 0, 785.50, true, 'The Earth', 1);
INSERT INTO public.planet VALUES (10, 0, 0, 235.17, false, 'Kepler-90c', 7);
INSERT INTO public.planet VALUES (11, 14, 1, 532.87, false, 'HD 40307b', 8);
INSERT INTO public.planet VALUES (12, 3, 1, 437.92, false, 'HD 40307c', 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 8, 543, 21235.50, 'The star we can see every day in the skies', true, 'The Sun', 1);
INSERT INTO public.star VALUES (2, 2, 43, 52132.20, 'Is a binary system in the constellation of Andromeda', true, 'Alpheratz', 2);
INSERT INTO public.star VALUES (3, 10, 7, 92834.92, 'Evolved giant star', true, 'Mirach', 2);
INSERT INTO public.star VALUES (4, NULL, 129, 2694.12, 'Multiple star system', false, 'Nu Andromedae', 2);
INSERT INTO public.star VALUES (5, NULL, 25, 2276.62, 'The brightest star in the nigght sky', false, 'Sirius', 1);
INSERT INTO public.star VALUES (6, 58, 1827, 7162.92, 'It is very close to the Sun (25 light-years away)', true, 'Vega', 1);
INSERT INTO public.star VALUES (7, 2, 19, 2363.20, 'Was discovered by the Kepler telescope', true, 'Kepler-90', 1);
INSERT INTO public.star VALUES (8, 2, 324, 7322.10, 'K-type dwarf star in the constellation Pictor', true, 'HD 40307', 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

