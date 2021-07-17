--
-- PostgreSQL database cluster dump
--

-- Started on 2021-07-16 16:44:51

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md53e5c168cc4ce2dfaa3b1cb73154db5e6';






-- Completed on 2021-07-16 16:44:52

--
-- PostgreSQL database cluster dump complete
--

