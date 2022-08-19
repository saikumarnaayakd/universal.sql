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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    has_planets boolean,
    has_stars boolean,
    age integer,
    size integer,
    dist_from_earth numeric(5,2)
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
-- Name: galaxy_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_planets (
    galaxy_planets_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer,
    planet_id integer,
    moon_id integer,
    name character varying(60)
);


ALTER TABLE public.galaxy_planets OWNER TO freecodecamp;

--
-- Name: galaxy_planets_galaxy_planets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_planets_galaxy_planets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_planets_galaxy_planets_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_planets_galaxy_planets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_planets_galaxy_planets_id_seq OWNED BY public.galaxy_planets.galaxy_planets_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age integer,
    size integer,
    dist_from_earth numeric(5,2),
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
    name character varying(60) NOT NULL,
    description text,
    has_satellites boolean,
    is_spherical boolean,
    age integer,
    size integer,
    dist_from_sun numeric(5,2),
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
    name character varying(60) NOT NULL,
    description text,
    is_independent boolean,
    has_planets boolean,
    age integer,
    size integer,
    dist_from_earth numeric(5,2),
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_planets galaxy_planets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planets ALTER COLUMN galaxy_planets_id SET DEFAULT nextval('public.galaxy_planets_galaxy_planets_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milkyway', 'this is milky wya galaxy', true, true, 174, 999, 153.05);
INSERT INTO public.galaxy VALUES (2, 'NGC 7541', 'this is a circular galaxy', true, true, 198, 999, 149.03);
INSERT INTO public.galaxy VALUES (3, 'NGC 3021', 'this is rasengan type galaxy', true, true, 1785, 988, 149.02);
INSERT INTO public.galaxy VALUES (4, 'NGC 5643', 'galactic nucleus ', true, true, 4040, 986, 40.00);
INSERT INTO public.galaxy VALUES (8, 'NGC 3147', 'draco circo', true, true, 1769, 3147, 130.03);
INSERT INTO public.galaxy VALUES (9, 'NGC 3254', 'this is also rasengan type galaxy', true, true, 1786, 888, 60.00);


