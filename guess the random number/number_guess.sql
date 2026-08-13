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

DROP DATABASE random_game;
--
-- Name: random_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE random_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE random_game OWNER TO freecodecamp;

\connect random_game

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
-- Name: game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game (
    name character varying(22),
    games_played integer,
    best_score integer
);


ALTER TABLE public.game OWNER TO freecodecamp;

--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game VALUES ('spoingus', 1, 3);
INSERT INTO public.game VALUES ('bingus', 1, 3);
INSERT INTO public.game VALUES ('user_1786606202007', 1, 4);
INSERT INTO public.game VALUES ('user_1786606202006', 1, 3);
INSERT INTO public.game VALUES ('user_1786607256947', 2, 3);
INSERT INTO public.game VALUES ('user_1786607256948', 5, 2);
INSERT INTO public.game VALUES ('user_1786607331744', 2, 411);
INSERT INTO public.game VALUES ('user_1786607331745', 5, 453);
INSERT INTO public.game VALUES ('user_1786607439839', 2, 100);
INSERT INTO public.game VALUES ('user_1786607439840', 5, 157);


--
-- PostgreSQL database dump complete
--

