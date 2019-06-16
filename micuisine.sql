--
-- PostgreSQL database dump
--

-- Dumped from database version 10.8 (Ubuntu 10.8-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.8 (Ubuntu 10.8-0ubuntu0.18.04.1)

-- Started on 2019-06-16 16:06:06 CEST

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

--
-- TOC entry 1 (class 3079 OID 13121)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 247 (class 1255 OID 31663)
-- Name: newid(); Type: FUNCTION; Schema: public; Owner: usuariocuba
--

CREATE FUNCTION public.newid() RETURNS uuid
    LANGUAGE sql
    AS $$select md5(random()::text || clock_timestamp()::text)::uuid$$;


ALTER FUNCTION public.newid() OWNER TO usuariocuba;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 240 (class 1259 OID 31677)
-- Name: micuisine_cantidad; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.micuisine_cantidad (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    peso character varying(255)
);


ALTER TABLE public.micuisine_cantidad OWNER TO usuariocuba;

--
-- TOC entry 239 (class 1259 OID 31672)
-- Name: micuisine_ingrediente; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.micuisine_ingrediente (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    nombre character varying(255)
);


ALTER TABLE public.micuisine_ingrediente OWNER TO usuariocuba;

--
-- TOC entry 246 (class 1259 OID 31710)
-- Name: micuisine_ingredientes_mas_utilizados; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.micuisine_ingredientes_mas_utilizados (
    id uuid NOT NULL,
    ingrediente character varying(255),
    cantidad integer
);


ALTER TABLE public.micuisine_ingredientes_mas_utilizados OWNER TO usuariocuba;

--
-- TOC entry 241 (class 1259 OID 31682)
-- Name: micuisine_receta; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.micuisine_receta (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    categoria integer,
    nombre character varying(255),
    personas character varying(255),
    duracion character varying(255),
    preparacion character varying(600),
    visitas integer,
    consejos character varying(300),
    uri character varying(255),
    fecha_creacion date,
    usuario_id uuid
);


ALTER TABLE public.micuisine_receta OWNER TO usuariocuba;

--
-- TOC entry 243 (class 1259 OID 31695)
-- Name: micuisine_receta_cantidad_link; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.micuisine_receta_cantidad_link (
    receta_id uuid NOT NULL,
    cantidad_id uuid NOT NULL
);


ALTER TABLE public.micuisine_receta_cantidad_link OWNER TO usuariocuba;

--
-- TOC entry 242 (class 1259 OID 31690)
-- Name: micuisine_receta_ingrediente_link; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.micuisine_receta_ingrediente_link (
    receta_id uuid NOT NULL,
    ingrediente_id uuid NOT NULL
);


ALTER TABLE public.micuisine_receta_ingrediente_link OWNER TO usuariocuba;

--
-- TOC entry 245 (class 1259 OID 31705)
-- Name: micuisine_recetas_por_dia; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.micuisine_recetas_por_dia (
    id uuid NOT NULL,
    fecha character varying(255),
    cantidad_recetas integer
);


ALTER TABLE public.micuisine_recetas_por_dia OWNER TO usuariocuba;

--
-- TOC entry 244 (class 1259 OID 31700)
-- Name: micuisine_recetas_por_usuario; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.micuisine_recetas_por_usuario (
    id uuid NOT NULL,
    usuario character varying(255),
    cantidad_recetas integer
);


ALTER TABLE public.micuisine_recetas_por_usuario OWNER TO usuariocuba;

--
-- TOC entry 238 (class 1259 OID 31664)
-- Name: micuisine_usuario; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.micuisine_usuario (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    nombre character varying(255),
    apellidos character varying(255),
    email character varying(255),
    telefono character varying(255)
);


ALTER TABLE public.micuisine_usuario OWNER TO usuariocuba;

--
-- TOC entry 210 (class 1259 OID 31282)
-- Name: sec_constraint; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_constraint (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    code character varying(255),
    check_type character varying(50) DEFAULT 'db'::character varying,
    operation_type character varying(50) DEFAULT 'read'::character varying,
    entity_name character varying(255) NOT NULL,
    join_clause character varying(500),
    where_clause character varying(1000),
    groovy_script text,
    filter_xml text,
    is_active boolean DEFAULT true,
    group_id uuid
);


ALTER TABLE public.sec_constraint OWNER TO usuariocuba;

--
-- TOC entry 217 (class 1259 OID 31373)
-- Name: sec_entity_log; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_entity_log (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    event_ts timestamp without time zone,
    user_id uuid,
    change_type character(1),
    entity character varying(100),
    entity_instance_name character varying(1000),
    entity_id uuid,
    string_entity_id character varying(255),
    int_entity_id integer,
    long_entity_id bigint,
    changes text
);


ALTER TABLE public.sec_entity_log OWNER TO usuariocuba;

--
-- TOC entry 218 (class 1259 OID 31390)
-- Name: sec_filter; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_filter (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    component character varying(200),
    name character varying(255),
    code character varying(200),
    xml text,
    user_id uuid,
    global_default boolean
);


ALTER TABLE public.sec_filter OWNER TO usuariocuba;

--
-- TOC entry 205 (class 1259 OID 31215)
-- Name: sec_group; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_group (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(255) NOT NULL,
    parent_id uuid
);


ALTER TABLE public.sec_group OWNER TO usuariocuba;

--
-- TOC entry 206 (class 1259 OID 31226)
-- Name: sec_group_hierarchy; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_group_hierarchy (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    group_id uuid,
    parent_id uuid,
    hierarchy_level integer
);


ALTER TABLE public.sec_group_hierarchy OWNER TO usuariocuba;

--
-- TOC entry 211 (class 1259 OID 31299)
-- Name: sec_localized_constraint_msg; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_localized_constraint_msg (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    entity_name character varying(255) NOT NULL,
    operation_type character varying(50) NOT NULL,
    values_ text
);


ALTER TABLE public.sec_localized_constraint_msg OWNER TO usuariocuba;

--
-- TOC entry 216 (class 1259 OID 31360)
-- Name: sec_logged_attr; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_logged_attr (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    entity_id uuid,
    name character varying(50)
);


ALTER TABLE public.sec_logged_attr OWNER TO usuariocuba;

--
-- TOC entry 215 (class 1259 OID 31353)
-- Name: sec_logged_entity; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_logged_entity (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    name character varying(100),
    auto boolean,
    manual boolean
);


ALTER TABLE public.sec_logged_entity OWNER TO usuariocuba;

--
-- TOC entry 209 (class 1259 OID 31271)
-- Name: sec_permission; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_permission (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    permission_type integer,
    target character varying(100),
    value_ integer,
    role_id uuid
);


ALTER TABLE public.sec_permission OWNER TO usuariocuba;

--
-- TOC entry 221 (class 1259 OID 31427)
-- Name: sec_presentation; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_presentation (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    component character varying(200),
    name character varying(255),
    xml character varying(7000),
    user_id uuid,
    is_auto_save boolean
);


ALTER TABLE public.sec_presentation OWNER TO usuariocuba;

--
-- TOC entry 234 (class 1259 OID 31613)
-- Name: sec_remember_me; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_remember_me (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    user_id uuid NOT NULL,
    token character varying(32) NOT NULL
);


ALTER TABLE public.sec_remember_me OWNER TO usuariocuba;

--
-- TOC entry 204 (class 1259 OID 31206)
-- Name: sec_role; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_role (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(255) NOT NULL,
    loc_name character varying(255),
    description character varying(1000),
    is_default_role boolean,
    role_type integer
);


ALTER TABLE public.sec_role OWNER TO usuariocuba;

--
-- TOC entry 224 (class 1259 OID 31474)
-- Name: sec_screen_history; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_screen_history (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    user_id uuid,
    caption character varying(255),
    url text,
    entity_id uuid,
    substituted_user_id uuid
);


ALTER TABLE public.sec_screen_history OWNER TO usuariocuba;

--
-- TOC entry 222 (class 1259 OID 31441)
-- Name: sec_search_folder; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_search_folder (
    folder_id uuid NOT NULL,
    filter_component character varying(200),
    filter_xml character varying(7000),
    user_id uuid,
    presentation_id uuid,
    apply_default boolean,
    is_set boolean,
    entity_type character varying(50)
);


ALTER TABLE public.sec_search_folder OWNER TO usuariocuba;

--
-- TOC entry 212 (class 1259 OID 31308)
-- Name: sec_session_attr; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_session_attr (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(50),
    str_value character varying(1000),
    datatype character varying(20),
    group_id uuid
);


ALTER TABLE public.sec_session_attr OWNER TO usuariocuba;

--
-- TOC entry 237 (class 1259 OID 31641)
-- Name: sec_session_log; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_session_log (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    session_id uuid NOT NULL,
    user_id uuid NOT NULL,
    substituted_user_id uuid,
    user_data text,
    last_action integer NOT NULL,
    client_info character varying(512),
    client_type character varying(10),
    address character varying(255),
    started_ts timestamp without time zone,
    finished_ts timestamp without time zone,
    server_id character varying(128)
);


ALTER TABLE public.sec_session_log OWNER TO usuariocuba;

--
-- TOC entry 207 (class 1259 OID 31241)
-- Name: sec_user; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_user (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    login character varying(50) NOT NULL,
    login_lc character varying(50) NOT NULL,
    password character varying(255),
    password_encryption character varying(50),
    name character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    middle_name character varying(255),
    position_ character varying(255),
    email character varying(100),
    language_ character varying(20),
    time_zone character varying(50),
    time_zone_auto boolean,
    active boolean,
    group_id uuid NOT NULL,
    ip_mask character varying(200),
    change_password_at_logon boolean
);


ALTER TABLE public.sec_user OWNER TO usuariocuba;

--
-- TOC entry 208 (class 1259 OID 31255)
-- Name: sec_user_role; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_user_role (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    user_id uuid,
    role_id uuid
);


ALTER TABLE public.sec_user_role OWNER TO usuariocuba;

--
-- TOC entry 213 (class 1259 OID 31322)
-- Name: sec_user_setting; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_user_setting (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    user_id uuid,
    client_type character(1),
    name character varying(255),
    value_ text
);


ALTER TABLE public.sec_user_setting OWNER TO usuariocuba;

--
-- TOC entry 214 (class 1259 OID 31337)
-- Name: sec_user_substitution; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sec_user_substitution (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    user_id uuid NOT NULL,
    substituted_user_id uuid NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone
);


ALTER TABLE public.sec_user_substitution OWNER TO usuariocuba;

--
-- TOC entry 235 (class 1259 OID 31625)
-- Name: sys_access_token; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_access_token (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    token_value character varying(255),
    token_bytes bytea,
    authentication_key character varying(255),
    authentication_bytes bytea,
    expiry timestamp without time zone,
    user_login character varying(50),
    locale character varying(200),
    refresh_token_value character varying(255)
);


ALTER TABLE public.sys_access_token OWNER TO usuariocuba;

--
-- TOC entry 220 (class 1259 OID 31414)
-- Name: sys_app_folder; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_app_folder (
    folder_id uuid NOT NULL,
    filter_component character varying(200),
    filter_xml character varying(7000),
    visibility_script text,
    quantity_script text,
    apply_default boolean
);


ALTER TABLE public.sys_app_folder OWNER TO usuariocuba;

--
-- TOC entry 230 (class 1259 OID 31570)
-- Name: sys_attr_value; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_attr_value (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    category_attr_id uuid NOT NULL,
    code character varying(100) NOT NULL,
    entity_id uuid,
    string_entity_id character varying(255),
    int_entity_id integer,
    long_entity_id bigint,
    string_value character varying,
    integer_value integer,
    double_value numeric(36,6),
    date_value timestamp without time zone,
    boolean_value boolean,
    entity_value uuid,
    string_entity_value character varying(255),
    int_entity_value integer,
    long_entity_value bigint,
    parent_id uuid
);


ALTER TABLE public.sys_attr_value OWNER TO usuariocuba;

--
-- TOC entry 228 (class 1259 OID 31546)
-- Name: sys_category; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_category (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(255) NOT NULL,
    special character varying(50),
    entity_type character varying(100) NOT NULL,
    is_default boolean,
    discriminator integer,
    locale_names character varying(1000)
);


ALTER TABLE public.sys_category OWNER TO usuariocuba;

--
-- TOC entry 229 (class 1259 OID 31555)
-- Name: sys_category_attr; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_category_attr (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    category_entity_type character varying(4000),
    name character varying(255),
    code character varying(100) NOT NULL,
    category_id uuid NOT NULL,
    entity_class character varying(500),
    data_type character varying(200),
    default_string character varying,
    default_int integer,
    default_double numeric(36,6),
    default_date timestamp without time zone,
    default_date_is_current boolean,
    default_boolean boolean,
    default_entity_value uuid,
    default_str_entity_value character varying(255),
    default_int_entity_value integer,
    default_long_entity_value bigint,
    enumeration character varying(500),
    order_no integer,
    screen character varying(255),
    required boolean,
    lookup boolean,
    target_screens character varying(4000),
    width character varying(20),
    rows_count integer,
    is_collection boolean,
    join_clause character varying(4000),
    where_clause character varying(4000),
    filter_xml text,
    locale_names character varying(1000),
    enumeration_locales character varying(5000)
);


ALTER TABLE public.sys_category_attr OWNER TO usuariocuba;

--
-- TOC entry 198 (class 1259 OID 31153)
-- Name: sys_config; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_config (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    name character varying(255) NOT NULL,
    value_ text NOT NULL
);


ALTER TABLE public.sys_config OWNER TO usuariocuba;

--
-- TOC entry 196 (class 1259 OID 31137)
-- Name: sys_db_changelog; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_db_changelog (
    script_name character varying(300) NOT NULL,
    create_ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_init integer DEFAULT 0
);


ALTER TABLE public.sys_db_changelog OWNER TO usuariocuba;

--
-- TOC entry 227 (class 1259 OID 31529)
-- Name: sys_entity_snapshot; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_entity_snapshot (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    entity_meta_class character varying(50) NOT NULL,
    entity_id uuid,
    string_entity_id character varying(255),
    int_entity_id integer,
    long_entity_id bigint,
    author_id uuid NOT NULL,
    view_xml text NOT NULL,
    snapshot_xml text NOT NULL,
    snapshot_date timestamp without time zone NOT NULL
);


ALTER TABLE public.sys_entity_snapshot OWNER TO usuariocuba;

--
-- TOC entry 201 (class 1259 OID 31175)
-- Name: sys_entity_statistics; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_entity_statistics (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    name character varying(50),
    instance_count bigint,
    fetch_ui integer,
    max_fetch_ui integer,
    lazy_collection_threshold integer,
    lookup_screen_threshold integer
);


ALTER TABLE public.sys_entity_statistics OWNER TO usuariocuba;

--
-- TOC entry 199 (class 1259 OID 31162)
-- Name: sys_file; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_file (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(500) NOT NULL,
    ext character varying(20),
    file_size bigint,
    create_date timestamp without time zone
);


ALTER TABLE public.sys_file OWNER TO usuariocuba;

--
-- TOC entry 219 (class 1259 OID 31404)
-- Name: sys_folder; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_folder (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    folder_type character(1),
    parent_id uuid,
    name character varying(100),
    tab_name character varying(100),
    sort_order integer
);


ALTER TABLE public.sys_folder OWNER TO usuariocuba;

--
-- TOC entry 223 (class 1259 OID 31465)
-- Name: sys_fts_queue; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_fts_queue (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    entity_id uuid,
    string_entity_id character varying(255),
    int_entity_id integer,
    long_entity_id bigint,
    entity_name character varying(200),
    change_type character(1),
    source_host character varying(255),
    indexing_host character varying(255),
    fake boolean
);


ALTER TABLE public.sys_fts_queue OWNER TO usuariocuba;

--
-- TOC entry 231 (class 1259 OID 31592)
-- Name: sys_jmx_instance; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_jmx_instance (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    node_name character varying(255),
    address character varying(500) NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.sys_jmx_instance OWNER TO usuariocuba;

--
-- TOC entry 200 (class 1259 OID 31170)
-- Name: sys_lock_config; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_lock_config (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    name character varying(100),
    timeout_sec integer
);


ALTER TABLE public.sys_lock_config OWNER TO usuariocuba;

--
-- TOC entry 232 (class 1259 OID 31600)
-- Name: sys_query_result_seq; Type: SEQUENCE; Schema: public; Owner: usuariocuba
--

CREATE SEQUENCE public.sys_query_result_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_query_result_seq OWNER TO usuariocuba;

--
-- TOC entry 233 (class 1259 OID 31602)
-- Name: sys_query_result; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_query_result (
    id bigint DEFAULT nextval('public.sys_query_result_seq'::regclass) NOT NULL,
    session_id uuid NOT NULL,
    query_key integer NOT NULL,
    entity_id uuid,
    string_entity_id character varying(255),
    int_entity_id integer,
    long_entity_id bigint
);


ALTER TABLE public.sys_query_result OWNER TO usuariocuba;

--
-- TOC entry 236 (class 1259 OID 31633)
-- Name: sys_refresh_token; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_refresh_token (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    token_value character varying(255),
    token_bytes bytea,
    authentication_bytes bytea,
    expiry timestamp without time zone,
    user_login character varying(50)
);


ALTER TABLE public.sys_refresh_token OWNER TO usuariocuba;

--
-- TOC entry 203 (class 1259 OID 31191)
-- Name: sys_scheduled_execution; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_scheduled_execution (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    task_id uuid,
    server character varying(512),
    start_time timestamp with time zone,
    finish_time timestamp with time zone,
    result text
);


ALTER TABLE public.sys_scheduled_execution OWNER TO usuariocuba;

--
-- TOC entry 202 (class 1259 OID 31181)
-- Name: sys_scheduled_task; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_scheduled_task (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    defined_by character varying(1) DEFAULT 'B'::character varying,
    class_name character varying(500),
    script_name character varying(500),
    bean_name character varying(50),
    method_name character varying(50),
    method_params character varying(1000),
    user_name character varying(50),
    is_singleton boolean,
    is_active boolean,
    period integer,
    timeout integer,
    start_date timestamp without time zone,
    time_frame integer,
    start_delay integer,
    permitted_servers character varying(4096),
    log_start boolean,
    log_finish boolean,
    last_start_time timestamp with time zone,
    last_start_server character varying(512),
    description character varying(1000),
    cron character varying(100),
    scheduling_type character varying(1) DEFAULT 'P'::character varying
);


ALTER TABLE public.sys_scheduled_task OWNER TO usuariocuba;

--
-- TOC entry 226 (class 1259 OID 31510)
-- Name: sys_sending_attachment; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_sending_attachment (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    message_id uuid,
    content bytea,
    content_file_id uuid,
    content_id character varying(50),
    name character varying(500),
    disposition character varying(50),
    text_encoding character varying(50)
);


ALTER TABLE public.sys_sending_attachment OWNER TO usuariocuba;

--
-- TOC entry 225 (class 1259 OID 31494)
-- Name: sys_sending_message; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_sending_message (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer,
    update_ts timestamp with time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    address_to text,
    address_cc text,
    address_bcc text,
    address_from character varying(100),
    caption character varying(500),
    email_headers character varying(500),
    content_text text,
    content_text_file_id uuid,
    deadline timestamp with time zone,
    status integer,
    date_sent timestamp without time zone,
    attempts_count integer,
    attempts_made integer,
    attachments_name text,
    body_content_type character varying(50)
);


ALTER TABLE public.sys_sending_message OWNER TO usuariocuba;

--
-- TOC entry 197 (class 1259 OID 31144)
-- Name: sys_server; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_server (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    name character varying(255),
    is_running boolean,
    data text
);


ALTER TABLE public.sys_server OWNER TO usuariocuba;

--
-- TOC entry 3463 (class 0 OID 31677)
-- Dependencies: 240
-- Data for Name: micuisine_cantidad; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_cantidad (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, peso) FROM stdin;
9f4076b4-44a0-4d76-b206-705cb5995c17	1	\N	\N	\N	\N	\N	\N	50g
04a3d183-1896-483e-bfb2-a327e6181d9d	1	\N	\N	\N	\N	\N	\N	1 cucharada
307f675f-15c4-49e1-ad1f-5c334d775436	1	\N	\N	\N	\N	\N	\N	150ml
ae7d18ad-aa44-4baf-adf1-68b2321c6a8b	1	\N	\N	\N	\N	\N	\N	2kg
23ba9f79-8f80-4e26-b3a2-8ba3421fd193	1	\N	\N	\N	\N	\N	\N	150g
9e9f4587-2be7-4764-b4b9-70eb2396d70d	1	\N	\N	\N	\N	\N	\N	200g
203491f8-4633-4f0d-a47b-8696e0c78539	1	\N	\N	\N	\N	\N	\N	40g
1671f686-dabf-4437-b154-6ac944387006	1	\N	\N	\N	\N	\N	\N	100ml
cebc3bf2-3802-44df-a68a-dbd063909726	1	\N	\N	\N	\N	\N	\N	20ml
f89bf0ac-a124-4b71-8f10-f9ccbc3dad0b	1	\N	\N	\N	\N	\N	\N	20g
2d6db946-d1b9-4d66-bb74-14f633399f15	1	\N	\N	\N	\N	\N	\N	2litros
2a655895-2fb9-400f-89e1-48c1e31e2dc8	1	\N	\N	\N	\N	\N	\N	1kg
3132af85-6998-45cb-86bd-bb56fa0c8f1c	1	\N	\N	\N	\N	\N	\N	400g
256b4489-22fa-4310-9501-db7d1447faac	1	\N	\N	\N	\N	\N	\N	400ml
c1cffbe5-c512-4cfd-8dea-0be4eeea52f5	1	\N	\N	\N	\N	\N	\N	4
a2a48d0e-bc5c-4e6a-83e6-ff458c409572	1	\N	\N	\N	\N	\N	\N	30g
9dd55d76-520c-4007-a4bd-cae14684f26b	1	\N	\N	\N	\N	\N	\N	1litro
69b000ea-d345-4355-97f3-28566f0fb0b5	1	\N	\N	\N	\N	\N	\N	10g
f8f83141-c850-40a1-98dc-804ec30a18fb	1	\N	\N	\N	\N	\N	\N	500g
f2d1761f-b291-4b81-8633-2b8b2dc68188	1	\N	\N	\N	\N	\N	\N	300g
e6cfd946-224e-49cf-a1fd-698ca634723c	1	\N	\N	\N	\N	\N	\N	1
a3ed2702-356d-41ed-81f4-20d68ce9b315	1	\N	\N	\N	\N	\N	\N	5g
176a2bc4-c189-4364-987a-038df608321d	1	\N	\N	\N	\N	\N	\N	Media
8e77bff0-3fa4-4e2a-8d08-8a0c41b47da6	1	\N	\N	\N	\N	\N	\N	Medio
697f1e9b-d3bb-4a99-84b8-484077601d93	1	\N	\N	\N	\N	\N	\N	60g
6b2fd382-2651-4082-9a95-67dc696d5c55	1	\N	\N	\N	\N	\N	\N	2
e7b8076f-3577-446e-bcd3-27e078e5ca9a	1	\N	\N	\N	\N	\N	\N	Al gusto
d60468cf-9a24-4a80-ba18-460539bcd8ba	1	\N	\N	\N	\N	\N	\N	1 lata
\.


--
-- TOC entry 3462 (class 0 OID 31672)
-- Dependencies: 239
-- Data for Name: micuisine_ingrediente; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_ingrediente (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, nombre) FROM stdin;
c23e4c9a-80dd-a93c-46fb-007742440d44	1	2019-06-16 15:58:48.093	admin	2019-06-16 15:58:48.093	\N	\N	\N	Aguacate
09a5f28e-862c-478f-9a1b-65759ac74f81	1	\N	\N	\N	\N	\N	\N	Pimiento rojo
7ed50a3b-61f8-4ef1-bcc2-6c71797eed70	1	\N	\N	\N	\N	\N	\N	Aceite
84f6bdfa-8fcb-4f69-a3c5-30888fec9461	1	\N	\N	\N	\N	\N	\N	Manzana
617ba86b-e04c-48eb-b076-bcdf3de0e9be	1	\N	\N	\N	\N	\N	\N	Habichuelas
b443368b-6ccc-419e-ac45-a2882d41001c	1	\N	\N	\N	\N	\N	\N	Harina
9996bff1-ae1a-4256-9ff8-367be32aa37f	1	\N	\N	\N	\N	\N	\N	Miel de caña
d49fd3ca-78e1-4fab-b545-1cb3a3d6784e	1	\N	\N	\N	\N	\N	\N	Agua
b941d25f-de14-4d39-bc09-814ac416bfe9	1	\N	\N	\N	\N	\N	\N	Pimienta
0bf7e25a-8073-4e5f-8a90-0e5b730916e1	1	\N	\N	\N	\N	\N	\N	Pera
6f25b0f1-2acc-4969-ae3c-4ca31878b874	1	\N	\N	\N	\N	\N	\N	Mascarpone
7efd5200-0888-40b7-a00b-aef8b83e3c73	1	\N	\N	\N	\N	\N	\N	Remolacha
d117a66e-ad0e-4c74-8414-7fd5922ad1a8	1	\N	\N	\N	\N	\N	\N	Ternera
6da0a4f8-c115-4239-9c44-48026218dd32	1	\N	\N	\N	\N	\N	\N	Lechuga
af0c94ab-65a3-4482-8221-370737abd1f6	1	\N	\N	\N	\N	\N	\N	Romero
d256871c-e037-43c7-86c7-265ed60678db	1	\N	\N	\N	\N	\N	\N	Pepino
2cc581d4-efb0-48df-94e2-91ec719cb1b3	1	\N	\N	\N	\N	\N	\N	Yogurt
5d620d1d-bec7-4fae-a403-dd81331e8d03	1	\N	\N	\N	\N	\N	\N	Leche
463f2d51-673c-4f98-a1e0-e0ad7383c3e6	1	\N	\N	\N	\N	\N	\N	Fideos
3746ff61-feb6-439c-9f4e-29c97369d0af	1	\N	\N	\N	\N	\N	\N	Muslos de Pollo
33c90665-775f-4326-ad62-5bd566fe6b08	1	\N	\N	\N	\N	\N	\N	Azúcar
dec31c67-a634-41fc-ae5b-b6389d349b52	1	\N	\N	\N	\N	\N	\N	Pollo
37cd1dc1-00e9-498e-a8b3-7b39fb5b9477	1	\N	\N	\N	\N	\N	\N	Atún
627a580b-fe0f-4a09-96d0-64a4528fb3dd	1	\N	\N	\N	\N	\N	\N	Zanahoria
5f3b206f-3bbe-4f73-9e45-a0623430624f	1	\N	\N	\N	\N	\N	\N	Pan
ef131e0b-04d1-4c7d-b226-9ff0cfe6a7d7	1	\N	\N	\N	\N	\N	\N	Vinagre
749a90a5-bc76-4803-a266-1336db2cc8b9	1	\N	\N	\N	\N	\N	\N	Garbanzos
a3790f80-2d56-4f6a-ab89-59d2aee2d018	1	\N	\N	\N	\N	\N	\N	Limón
4f30e4b6-828e-4411-8a27-fa8090e9aa4f	1	\N	\N	\N	\N	\N	\N	Picatostes
941e7e54-4209-468c-bbfd-ebb7520bf61f	1	\N	\N	\N	\N	\N	\N	Huevos
8f645602-6065-461d-aa03-62f65f660826	1	\N	\N	\N	\N	\N	\N	Tomate de pera
3569793b-8b86-4091-a9a8-5755fe616b6f	1	\N	\N	\N	\N	\N	\N	Cebolla 
155b7670-c50d-4ddc-8e87-ffb5df068a20	1	\N	\N	\N	\N	\N	\N	Taquitos Jamón
cbc360f4-7180-4c69-9f90-864b6dbec0ba	1	\N	\N	\N	\N	\N	\N	Perejil
69d7390b-f05d-4676-86ce-6d2ee12e8230	1	\N	\N	\N	\N	\N	\N	Coliflor
285dfd13-687d-429f-ba45-1f343550b7fa	1	\N	\N	\N	\N	\N	\N	Queso parmesano
396766db-eddc-4089-9a6b-3c994b1203ba	1	\N	\N	\N	\N	\N	\N	Espaguetis
d0afbe3a-99e7-428a-be88-b202e8d20f7c	1	\N	\N	\N	\N	\N	\N	Queso
4bc1cf57-e109-4839-8bde-82b288309f10	1	\N	\N	\N	\N	\N	\N	Sal
c4242c7a-3b08-47c5-a1b2-35c3f0f1ac25	1	\N	\N	\N	\N	\N	\N	Ajos
a4e1ac16-1a7a-4509-ad38-3b9004f14f67	1	\N	\N	\N	\N	\N	\N	Laurel
05298333-9bea-4624-8c6f-9498adbc3894	1	\N	\N	\N	\N	\N	\N	Berenjenas
21abfd75-77dc-48d2-ac3b-9cc826f3aeb6	1	\N	\N	\N	\N	\N	\N	Aguacate
03031514-2ea7-4640-ac41-0624be31cca9	1	\N	\N	\N	\N	\N	\N	Tomate frito
d0bcb57b-8a5a-4bfa-a580-7459b84ef865	1	\N	\N	\N	\N	\N	\N	Guisantes
282fb397-4d8a-4bd4-bfea-d648da514d84	1	\N	\N	\N	\N	\N	\N	Fresa
7c559ce4-ad52-4465-9a9c-0506953d7917	1	\N	\N	\N	\N	\N	\N	Carne picada
e4918bdf-4821-4d00-b74d-0c534ab18556	1	\N	\N	\N	\N	\N	\N	Canela
45d901f2-1255-4892-8673-2fcbbdb4ce85	1	\N	\N	\N	\N	\N	\N	Nueces
a37ad265-ef95-4430-8316-04b0ad4d0099	1	\N	\N	\N	\N	\N	\N	Patata
\.


--
-- TOC entry 3469 (class 0 OID 31710)
-- Dependencies: 246
-- Data for Name: micuisine_ingredientes_mas_utilizados; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_ingredientes_mas_utilizados (id, ingrediente, cantidad) FROM stdin;
\.


--
-- TOC entry 3464 (class 0 OID 31682)
-- Dependencies: 241
-- Data for Name: micuisine_receta; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_receta (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, categoria, nombre, personas, duracion, preparacion, visitas, consejos, uri, fecha_creacion, usuario_id) FROM stdin;
4b27b340-944b-4058-a6bd-b6269c6867a4	2	\N	\N	2019-06-16 15:52:16.766	admin	\N	\N	7	Carpa dorada	1	20min		2		https://firebasestorage.googleapis.com/v0/b/mi-cuisine.appspot.com/o/fotos%2Fstorage%2Femulated%2F0%2FDCIM%2FCamera%2FIMG_20190604_113416.jpg?alt=media&token=6083092d-35c7-4785-bd3a-1643281d80f8	2019-06-14	cd2b75e6-18ce-4e72-8a88-5464a665df1d
9cea273c-8469-47c3-bf0d-8901b1ae53f8	2	\N	\N	2019-06-16 15:59:28.813	admin	\N	\N	3	Guacamole	2	20m	Triturar todos los ingredientes hasta que quede pastosa	0	añadir cilantro	https://firebasestorage.googleapis.com/v0/b/mi-cuisine.appspot.com/o/camara.png?alt=media&token=70756ee2-886b-451b-bb80-8bdc41fe6636	2019-06-13	fb011a05-9038-49e3-a904-e770789f8863
ec1d5ce3-6e68-4eda-8985-dda8803761db	2	\N	\N	2019-06-16 16:00:46.825	admin	\N	\N	4	Ensalada Mediterranea	4	15min	Picamos los ingredientes y los ponemos en un bol, con el vinagre el aceite y sal hacemos una vinagreta para la ensalada.	18	Al aliño podemos ponerle orégano y le da un toque diferente.	content://com.example.cyntia.micuisine.provider/my_images/IMG_20190614_193714_368821082.jpg	2019-06-12	cd2b75e6-18ce-4e72-8a88-5464a665df1d
53d9a815-cc58-407a-84ae-4c3ba6efe15a	2	\N	\N	2019-06-16 16:01:02.9	admin	\N	\N	3	Berenjenas fritas con humus y miel de caña	4	25min	Triturar los garbanzos después de lavarlos y escurrirlos, el ajo, el agua, el vinagre y el aceite. \n\nPoner el humus en la nevera después de echar la sal.\n\nCorte las berenjenas en láminas. Sazonar y dejar reposar al menos 2h.\n\nEscurrir las berenjenas, harinar y freír. Una vez fritas, añadir la miel y el humus en el mismo plato.	6	se puede añadir comino al humus.	content://com.mi.android.globalFileexplorer.myprovider/external_files/Download/Berenjenas-con-miel-de-caC3B1a.jpg	2019-06-13	c2b86653-971f-41c1-9d0d-2fb273931ff5
e5d78321-c135-41bf-b986-2664e40dc16e	1	\N	\N	\N	\N	\N	\N	6	Espaguetis Boloñesa	4personas	40min	Picamos todas las verduras y sofreimos en una sarten con aceite.\nDespués ponemos una olla con agua a calentar , cuando este hirviendo el agua añadimos los 400g de espaguetis, y cocemos durante 8 minutos. \nDespués de sofreir la verdura sofreimos la carne en otra sarten.\nCuando tengamos la verdura la batiremos con tomate frito y esa salsa la uniremos a la carne. \nUna vez acabado estos pasos unimos la salsa a los espaguetis.	19	Se puede sofreir la carne con un poco de vino.	content://com.example.cyntia.micuisine.provider/my_images/IMG_20190614_194158_564201802.jpg	2019-06-07	cd2b75e6-18ce-4e72-8a88-5464a665df1d
d7d8d360-2d54-4250-bb8f-75aa82298b3c	1	\N	\N	\N	\N	\N	\N	3	Coliflor Rebozada	4	25min	1-Cortar la coliflor en trozos más pequeños\n\n2-Batir huevo y poner agua\n\n3- Mojar la coliflor en agua y huevo y rebozar en harina\n\n4- Freír y ya esta	0	Acompañar con un poco de mayonesa	https://firebasestorage.googleapis.com/v0/b/mi-cuisine.appspot.com/o/camara.png?alt=media&token=70756ee2-886b-451b-bb80-8bdc41fe6636	2019-06-14	fb011a05-9038-49e3-a904-e770789f8863
95b25353-1a2b-4c4f-b7e0-b2aefc2131b8	2	\N	\N	2019-06-16 16:01:27.261	admin	\N	\N	12	Mermelada de Fresa	6	30min	Limpiar las fresas y verterlas junto al azúcar y el zumo de limón en una olla.\n\nDejar a fuego medio durante 20/25 y posteriormente triturar	1	se recomienda usar Thermomix o similar	content://com.mi.android.globalFileexplorer.myprovider/external_files/Download/descarga.jpeg	2019-06-13	fb011a05-9038-49e3-a904-e770789f8863
\.


--
-- TOC entry 3466 (class 0 OID 31695)
-- Dependencies: 243
-- Data for Name: micuisine_receta_cantidad_link; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_receta_cantidad_link (receta_id, cantidad_id) FROM stdin;
4b27b340-944b-4058-a6bd-b6269c6867a4	9f4076b4-44a0-4d76-b206-705cb5995c17
9cea273c-8469-47c3-bf0d-8901b1ae53f8	e7b8076f-3577-446e-bcd3-27e078e5ca9a
9cea273c-8469-47c3-bf0d-8901b1ae53f8	04a3d183-1896-483e-bfb2-a327e6181d9d
9cea273c-8469-47c3-bf0d-8901b1ae53f8	9e9f4587-2be7-4764-b4b9-70eb2396d70d
ec1d5ce3-6e68-4eda-8985-dda8803761db	f2d1761f-b291-4b81-8633-2b8b2dc68188
ec1d5ce3-6e68-4eda-8985-dda8803761db	203491f8-4633-4f0d-a47b-8696e0c78539
ec1d5ce3-6e68-4eda-8985-dda8803761db	23ba9f79-8f80-4e26-b3a2-8ba3421fd193
\.


--
-- TOC entry 3465 (class 0 OID 31690)
-- Dependencies: 242
-- Data for Name: micuisine_receta_ingrediente_link; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_receta_ingrediente_link (receta_id, ingrediente_id) FROM stdin;
4b27b340-944b-4058-a6bd-b6269c6867a4	6f25b0f1-2acc-4969-ae3c-4ca31878b874
9cea273c-8469-47c3-bf0d-8901b1ae53f8	c23e4c9a-80dd-a93c-46fb-007742440d44
9cea273c-8469-47c3-bf0d-8901b1ae53f8	b941d25f-de14-4d39-bc09-814ac416bfe9
9cea273c-8469-47c3-bf0d-8901b1ae53f8	7ed50a3b-61f8-4ef1-bcc2-6c71797eed70
ec1d5ce3-6e68-4eda-8985-dda8803761db	84f6bdfa-8fcb-4f69-a3c5-30888fec9461
ec1d5ce3-6e68-4eda-8985-dda8803761db	285dfd13-687d-429f-ba45-1f343550b7fa
ec1d5ce3-6e68-4eda-8985-dda8803761db	8f645602-6065-461d-aa03-62f65f660826
\.


--
-- TOC entry 3468 (class 0 OID 31705)
-- Dependencies: 245
-- Data for Name: micuisine_recetas_por_dia; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_recetas_por_dia (id, fecha, cantidad_recetas) FROM stdin;
\.


--
-- TOC entry 3467 (class 0 OID 31700)
-- Dependencies: 244
-- Data for Name: micuisine_recetas_por_usuario; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_recetas_por_usuario (id, usuario, cantidad_recetas) FROM stdin;
\.


--
-- TOC entry 3461 (class 0 OID 31664)
-- Dependencies: 238
-- Data for Name: micuisine_usuario; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_usuario (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, nombre, apellidos, email, telefono) FROM stdin;
f1ffd2c4-54a7-44ab-892b-867ff7c898a6	1	\N	\N	\N	\N	\N	\N	prueba	prueba	1234@1234.com	661121633
c2b86653-971f-41c1-9d0d-2fb273931ff5	1	\N	\N	\N	\N	\N	\N	Alberto	Chicote	albertochicote@lasexta.com	685438717
67c420e8-1081-4adf-b166-50c154d4c1f6	1	\N	\N	\N	\N	\N	\N	Isabel	Pantoja	isabel@pantoja.es	612612583
e7ff6229-8d7c-4db4-af9a-03e82155b35e	1	\N	\N	\N	\N	\N	\N	lydia	garcia ruiz	lydiagarciaruz@gmail.com	605391386
cd2b75e6-18ce-4e72-8a88-5464a665df1d	1	\N	\N	\N	\N	\N	\N	Cintia	Garcia Ruiz	cyntigr@gmail.com	661121633
fb011a05-9038-49e3-a904-e770789f8863	1	\N	\N	\N	\N	\N	\N	Alexander	Quesada	alexql91@gmail.com	610040371
\.


--
-- TOC entry 3433 (class 0 OID 31282)
-- Dependencies: 210
-- Data for Name: sec_constraint; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_constraint (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, code, check_type, operation_type, entity_name, join_clause, where_clause, groovy_script, filter_xml, is_active, group_id) FROM stdin;
\.


--
-- TOC entry 3440 (class 0 OID 31373)
-- Dependencies: 217
-- Data for Name: sec_entity_log; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_entity_log (id, create_ts, created_by, event_ts, user_id, change_type, entity, entity_instance_name, entity_id, string_entity_id, int_entity_id, long_entity_id, changes) FROM stdin;
\.


--
-- TOC entry 3441 (class 0 OID 31390)
-- Dependencies: 218
-- Data for Name: sec_filter; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_filter (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, component, name, code, xml, user_id, global_default) FROM stdin;
b61d18cb-e79a-46f3-b16d-eaf4aebb10dd	2019-06-15 22:31:55.228469	admin	0	\N	\N	\N	\N	[sec$User.browse].genericFilter	Search by role	\N	<?xml version="1.0" encoding="UTF-8"?><filter><and><c name="UrMxpkfMGn" class="com.haulmont.cuba.security.entity.Role" type="CUSTOM" locCaption="Role" entityAlias="u" join="join u.userRoles ur">ur.role.id = :component$genericFilter.UrMxpkfMGn32565<param name="component$genericFilter.UrMxpkfMGn32565">NULL</param></c></and></filter>	60885987-1b61-4247-94c7-dff348347f93	f
\.


--
-- TOC entry 3428 (class 0 OID 31215)
-- Dependencies: 205
-- Data for Name: sec_group; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_group (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, name, parent_id) FROM stdin;
0fa2b1a5-1d68-4d69-9fbd-dff348347f93	2019-06-15 22:31:55.150655	\N	0	\N	\N	\N	\N	Company	\N
\.


--
-- TOC entry 3429 (class 0 OID 31226)
-- Dependencies: 206
-- Data for Name: sec_group_hierarchy; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_group_hierarchy (id, create_ts, created_by, group_id, parent_id, hierarchy_level) FROM stdin;
\.


--
-- TOC entry 3434 (class 0 OID 31299)
-- Dependencies: 211
-- Data for Name: sec_localized_constraint_msg; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_localized_constraint_msg (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, entity_name, operation_type, values_) FROM stdin;
\.


--
-- TOC entry 3439 (class 0 OID 31360)
-- Dependencies: 216
-- Data for Name: sec_logged_attr; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_logged_attr (id, create_ts, created_by, entity_id, name) FROM stdin;
\.


--
-- TOC entry 3438 (class 0 OID 31353)
-- Dependencies: 215
-- Data for Name: sec_logged_entity; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_logged_entity (id, create_ts, created_by, name, auto, manual) FROM stdin;
\.


--
-- TOC entry 3432 (class 0 OID 31271)
-- Dependencies: 209
-- Data for Name: sec_permission; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, permission_type, target, value_, role_id) FROM stdin;
\.


--
-- TOC entry 3444 (class 0 OID 31427)
-- Dependencies: 221
-- Data for Name: sec_presentation; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_presentation (id, create_ts, created_by, update_ts, updated_by, component, name, xml, user_id, is_auto_save) FROM stdin;
\.


--
-- TOC entry 3457 (class 0 OID 31613)
-- Dependencies: 234
-- Data for Name: sec_remember_me; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_remember_me (id, create_ts, created_by, version, user_id, token) FROM stdin;
\.


--
-- TOC entry 3427 (class 0 OID 31206)
-- Dependencies: 204
-- Data for Name: sec_role; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_role (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, name, loc_name, description, is_default_role, role_type) FROM stdin;
0c018061-b26f-4de2-a5be-dff348347f93	2019-06-15 22:31:55.183881	\N	0	\N	\N	\N	\N	Administrators	\N	\N	\N	10
cd541dd4-eeb7-cd5b-847e-d32236552fa9	2019-06-15 22:31:55.19517	\N	0	\N	\N	\N	\N	Anonymous	\N	\N	\N	30
\.


--
-- TOC entry 3447 (class 0 OID 31474)
-- Dependencies: 224
-- Data for Name: sec_screen_history; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_screen_history (id, create_ts, created_by, user_id, caption, url, entity_id, substituted_user_id) FROM stdin;
\.


--
-- TOC entry 3445 (class 0 OID 31441)
-- Dependencies: 222
-- Data for Name: sec_search_folder; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_search_folder (folder_id, filter_component, filter_xml, user_id, presentation_id, apply_default, is_set, entity_type) FROM stdin;
\.


--
-- TOC entry 3435 (class 0 OID 31308)
-- Dependencies: 212
-- Data for Name: sec_session_attr; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_session_attr (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, name, str_value, datatype, group_id) FROM stdin;
\.


--
-- TOC entry 3460 (class 0 OID 31641)
-- Dependencies: 237
-- Data for Name: sec_session_log; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_session_log (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, session_id, user_id, substituted_user_id, user_data, last_action, client_info, client_type, address, started_ts, finished_ts, server_id) FROM stdin;
\.


--
-- TOC entry 3430 (class 0 OID 31241)
-- Dependencies: 207
-- Data for Name: sec_user; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_user (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, login, login_lc, password, password_encryption, name, first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active, group_id, ip_mask, change_password_at_logon) FROM stdin;
60885987-1b61-4247-94c7-dff348347f93	2019-06-15 22:31:55.161708	\N	0	\N	\N	\N	\N	admin	admin	$2a$10$vQx8b8B7jzZ0rQmtuK4YDOKp7nkmUCFjPx6DMT.voPtetNHFOsaOu	bcrypt	Administrator	\N	\N	\N	\N	\N	\N	\N	\N	t	0fa2b1a5-1d68-4d69-9fbd-dff348347f93	\N	\N
a405db59-e674-4f63-8afe-269dda788fe8	2019-06-15 22:31:55.172732	\N	0	\N	\N	\N	\N	anonymous	anonymous	\N	\N	Anonymous	\N	\N	\N	\N	\N	\N	\N	\N	t	0fa2b1a5-1d68-4d69-9fbd-dff348347f93	\N	\N
\.


--
-- TOC entry 3431 (class 0 OID 31255)
-- Dependencies: 208
-- Data for Name: sec_user_role; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_user_role (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, user_id, role_id) FROM stdin;
c838be0a-96d0-4ef4-a7c0-dff348347f93	2019-06-15 22:31:55.206083	\N	0	\N	\N	\N	\N	60885987-1b61-4247-94c7-dff348347f93	0c018061-b26f-4de2-a5be-dff348347f93
f01fb532-c2f0-dc18-b86c-450cf8a8d8c5	2019-06-15 22:31:55.217188	\N	0	\N	\N	\N	\N	a405db59-e674-4f63-8afe-269dda788fe8	cd541dd4-eeb7-cd5b-847e-d32236552fa9
\.


--
-- TOC entry 3436 (class 0 OID 31322)
-- Dependencies: 213
-- Data for Name: sec_user_setting; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_user_setting (id, create_ts, created_by, user_id, client_type, name, value_) FROM stdin;
38169e4b-f92b-2625-0be0-f0f5396ef0c1	2019-06-15 23:27:02.462	admin	60885987-1b61-4247-94c7-dff348347f93	W	micuisine_Receta.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="recetasTable"/>\n  </components>\n</settings>\n
2cd28c76-9676-dc86-4f15-0fc3c14cfcf7	2019-06-15 23:27:05.876	admin	60885987-1b61-4247-94c7-dff348347f93	W	micuisine_Usuario.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="usuariosTable"/>\n  </components>\n</settings>\n
3e035ae8-7dd1-b6dc-8dee-fb725b19af7f	2019-06-15 23:34:27.074	admin	60885987-1b61-4247-94c7-dff348347f93	W	micuisine_Ingrediente.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="ingredientesTable"/>\n  </components>\n</settings>\n
14e89376-d8e5-5a4d-10b2-018cce0f1a5b	2019-06-16 15:51:33.992	admin	60885987-1b61-4247-94c7-dff348347f93	W	micuisine_Receta.edit	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="listaIngredientesBox"/>\n    <component name="listaIngredientesTable">\n      <columns sortProperty="nombre" sortAscending="true">\n        <columns id="nombre" visible="true"/>\n      </columns>\n    </component>\n    <component name="listaCantidadBox"/>\n    <component name="listaCantidadTable">\n      <columns sortProperty="peso" sortAscending="true">\n        <columns id="peso" visible="true"/>\n      </columns>\n    </component>\n  </components>\n</settings>\n
b5ebdc8f-358f-0ab1-af33-cde7d459361a	2019-06-16 15:52:15.097	admin	60885987-1b61-4247-94c7-dff348347f93	W	micuisine_Cantidad.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="cantidadsTable"/>\n  </components>\n</settings>\n
\.


--
-- TOC entry 3437 (class 0 OID 31337)
-- Dependencies: 214
-- Data for Name: sec_user_substitution; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_user_substitution (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, user_id, substituted_user_id, start_date, end_date) FROM stdin;
\.


--
-- TOC entry 3458 (class 0 OID 31625)
-- Dependencies: 235
-- Data for Name: sys_access_token; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_access_token (id, create_ts, token_value, token_bytes, authentication_key, authentication_bytes, expiry, user_login, locale, refresh_token_value) FROM stdin;
\.


--
-- TOC entry 3443 (class 0 OID 31414)
-- Dependencies: 220
-- Data for Name: sys_app_folder; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_app_folder (folder_id, filter_component, filter_xml, visibility_script, quantity_script, apply_default) FROM stdin;
\.


--
-- TOC entry 3453 (class 0 OID 31570)
-- Dependencies: 230
-- Data for Name: sys_attr_value; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_attr_value (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, category_attr_id, code, entity_id, string_entity_id, int_entity_id, long_entity_id, string_value, integer_value, double_value, date_value, boolean_value, entity_value, string_entity_value, int_entity_value, long_entity_value, parent_id) FROM stdin;
\.


--
-- TOC entry 3451 (class 0 OID 31546)
-- Dependencies: 228
-- Data for Name: sys_category; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_category (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, name, special, entity_type, is_default, discriminator, locale_names) FROM stdin;
\.


--
-- TOC entry 3452 (class 0 OID 31555)
-- Dependencies: 229
-- Data for Name: sys_category_attr; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_category_attr (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, category_entity_type, name, code, category_id, entity_class, data_type, default_string, default_int, default_double, default_date, default_date_is_current, default_boolean, default_entity_value, default_str_entity_value, default_int_entity_value, default_long_entity_value, enumeration, order_no, screen, required, lookup, target_screens, width, rows_count, is_collection, join_clause, where_clause, filter_xml, locale_names, enumeration_locales) FROM stdin;
\.


--
-- TOC entry 3421 (class 0 OID 31153)
-- Dependencies: 198
-- Data for Name: sys_config; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_config (id, create_ts, created_by, version, update_ts, updated_by, name, value_) FROM stdin;
\.


--
-- TOC entry 3419 (class 0 OID 31137)
-- Dependencies: 196
-- Data for Name: sys_db_changelog; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_db_changelog (script_name, create_ts, is_init) FROM stdin;
10-cuba/init/postgres/create-db.sql	2019-06-15 22:31:55.239551	1
50-Micuisine/init/postgres/10.create-db.sql	2019-06-15 22:31:55.83013	1
50-Micuisine/init/postgres/20.create-db.sql	2019-06-15 22:31:55.952342	1
50-Micuisine/init/postgres/30.create-db.sql	2019-06-15 22:31:55.964084	1
10-cuba/update/postgres/01/01-010-addValueIdToEntityLog.sql	2019-06-15 22:31:55.982573	1
10-cuba/update/postgres/01/01-020-dropDbUpdatePKey.sql	2019-06-15 22:31:55.985713	1
10-cuba/update/postgres/01/01-030-add_EntityLogAttr_messagesPack.sql	2019-06-15 22:31:55.99681	1
10-cuba/update/postgres/01/01-040-renameUserPosition.sql	2019-06-15 22:31:56.007968	1
10-cuba/update/postgres/01/01-050-addUserLanguage.sql	2019-06-15 22:31:56.019075	1
10-cuba/update/postgres/01/01-050-sysFtsQueue.sql	2019-06-15 22:31:56.030133	1
10-cuba/update/postgres/01/01-055-createReportTables.sql	2019-06-15 22:31:56.041278	1
10-cuba/update/postgres/01/01-060-addReportParameterPosition.sql	2019-06-15 22:31:56.052362	1
10-cuba/update/postgres/01/01-070-addCodeInFolder.sql	2019-06-15 22:31:56.063523	1
10-cuba/update/postgres/01/01-080-SessionAttributes.sql	2019-06-15 22:31:56.074607	1
10-cuba/update/postgres/01/01-090-ChangeReportKeys.sql	2019-06-15 22:31:56.085718	1
10-cuba/update/postgres/01/01-100-EntityStatistics.sql	2019-06-15 22:31:56.09682	1
10-cuba/update/postgres/01/01-100-addPresentations.sql	2019-06-15 22:31:56.107971	1
10-cuba/update/postgres/01/01-110-AddFieldInSysFolder.sql	2019-06-15 22:31:56.119076	1
10-cuba/update/postgres/01/01-120-AddCodeFieldInSecFilter.sql	2019-06-15 22:31:56.130291	1
10-cuba/update/postgres/01/01-130-createReportValueFormatTable.sql	2019-06-15 22:31:56.141263	1
10-cuba/update/postgres/01/01-140-AddTabHistory.sql	2019-06-15 22:31:56.152362	1
10-cuba/update/postgres/01/01-150-CreateIndexes.sql	2019-06-15 22:31:56.163464	1
10-cuba/update/postgres/01/01-160-screenHistory.sql	2019-06-15 22:31:56.174652	1
10-cuba/update/postgres/01/01-170-entityStatisticsFetchUI.sql	2019-06-15 22:31:56.185831	1
10-cuba/update/postgres/01/01-180-changeAppFoldersScriptsLength.sql	2019-06-15 22:31:56.196793	1
10-cuba/update/postgres/01/01-190-renameDoubleNameInSysFolder.sql	2019-06-15 22:31:56.20792	1
10-cuba/update/postgres/01/01-200-deleteCodeInSysFolders.sql	2019-06-15 22:31:56.219139	1
10-cuba/update/postgres/01/01-210-updateTabNameInSysFolder.sql	2019-06-15 22:31:56.230192	1
10-cuba/update/postgres/01/01-220-reportTablesChangeColumns.sql	2019-06-15 22:31:56.241249	1
10-cuba/update/postgres/01/01-230-reportParameterAddEnumClass.sql	2019-06-15 22:31:56.252353	1
10-cuba/update/postgres/01/01-240-userIpMask.sql	2019-06-15 22:31:56.26361	1
10-cuba/update/postgres/01/01-250-entityStatLookupScreenThreshold.sql	2019-06-15 22:31:56.274567	1
10-cuba/update/postgres/01/01-260-reportTemplatesTable.sql	2019-06-15 22:31:56.285845	1
10-cuba/update/postgres/01/01-270-sendingMessagesHistory.sql	2019-06-15 22:31:56.296855	1
10-cuba/update/postgres/01/01-280-addApplyDefault.sql	2019-06-15 22:31:56.307991	1
10-cuba/update/postgres/01/01-290-addIsSetToSearchFolder.sql	2019-06-15 22:31:56.31913	1
10-cuba/update/postgres/01/01-300-addEntitySnapshotTable.sql	2019-06-15 22:31:56.330587	1
10-cuba/update/postgres/01/01-310-RuntimePropertiesTables.sql	2019-06-15 22:31:56.341478	1
10-cuba/update/postgres/01/01-320-RuntimePropertiesRework.sql	2019-06-15 22:31:56.35273	1
10-cuba/update/postgres/01/01-330-CategoryAttrAlterType.sql	2019-06-15 22:31:56.363797	1
10-cuba/update/postgres/01/01-340-CategoryDiscriminator.sql	2019-06-15 22:31:56.374912	1
10-cuba/update/postgres/01/01-350-categoryAttrOrderNo.sql	2019-06-15 22:31:56.386133	1
10-cuba/update/postgres/01/01-360-CategoryAttrScreen.sql	2019-06-15 22:31:56.396966	1
10-cuba/update/postgres/01/01-370-CategoryAttrRequired.sql	2019-06-15 22:31:56.408206	1
10-cuba/update/postgres/01/01-380-AlterTypeColumnUrlInScreenHistory.sql	2019-06-15 22:31:56.4194	1
10-cuba/update/postgres/01/01-390-AlterTableSysCategoryAttr.sql	2019-06-15 22:31:56.430256	1
10-cuba/update/postgres/01/01-400-AlterTableSysAttrValue.sql	2019-06-15 22:31:56.441587	1
10-cuba/update/postgres/01/01-410-addDataSetParams.sql	2019-06-15 22:31:56.452685	1
10-cuba/update/postgres/01/01-410-addStartDateToUserSubstitution.sql	2019-06-15 22:31:56.464011	1
10-cuba/update/postgres/01/01-420-addEntityIdToScreenHistory.sql	2019-06-15 22:31:56.474916	1
10-cuba/update/postgres/01/01-440-addDropdownToCategoryAttribute.sql	2019-06-15 22:31:56.486038	1
10-cuba/update/postgres/01/01-450-alterSecConstraint.sql	2019-06-15 22:31:56.496991	1
10-cuba/update/postgres/02/02-010-addScheduledTasks.sql	2019-06-15 22:31:56.508084	1
10-cuba/update/postgres/02/02-020-alterDoubleValueColumnInSysAttrValueTable.sql	2019-06-15 22:31:56.519217	1
10-cuba/update/postgres/02/02-030-addReportGroup.sql	2019-06-15 22:31:56.530699	1
10-cuba/update/postgres/02/02-040-addReportRefToBand.sql	2019-06-15 22:31:56.541384	1
10-cuba/update/postgres/02/02-050-reportLocales.sql	2019-06-15 22:31:56.552584	1
10-cuba/update/postgres/02/02-060-reportCode.sql	2019-06-15 22:31:56.563843	1
10-cuba/update/postgres/02/02-070-addRoleType.sql	2019-06-15 22:31:56.574954	1
10-cuba/update/postgres/02/02-080-addSnapshotDate.sql	2019-06-15 22:31:56.585956	1
10-cuba/update/postgres/02/02-090-schedulingDaylightSaving.sql	2019-06-15 22:31:56.597514	1
10-cuba/update/postgres/02/02-100-entitySnapshotAuthor.sql	2019-06-15 22:31:56.608246	1
10-cuba/update/postgres/02/02-110-addDefaultDateIsCurrent.sql	2019-06-15 22:31:56.619248	1
10-cuba/update/postgres/02/02-120-addUserDescriminator.sql	2019-06-15 22:31:56.630822	1
10-cuba/update/postgres/02/02-130-alterSecConstraint.sql	2019-06-15 22:31:56.641497	1
10-cuba/update/postgres/02/02-130-queryResults.sql	2019-06-15 22:31:56.652734	1
10-cuba/update/postgres/02/02-140-entityLogChanges.sql	2019-06-15 22:31:56.664147	1
10-cuba/update/postgres/02/02-150-alterSysScheduledTask.sql	2019-06-15 22:31:56.67504	1
10-cuba/update/postgres/12/121002-updateScreenPermissions.sql	2019-06-15 22:31:56.685913	1
10-cuba/update/postgres/12/121003-addCodeToCategoryAttribute.sql	2019-06-15 22:31:56.697532	1
10-cuba/update/postgres/12/121004-addFieldsToScheduledTasks.sql	2019-06-15 22:31:56.708246	1
10-cuba/update/postgres/12/121020-addLoginConstraintsForUser.sql	2019-06-15 22:31:56.719287	1
10-cuba/update/postgres/12/121024-addEncryptionParamsToUser.sql	2019-06-15 22:31:56.730924	1
10-cuba/update/postgres/12/121031-dropPasswordColumnFromScheduledTask.sql	2019-06-15 22:31:56.74159	1
10-cuba/update/postgres/12/121102-dropSaltColumn.sql	2019-06-15 22:31:56.752699	1
10-cuba/update/postgres/12/121114-addDescriptionToScheduledTask.sql	2019-06-15 22:31:56.764125	1
10-cuba/update/postgres/12/121228-addJmxInstance.sql	2019-06-15 22:31:56.775052	1
10-cuba/update/postgres/13/130110-removeJmxInstanceDescription.sql	2019-06-15 22:31:56.786093	1
10-cuba/update/postgres/13/130311-renameColumnsForOracle.sql	2019-06-15 22:31:56.797258	1
10-cuba/update/postgres/13/130731-changeServerEntity.sql	2019-06-15 22:31:56.808347	1
10-cuba/update/postgres/13/130918-email-attachment-options.sql	2019-06-15 22:31:56.819408	1
10-cuba/update/postgres/13/130920-email-file-storage.sql	2019-06-15 22:31:56.830758	1
10-cuba/update/postgres/13/130923-permissionsToRenamedScreens.sql	2019-06-15 22:31:56.841772	1
10-cuba/update/postgres/13/131108-sending-message-timeshift.sql	2019-06-15 22:31:56.852856	1
10-cuba/update/postgres/13/131112-scheduled-task-cron.sql	2019-06-15 22:31:56.863941	1
10-cuba/update/postgres/14/140313-ftsQueueIndexingHost.sql	2019-06-15 22:31:56.875028	1
10-cuba/update/postgres/14/140405-changeTypeForSysConfigValue.sql	2019-06-15 22:31:56.886033	1
10-cuba/update/postgres/14/140708-addRememberMeTable.sql	2019-06-15 22:31:56.897463	1
10-cuba/update/postgres/14/140716-changeSysFileSizeType.sql	2019-06-15 22:31:56.908446	1
10-cuba/update/postgres/14/141203-setNotNullSysFileName.sql	2019-06-15 22:31:56.919524	1
10-cuba/update/postgres/15/150203-sendingMessageEmailHeaders.sql	2019-06-15 22:31:56.930459	1
10-cuba/update/postgres/15/150203-userTimeZone.sql	2019-06-15 22:31:56.941631	1
10-cuba/update/postgres/15/150205-addSubstituteUserInScreenHistory.sql	2019-06-15 22:31:56.952823	1
10-cuba/update/postgres/15/150226-addIndexInScreenHistory.sql	2019-06-15 22:31:56.964182	1
10-cuba/update/postgres/15/150310-alterFilterXml.sql	2019-06-15 22:31:56.974963	1
10-cuba/update/postgres/15/150417-runtimePropertiesChanges.sql	2019-06-15 22:31:56.986221	1
10-cuba/update/postgres/15/150514-categoryEntityTypeInAttribute.sql	2019-06-15 22:31:56.997659	1
10-cuba/update/postgres/15/150630-entityClassToCategoryAttribute.sql	2019-06-15 22:31:57.008318	1
10-cuba/update/postgres/15/150805-fakeFtsQueue.sql	2019-06-15 22:31:57.019581	1
10-cuba/update/postgres/15/151106-extendScheduledTaskFields.sql	2019-06-15 22:31:57.030572	1
10-cuba/update/postgres/15/151116-rowLevelSecurity.sql	2019-06-15 22:31:57.041644	1
10-cuba/update/postgres/15/151228-sendingMessagesExtendFields.sql	2019-06-15 22:31:57.052734	1
10-cuba/update/postgres/15/1512282-addIsActiveToConstraint.sql	2019-06-15 22:31:57.064075	1
10-cuba/update/postgres/16/160322-dropUniqSysScheduledTaskBeanMethodConstraint.sql	2019-06-15 22:31:57.075076	1
10-cuba/update/postgres/16/160405-createUniqSysCategory.sql	2019-06-15 22:31:57.086007	1
10-cuba/update/postgres/16/160420-createUpdateTsIndexOnSysSendingMessage.sql	2019-06-15 22:31:57.09746	1
10-cuba/update/postgres/16/160616-addSizeCategoryAttribute.sql	2019-06-15 22:31:57.108326	1
10-cuba/update/postgres/16/160626-createIndexOnFinishTimeScheduledExecution.sql	2019-06-15 22:31:57.119551	1
10-cuba/update/postgres/16/160725-anonymousLogin.sql	2019-06-15 22:31:57.130551	1
10-cuba/update/postgres/16/160916-addEntityIdToFtsQueue.sql	2019-06-15 22:31:57.141646	1
10-cuba/update/postgres/16/161024-collectionDynamicAttributes.sql	2019-06-15 22:31:57.152765	1
10-cuba/update/postgres/16/161025-sysAttrValueParentConstraint.sql	2019-06-15 22:31:57.164283	1
10-cuba/update/postgres/16/161102-setIsCollectionForExistingCategoryAttrs.sql	2019-06-15 22:31:57.175113	1
10-cuba/update/postgres/16/161124-FilterXmlInCategoryAttr.sql	2019-06-15 22:31:57.186266	1
10-cuba/update/postgres/16/161124-joinAndWhereInCategoryAttr.sql	2019-06-15 22:31:57.197545	1
10-cuba/update/postgres/16/270916-addEntityIdToQueryResult.sql	2019-06-15 22:31:57.208409	1
10-cuba/update/postgres/17/170214-addEntityIdToSnapshot.sql	2019-06-15 22:31:57.219545	1
10-cuba/update/postgres/17/170215-addEntityIdToEntityLog.sql	2019-06-15 22:31:57.230833	1
10-cuba/update/postgres/17/170221-addEntityIdToAttributeValue.sql	2019-06-15 22:31:57.241763	1
10-cuba/update/postgres/17/170228-createRestApiTokenTable.sql	2019-06-15 22:31:57.252854	1
10-cuba/update/postgres/17/170502-createSessionHistoryTable.sql	2019-06-15 22:31:57.264363	1
10-cuba/update/postgres/17/170620-alterConstraints.sql	2019-06-15 22:31:57.275203	1
10-cuba/update/postgres/17/170712-createLocalizedConstraintMessageTable.sql	2019-06-15 22:31:57.286289	1
10-cuba/update/postgres/17/170829-addLocaleNameColumnToCategory.sql	2019-06-15 22:31:57.297812	1
10-cuba/update/postgres/17/171002-addUserLoginToRestApiToken.sql	2019-06-15 22:31:57.3085	1
10-cuba/update/postgres/17/171116-addGlobalDefaultToFilterEntity.sql	2019-06-15 22:31:57.319565	1
10-cuba/update/postgres/17/171121-addLocaleToRestApiToken.sql	2019-06-15 22:31:57.33085	1
10-cuba/update/postgres/17/1712011000-createRestApiRefreshTokenTable.sql	2019-06-15 22:31:57.341747	1
10-cuba/update/postgres/17/1712011010-renameRestApiTokenColumns.sql	2019-06-15 22:31:57.352803	1
10-cuba/update/postgres/17/1712011010-renameRestApiTokenTable.sql	2019-06-15 22:31:57.364017	1
10-cuba/update/postgres/17/171227-createIndexStartedTsDescToSessionLog.sql	2019-06-15 22:31:57.375087	1
10-cuba/update/postgres/17/171229-addRefreshTokenColumnToAccessTokenTable.sql	2019-06-15 22:31:57.386223	1
10-cuba/update/postgres/18/180112-alterDynamicAttributeDoubleType.sql	2019-06-15 22:31:57.397571	1
10-cuba/update/postgres/18/180312-renameColumns.sql	2019-06-15 22:31:57.4084	1
10-cuba/update/postgres/18/180321-addContentBodyTypeColumnToSendingMessage.sql	2019-06-15 22:31:57.419503	1
10-cuba/update/postgres/18/180331-truncateQueryResultTable.sql	2019-06-15 22:31:57.430955	1
10-cuba/update/postgres/18/180704-addNotNullForConfig.sql	2019-06-15 22:31:57.441911	1
10-cuba/update/postgres/18/181024-addCcAndBccToSendingMessage.sql	2019-06-15 22:31:57.453247	1
10-cuba/update/postgres/18/181210-addUserPasswordEncryption.sql	2019-06-15 22:31:57.464034	1
10-cuba/update/postgres/19/190321-addEntityLogInstanceName.sql	2019-06-15 22:31:57.475481	1
50-Micuisine/update/postgres/19/190605-2-updateReceta.sql	2019-06-15 22:31:57.486328	1
50-Micuisine/update/postgres/19/190605-2-updateReceta_DropScript.sql	2019-06-15 22:31:57.497784	1
50-Micuisine/update/postgres/19/190606-1-createRecetasPorDia.sql	2019-06-15 22:31:57.508513	1
50-Micuisine/update/postgres/19/190606-1-createRecetasPorUsuario.sql	2019-06-15 22:31:57.519617	1
50-Micuisine/update/postgres/19/190606-2-updateRecetasPorDia.sql	2019-06-15 22:31:57.53104	1
50-Micuisine/update/postgres/19/190606-2-updateRecetasPorDia_DropScript.sql	2019-06-15 22:31:57.541888	1
50-Micuisine/update/postgres/19/190607-0-dropRecetaUsuarioLink.sql	2019-06-15 22:31:57.55292	1
50-Micuisine/update/postgres/19/190607-0-dropRecetaUsuarioLink_DropScript.sql	2019-06-15 22:31:57.564132	1
50-Micuisine/update/postgres/19/190607-0-dropUsuarioRecetaLink.sql	2019-06-15 22:31:57.575225	1
50-Micuisine/update/postgres/19/190607-0-dropUsuarioRecetaLink_DropScript.sql	2019-06-15 22:31:57.58635	1
50-Micuisine/update/postgres/19/190607-1-createRecetaUsuarioLink.sql	2019-06-15 22:31:57.597731	1
50-Micuisine/update/postgres/19/190607-2-createRecetaUsuarioLink.sql	2019-06-15 22:31:57.608553	1
50-Micuisine/update/postgres/19/190607-2-updateReceta.sql	2019-06-15 22:31:57.619734	1
50-Micuisine/update/postgres/19/190607-2-updateReceta01.sql	2019-06-15 22:31:57.631072	1
50-Micuisine/update/postgres/19/190607-2-updateReceta02.sql	2019-06-15 22:31:57.641915	1
50-Micuisine/update/postgres/19/190607-2-updateReceta02_DropScript.sql	2019-06-15 22:31:57.653064	1
50-Micuisine/update/postgres/19/190607-2-updateReceta03.sql	2019-06-15 22:31:57.664349	1
50-Micuisine/update/postgres/19/190611-1-createIngredientesMasUtilizados.sql	2019-06-15 22:31:57.675516	1
50-Micuisine/update/postgres/19/190611-2-updateRecetasPorUsuario.sql	2019-06-15 22:31:57.68646	1
50-Micuisine/update/postgres/19/190611-2-updateRecetasPorUsuario_DropScript.sql	2019-06-15 22:31:57.697965	1
50-Micuisine/update/postgres/19/190614-2-updateReceta.sql	2019-06-15 22:31:57.708605	1
50-Micuisine/update/postgres/19/190614-2-updateReceta01.sql	2019-06-15 22:31:57.719722	1
50-Micuisine/update/postgres/19/190614-2-updateReceta02.sql	2019-06-15 22:31:57.731009	1
50-Micuisine/update/postgres/19/190614-2-updateReceta03.sql	2019-06-15 22:31:57.741976	1
50-Micuisine/update/postgres/19/190614-2-updateReceta04.sql	2019-06-15 22:31:57.753297	1
50-Micuisine/update/postgres/19/190614-2-updateReceta06.sql	2019-06-15 22:31:57.764203	1
50-Micuisine/update/postgres/19/190614-2-updateReceta_DropScript.sql	2019-06-15 22:31:57.775589	1
50-Micuisine/update/postgres/19/190615-2-updateReceta.sql	2019-06-15 22:31:57.786536	1
50-Micuisine/update/postgres/19/190615-2-updateReceta01.sql	2019-06-15 22:31:57.797755	1
50-Micuisine/update/postgres/19/190615-2-updateReceta_DropScript.sql	2019-06-15 22:31:57.808662	1
\.


--
-- TOC entry 3450 (class 0 OID 31529)
-- Dependencies: 227
-- Data for Name: sys_entity_snapshot; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_entity_snapshot (id, create_ts, created_by, entity_meta_class, entity_id, string_entity_id, int_entity_id, long_entity_id, author_id, view_xml, snapshot_xml, snapshot_date) FROM stdin;
\.


--
-- TOC entry 3424 (class 0 OID 31175)
-- Dependencies: 201
-- Data for Name: sys_entity_statistics; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_entity_statistics (id, create_ts, created_by, update_ts, updated_by, name, instance_count, fetch_ui, max_fetch_ui, lazy_collection_threshold, lookup_screen_threshold) FROM stdin;
\.


--
-- TOC entry 3422 (class 0 OID 31162)
-- Dependencies: 199
-- Data for Name: sys_file; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_file (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, name, ext, file_size, create_date) FROM stdin;
\.


--
-- TOC entry 3442 (class 0 OID 31404)
-- Dependencies: 219
-- Data for Name: sys_folder; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_folder (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, folder_type, parent_id, name, tab_name, sort_order) FROM stdin;
\.


--
-- TOC entry 3446 (class 0 OID 31465)
-- Dependencies: 223
-- Data for Name: sys_fts_queue; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_fts_queue (id, create_ts, created_by, entity_id, string_entity_id, int_entity_id, long_entity_id, entity_name, change_type, source_host, indexing_host, fake) FROM stdin;
\.


--
-- TOC entry 3454 (class 0 OID 31592)
-- Dependencies: 231
-- Data for Name: sys_jmx_instance; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_jmx_instance (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, node_name, address, login, password) FROM stdin;
\.


--
-- TOC entry 3423 (class 0 OID 31170)
-- Dependencies: 200
-- Data for Name: sys_lock_config; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_lock_config (id, create_ts, created_by, name, timeout_sec) FROM stdin;
\.


--
-- TOC entry 3456 (class 0 OID 31602)
-- Dependencies: 233
-- Data for Name: sys_query_result; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_query_result (id, session_id, query_key, entity_id, string_entity_id, int_entity_id, long_entity_id) FROM stdin;
\.


--
-- TOC entry 3459 (class 0 OID 31633)
-- Dependencies: 236
-- Data for Name: sys_refresh_token; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_refresh_token (id, create_ts, token_value, token_bytes, authentication_bytes, expiry, user_login) FROM stdin;
\.


--
-- TOC entry 3426 (class 0 OID 31191)
-- Dependencies: 203
-- Data for Name: sys_scheduled_execution; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_scheduled_execution (id, create_ts, created_by, task_id, server, start_time, finish_time, result) FROM stdin;
\.


--
-- TOC entry 3425 (class 0 OID 31181)
-- Dependencies: 202
-- Data for Name: sys_scheduled_task; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_scheduled_task (id, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, defined_by, class_name, script_name, bean_name, method_name, method_params, user_name, is_singleton, is_active, period, timeout, start_date, time_frame, start_delay, permitted_servers, log_start, log_finish, last_start_time, last_start_server, description, cron, scheduling_type) FROM stdin;
\.


--
-- TOC entry 3449 (class 0 OID 31510)
-- Dependencies: 226
-- Data for Name: sys_sending_attachment; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_sending_attachment (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, message_id, content, content_file_id, content_id, name, disposition, text_encoding) FROM stdin;
\.


--
-- TOC entry 3448 (class 0 OID 31494)
-- Dependencies: 225
-- Data for Name: sys_sending_message; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_sending_message (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, address_to, address_cc, address_bcc, address_from, caption, email_headers, content_text, content_text_file_id, deadline, status, date_sent, attempts_count, attempts_made, attachments_name, body_content_type) FROM stdin;
\.


--
-- TOC entry 3420 (class 0 OID 31144)
-- Dependencies: 197
-- Data for Name: sys_server; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_server (id, create_ts, created_by, update_ts, updated_by, name, is_running, data) FROM stdin;
00026b7b-fbfb-640e-e8ce-d8b056d2d61c	2019-06-15 23:14:13.962	\N	2019-06-16 16:04:47.404	\N	localhost:8080/app-core	f	\N
\.


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 232
-- Name: sys_query_result_seq; Type: SEQUENCE SET; Schema: public; Owner: usuariocuba
--

SELECT pg_catalog.setval('public.sys_query_result_seq', 1, false);


--
-- TOC entry 3245 (class 2606 OID 31681)
-- Name: micuisine_cantidad micuisine_cantidad_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_cantidad
    ADD CONSTRAINT micuisine_cantidad_pkey PRIMARY KEY (id);


--
-- TOC entry 3243 (class 2606 OID 31676)
-- Name: micuisine_ingrediente micuisine_ingrediente_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_ingrediente
    ADD CONSTRAINT micuisine_ingrediente_pkey PRIMARY KEY (id);


--
-- TOC entry 3258 (class 2606 OID 31714)
-- Name: micuisine_ingredientes_mas_utilizados micuisine_ingredientes_mas_utilizados_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_ingredientes_mas_utilizados
    ADD CONSTRAINT micuisine_ingredientes_mas_utilizados_pkey PRIMARY KEY (id);


--
-- TOC entry 3252 (class 2606 OID 31699)
-- Name: micuisine_receta_cantidad_link micuisine_receta_cantidad_link_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_receta_cantidad_link
    ADD CONSTRAINT micuisine_receta_cantidad_link_pkey PRIMARY KEY (receta_id, cantidad_id);


--
-- TOC entry 3250 (class 2606 OID 31694)
-- Name: micuisine_receta_ingrediente_link micuisine_receta_ingrediente_link_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_receta_ingrediente_link
    ADD CONSTRAINT micuisine_receta_ingrediente_link_pkey PRIMARY KEY (receta_id, ingrediente_id);


--
-- TOC entry 3248 (class 2606 OID 31689)
-- Name: micuisine_receta micuisine_receta_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_receta
    ADD CONSTRAINT micuisine_receta_pkey PRIMARY KEY (id);


--
-- TOC entry 3256 (class 2606 OID 31709)
-- Name: micuisine_recetas_por_dia micuisine_recetas_por_dia_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_recetas_por_dia
    ADD CONSTRAINT micuisine_recetas_por_dia_pkey PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 31704)
