--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-1.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-1.pgdg120+1)

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
-- Name: Delivery; Type: TABLE; Schema: public; Owner: kadalcj
--

CREATE TABLE public."Delivery" (
    id text NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "finishTime" timestamp(3) without time zone NOT NULL,
    "plannedStartTime" timestamp(3) without time zone NOT NULL,
    "deliveryNumber" text NOT NULL
);


ALTER TABLE public."Delivery" OWNER TO kadalcj;

--
-- Name: Matrix; Type: TABLE; Schema: public; Owner: kadalcj
--

CREATE TABLE public."Matrix" (
    id text NOT NULL,
    "fromStop" text NOT NULL,
    "toStop" text NOT NULL,
    length integer NOT NULL,
    duration integer NOT NULL,
    "deliveryId" text NOT NULL
);


ALTER TABLE public."Matrix" OWNER TO kadalcj;

--
-- Name: Stop; Type: TABLE; Schema: public; Owner: kadalcj
--

CREATE TABLE public."Stop" (
    id text NOT NULL,
    number integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    "stopIndex" integer NOT NULL,
    "stopStartTime" timestamp(3) without time zone NOT NULL,
    "stopEndTime" timestamp(3) without time zone NOT NULL,
    "unloadingTime" integer NOT NULL,
    "deliveryId" text NOT NULL
);


ALTER TABLE public."Stop" OWNER TO kadalcj;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: kadalcj
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO kadalcj;

--
-- Data for Name: Delivery; Type: TABLE DATA; Schema: public; Owner: kadalcj
--

COPY public."Delivery" (id, "startTime", "finishTime", "plannedStartTime", "deliveryNumber") FROM stdin;
clmkd5qvh0000x2f06dc791yn	2022-10-31 09:00:00	2022-10-31 09:00:00	2022-10-31 09:00:00	A2D4GA8
clmkd5ybz0001x2f0wh630ipo	2022-10-31 09:00:00	2022-10-31 09:00:00	2022-10-31 09:00:00	A2D4GB7
\.


--
-- Data for Name: Matrix; Type: TABLE DATA; Schema: public; Owner: kadalcj
--

COPY public."Matrix" (id, "fromStop", "toStop", length, duration, "deliveryId") FROM stdin;
clmkqeip50003x2dsf065gjf5	base	stop_1	2000	20	clmkd5qvh0000x2f06dc791yn
clmkqf5hs0007x2dscu85z0ap	base	stop_3	4000	40	clmkd5qvh0000x2f06dc791yn
clmkqelwf0005x2ds91e84ten	base	stop_2	3000	30	clmkd5qvh0000x2f06dc791yn
clmkqh2460009x2ds47pr67l5	stop_1	stop_2	2000	20	clmkd5qvh0000x2f06dc791yn
clmkqh7my000bx2dsw4kqxoc8	stop_1	stop_3	3000	30	clmkd5qvh0000x2f06dc791yn
clmkqhu7r000dx2dshv9y2yxh	stop_1	base	2000	20	clmkd5qvh0000x2f06dc791yn
clmkqidor000fx2ds0mkzh1da	stop_2	base	2000	20	clmkd5qvh0000x2f06dc791yn
clmkqik3h000hx2dsaq5664mx	stop_2	stop_1	3000	30	clmkd5qvh0000x2f06dc791yn
clmkqj6lh000jx2dsbhth3elb	stop_2	stop_3	4000	40	clmkd5qvh0000x2f06dc791yn
clmkqjegm000lx2dsqkyxmzdt	stop_3	base	2000	20	clmkd5qvh0000x2f06dc791yn
clmkqjmhq000nx2ds52zt7ghd	stop_3	stop_1	3000	30	clmkd5qvh0000x2f06dc791yn
clmkqjsgm000px2ds1c3af3tv	stop_3	stop_2	4000	40	clmkd5qvh0000x2f06dc791yn
\.


--
-- Data for Name: Stop; Type: TABLE DATA; Schema: public; Owner: kadalcj
--

COPY public."Stop" (id, number, name, address, "stopIndex", "stopStartTime", "stopEndTime", "unloadingTime", "deliveryId") FROM stdin;
clmkdbr0w0003x2lwc04xb0he	123456	stop_1	Jakarta	1	2022-10-31 09:00:00	2022-10-31 09:00:00	10	clmkd5qvh0000x2f06dc791yn
clmkdccki0005x2lwp8mh1tx3	123457	stop_2	Jakarta	2	2022-10-31 09:00:00	2022-10-31 09:00:00	10	clmkd5qvh0000x2f06dc791yn
clmkdcj9z0007x2lwpajua9az	123458	stop_3	Jakarta	3	2022-10-31 09:00:00	2022-10-31 09:00:00	10	clmkd5qvh0000x2f06dc791yn
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: kadalcj
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
9905ab6b-eb31-444b-8890-aa7e8c401b62	368a8b132ed91bb6d79494955f44a683c958a8ee1986d4144a10b15dbad86930	2023-09-15 08:53:39.040769+00	20230912174855_init	\N	\N	2023-09-15 08:53:39.007886+00	1
\.


--
-- Name: Delivery Delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: kadalcj
--

ALTER TABLE ONLY public."Delivery"
    ADD CONSTRAINT "Delivery_pkey" PRIMARY KEY (id);


--
-- Name: Matrix Matrix_pkey; Type: CONSTRAINT; Schema: public; Owner: kadalcj
--

ALTER TABLE ONLY public."Matrix"
    ADD CONSTRAINT "Matrix_pkey" PRIMARY KEY (id);


--
-- Name: Stop Stop_pkey; Type: CONSTRAINT; Schema: public; Owner: kadalcj
--

ALTER TABLE ONLY public."Stop"
    ADD CONSTRAINT "Stop_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: kadalcj
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Delivery_deliveryNumber_key; Type: INDEX; Schema: public; Owner: kadalcj
--

CREATE UNIQUE INDEX "Delivery_deliveryNumber_key" ON public."Delivery" USING btree ("deliveryNumber");


--
-- Name: Matrix_fromStop_toStop_key; Type: INDEX; Schema: public; Owner: kadalcj
--

CREATE UNIQUE INDEX "Matrix_fromStop_toStop_key" ON public."Matrix" USING btree ("fromStop", "toStop");


--
-- Name: Stop_number_name_key; Type: INDEX; Schema: public; Owner: kadalcj
--

CREATE UNIQUE INDEX "Stop_number_name_key" ON public."Stop" USING btree (number, name);


--
-- Name: Matrix Matrix_deliveryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kadalcj
--

ALTER TABLE ONLY public."Matrix"
    ADD CONSTRAINT "Matrix_deliveryId_fkey" FOREIGN KEY ("deliveryId") REFERENCES public."Delivery"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Stop Stop_deliveryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kadalcj
--

ALTER TABLE ONLY public."Stop"
    ADD CONSTRAINT "Stop_deliveryId_fkey" FOREIGN KEY ("deliveryId") REFERENCES public."Delivery"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

