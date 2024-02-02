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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.games (game_id, year, round, winner_id, opponent_id, winner_goals, opponent_goals) FROM stdin;
225	2018	Final	434	435	4	2
226	2018	Third Place	436	437	2	0
227	2018	Semi-Final	435	437	2	1
228	2018	Semi-Final	434	436	1	0
229	2018	Quarter-Final	435	438	3	2
230	2018	Quarter-Final	437	439	2	0
231	2018	Quarter-Final	436	440	2	1
232	2018	Quarter-Final	434	441	2	0
233	2018	Eighth-Final	437	442	2	1
234	2018	Eighth-Final	439	443	1	0
235	2018	Eighth-Final	436	444	3	2
236	2018	Eighth-Final	440	445	2	0
237	2018	Eighth-Final	435	446	2	1
238	2018	Eighth-Final	438	447	2	1
239	2018	Eighth-Final	441	448	2	1
240	2018	Eighth-Final	434	449	4	3
241	2014	Final	450	449	1	0
242	2014	Third Place	451	440	3	0
243	2014	Semi-Final	449	451	1	0
244	2014	Semi-Final	450	440	7	1
245	2014	Quarter-Final	451	452	1	0
246	2014	Quarter-Final	449	436	1	0
247	2014	Quarter-Final	440	442	2	1
248	2014	Quarter-Final	450	434	1	0
249	2014	Eighth-Final	440	453	2	1
250	2014	Eighth-Final	442	441	2	0
251	2014	Eighth-Final	434	454	2	0
252	2014	Eighth-Final	450	455	2	1
253	2014	Eighth-Final	451	445	2	1
254	2014	Eighth-Final	452	456	2	1
255	2014	Eighth-Final	449	443	1	0
256	2014	Eighth-Final	436	457	2	1
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.teams (team_id, name) FROM stdin;
434	France
435	Croatia
436	Belgium
437	England
438	Russia
439	Sweden
440	Brazil
441	Uruguay
442	Colombia
443	Switzerland
444	Japan
445	Mexico
446	Denmark
447	Spain
448	Portugal
449	Argentina
450	Germany
451	Netherlands
452	Costa Rica
453	Chile
454	Nigeria
455	Algeria
456	Greece
457	United States
\.


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 256, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 457, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