-- Name: micuisine_recetas_por_usuario micuisine_recetas_por_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_recetas_por_usuario
    ADD CONSTRAINT micuisine_recetas_por_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3241 (class 2606 OID 31671)
-- Name: micuisine_usuario micuisine_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_usuario
    ADD CONSTRAINT micuisine_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3141 (class 2606 OID 31292)
-- Name: sec_constraint sec_constraint_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_constraint
    ADD CONSTRAINT sec_constraint_pkey PRIMARY KEY (id);


--
-- TOC entry 3169 (class 2606 OID 31380)
-- Name: sec_entity_log sec_entity_log_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_entity_log
    ADD CONSTRAINT sec_entity_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3172 (class 2606 OID 31397)
-- Name: sec_filter sec_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_filter
    ADD CONSTRAINT sec_filter_pkey PRIMARY KEY (id);


--
-- TOC entry 3129 (class 2606 OID 31230)
-- Name: sec_group_hierarchy sec_group_hierarchy_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_group_hierarchy
    ADD CONSTRAINT sec_group_hierarchy_pkey PRIMARY KEY (id);


--
-- TOC entry 3127 (class 2606 OID 31219)
-- Name: sec_group sec_group_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_group
    ADD CONSTRAINT sec_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3144 (class 2606 OID 31306)
