--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2020-03-31 22:12:26

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
-- TOC entry 202 (class 1259 OID 16609)
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor (
    actor_id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16613)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    address_id integer NOT NULL,
    address character varying(50) NOT NULL,
    address2 character varying(50),
    district character varying(20) NOT NULL,
    city_id smallint NOT NULL,
    postal_code character varying(10),
    phone character varying(20) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16617)
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    city_id integer NOT NULL,
    city character varying(50) NOT NULL,
    country_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.city OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16621)
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    country_id integer NOT NULL,
    country character varying(50) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16625)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    store_id smallint NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    email character varying(50),
    address_id smallint NOT NULL,
    activebool boolean DEFAULT true NOT NULL,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    last_update timestamp without time zone DEFAULT now(),
    active integer
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16631)
-- Name: customer_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_list (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(50) NOT NULL,
    zip_code character varying(10),
    phone character varying(20) NOT NULL,
    city character varying(50) NOT NULL,
    country character varying(50) NOT NULL,
    notes character varying(50) NOT NULL,
    sid integer NOT NULL
);


ALTER TABLE public.customer_list OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16634)
-- Name: film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film (
    film_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    release_year integer,
    language_id smallint NOT NULL,
    original_language_id smallint,
    rental_duration smallint DEFAULT 3 NOT NULL,
    rental_rate numeric(4,2) DEFAULT 4.99 NOT NULL,
    length smallint,
    replacement_cost numeric(5,2) DEFAULT 19.99 NOT NULL,
    rating text,
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    special_features text[],
    fulltext tsvector NOT NULL
);


ALTER TABLE public.film OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16644)
-- Name: film_actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_actor (
    actor_id smallint NOT NULL,
    film_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.film_actor OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16648)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    inventory_id integer NOT NULL,
    film_id smallint NOT NULL,
    store_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16652)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    customer_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    rental_id integer NOT NULL,
    amount numeric(5,2) NOT NULL,
    payment_date timestamp without time zone NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16655)
