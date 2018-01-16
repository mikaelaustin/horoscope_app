--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Horoscopes; Type: TABLE; Schema: public; Owner: mikaelaustin
--

CREATE TABLE "Horoscopes" (
    id integer NOT NULL,
    zodiac character varying(255),
    todays_horoscope text,
    description text,
    date_range character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE "Horoscopes" OWNER TO mikaelaustin;

--
-- Name: Horoscopes_id_seq; Type: SEQUENCE; Schema: public; Owner: mikaelaustin
--

CREATE SEQUENCE "Horoscopes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Horoscopes_id_seq" OWNER TO mikaelaustin;

--
-- Name: Horoscopes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikaelaustin
--

ALTER SEQUENCE "Horoscopes_id_seq" OWNED BY "Horoscopes".id;


--
-- Name: Sessions; Type: TABLE; Schema: public; Owner: mikaelaustin
--

CREATE TABLE "Sessions" (
    sid character varying(32) NOT NULL,
    expires timestamp with time zone,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE "Sessions" OWNER TO mikaelaustin;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: mikaelaustin
--

CREATE TABLE "Users" (
    id integer NOT NULL,
    name character varying(255),
    birthdate character varying(255),
    zodiac character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE "Users" OWNER TO mikaelaustin;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: mikaelaustin
--

CREATE SEQUENCE "Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Users_id_seq" OWNER TO mikaelaustin;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikaelaustin
--

ALTER SEQUENCE "Users_id_seq" OWNED BY "Users".id;


--
-- Name: Horoscopes id; Type: DEFAULT; Schema: public; Owner: mikaelaustin
--

ALTER TABLE ONLY "Horoscopes" ALTER COLUMN id SET DEFAULT nextval('"Horoscopes_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: mikaelaustin
--

ALTER TABLE ONLY "Users" ALTER COLUMN id SET DEFAULT nextval('"Users_id_seq"'::regclass);


--
-- Data for Name: Horoscopes; Type: TABLE DATA; Schema: public; Owner: mikaelaustin
--

COPY "Horoscopes" (id, zodiac, todays_horoscope, description, date_range, "createdAt", "updatedAt") FROM stdin;
2	Pisces	The Sun and Venus just joined Pluto in the sign of Capricorn, and changes made today tend to be profound and made never to return. Going back isn’t an option any longer, not even if nostalgia kicks in and you feel the need to move into past choices once again.	Pisces are very friendly, so they often find themselves in a company of very different people. Pisces are selfless, they are always willing to help others, without hoping to get anything back. Pisces is a Water sign and as such this zodiac sign is characterized by empathy and expressed emotional capacity. Their ruling planet is Neptune, so Pisces are more intuitive than others and have an artistic talent. Neptune is connected to music, so Pisces reveal music preferences in the earliest stages of life. They are generous, compassionate and extremely faithful and caring.	2/19-3/20	2018-01-09 21:26:47.581-05	2018-01-09 21:26:47.581-05
3	Aries	Sabaton is a Swedish Metal band that teaches history through its music. Some relationships in your life are there only to teach you some important lessons today, so don’t hold on to them too firmly and let go to the idea that they won’t last even if you stubbornly stick to their value. The moment is right for positive conversations that will take the edge off and remind you what you are worth yourself. You need all the support you can get.	As the first sign in the zodiac, the presence of Aries always marks the beginning of something energetic and turbulent. They are continuously looking for dynamic, speed and competition, always being the first in everything - from work to social gatherings. Thanks to its ruling planet Mars and the fact it belongs to the element of Fire (just like Leo and Sagittarius), Aries is one of the most active zodiac signs. It is in their nature to take action, sometimes before they think about it well.	3/21-4/19	2018-01-09 21:28:41.761-05	2018-01-09 21:28:41.761-05
5	Gemini	You didn’t even realize that you had such an active volcano in your heart and recent events made you understand your own depth. Don’t rush into anything new before you realize where your limitations lie and what feels right to your heart.	Expressive and quick-witted, Gemini represents two different personalities in one and you will never be sure which one you will face. They are sociable, communicative and ready for fun, with a tendency to suddenly get serious, thoughtful and restless. They are fascinated with the world itself, extremely curious, with a constant feeling that there is not enough time to experience everything they want to see.	5/21-6/20	2018-01-09 21:32:06.889-05	2018-01-09 21:32:06.889-05
6	Cancer	ABBA turned down $1 billion offer to do a 100 concerts reunion tour in 2000. There is no amount of money that would push you down a certain road and this is the time to question your moral imperatives and see where your boundaries lie.	Deeply intuitive and sentimental, Cancer can be one of the most challenging zodiac signs to get to know. They are very emotional and sensitive, and care deeply about matters of the family and their home. Cancer is sympathetic and attached to people they keep close. Those born with their Sun in Cancer are very loyal and able to empathize with other people's pain and suffering.	6/21-7/22	2018-01-09 23:18:22.738-05	2018-01-09 23:18:22.738-05
7	Leo	Emotions and reason have something separate to say today. It seems to be impossible to stay in touch with your heart and still maintain a reasonable approach to things in your life. You will find middle grounds as soon as you realize where you’re supposed to look for it.	People born under the sign of Leo are natural born leaders. They are dramatic, creative, self-confident, dominant and extremely difficult to resist, able to achieve anything they want to in any area of life they commit to. There is a specific strength to a Leo and their 'king of the jungle' status. Leo often has many friends for they are generous and loyal. Self-confident and attractive, this is a Sun sign capable of uniting different groups of people and leading them as one towards a shared cause, and their healthy sense of humor makes collaboration with other people even easier.	7/23-8/22	2018-01-09 23:26:43.486-05	2018-01-09 23:26:43.486-05
9	Virgo	Things you do with children and young people today have a chance to reshape your entire world into something positive and more mellow. Smile and have some fun, remembering that humor is the most important part of any relationship you build today.	Virgos are always paying attention to the smallest details and their deep sense of humanity makes them one of the most careful signs of the zodiac. Their methodical approach to life ensures that nothing is left to chance, and although they are often tender, their heart might be closed for the outer world. This is a sign often misunderstood, not because they lack the ability to express, but because they won’t accept their feelings as valid, true, or even relevant when opposed to reason. The symbolism behind the name speaks well of their nature, born with a feeling they are experiencing everything for the first time.	8/23-9/22	2018-01-09 23:28:30.51-05	2018-01-09 23:28:30.51-05
10	Libra	The Beastie Boys used to disguise into a heavy metal band to open their concerts themselves. Plans you have include a lot more work than what is visible at first. Make sure your superiors know what you’ve done and don’t take punches for anyone else if they aren’t showing gratitude.	People born under the sign of Libra are peaceful, fair, and they hate being alone. Partnership is very important for them, as their mirror and someone giving them the ability to be the mirror themselves. These individuals are fascinated by balance and symmetry, they are in a constant chase for justice and equality, realizing through life that the only thing that should be truly important to themselves in their own inner core of personality. This is someone ready to do nearly anything to avoid conflict, keeping the peace whenever possible.	9/23-10/22	2018-01-09 23:29:45.93-05	2018-01-09 23:29:45.93-05
1	Aquarius	Now you finally understand the direction you should take and why. It is up to you to determine the course of action in the future and although the collective might have a hard time following, you know that you can do much more if you employ the right social circle to begin with.	Aquarius-born are shy and quiet, but on the other hand they can be eccentric and energetic. However, in both cases, they are deep thinkers and highly intellectual people who love helping others. They are able to see without prejudice, on both sides, which makes them people who can easily solve problems. Although they can easily adapt to the energy that surrounds them, Aquarius-born have a deep need to be some time alone and away from everything, in order to restore power. People born under the Aquarius sign, look at the world as a place full of possibilities.	1/20-2/18	2018-01-09 21:24:15.418-05	2018-01-09 21:24:15.418-05
12	Scorpio	You are feeling lucky today, as if the forces of Nature were all on your side, making you confident that you will succeed. With the right ideals in mind, there is really nothing standing in your way and this is something you should be aware of every step of the way.	Scorpio-born are passionate and assertive people. They are determined and decisive, and will research until they find out the truth. Scorpio is a great leader, always aware of the situation and also features prominently in resourcefulness. Scorpio is a Water sign and lives to experience and express emotions. Although emotions are very important for Scorpio, they manifest them differently than other water signs. In any case, you can be sure that the Scorpio will keep your secrets, whatever they may be.	10/23-11/21	2018-01-09 23:31:30.853-05	2018-01-09 23:31:30.853-05
13	Sagittarius	You got tied to certain people, relationships and their effect on your overall state of heart, but they offer very little you won’t be able to create in your heart alone. Remember what it was like to be a part of something beautiful and if the feeling starts to fade, return to the source instead of turning to solutions that aren’t whole.	Curious and energetic, Sagittarius is one of the biggest travelers among all zodiac signs. Their open mind and philosophical view motivates them to wander around the world in search of the meaning of life. Sagittarius is extrovert, optimistic and enthusiastic, and likes changes. Sagittarius-born are able to transform their thoughts into concrete actions and they will do anything to achieve their goals.	11/22-12/21	2018-01-09 23:33:11.109-05	2018-01-09 23:33:11.109-05
15	Capricorn	The longest period that one album spent on billboard charts is 741 weeks, from 1973 to 1988 and it was Pink Floyd’s “Dark Side of the Moon”. You are pressured to stay in one position for too long, even though the time for change has come a while ago and you can feel it.	Capricorn is a sign that represents time and responsibility, and its representatives are traditional and often very serious by nature. These individuals possess an inner state of independence that enables significant progress both in their personal and professional lives. They are masters of self-control and have the ability to lead the way, make solid and realistic plans, and manage many people who work for them at any time. They will learn from their mistakes and get to the top based solely on their experience and expertise.	12/22-1/19	2018-01-09 23:34:27.869-05	2018-01-09 23:34:27.869-05
4	Taurus	You are coming out of something deep and profound and need to take enough time to heal and regenerate. Deep internal processes are there to be pushed through. It is important to see the value of your own subconscious world instead of shoving it aside in an attempt to be practical.	Practical and well-grounded, Taurus is the sign that harvests the fruits of labor. They feel the need to always be surrounded by love and beauty, turned to the material world, hedonism, and physical pleasures. People born with their Sun in Taurus are sensual and tactile, considering touch and taste the most important of all senses. Stable and conservative, this is one of the most reliable signs of the zodiac, ready to endure and stick to their choices until they reach the point of personal satisfaction.	4/20-5/20	2018-01-09 21:30:00.23-05	2018-01-09 21:30:00.23-05
\.


--
-- Data for Name: Sessions; Type: TABLE DATA; Schema: public; Owner: mikaelaustin
--

COPY "Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: mikaelaustin
--

COPY "Users" (id, name, birthdate, zodiac, "createdAt", "updatedAt") FROM stdin;
10	hi	2000-04-04	\N	2018-01-13 23:01:10.072-05	2018-01-13 23:01:10.072-05
11	danny	2000-06-21	\N	2018-01-13 23:03:58.146-05	2018-01-13 23:03:58.146-05
12	dannyyyyyy	2000-06-21	cancer	2018-01-13 23:06:51.195-05	2018-01-13 23:06:51.195-05
13	weeeeee	1999-07-30	leo	2018-01-13 23:09:22.259-05	2018-01-13 23:09:22.259-05
14	mike	2000-07-23	leo	2018-01-13 23:12:28.292-05	2018-01-13 23:12:28.292-05
15	hiiii	2000-04-01	aries	2018-01-13 23:21:44.587-05	2018-01-13 23:21:44.587-05
16	ashasjfioajf	2000-01-02	Capricorn	2018-01-13 23:29:34.581-05	2018-01-13 23:29:34.581-05
17		1111-01-01	Cancer	2018-01-13 23:31:21.974-05	2018-01-13 23:31:21.974-05
18	dededede	1333-03-03	Leo	2018-01-13 23:32:43.155-05	2018-01-13 23:32:43.155-05
19	dedededelolololololololol	1333-03-03	Leo	2018-01-13 23:34:38.772-05	2018-01-13 23:34:38.772-05
20	dppppppppp	2000-03-03	Taurus	2018-01-13 23:41:38.8-05	2018-01-13 23:41:38.8-05
21	weeeeeeeeeeeee	2000-03-03	Aries	2018-01-13 23:43:12.739-05	2018-01-13 23:43:12.739-05
22	practice	2000-03-31	Aquarius	2018-01-15 10:07:54.908-05	2018-01-15 10:07:54.908-05
23	shalom shalom	2000-01-01	Scorpio	2018-01-15 12:51:06.5-05	2018-01-15 12:51:06.5-05
24	hiii	1990-02-02	Cancer	2018-01-15 13:43:39.115-05	2018-01-15 13:43:39.115-05
25	helloooooo	0999-02-21	Aries	2018-01-16 13:33:16.506-05	2018-01-16 13:33:16.506-05
\.


--
-- Name: Horoscopes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikaelaustin
--

SELECT pg_catalog.setval('"Horoscopes_id_seq"', 1, false);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikaelaustin
--

SELECT pg_catalog.setval('"Users_id_seq"', 25, true);


--
-- Name: Horoscopes Horoscopes_pkey; Type: CONSTRAINT; Schema: public; Owner: mikaelaustin
--

ALTER TABLE ONLY "Horoscopes"
    ADD CONSTRAINT "Horoscopes_pkey" PRIMARY KEY (id);


--
-- Name: Horoscopes Horoscopes_zodiac_key; Type: CONSTRAINT; Schema: public; Owner: mikaelaustin
--

ALTER TABLE ONLY "Horoscopes"
    ADD CONSTRAINT "Horoscopes_zodiac_key" UNIQUE (zodiac);


--
-- Name: Sessions Sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: mikaelaustin
--

ALTER TABLE ONLY "Sessions"
    ADD CONSTRAINT "Sessions_pkey" PRIMARY KEY (sid);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: mikaelaustin
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