-- Name: sec_localized_constraint_msg sec_localized_constraint_msg_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_localized_constraint_msg
    ADD CONSTRAINT sec_localized_constraint_msg_pkey PRIMARY KEY (id);


--
-- TOC entry 3161 (class 2606 OID 31364)
-- Name: sec_logged_attr sec_logged_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_logged_attr
    ADD CONSTRAINT sec_logged_attr_pkey PRIMARY KEY (id);


--
-- TOC entry 3163 (class 2606 OID 31366)
-- Name: sec_logged_attr sec_logged_attr_uniq_name; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_logged_attr
    ADD CONSTRAINT sec_logged_attr_uniq_name UNIQUE (entity_id, name);


--
-- TOC entry 3156 (class 2606 OID 31357)
-- Name: sec_logged_entity sec_logged_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_logged_entity
    ADD CONSTRAINT sec_logged_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 3158 (class 2606 OID 31359)
-- Name: sec_logged_entity sec_logged_entity_uniq_name; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_logged_entity
    ADD CONSTRAINT sec_logged_entity_uniq_name UNIQUE (name);


--
-- TOC entry 3138 (class 2606 OID 31275)
-- Name: sec_permission sec_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_permission
    ADD CONSTRAINT sec_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3179 (class 2606 OID 31434)