-- Name: rental; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental (
    rental_id integer NOT NULL,
    rental_date timestamp without time zone NOT NULL,
    inventory_id integer NOT NULL,
    customer_id smallint NOT NULL,
    return_date timestamp without time zone,
    staff_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.rental OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16659)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    staff_id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    address_id smallint NOT NULL,
    email character varying(50),
    store_id smallint NOT NULL,
    active boolean DEFAULT true NOT NULL,
    username character varying(16) NOT NULL,
    password character varying(40),
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    picture bytea
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16667)
-- Name: store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store (
    store_id integer NOT NULL,
    manager_staff_id smallint NOT NULL,
    address_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.store OWNER TO postgres;

--
-- TOC entry 2878 (class 0 OID 16609)
-- Dependencies: 202
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actor (actor_id, first_name, last_name, last_update) FROM stdin;
1	PENELOPE	GUINESS	2006-02-15 09:34:33
2	NICK	WAHLBERG	2006-02-15 09:34:33
3	ED	CHASE	2006-02-15 09:34:33
4	JENNIFER	DAVIS	2006-02-15 09:34:33
5	JOHNNY	LOLLOBRIGIDA	2006-02-15 09:34:33
6	BETTE	NICHOLSON	2006-02-15 09:34:33
7	GRACE	MOSTEL	2006-02-15 09:34:33
8	MATTHEW	JOHANSSON	2006-02-15 09:34:33
9	JOE	SWANK	2006-02-15 09:34:33
10	CHRISTIAN	GABLE	2006-02-15 09:34:33
11	ZERO	CAGE	2006-02-15 09:34:33
12	KARL	BERRY	2006-02-15 09:34:33
13	UMA	WOOD	2006-02-15 09:34:33
14	VIVIEN	BERGEN	2006-02-15 09:34:33
15	CUBA	OLIVIER	2006-02-15 09:34:33
16	FRED	COSTNER	2006-02-15 09:34:33
17	HELEN	VOIGHT	2006-02-15 09:34:33
18	DAN	TORN	2006-02-15 09:34:33
19	BOB	FAWCETT	2006-02-15 09:34:33
20	LUCILLE	TRACY	2006-02-15 09:34:33
21	KIRSTEN	PALTROW	2006-02-15 09:34:33
22	ELVIS	MARX	2006-02-15 09:34:33
23	SANDRA	KILMER	2006-02-15 09:34:33
24	CAMERON	STREEP	2006-02-15 09:34:33
25	KEVIN	BLOOM	2006-02-15 09:34:33
26	RIP	CRAWFORD	2006-02-15 09:34:33
27	JULIA	MCQUEEN	2006-02-15 09:34:33
28	WOODY	HOFFMAN	2006-02-15 09:34:33
29	ALEC	WAYNE	2006-02-15 09:34:33
30	SANDRA	PECK	2006-02-15 09:34:33
31	SISSY	SOBIESKI	2006-02-15 09:34:33
32	TIM	HACKMAN	2006-02-15 09:34:33
33	MILLA	PECK	2006-02-15 09:34:33
34	AUDREY	OLIVIER	2006-02-15 09:34:33
35	JUDY	DEAN	2006-02-15 09:34:33
36	BURT	DUKAKIS	2006-02-15 09:34:33
37	VAL	BOLGER	2006-02-15 09:34:33
38	TOM	MCKELLEN	2006-02-15 09:34:33
39	GOLDIE	BRODY	2006-02-15 09:34:33
40	JOHNNY	CAGE	2006-02-15 09:34:33
41	JODIE	DEGENERES	2006-02-15 09:34:33
42	TOM	MIRANDA	2006-02-15 09:34:33
43	KIRK	JOVOVICH	2006-02-15 09:34:33
44	NICK	STALLONE	2006-02-15 09:34:33
45	REESE	KILMER	2006-02-15 09:34:33
46	PARKER	GOLDBERG	2006-02-15 09:34:33
47	JULIA	BARRYMORE	2006-02-15 09:34:33
48	FRANCES	DAY-LEWIS	2006-02-15 09:34:33
49	ANNE	CRONYN	2006-02-15 09:34:33
50	NATALIE	HOPKINS	2006-02-15 09:34:33
51	GARY	PHOENIX	2006-02-15 09:34:33
52	CARMEN	HUNT	2006-02-15 09:34:33
53	MENA	TEMPLE	2006-02-15 09:34:33
54	PENELOPE	PINKETT	2006-02-15 09:34:33
55	FAY	KILMER	2006-02-15 09:34:33
56	DAN	HARRIS	2006-02-15 09:34:33
57	JUDE	CRUISE	2006-02-15 09:34:33
58	CHRISTIAN	AKROYD	2006-02-15 09:34:33
59	DUSTIN	TAUTOU	2006-02-15 09:34:33
60	HENRY	BERRY	2006-02-15 09:34:33
61	CHRISTIAN	NEESON	2006-02-15 09:34:33
62	JAYNE	NEESON	2006-02-15 09:34:33
63	CAMERON	WRAY	2006-02-15 09:34:33
64	RAY	JOHANSSON	2006-02-15 09:34:33
65	ANGELA	HUDSON	2006-02-15 09:34:33
66	MARY	TANDY	2006-02-15 09:34:33
67	JESSICA	BAILEY	2006-02-15 09:34:33
68	RIP	WINSLET	2006-02-15 09:34:33
69	KENNETH	PALTROW	2006-02-15 09:34:33
70	MICHELLE	MCCONAUGHEY	2006-02-15 09:34:33
71	ADAM	GRANT	2006-02-15 09:34:33
72	SEAN	WILLIAMS	2006-02-15 09:34:33
73	GARY	PENN	2006-02-15 09:34:33
74	MILLA	KEITEL	2006-02-15 09:34:33
75	BURT	POSEY	2006-02-15 09:34:33
76	ANGELINA	ASTAIRE	2006-02-15 09:34:33
77	CARY	MCCONAUGHEY	2006-02-15 09:34:33
78	GROUCHO	SINATRA	2006-02-15 09:34:33
79	MAE	HOFFMAN	2006-02-15 09:34:33
80	RALPH	CRUZ	2006-02-15 09:34:33
81	SCARLETT	DAMON	2006-02-15 09:34:33
82	WOODY	JOLIE	2006-02-15 09:34:33
83	BEN	WILLIS	2006-02-15 09:34:33
84	JAMES	PITT	2006-02-15 09:34:33
85	MINNIE	ZELLWEGER	2006-02-15 09:34:33
86	GREG	CHAPLIN	2006-02-15 09:34:33
87	SPENCER	PECK	2006-02-15 09:34:33
88	KENNETH	PESCI	2006-02-15 09:34:33
89	CHARLIZE	DENCH	2006-02-15 09:34:33
90	SEAN	GUINESS	2006-02-15 09:34:33
91	CHRISTOPHER	BERRY	2006-02-15 09:34:33
92	KIRSTEN	AKROYD	2006-02-15 09:34:33
93	ELLEN	PRESLEY	2006-02-15 09:34:33
94	KENNETH	TORN	2006-02-15 09:34:33
95	DARYL	WAHLBERG	2006-02-15 09:34:33
96	GENE	WILLIS	2006-02-15 09:34:33
97	MEG	HAWKE	2006-02-15 09:34:33
98	CHRIS	BRIDGES	2006-02-15 09:34:33
99	JIM	MOSTEL	2006-02-15 09:34:33
100	SPENCER	DEPP	2006-02-15 09:34:33
101	SUSAN	DAVIS	2006-02-15 09:34:33
102	WALTER	TORN	2006-02-15 09:34:33
103	MATTHEW	LEIGH	2006-02-15 09:34:33
104	PENELOPE	CRONYN	2006-02-15 09:34:33
105	SIDNEY	CROWE	2006-02-15 09:34:33
106	GROUCHO	DUNST	2006-02-15 09:34:33
107	GINA	DEGENERES	2006-02-15 09:34:33
108	WARREN	NOLTE	2006-02-15 09:34:33
109	SYLVESTER	DERN	2006-02-15 09:34:33
110	SUSAN	DAVIS	2006-02-15 09:34:33
111	CAMERON	ZELLWEGER	2006-02-15 09:34:33
112	RUSSELL	BACALL	2006-02-15 09:34:33
113	MORGAN	HOPKINS	2006-02-15 09:34:33
114	MORGAN	MCDORMAND	2006-02-15 09:34:33
115	HARRISON	BALE	2006-02-15 09:34:33
116	DAN	STREEP	2006-02-15 09:34:33
117	RENEE	TRACY	2006-02-15 09:34:33
118	CUBA	ALLEN	2006-02-15 09:34:33
119	WARREN	JACKMAN	2006-02-15 09:34:33
120	PENELOPE	MONROE	2006-02-15 09:34:33
121	LIZA	BERGMAN	2006-02-15 09:34:33
122	SALMA	NOLTE	2006-02-15 09:34:33
123	JULIANNE	DENCH	2006-02-15 09:34:33
124	SCARLETT	BENING	2006-02-15 09:34:33
125	ALBERT	NOLTE	2006-02-15 09:34:33
126	FRANCES	TOMEI	2006-02-15 09:34:33
127	KEVIN	GARLAND	2006-02-15 09:34:33
128	CATE	MCQUEEN	2006-02-15 09:34:33
129	DARYL	CRAWFORD	2006-02-15 09:34:33
130	GRETA	KEITEL	2006-02-15 09:34:33
131	JANE	JACKMAN	2006-02-15 09:34:33
132	ADAM	HOPPER	2006-02-15 09:34:33
133	RICHARD	PENN	2006-02-15 09:34:33
134	GENE	HOPKINS	2006-02-15 09:34:33
135	RITA	REYNOLDS	2006-02-15 09:34:33
136	ED	MANSFIELD	2006-02-15 09:34:33
137	MORGAN	WILLIAMS	2006-02-15 09:34:33
138	LUCILLE	DEE	2006-02-15 09:34:33
139	EWAN	GOODING	2006-02-15 09:34:33
140	WHOOPI	HURT	2006-02-15 09:34:33
141	CATE	HARRIS	2006-02-15 09:34:33
142	JADA	RYDER	2006-02-15 09:34:33
143	RIVER	DEAN	2006-02-15 09:34:33
144	ANGELA	WITHERSPOON	2006-02-15 09:34:33
145	KIM	ALLEN	2006-02-15 09:34:33
146	ALBERT	JOHANSSON	2006-02-15 09:34:33
147	FAY	WINSLET	2006-02-15 09:34:33
148	EMILY	DEE	2006-02-15 09:34:33
149	RUSSELL	TEMPLE	2006-02-15 09:34:33
150	JAYNE	NOLTE	2006-02-15 09:34:33
151	GEOFFREY	HESTON	2006-02-15 09:34:33
152	BEN	HARRIS	2006-02-15 09:34:33
153	MINNIE	KILMER	2006-02-15 09:34:33
154	MERYL	GIBSON	2006-02-15 09:34:33
155	IAN	TANDY	2006-02-15 09:34:33
156	FAY	WOOD	2006-02-15 09:34:33
157	GRETA	MALDEN	2006-02-15 09:34:33
158	VIVIEN	BASINGER	2006-02-15 09:34:33
159	LAURA	BRODY	2006-02-15 09:34:33
160	CHRIS	DEPP	2006-02-15 09:34:33
161	HARVEY	HOPE	2006-02-15 09:34:33
162	OPRAH	KILMER	2006-02-15 09:34:33
163	CHRISTOPHER	WEST	2006-02-15 09:34:33
164	HUMPHREY	WILLIS	2006-02-15 09:34:33
165	AL	GARLAND	2006-02-15 09:34:33
166	NICK	DEGENERES	2006-02-15 09:34:33
167	LAURENCE	BULLOCK	2006-02-15 09:34:33
168	WILL	WILSON	2006-02-15 09:34:33
169	KENNETH	HOFFMAN	2006-02-15 09:34:33
170	MENA	HOPPER	2006-02-15 09:34:33
171	OLYMPIA	PFEIFFER	2006-02-15 09:34:33
172	GROUCHO	WILLIAMS	2006-02-15 09:34:33
173	ALAN	DREYFUSS	2006-02-15 09:34:33
174	MICHAEL	BENING	2006-02-15 09:34:33
175	WILLIAM	HACKMAN	2006-02-15 09:34:33
176	JON	CHASE	2006-02-15 09:34:33
177	GENE	MCKELLEN	2006-02-15 09:34:33
178	LISA	MONROE	2006-02-15 09:34:33
179	ED	GUINESS	2006-02-15 09:34:33
180	JEFF	SILVERSTONE	2006-02-15 09:34:33
181	MATTHEW	CARREY	2006-02-15 09:34:33
182	DEBBIE	AKROYD	2006-02-15 09:34:33
183	RUSSELL	CLOSE	2006-02-15 09:34:33
184	HUMPHREY	GARLAND	2006-02-15 09:34:33
185	MICHAEL	BOLGER	2006-02-15 09:34:33
186	JULIA	ZELLWEGER	2006-02-15 09:34:33
187	RENEE	BALL	2006-02-15 09:34:33
188	ROCK	DUKAKIS	2006-02-15 09:34:33
189	CUBA	BIRCH	2006-02-15 09:34:33
190	AUDREY	BAILEY	2006-02-15 09:34:33
191	GREGORY	GOODING	2006-02-15 09:34:33
192	JOHN	SUVARI	2006-02-15 09:34:33
193	BURT	TEMPLE	2006-02-15 09:34:33
194	MERYL	ALLEN	2006-02-15 09:34:33
195	JAYNE	SILVERSTONE	2006-02-15 09:34:33
196	BELA	WALKEN	2006-02-15 09:34:33
197	REESE	WEST	2006-02-15 09:34:33
198	MARY	KEITEL	2006-02-15 09:34:33
199	JULIA	FAWCETT	2006-02-15 09:34:33
200	THORA	TEMPLE	2006-02-15 09:34:33
\.


--
-- TOC entry 2879 (class 0 OID 16613)
-- Dependencies: 203
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (address_id, address, address2, district, city_id, postal_code, phone, last_update) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 16617)
-- Dependencies: 204
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (city_id, city, country_id, last_update) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 16621)
-- Dependencies: 205
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (country_id, country, last_update) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 16625)
-- Dependencies: 206
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 16631)
-- Dependencies: 207
-- Data for Name: customer_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_list (id, name, address, zip_code, phone, city, country, notes, sid) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 16634)
-- Dependencies: 208
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.film (film_id, title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 16644)
-- Dependencies: 209
-- Data for Name: film_actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.film_actor (actor_id, film_id, last_update) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 16648)
-- Dependencies: 210
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory (inventory_id, film_id, store_id, last_update) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 16652)
-- Dependencies: 211
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (payment_id, customer_id, staff_id, rental_id, amount, payment_date) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 16655)
-- Dependencies: 212
-- Data for Name: rental; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 16659)
-- Dependencies: 213
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 16667)
-- Dependencies: 214
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store (store_id, manager_staff_id, address_id, last_update) FROM stdin;
\.


-- Completed on 2020-03-31 22:12:26

--
-- PostgreSQL database dump complete
--

