-
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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    user_id integer NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1675072569847', 111, 1, 734);
INSERT INTO public.users VALUES ('user_1675072569846', 113, 1, 901);
INSERT INTO public.users VALUES ('user_1675073011434', 135, 2, 257);
INSERT INTO public.users VALUES ('user_1675073419641', 151, 2, 382);
INSERT INTO public.users VALUES ('user_1675073011435', 134, 5, 154);
INSERT INTO public.users VALUES ('user_1675072665111', 119, 2, 816);
INSERT INTO public.users VALUES ('user_1675072665112', 118, 5, 119);
INSERT INTO public.users VALUES ('user_1675073061750', 137, 2, 185);
INSERT INTO public.users VALUES ('user_1675072699810', 121, 2, 597);
INSERT INTO public.users VALUES ('user_1675073419642', 150, 5, 17);
INSERT INTO public.users VALUES ('user_1675072699811', 120, 5, 252);
INSERT INTO public.users VALUES ('user_1675073061751', 136, 5, 170);
INSERT INTO public.users VALUES ('user_1675072812528', 123, 2, 460);
INSERT INTO public.users VALUES ('user_1675072812529', 122, 5, 260);
INSERT INTO public.users VALUES ('user_1675073186748', 139, 2, 60);
INSERT INTO public.users VALUES ('user_1675072852304', 126, 2, 158);
INSERT INTO public.users VALUES ('user_1675073570389', 153, 2, 531);
INSERT INTO public.users VALUES ('user_1675073186749', 138, 5, 79);
INSERT INTO public.users VALUES ('user_1675072852305', 125, 5, 204);
INSERT INTO public.users VALUES ('user_1675072875065', 127, 2, 543);
INSERT INTO public.users VALUES ('user_1675072890677', 129, 2, 309);
INSERT INTO public.users VALUES ('user_1675073206631', 141, 2, 208);
INSERT INTO public.users VALUES ('user_1675072890678', 128, 5, 122);
INSERT INTO public.users VALUES ('user_1675073570390', 152, 5, 49);
INSERT INTO public.users VALUES ('user_1675072944102', 131, 2, 570);
INSERT INTO public.users VALUES ('user_1675073206632', 140, 5, 5);
INSERT INTO public.users VALUES ('user_1675072944103', 130, 5, 127);
INSERT INTO public.users VALUES ('user_1675073581887', 155, 2, 282);
INSERT INTO public.users VALUES ('user_1675072975265', 133, 2, 475);
INSERT INTO public.users VALUES ('user_1675073263597', 143, 2, 5);
INSERT INTO public.users VALUES ('user_1675072975266', 132, 5, 123);
INSERT INTO public.users VALUES ('user_1675073263598', 142, 5, 52);
INSERT INTO public.users VALUES ('user_1675073581888', 154, 5, 276);
INSERT INTO public.users VALUES ('user_1675073268320', 145, 2, 470);
INSERT INTO public.users VALUES ('user_1675073268321', 144, 5, 132);
INSERT INTO public.users VALUES ('Chief', 124, 3, 4);
INSERT INTO public.users VALUES ('user_1675077858500', 157, 2, 182);
INSERT INTO public.users VALUES ('user_1675073368632', 147, 2, 375);
INSERT INTO public.users VALUES ('user_1675077858501', 156, 5, 276);
INSERT INTO public.users VALUES ('user_1675073368633', 146, 5, 37);
INSERT INTO public.users VALUES ('user_1675073376163', 149, 2, 409);
INSERT INTO public.users VALUES ('user_1675073376164', 148, 5, 363);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 157, true);


--
-- Name: users unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_name UNIQUE (username);


--
-- PostgreSQL database dump complete
--