-- Name: sec_presentation sec_presentation_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_presentation
    ADD CONSTRAINT sec_presentation_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 31617)
-- Name: sec_remember_me sec_remember_me_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_remember_me
    ADD CONSTRAINT sec_remember_me_pkey PRIMARY KEY (id);


--
-- TOC entry 3124 (class 2606 OID 31213)
-- Name: sec_role sec_role_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_role
    ADD CONSTRAINT sec_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3189 (class 2606 OID 31481)
-- Name: sec_screen_history sec_screen_history_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_screen_history
    ADD CONSTRAINT sec_screen_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3182 (class 2606 OID 31448)
-- Name: sec_search_folder sec_search_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_search_folder
    ADD CONSTRAINT sec_search_folder_pkey PRIMARY KEY (folder_id);


--
-- TOC entry 3147 (class 2606 OID 31315)
-- Name: sec_session_attr sec_session_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_session_attr
    ADD CONSTRAINT sec_session_attr_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 31648)
-- Name: sec_session_log sec_session_log_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_session_log
    ADD CONSTRAINT sec_session_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3132 (class 2606 OID 31248)
-- Name: sec_user sec_user_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user
    ADD CONSTRAINT sec_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3135 (class 2606 OID 31259)
-- Name: sec_user_role sec_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_role
    ADD CONSTRAINT sec_user_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3149 (class 2606 OID 31329)
