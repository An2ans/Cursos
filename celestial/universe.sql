--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    symbolism character varying(30)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    constellation_id integer,
    name character varying(30) NOT NULL,
    distance_from_earth_ly bigint,
    galaxy_type character varying(30)
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
    planet_id integer,
    name character varying(30) NOT NULL,
    has_life boolean,
    order_distance_to_planet integer
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
    star_id integer,
    name character varying(30) NOT NULL,
    description text,
    planet_type character varying(30),
    has_life boolean,
    satellites integer
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
    galaxy_id integer,
    name character varying(30) NOT NULL,
    star_type character varying(30),
    age_in_millions_of_years bigint,
    absolute_magnitude numeric
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Sagittarius', 'the Archer');
INSERT INTO public.constellation VALUES (2, 'Draco', 'the Dragon');
INSERT INTO public.constellation VALUES (3, 'Andromeda', 'the Chained Woman');
INSERT INTO public.constellation VALUES (4, 'Centaurus', 'the Centaur');
INSERT INTO public.constellation VALUES (5, 'Corvus', 'the Crow');
INSERT INTO public.constellation VALUES (6, 'Virgo', 'the Maiden');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 1, 'Milky Way', 25881, 'barred spiral galaxy');
INSERT INTO public.galaxy VALUES (2, 3, 'Andromeda', 2500000, 'barred spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 4, 'Backward galaxy', 200000000, 'unbarred spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 2, 'Tadpole Galaxy', 400000000, 'barred spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 4, 'Centaurus A', 11000000, 'lenticular galaxy');
INSERT INTO public.galaxy VALUES (6, 5, 'Antennae Galaxies', 45000000, 'Small Magellanic Cloud');
INSERT INTO public.galaxy VALUES (7, 6, 'Sombrero Galaxy', 31100000, 'elliptical galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Luna', false, 1);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', false, 1);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', false, 2);
INSERT INTO public.moon VALUES (4, 5, 'Io', false, 1);
INSERT INTO public.moon VALUES (5, 5, 'Europa', false, 2);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', false, 3);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', false, 4);
INSERT INTO public.moon VALUES (8, 5, 'Amalthea', false, 5);
INSERT INTO public.moon VALUES (9, 5, 'Himalia', false, 6);
INSERT INTO public.moon VALUES (10, 5, 'Elara', false, 7);
INSERT INTO public.moon VALUES (11, 5, 'Pasiphae', false, 8);
INSERT INTO public.moon VALUES (12, 5, 'Sinope', false, 9);
INSERT INTO public.moon VALUES (13, 5, 'Lysithea', false, 10);
INSERT INTO public.moon VALUES (14, 6, 'Mimas', false, 1);
INSERT INTO public.moon VALUES (15, 6, 'Enceladus', false, 2);
INSERT INTO public.moon VALUES (16, 6, 'Tethys', false, 3);
INSERT INTO public.moon VALUES (17, 6, 'Dione', false, 4);
INSERT INTO public.moon VALUES (18, 6, 'Rhea', false, 5);
INSERT INTO public.moon VALUES (19, 6, 'Titan', false, 6);
INSERT INTO public.moon VALUES (20, 6, 'Iapetus', false, 7);
INSERT INTO public.moon VALUES (21, 7, 'Miranda', false, 1);
INSERT INTO public.moon VALUES (22, 7, 'Ariel', false, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Mercury is the first planet from the Sun and the smallest in the Solar System. In English, it is named after the ancient Roman god Mercurius (Mercury), god of commerce and communication, and the messenger of the gods.', 'Terrestrial planet', false, 0);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Venus is the second planet from the Sun. It is a terrestrial planet and is the closest in mass and size to its orbital neighbour Earth. Venus has by far the densest atmosphere of the terrestrial planets, composed mostly of carbon dioxide with a thick, global sulfuric acid cloud cover.', 'Terrestrial planet', false, 0);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Earth is the third planet from the Sun and the only astronomical object known to harbor life. This is enabled by Earth being an ocean world, the only one in the Solar System sustaining liquid surface water. Almost all of Earth''s water is contained in its global ocean, covering 70.8% of Earth''s crust. The remaining 29.2% of Earth''s crust is land, most of which is located in the form of continental landmasses within Earth''s land hemisphere.', 'Ocean planet', true, 1);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Mars is the fourth planet from the Sun. The surface of Mars is orange-red because it is covered in iron(III) oxide dust, giving it the nickname "the Red Planet". Mars is among the brightest objects in Earth''s sky, and its high-contrast albedo features have made it a common subject for telescope viewing.', 'Terrestrial planet', false, 2);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than 2.5 times that of all the other planets in the Solar System combined and slightly less than one-thousandth the mass of the Sun. Its diameter is eleven times that of Earth, and a tenth that of the Sun.', 'Gas giant', false, 95);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'Saturn is the sixth planet from the Sun and the second largest in the Solar System, after Jupiter. It is a gas giant, with an average radius of about nine times that of Earth. It has an eighth the average density of Earth, but is over 95 times more massive. Even though Saturn is almost as big as Jupiter, Saturn has less than a third the mass of Jupiter.', 'Gas giant', false, 146);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'Uranus is the seventh planet from the Sun. It is a gaseous cyan-coloured ice giant. Most of the planet is made of water, ammonia, and methane in a supercritical phase of matter, which astronomy calls "ice" or volatiles. The planet''s atmosphere has a complex layered cloud structure and has the lowest minimum temperature (49 K (−224 °C; −371 °F)) of all the Solar System''s planets.', 'Ice giant', false, 28);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'Neptune is the eighth and farthest known planet from the Sun. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth and slightly more massive, but denser and smaller, than fellow ice giant Uranus.', 'Ice giant', false, 16);
INSERT INTO public.planet VALUES (9, 1, 'Pluto', 'Pluto (minor-planet designation: 134340 Pluto) is a dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune. It is the ninth-largest and tenth-most-massive known object to directly orbit the Sun. It is the largest known trans-Neptunian object by volume.', 'Dwarf planet', false, 5);
INSERT INTO public.planet VALUES (10, 6, 'Proxima Centauri b', 'Proxima Centauri b is an exoplanet orbiting within the habitable zone of the red dwarf star Proxima Centauri, which is the closest star to the Sun. The planet orbits within the habitable zone of its parent star; but it is not known whether it has an atmosphere, which would impact the habitability probabilities. Proxima Centauri is a flare star with intense emission of electromagnetic radiation that could strip an atmosphere off the planet.', 'Terrestrial planet', false, 0);
INSERT INTO public.planet VALUES (11, 6, 'Proxima Centauri d', 'Proxima Centauri d is a candidate exoplanet orbiting the red dwarf star Proxima Centauri, the closest star to the Sun. Proxima d is a sub-Earth at least one-quarter of the mass of Earth (or twice the mass of Mars), orbiting at roughly 0.029 AU every 5.1 days. It is the least massive and innermost known planet of the Proxima Centauri system.', 'Terrestrial planet', false, 0);
INSERT INTO public.planet VALUES (12, 6, 'Proxima Centauri c', 'Proxima Centauri c is a controversial exoplanet candidate claimed to be orbiting the red dwarf star Proxima Centauri, which is the closest star to the Sun. Proxima Centauri c is a super-Earth or mini-Neptune about 7 times as massive as Earth, orbiting at roughly 1.49 AU every 1,928 days (5.28 yr). Due to its large mass and its distance from Proxima Centauri, the exoplanet is uninhabitable, with an equilibrium temperature of approximately 39 K (−234.2 °C).', 'Terrestrial planet', false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'yellow dwarf', 4600, 4.83);
INSERT INTO public.star VALUES (2, 2, 'Xi Andromedae', 'red giant', NULL, 0.550);
INSERT INTO public.star VALUES (3, 2, 'Beta Andromedae', 'red giant', NULL, -1.76);
INSERT INTO public.star VALUES (4, 2, '51 Andromedae', 'red giant', NULL, -0.04);
INSERT INTO public.star VALUES (5, 5, 'Theta Centauri', 'red giant', NULL, 0.87);
INSERT INTO public.star VALUES (6, 5, 'Proxima Centauri', 'red dwarf', NULL, 15.60);
INSERT INTO public.star VALUES (7, 5, 'Alpha Centauri A', 'yellow dwarf', NULL, 4.38);
INSERT INTO public.star VALUES (8, 5, 'Alpha Centauri B', 'orange dwarf', NULL, 4.38);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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