--
-- Data for Name: galaxy_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_planets VALUES (1, 1, 7, 3, 3, 'guess');
INSERT INTO public.galaxy_planets VALUES (2, 2, 8, 4, 4, 'what');
INSERT INTO public.galaxy_planets VALUES (3, 4, 12, 5, 5, 'kidding');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 'its for earth', false, true, 111, 111, 11.00, 2);
INSERT INTO public.moon VALUES (2, 'ganymede', 'its for jupiter', false, true, 121, 121, 12.00, 7);
INSERT INTO public.moon VALUES (3, 'titania', 'for uranus', false, true, 131, 131, 13.00, 9);
INSERT INTO public.moon VALUES (4, 'phoebe', 'its for saturn', false, true, 141, 141, 14.00, 6);
INSERT INTO public.moon VALUES (5, 'dione', 'for saturn', false, true, 141, 141, 14.00, 6);
INSERT INTO public.moon VALUES (6, 'prometheus', 'for saturn', false, true, 151, 151, 15.00, 6);
INSERT INTO public.moon VALUES (7, 'despine', 'its for neptune', false, true, 161, 161, 16.00, 8);
INSERT INTO public.moon VALUES (8, 'proteus', 'for neptune', false, true, 161, 161, 16.00, 8);
INSERT INTO public.moon VALUES (9, 'tritan', 'for neptune', false, true, 161, 161, 16.00, 8);
INSERT INTO public.moon VALUES (10, 'thalassa', 'for neptune', false, true, 161, 161, 16.00, 8);
INSERT INTO public.moon VALUES (11, 'sao', 'its for neptune', false, true, 161, 161, 16.00, 8);
INSERT INTO public.moon VALUES (12, 'halimede', 'for neptune', false, true, 161, 161, 16.00, 8);
INSERT INTO public.moon VALUES (13, 'neried', 'for neptune', false, true, 161, 161, 16.00, 8);
INSERT INTO public.moon VALUES (14, 'larissa', 'for neptune', false, true, 161, 161, 16.00, 8);
INSERT INTO public.moon VALUES (15, 'neso', 'its for neptune', false, true, 161, 161, 16.00, 8);
INSERT INTO public.moon VALUES (16, 'psamathe', 'for neptune', false, true, 161, 161, 16.00, 8);
INSERT INTO public.moon VALUES (17, 'leomediea', 'for neptune', false, true, 161, 161, 16.00, 8);
INSERT INTO public.moon VALUES (18, 'mimas', 'for saturn', false, true, 151, 151, 15.00, 6);
INSERT INTO public.moon VALUES (19, 'lapetus', 'its for saturn', false, true, 151, 151, 15.00, 6);
INSERT INTO public.moon VALUES (20, 'thetys', 'for saturn', false, true, 151, 151, 15.00, 6);
INSERT INTO public.moon VALUES (21, 'Enceladus', 'for saturn', false, true, 151, 151, 15.00, 6);
INSERT INTO public.moon VALUES (22, 'rhea', 'for saturn', false, true, 151, 151, 15.00, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'mercury', 'the smallest planet', true, true, 123, 234, 123.00, 7);
INSERT INTO public.planet VALUES (3, 'venus', 'the thick atmosphere planet', true, true, 124, 234, 124.00, 7);
INSERT INTO public.planet VALUES (4, 'earth', 'the liquid water  planet', true, true, 124, 234, 124.00, 8);
INSERT INTO public.planet VALUES (5, 'mars', 'biggeest planet in the soloar', true, true, 234, 457, 144.00, 8);
INSERT INTO public.planet VALUES (6, 'saturn', 'uniqueplanet', true, true, 124, 234, 124.00, 9);
INSERT INTO public.planet VALUES (7, 'jupiter', 'great redspot planet in the soloar', true, true, 234, 457, 144.00, 9);
INSERT INTO public.planet VALUES (8, 'neptune', 'dark cold and whipped', true, true, 749, 987, 199.00, 10);
INSERT INTO public.planet VALUES (9, 'uranus', '90 degree rotation planet in the soloar', true, true, 567, 957, 146.00, 10);
INSERT INTO public.planet VALUES (10, 'kepler-22b', 'away from 600light years', true, true, 745, 596, 987.00, 11);
INSERT INTO public.planet VALUES (11, 'gliese', 'this is an artistic ', true, true, 159, 989, 963.00, 11);
INSERT INTO public.planet VALUES (12, 'trapist', 'away far away', true, true, 741, 591, 981.00, 12);
INSERT INTO public.planet VALUES (13, 'proxima', 'this is another earth ', true, true, 354, 982, 962.00, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'andromeda', 'the horse', true, true, 90, 100, 150.00, 1);
INSERT INTO public.star VALUES (8, 'antlia', 'the pump', true, false, 91, 101, 151.00, 2);
INSERT INTO public.star VALUES (9, 'apus', 'the bird of paradise', false, false, 92, 102, 152.00, 3);
INSERT INTO public.star VALUES (10, 'aquarius', 'the water carrier', true, true, 93, 103, 153.00, 4);
INSERT INTO public.star VALUES (11, 'aquila', 'the eagle', true, false, 94, 104, 154.00, 8);
INSERT INTO public.star VALUES (12, 'ara', 'the alter', false, false, 95, 105, 155.00, 9);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: galaxy_planets_galaxy_planets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_planets_galaxy_planets_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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
-- Name: galaxy_planets galaxy_planets_galaxy_planets_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planets
    ADD CONSTRAINT galaxy_planets_galaxy_planets_id_key UNIQUE (galaxy_planets_id);


--
-- Name: galaxy_planets galaxy_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planets
    ADD CONSTRAINT galaxy_planets_pkey PRIMARY KEY (galaxy_planets_id);


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
-- Name: galaxy_planets galaxy_planets_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planets
    ADD CONSTRAINT galaxy_planets_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_planets galaxy_planets_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planets
    ADD CONSTRAINT galaxy_planets_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: galaxy_planets galaxy_planets_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planets
    ADD CONSTRAINT galaxy_planets_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: galaxy_planets galaxy_planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planets
    ADD CONSTRAINT galaxy_planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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
-- Name: planet planet_star_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey1 FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey1 FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