-- Name: sec_user_setting sec_user_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_setting
    ADD CONSTRAINT sec_user_setting_pkey PRIMARY KEY (id);


--
-- TOC entry 3151 (class 2606 OID 31331)
-- Name: sec_user_setting sec_user_setting_uniq; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_setting
    ADD CONSTRAINT sec_user_setting_uniq UNIQUE (user_id, name, client_type);


--
-- TOC entry 3154 (class 2606 OID 31341)
-- Name: sec_user_substitution sec_user_substitution_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_substitution
    ADD CONSTRAINT sec_user_substitution_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 31632)
-- Name: sys_access_token sys_access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_access_token
    ADD CONSTRAINT sys_access_token_pkey PRIMARY KEY (id);


--
-- TOC entry 3176 (class 2606 OID 31421)
-- Name: sys_app_folder sys_app_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_app_folder
    ADD CONSTRAINT sys_app_folder_pkey PRIMARY KEY (folder_id);


--
-- TOC entry 3216 (class 2606 OID 31577)
-- Name: sys_attr_value sys_attr_value_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_attr_value
    ADD CONSTRAINT sys_attr_value_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 31562)
-- Name: sys_category_attr sys_category_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_category_attr
    ADD CONSTRAINT sys_category_attr_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 31553)
-- Name: sys_category sys_category_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_category
    ADD CONSTRAINT sys_category_pkey PRIMARY KEY (id);


