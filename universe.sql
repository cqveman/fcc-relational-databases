--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: civilization; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.civilization (
    civilization_id integer NOT NULL,
    name character varying(150) NOT NULL,
    planet_id integer,
    tech_level integer NOT NULL,
    is_spacefaring boolean NOT NULL,
    notes text
);


ALTER TABLE public.civilization OWNER TO freecodecamp;

--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.civilization_civilization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.civilization_civilization_id_seq OWNER TO freecodecamp;

--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.civilization_civilization_id_seq OWNED BY public.civilization.civilization_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(150) NOT NULL,
    type character varying(60) NOT NULL,
    num_stars integer NOT NULL,
    is_spiral boolean NOT NULL,
    description text
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
    name character varying(150) NOT NULL,
    planet_id integer NOT NULL,
    radius_km numeric(9,2) NOT NULL,
    orbital_distance_km numeric(12,2),
    has_atmosphere boolean NOT NULL,
    discovered_year integer
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
    name character varying(150) NOT NULL,
    star_id integer NOT NULL,
    mass_earth numeric(12,6) NOT NULL,
    radius_km numeric(10,2),
    num_moons integer NOT NULL,
    habitable boolean NOT NULL,
    atmosphere text
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
    name character varying(150) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(30) NOT NULL,
    mass_solar numeric(8,4),
    is_main_sequence boolean NOT NULL,
    age_myr integer NOT NULL,
    description text
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
-- Name: civilization civilization_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization ALTER COLUMN civilization_id SET DEFAULT nextval('public.civilization_civilization_id_seq'::regclass);


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
-- Data for Name: civilization; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.civilization VALUES (1, 'Terran Federation', 3, 7, true, 'Human civilization on Earth.');
INSERT INTO public.civilization VALUES (2, 'Martian Collective', 4, 4, false, 'Early-stage Martian settlement efforts.');
INSERT INTO public.civilization VALUES (3, 'Proxima Settlers', 9, 3, false, 'Hypothetical colony on Proxima-b.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 250000000, true, 'Home galaxy of the Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 1000000000, true, 'Nearest large spiral neighbor.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 40000000, true, 'Smaller spiral galaxy.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Unbarred Spiral', 80000000, true, 'Bright central bulge and dust lane.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 160000000, true, 'Interacting spiral galaxy (M51).');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 30000000, false, 'A satellite irregular galaxy.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 1737.10, 384400.00, false, -4000);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.27, 9376.00, false, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.20, 23460.00, false, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821.60, 421700.00, false, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560.80, 670900.00, false, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.10, 1070400.00, false, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.30, 1882700.00, false, 1610);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2576.00, 1221870.00, true, 1655);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 763.80, 527040.00, false, 1672);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 734.50, 3561000.00, false, 1671);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 561.40, 377400.00, false, 1684);
INSERT INTO public.moon VALUES (12, 'Miranda', 7, 235.80, 129390.00, false, 1948);
INSERT INTO public.moon VALUES (13, 'Ariel', 7, 578.90, 191020.00, false, 1851);
INSERT INTO public.moon VALUES (14, 'Umbriel', 7, 584.70, 266000.00, false, 1851);
INSERT INTO public.moon VALUES (15, 'Titania', 7, 788.90, 436300.00, false, 1787);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 761.40, 583500.00, false, 1787);
INSERT INTO public.moon VALUES (17, 'Triton', 8, 1353.40, 354760.00, true, 1846);
INSERT INTO public.moon VALUES (18, 'Nereid', 8, 170.00, 5514000.00, false, 1949);
INSERT INTO public.moon VALUES (19, 'Proxima-b-1', 9, 1300.00, 200000.00, false, 2016);
INSERT INTO public.moon VALUES (20, 'Proxima-b-2', 9, 700.00, 320000.00, false, 2019);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.055300, 2440.00, 0, false, 'Very thin exosphere');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.815000, 6051.80, 0, false, 'Thick CO2 atmosphere, high greenhouse effect');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1.000000, 6371.00, 1, true, 'Nitrogen-oxygen atmosphere');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.107000, 3389.50, 2, false, 'Thin CO2 atmosphere');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 317.800000, 69911.00, 4, false, 'Hydrogen-helium gas giant');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 95.160000, 58232.00, 4, false, 'Prominent ring system');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 14.540000, 25362.00, 5, false, 'Ice giant, tilted axis');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 17.150000, 24622.00, 2, false, 'Ice giant');
INSERT INTO public.planet VALUES (9, 'Proxima-b', 2, 1.270000, 9000.00, 0, false, 'Close-in exoplanet around Proxima Centauri');
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 4, 1.400000, 9000.00, 0, false, 'Earth-size exoplanet in habitable zone');
INSERT INTO public.planet VALUES (11, 'Rigel-1b', 3, 20.500000, 150000.00, 0, false, 'Massive hot exoplanet candidate');
INSERT INTO public.planet VALUES (12, 'Vega-7c', 4, 2.150000, 12000.00, 1, false, 'Exoplanet orbiting Vega.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1.0000, true, 4600, 'Primary star of the Solar System.');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'M5.5V', 0.1221, true, 4800, 'Closest star to the Sun.');
INSERT INTO public.star VALUES (3, 'Rigel', 1, 'B8Ia', 21.0000, false, 8, 'A luminous blue supergiant in Orion.');
INSERT INTO public.star VALUES (4, 'Vega', 1, 'A0V', 2.1350, true, 455, 'Bright star in Lyra.');
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 'G2V', 1.1000, true, 6000, 'Part of the Alpha Centauri system.');
INSERT INTO public.star VALUES (6, 'Betelgeuse', 1, 'M2Iab', 11.6000, false, 10, 'Red supergiant in Orion.');


--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.civilization_civilization_id_seq', 1, false);


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
-- Name: civilization civilization_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_name_key UNIQUE (name);


--
-- Name: civilization civilization_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_pkey PRIMARY KEY (civilization_id);


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
-- Name: civilization civilization_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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