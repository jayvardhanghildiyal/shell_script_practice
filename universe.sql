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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_size numeric(3,1) NOT NULL,
    name character varying(30),
    galaxy_destroyed boolean,
    col integer
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
    moon_story text NOT NULL,
    name character varying(30),
    moon_loved boolean,
    planet_id integer,
    col integer
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
    planet_size integer NOT NULL,
    name character varying(30),
    star_id integer,
    col integer
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
    star_size integer NOT NULL,
    name character varying(30),
    galaxy_id integer,
    col integer
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
-- Name: trade; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.trade (
    name character varying(30) NOT NULL,
    trade_id integer NOT NULL,
    meow integer,
    col integer
);


ALTER TABLE public.trade OWNER TO freecodecamp;

--
-- Name: trade_trade_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.trade_trade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trade_trade_id_seq OWNER TO freecodecamp;

--
-- Name: trade_trade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.trade_trade_id_seq OWNED BY public.trade.trade_id;


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
-- Name: trade trade_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.trade ALTER COLUMN trade_id SET DEFAULT nextval('public.trade_trade_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 22.3, 'spoingus', false, NULL);
INSERT INTO public.galaxy VALUES (2, 18.9, 'boingus', false, NULL);
INSERT INTO public.galaxy VALUES (3, 31.2, 'bingus', true, NULL);
INSERT INTO public.galaxy VALUES (4, 30.0, 'a', true, NULL);
INSERT INTO public.galaxy VALUES (5, 40.0, 'b', true, NULL);
INSERT INTO public.galaxy VALUES (6, 50.0, 'c', true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'the parting from boingus', 'sog', true, 1, NULL);
INSERT INTO public.moon VALUES (2, 'a', '2', false, 2, NULL);
INSERT INTO public.moon VALUES (3, 'b', '3', true, 2, NULL);
INSERT INTO public.moon VALUES (4, 'c', '4', false, 3, NULL);
INSERT INTO public.moon VALUES (5, 'd', '5', false, 3, NULL);
INSERT INTO public.moon VALUES (6, 'e', '6', false, 4, NULL);
INSERT INTO public.moon VALUES (7, 'f', '7', false, 4, NULL);
INSERT INTO public.moon VALUES (8, 'g', '8', false, 5, NULL);
INSERT INTO public.moon VALUES (9, 'h', '9', false, 5, NULL);
INSERT INTO public.moon VALUES (10, 'i', '10', false, 6, NULL);
INSERT INTO public.moon VALUES (11, 'j', '11', false, 6, NULL);
INSERT INTO public.moon VALUES (12, 'k', '12', false, 6, NULL);
INSERT INTO public.moon VALUES (13, 'a', '2', false, 2, NULL);
INSERT INTO public.moon VALUES (14, 'b', '3', true, 2, NULL);
INSERT INTO public.moon VALUES (15, 'c', '4', false, 3, NULL);
INSERT INTO public.moon VALUES (16, 'd', '5', false, 3, NULL);
INSERT INTO public.moon VALUES (17, 'e', '6', false, 4, NULL);
INSERT INTO public.moon VALUES (18, 'f', '7', false, 4, NULL);
INSERT INTO public.moon VALUES (19, 'g', '8', false, 5, NULL);
INSERT INTO public.moon VALUES (20, 'h', '9', false, 5, NULL);
INSERT INTO public.moon VALUES (21, 'i', '10', false, 6, NULL);
INSERT INTO public.moon VALUES (22, 'j', '11', false, 6, NULL);
INSERT INTO public.moon VALUES (23, 'k', '12', false, 6, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'spog', 1, NULL);
INSERT INTO public.planet VALUES (2, 2, 'a', 2, NULL);
INSERT INTO public.planet VALUES (3, 3, 'b', 2, NULL);
INSERT INTO public.planet VALUES (4, 4, 'c', 3, NULL);
INSERT INTO public.planet VALUES (5, 5, 'd', 3, NULL);
INSERT INTO public.planet VALUES (6, 6, 'e', 4, NULL);
INSERT INTO public.planet VALUES (7, 7, 'f', 4, NULL);
INSERT INTO public.planet VALUES (8, 8, 'g', 5, NULL);
INSERT INTO public.planet VALUES (9, 9, 'h', 5, NULL);
INSERT INTO public.planet VALUES (10, 10, 'i', 6, NULL);
INSERT INTO public.planet VALUES (11, 11, 'j', 6, NULL);
INSERT INTO public.planet VALUES (12, 12, 'k', 6, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 2, 'spong', 1, NULL);
INSERT INTO public.star VALUES (2, 3, 'a', 1, NULL);
INSERT INTO public.star VALUES (3, 4, 'b', 4, NULL);
INSERT INTO public.star VALUES (4, 5, 'c', 4, NULL);
INSERT INTO public.star VALUES (5, 6, 'd', 5, NULL);
INSERT INTO public.star VALUES (6, 7, 'e', 6, NULL);


--
-- Data for Name: trade; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.trade VALUES ('bing', 1, NULL, NULL);
INSERT INTO public.trade VALUES ('bang', 2, NULL, NULL);
INSERT INTO public.trade VALUES ('boom', 3, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: trade_trade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.trade_trade_id_seq', 3, true);


--
-- Name: galaxy galaxy_col_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_col_key UNIQUE (col);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_col_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_col_key UNIQUE (col);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_col_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_col_key UNIQUE (col);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_col_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_col_key UNIQUE (col);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: trade trade_col_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.trade
    ADD CONSTRAINT trade_col_key UNIQUE (col);


--
-- Name: trade trade_meow_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.trade
    ADD CONSTRAINT trade_meow_key UNIQUE (meow);


--
-- Name: trade trade_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.trade
    ADD CONSTRAINT trade_pkey PRIMARY KEY (trade_id);


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