--
-- TOC entry 3108 (class 2606 OID 31160)
-- Name: sys_config sys_config_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_config
    ADD CONSTRAINT sys_config_pkey PRIMARY KEY (id);


--
-- TOC entry 3102 (class 2606 OID 31143)
-- Name: sys_db_changelog sys_db_changelog_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_db_changelog
    ADD CONSTRAINT sys_db_changelog_pkey PRIMARY KEY (script_name);


--
-- TOC entry 3203 (class 2606 OID 31536)
-- Name: sys_entity_snapshot sys_entity_snapshot_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_entity_snapshot
    ADD CONSTRAINT sys_entity_snapshot_pkey PRIMARY KEY (id);


--
-- TOC entry 3115 (class 2606 OID 31179)
-- Name: sys_entity_statistics sys_entity_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_entity_statistics
    ADD CONSTRAINT sys_entity_statistics_pkey PRIMARY KEY (id);


--
-- TOC entry 3110 (class 2606 OID 31169)
-- Name: sys_file sys_file_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_file
    ADD CONSTRAINT sys_file_pkey PRIMARY KEY (id);


--
-- TOC entry 3174 (class 2606 OID 31408)
-- Name: sys_folder sys_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_folder
    ADD CONSTRAINT sys_folder_pkey PRIMARY KEY (id);


--
-- TOC entry 3185 (class 2606 OID 31472)
-- Name: sys_fts_queue sys_fts_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_fts_queue
    ADD CONSTRAINT sys_fts_queue_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 31599)
-- Name: sys_jmx_instance sys_jmx_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_jmx_instance
    ADD CONSTRAINT sys_jmx_instance_pkey PRIMARY KEY (id);


--
-- TOC entry 3112 (class 2606 OID 31174)
-- Name: sys_lock_config sys_lock_config_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_lock_config
    ADD CONSTRAINT sys_lock_config_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 31607)
-- Name: sys_query_result sys_query_result_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_query_result
    ADD CONSTRAINT sys_query_result_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 31640)
-- Name: sys_refresh_token sys_refresh_token_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_refresh_token
    ADD CONSTRAINT sys_refresh_token_pkey PRIMARY KEY (id);


--
-- TOC entry 3121 (class 2606 OID 31198)
-- Name: sys_scheduled_execution sys_scheduled_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_scheduled_execution
    ADD CONSTRAINT sys_scheduled_execution_pkey PRIMARY KEY (id);


--
-- TOC entry 3117 (class 2606 OID 31190)
-- Name: sys_scheduled_task sys_scheduled_task_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_scheduled_task
    ADD CONSTRAINT sys_scheduled_task_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 31517)
-- Name: sys_sending_attachment sys_sending_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_sending_attachment
    ADD CONSTRAINT sys_sending_attachment_pkey PRIMARY KEY (id);


--
-- TOC entry 3194 (class 2606 OID 31501)
-- Name: sys_sending_message sys_sending_message_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_sending_message
    ADD CONSTRAINT sys_sending_message_pkey PRIMARY KEY (id);


--
-- TOC entry 3105 (class 2606 OID 31151)
-- Name: sys_server sys_server_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_server
    ADD CONSTRAINT sys_server_pkey PRIMARY KEY (id);


--
-- TOC entry 3207 (class 1259 OID 31569)
-- Name: idx_cat_attr_ent_type_and_code; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_cat_attr_ent_type_and_code ON public.sys_category_attr USING btree (category_entity_type, code) WHERE (delete_ts IS NULL);


--
-- TOC entry 3246 (class 1259 OID 31740)
-- Name: idx_micuisine_receta_on_usuario; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_micuisine_receta_on_usuario ON public.micuisine_receta USING btree (usuario_id);


--
-- TOC entry 3139 (class 1259 OID 31298)
-- Name: idx_sec_constraint_group; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_constraint_group ON public.sec_constraint USING btree (group_id);


--
-- TOC entry 3164 (class 1259 OID 31386)
-- Name: idx_sec_entity_log_entity_id; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_entity_log_entity_id ON public.sec_entity_log USING btree (entity_id);


--
-- TOC entry 3165 (class 1259 OID 31388)
-- Name: idx_sec_entity_log_ientity_id; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_entity_log_ientity_id ON public.sec_entity_log USING btree (int_entity_id);


--
-- TOC entry 3166 (class 1259 OID 31389)
-- Name: idx_sec_entity_log_lentity_id; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_entity_log_lentity_id ON public.sec_entity_log USING btree (long_entity_id);


--
-- TOC entry 3167 (class 1259 OID 31387)
-- Name: idx_sec_entity_log_sentity_id; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_entity_log_sentity_id ON public.sec_entity_log USING btree (string_entity_id);


--
-- TOC entry 3170 (class 1259 OID 31403)
-- Name: idx_sec_filter_component_user; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_filter_component_user ON public.sec_filter USING btree (component, user_id);


--
-- TOC entry 3125 (class 1259 OID 31225)
-- Name: idx_sec_group_uniq_name; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sec_group_uniq_name ON public.sec_group USING btree (name) WHERE (delete_ts IS NULL);


--
-- TOC entry 3142 (class 1259 OID 31307)
-- Name: idx_sec_loc_cnstrnt_msg_unique; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sec_loc_cnstrnt_msg_unique ON public.sec_localized_constraint_msg USING btree (entity_name, operation_type) WHERE (delete_ts IS NULL);


--
-- TOC entry 3159 (class 1259 OID 31372)
-- Name: idx_sec_logged_attr_entity; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_logged_attr_entity ON public.sec_logged_attr USING btree (entity_id);


--
-- TOC entry 3136 (class 1259 OID 31281)
-- Name: idx_sec_permission_unique; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sec_permission_unique ON public.sec_permission USING btree (role_id, permission_type, target) WHERE (delete_ts IS NULL);


--
-- TOC entry 3177 (class 1259 OID 31440)
-- Name: idx_sec_presentation_component_user; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_presentation_component_user ON public.sec_presentation USING btree (component, user_id);


--
-- TOC entry 3226 (class 1259 OID 31624)
-- Name: idx_sec_remember_me_token; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_remember_me_token ON public.sec_remember_me USING btree (token);


--
-- TOC entry 3227 (class 1259 OID 31623)
-- Name: idx_sec_remember_me_user; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_remember_me_user ON public.sec_remember_me USING btree (user_id);


--
-- TOC entry 3122 (class 1259 OID 31214)
-- Name: idx_sec_role_uniq_name; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sec_role_uniq_name ON public.sec_role USING btree (name) WHERE (delete_ts IS NULL);


--
-- TOC entry 3186 (class 1259 OID 31493)
-- Name: idx_sec_screen_hist_sub_user; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_screen_hist_sub_user ON public.sec_screen_history USING btree (substituted_user_id);


--
-- TOC entry 3187 (class 1259 OID 31492)
-- Name: idx_sec_screen_history_user; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_screen_history_user ON public.sec_screen_history USING btree (user_id);


--
-- TOC entry 3180 (class 1259 OID 31464)
-- Name: idx_sec_search_folder_user; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_search_folder_user ON public.sec_search_folder USING btree (user_id);


--
-- TOC entry 3145 (class 1259 OID 31321)
-- Name: idx_sec_session_attr_group; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_session_attr_group ON public.sec_session_attr USING btree (group_id);


--
-- TOC entry 3234 (class 1259 OID 31661)
-- Name: idx_sec_session_log_session; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_session_log_session ON public.sec_session_log USING btree (session_id);


--
-- TOC entry 3235 (class 1259 OID 31660)
-- Name: idx_sec_session_log_subuser; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_session_log_subuser ON public.sec_session_log USING btree (substituted_user_id);


--
-- TOC entry 3236 (class 1259 OID 31654)
-- Name: idx_sec_session_log_user; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_session_log_user ON public.sec_session_log USING btree (user_id);


--
-- TOC entry 3133 (class 1259 OID 31270)
-- Name: idx_sec_user_role_uniq_role; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sec_user_role_uniq_role ON public.sec_user_role USING btree (user_id, role_id) WHERE (delete_ts IS NULL);


--
-- TOC entry 3152 (class 1259 OID 31352)
-- Name: idx_sec_user_substitution_user; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_user_substitution_user ON public.sec_user_substitution USING btree (user_id);


--
-- TOC entry 3130 (class 1259 OID 31254)
-- Name: idx_sec_user_uniq_login; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sec_user_uniq_login ON public.sec_user USING btree (login_lc) WHERE (delete_ts IS NULL);


--
-- TOC entry 3237 (class 1259 OID 31662)
-- Name: idx_session_log_started_ts; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_session_log_started_ts ON public.sec_session_log USING btree (started_ts DESC);


--
-- TOC entry 3211 (class 1259 OID 31588)
-- Name: idx_sys_attr_value_entity; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_attr_value_entity ON public.sys_attr_value USING btree (entity_id);


--
-- TOC entry 3212 (class 1259 OID 31590)
-- Name: idx_sys_attr_value_ientity; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_attr_value_ientity ON public.sys_attr_value USING btree (int_entity_id);


--
-- TOC entry 3213 (class 1259 OID 31591)
-- Name: idx_sys_attr_value_lentity; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_attr_value_lentity ON public.sys_attr_value USING btree (long_entity_id);


--
-- TOC entry 3214 (class 1259 OID 31589)
-- Name: idx_sys_attr_value_sentity; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_attr_value_sentity ON public.sys_attr_value USING btree (string_entity_id);


--
-- TOC entry 3208 (class 1259 OID 31568)
-- Name: idx_sys_category_attr_category; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_category_attr_category ON public.sys_category_attr USING btree (category_id);


--
-- TOC entry 3204 (class 1259 OID 31554)
-- Name: idx_sys_category_uniq_name_entity_type; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sys_category_uniq_name_entity_type ON public.sys_category USING btree (name, entity_type) WHERE (delete_ts IS NULL);


--
-- TOC entry 3106 (class 1259 OID 31161)
-- Name: idx_sys_config_uniq_name; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sys_config_uniq_name ON public.sys_config USING btree (name);


--
-- TOC entry 3198 (class 1259 OID 31542)
-- Name: idx_sys_entity_snapshot_entity_id; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_entity_snapshot_entity_id ON public.sys_entity_snapshot USING btree (entity_id);


--
-- TOC entry 3199 (class 1259 OID 31544)
-- Name: idx_sys_entity_snapshot_ientity_id; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_entity_snapshot_ientity_id ON public.sys_entity_snapshot USING btree (int_entity_id);


--
-- TOC entry 3200 (class 1259 OID 31545)
-- Name: idx_sys_entity_snapshot_lentity_id; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_entity_snapshot_lentity_id ON public.sys_entity_snapshot USING btree (long_entity_id);


--
-- TOC entry 3201 (class 1259 OID 31543)
-- Name: idx_sys_entity_snapshot_sentity_id; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_entity_snapshot_sentity_id ON public.sys_entity_snapshot USING btree (string_entity_id);


--
-- TOC entry 3113 (class 1259 OID 31180)
-- Name: idx_sys_entity_statistics_uniq_name; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sys_entity_statistics_uniq_name ON public.sys_entity_statistics USING btree (name);


--
-- TOC entry 3183 (class 1259 OID 31473)
-- Name: idx_sys_fts_queue_idxhost_crts; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_fts_queue_idxhost_crts ON public.sys_fts_queue USING btree (indexing_host, create_ts);


--
-- TOC entry 3219 (class 1259 OID 31608)
-- Name: idx_sys_query_result_entity_session_key; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_query_result_entity_session_key ON public.sys_query_result USING btree (entity_id, session_id, query_key);


--
-- TOC entry 3220 (class 1259 OID 31610)
-- Name: idx_sys_query_result_ientity_session_key; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_query_result_ientity_session_key ON public.sys_query_result USING btree (int_entity_id, session_id, query_key);


--
-- TOC entry 3221 (class 1259 OID 31611)
-- Name: idx_sys_query_result_lentity_session_key; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_query_result_lentity_session_key ON public.sys_query_result USING btree (long_entity_id, session_id, query_key);


--
-- TOC entry 3222 (class 1259 OID 31609)
-- Name: idx_sys_query_result_sentity_session_key; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_query_result_sentity_session_key ON public.sys_query_result USING btree (string_entity_id, session_id, query_key);


--
-- TOC entry 3223 (class 1259 OID 31612)
-- Name: idx_sys_query_result_session_key; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_query_result_session_key ON public.sys_query_result USING btree (session_id, query_key);


--
-- TOC entry 3118 (class 1259 OID 31205)
-- Name: idx_sys_scheduled_execution_task_finish_time; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_scheduled_execution_task_finish_time ON public.sys_scheduled_execution USING btree (task_id, finish_time);


--
-- TOC entry 3119 (class 1259 OID 31204)
-- Name: idx_sys_scheduled_execution_task_start_time; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_scheduled_execution_task_start_time ON public.sys_scheduled_execution USING btree (task_id, start_time);


--
-- TOC entry 3190 (class 1259 OID 31508)
-- Name: idx_sys_sending_message_date_sent; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_sending_message_date_sent ON public.sys_sending_message USING btree (date_sent);


--
-- TOC entry 3191 (class 1259 OID 31507)
-- Name: idx_sys_sending_message_status; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_sending_message_status ON public.sys_sending_message USING btree (status);


--
-- TOC entry 3192 (class 1259 OID 31509)
-- Name: idx_sys_sending_message_update_ts; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_sending_message_update_ts ON public.sys_sending_message USING btree (update_ts);


--
-- TOC entry 3103 (class 1259 OID 31152)
-- Name: idx_sys_server_uniq_name; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sys_server_uniq_name ON public.sys_server USING btree (name);


--
-- TOC entry 3195 (class 1259 OID 31528)
-- Name: sys_sending_attachment_message_idx; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX sys_sending_attachment_message_idx ON public.sys_sending_attachment USING btree (message_id);


--
-- TOC entry 3293 (class 2606 OID 31735)
-- Name: micuisine_receta fk_micuisine_receta_on_usuario; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_receta
    ADD CONSTRAINT fk_micuisine_receta_on_usuario FOREIGN KEY (usuario_id) REFERENCES public.micuisine_usuario(id);


--
-- TOC entry 3297 (class 2606 OID 31730)
-- Name: micuisine_receta_cantidad_link fk_reccan_on_cantidad; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_receta_cantidad_link
    ADD CONSTRAINT fk_reccan_on_cantidad FOREIGN KEY (cantidad_id) REFERENCES public.micuisine_cantidad(id);


--
-- TOC entry 3296 (class 2606 OID 31725)
-- Name: micuisine_receta_cantidad_link fk_reccan_on_receta; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_receta_cantidad_link
    ADD CONSTRAINT fk_reccan_on_receta FOREIGN KEY (receta_id) REFERENCES public.micuisine_receta(id);


--
-- TOC entry 3295 (class 2606 OID 31720)
-- Name: micuisine_receta_ingrediente_link fk_recing_on_ingrediente; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_receta_ingrediente_link
    ADD CONSTRAINT fk_recing_on_ingrediente FOREIGN KEY (ingrediente_id) REFERENCES public.micuisine_ingrediente(id);


--
-- TOC entry 3294 (class 2606 OID 31715)
-- Name: micuisine_receta_ingrediente_link fk_recing_on_receta; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_receta_ingrediente_link
    ADD CONSTRAINT fk_recing_on_receta FOREIGN KEY (receta_id) REFERENCES public.micuisine_receta(id);


--
-- TOC entry 3273 (class 2606 OID 31381)
-- Name: sec_entity_log fk_sec_entity_log_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_entity_log
    ADD CONSTRAINT fk_sec_entity_log_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3274 (class 2606 OID 31398)
-- Name: sec_filter fk_sec_filter_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_filter
    ADD CONSTRAINT fk_sec_filter_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3282 (class 2606 OID 31487)
-- Name: sec_screen_history fk_sec_history_substituted_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_screen_history
    ADD CONSTRAINT fk_sec_history_substituted_user FOREIGN KEY (substituted_user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3281 (class 2606 OID 31482)
-- Name: sec_screen_history fk_sec_history_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_screen_history
    ADD CONSTRAINT fk_sec_history_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3272 (class 2606 OID 31367)
-- Name: sec_logged_attr fk_sec_logged_attr_entity; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_logged_attr
    ADD CONSTRAINT fk_sec_logged_attr_entity FOREIGN KEY (entity_id) REFERENCES public.sec_logged_entity(id);


--
-- TOC entry 3290 (class 2606 OID 31618)
-- Name: sec_remember_me fk_sec_remember_me_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_remember_me
    ADD CONSTRAINT fk_sec_remember_me_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3278 (class 2606 OID 31449)
-- Name: sec_search_folder fk_sec_search_folder_folder; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_search_folder
    ADD CONSTRAINT fk_sec_search_folder_folder FOREIGN KEY (folder_id) REFERENCES public.sys_folder(id);


--
-- TOC entry 3280 (class 2606 OID 31459)
-- Name: sec_search_folder fk_sec_search_folder_presentation; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_search_folder
    ADD CONSTRAINT fk_sec_search_folder_presentation FOREIGN KEY (presentation_id) REFERENCES public.sec_presentation(id) ON DELETE SET NULL;


--
-- TOC entry 3279 (class 2606 OID 31454)
-- Name: sec_search_folder fk_sec_search_folder_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_search_folder
    ADD CONSTRAINT fk_sec_search_folder_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3292 (class 2606 OID 31655)
-- Name: sec_session_log fk_sec_session_log_subuser; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_session_log
    ADD CONSTRAINT fk_sec_session_log_subuser FOREIGN KEY (substituted_user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3291 (class 2606 OID 31649)
-- Name: sec_session_log fk_sec_session_log_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_session_log
    ADD CONSTRAINT fk_sec_session_log_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3271 (class 2606 OID 31347)
-- Name: sec_user_substitution fk_sec_user_substitution_substituted_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_substitution
    ADD CONSTRAINT fk_sec_user_substitution_substituted_user FOREIGN KEY (substituted_user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3270 (class 2606 OID 31342)
-- Name: sec_user_substitution fk_sec_user_substitution_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_substitution
    ADD CONSTRAINT fk_sec_user_substitution_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3276 (class 2606 OID 31422)
-- Name: sys_app_folder fk_sys_app_folder_folder; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_app_folder
    ADD CONSTRAINT fk_sys_app_folder_folder FOREIGN KEY (folder_id) REFERENCES public.sys_folder(id);


--
-- TOC entry 3286 (class 2606 OID 31537)
-- Name: sys_entity_snapshot fk_sys_entity_snapshot_author_id; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_entity_snapshot
    ADD CONSTRAINT fk_sys_entity_snapshot_author_id FOREIGN KEY (author_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3275 (class 2606 OID 31409)
-- Name: sys_folder fk_sys_folder_parent; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_folder
    ADD CONSTRAINT fk_sys_folder_parent FOREIGN KEY (parent_id) REFERENCES public.sys_folder(id);


--
-- TOC entry 3285 (class 2606 OID 31523)
-- Name: sys_sending_attachment fk_sys_sending_attachment_content_file; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_sending_attachment
    ADD CONSTRAINT fk_sys_sending_attachment_content_file FOREIGN KEY (content_file_id) REFERENCES public.sys_file(id);


--
-- TOC entry 3284 (class 2606 OID 31518)
-- Name: sys_sending_attachment fk_sys_sending_attachment_sending_message; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_sending_attachment
    ADD CONSTRAINT fk_sys_sending_attachment_sending_message FOREIGN KEY (message_id) REFERENCES public.sys_sending_message(id);


--
-- TOC entry 3283 (class 2606 OID 31502)
-- Name: sys_sending_message fk_sys_sending_message_content_file; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_sending_message
    ADD CONSTRAINT fk_sys_sending_message_content_file FOREIGN KEY (content_text_file_id) REFERENCES public.sys_file(id);


--
-- TOC entry 3267 (class 2606 OID 31293)
-- Name: sec_constraint sec_constraint_group; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_constraint
    ADD CONSTRAINT sec_constraint_group FOREIGN KEY (group_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3261 (class 2606 OID 31231)
-- Name: sec_group_hierarchy sec_group_hierarchy_group; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_group_hierarchy
    ADD CONSTRAINT sec_group_hierarchy_group FOREIGN KEY (group_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3262 (class 2606 OID 31236)
-- Name: sec_group_hierarchy sec_group_hierarchy_parent; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_group_hierarchy
    ADD CONSTRAINT sec_group_hierarchy_parent FOREIGN KEY (parent_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3260 (class 2606 OID 31220)
-- Name: sec_group sec_group_parent; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_group
    ADD CONSTRAINT sec_group_parent FOREIGN KEY (parent_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3266 (class 2606 OID 31276)
-- Name: sec_permission sec_permission_role; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_permission
    ADD CONSTRAINT sec_permission_role FOREIGN KEY (role_id) REFERENCES public.sec_role(id);


--
-- TOC entry 3277 (class 2606 OID 31435)
-- Name: sec_presentation sec_presentation_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_presentation
    ADD CONSTRAINT sec_presentation_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3268 (class 2606 OID 31316)
-- Name: sec_session_attr sec_session_attr_group; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_session_attr
    ADD CONSTRAINT sec_session_attr_group FOREIGN KEY (group_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3263 (class 2606 OID 31249)
-- Name: sec_user sec_user_group; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user
    ADD CONSTRAINT sec_user_group FOREIGN KEY (group_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3264 (class 2606 OID 31260)
-- Name: sec_user_role sec_user_role_profile; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_role
    ADD CONSTRAINT sec_user_role_profile FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3265 (class 2606 OID 31265)
-- Name: sec_user_role sec_user_role_role; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_role
    ADD CONSTRAINT sec_user_role_role FOREIGN KEY (role_id) REFERENCES public.sec_role(id);


--
-- TOC entry 3269 (class 2606 OID 31332)
-- Name: sec_user_setting sec_user_setting_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_setting
    ADD CONSTRAINT sec_user_setting_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3289 (class 2606 OID 31583)
-- Name: sys_attr_value sys_attr_value_attr_value_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_attr_value
    ADD CONSTRAINT sys_attr_value_attr_value_parent_id FOREIGN KEY (parent_id) REFERENCES public.sys_attr_value(id);


--
-- TOC entry 3288 (class 2606 OID 31578)
-- Name: sys_attr_value sys_attr_value_category_attr_id; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_attr_value
    ADD CONSTRAINT sys_attr_value_category_attr_id FOREIGN KEY (category_attr_id) REFERENCES public.sys_category_attr(id);


--
-- TOC entry 3287 (class 2606 OID 31563)
-- Name: sys_category_attr sys_category_attr_category_id; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_category_attr
    ADD CONSTRAINT sys_category_attr_category_id FOREIGN KEY (category_id) REFERENCES public.sys_category(id);


--
-- TOC entry 3259 (class 2606 OID 31199)
-- Name: sys_scheduled_execution sys_scheduled_execution_task; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_scheduled_execution
    ADD CONSTRAINT sys_scheduled_execution_task FOREIGN KEY (task_id) REFERENCES public.sys_scheduled_task(id);


-- Completed on 2019-06-16 16:06:07 CEST

--
-- PostgreSQL database dump complete
--

