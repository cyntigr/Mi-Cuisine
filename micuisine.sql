--
-- PostgreSQL database dump
--

-- Dumped from database version 10.8 (Ubuntu 10.8-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.8 (Ubuntu 10.8-0ubuntu0.18.04.1)

-- Started on 2019-06-15 00:02:51 CEST

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
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 247 (class 1255 OID 28083)
-- Name: newid(); Type: FUNCTION; Schema: public; Owner: usuariocuba
--

CREATE FUNCTION public.newid() RETURNS uuid
    LANGUAGE sql
    AS $$select md5(random()::text || clock_timestamp()::text)::uuid$$;


ALTER FUNCTION public.newid() OWNER TO usuariocuba;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 240 (class 1259 OID 28097)
-- Name: micuisine_cantidad; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.micuisine_cantidad (
    id character varying(36) NOT NULL,
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
-- TOC entry 239 (class 1259 OID 28092)
-- Name: micuisine_ingrediente; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.micuisine_ingrediente (
    id character varying(36) NOT NULL,
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
-- TOC entry 246 (class 1259 OID 28130)
-- Name: micuisine_ingredientes_mas_utilizados; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.micuisine_ingredientes_mas_utilizados (
    id uuid NOT NULL,
    ingrediente character varying(255),
    cantidad integer
);


ALTER TABLE public.micuisine_ingredientes_mas_utilizados OWNER TO usuariocuba;

--
-- TOC entry 241 (class 1259 OID 28102)
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
    preparacion character varying(255),
    visitas integer,
    consejos character varying(255),
    uri character varying(255),
    fecha_creacion date,
    usuario_id uuid
);


ALTER TABLE public.micuisine_receta OWNER TO usuariocuba;

--
-- TOC entry 243 (class 1259 OID 28115)
-- Name: micuisine_receta_cantidad_link; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.micuisine_receta_cantidad_link (
    receta_id character varying(36) NOT NULL,
    cantidad_id character varying(36) NOT NULL
);


ALTER TABLE public.micuisine_receta_cantidad_link OWNER TO usuariocuba;

--
-- TOC entry 242 (class 1259 OID 28110)
-- Name: micuisine_receta_ingrediente_link; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.micuisine_receta_ingrediente_link (
    receta_id character varying(36) NOT NULL,
    ingrediente_id character varying(36) NOT NULL
);


ALTER TABLE public.micuisine_receta_ingrediente_link OWNER TO usuariocuba;

--
-- TOC entry 245 (class 1259 OID 28125)
-- Name: micuisine_recetas_por_dia; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.micuisine_recetas_por_dia (
    id uuid NOT NULL,
    fecha character varying(255),
    cantidad_recetas integer
);


ALTER TABLE public.micuisine_recetas_por_dia OWNER TO usuariocuba;

--
-- TOC entry 244 (class 1259 OID 28120)
-- Name: micuisine_recetas_por_usuario; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.micuisine_recetas_por_usuario (
    id uuid NOT NULL,
    usuario character varying(255),
    cantidad_recetas integer
);


ALTER TABLE public.micuisine_recetas_por_usuario OWNER TO usuariocuba;

--
-- TOC entry 238 (class 1259 OID 28084)
-- Name: micuisine_usuario; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.micuisine_usuario (
    id character varying(36) NOT NULL,
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
-- TOC entry 210 (class 1259 OID 27702)
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
-- TOC entry 217 (class 1259 OID 27793)
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
-- TOC entry 218 (class 1259 OID 27810)
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
-- TOC entry 205 (class 1259 OID 27635)
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
-- TOC entry 206 (class 1259 OID 27646)
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
-- TOC entry 211 (class 1259 OID 27719)
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
-- TOC entry 216 (class 1259 OID 27780)
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
-- TOC entry 215 (class 1259 OID 27773)
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
-- TOC entry 209 (class 1259 OID 27691)
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
-- TOC entry 221 (class 1259 OID 27847)
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
-- TOC entry 234 (class 1259 OID 28033)
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
-- TOC entry 204 (class 1259 OID 27626)
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
-- TOC entry 224 (class 1259 OID 27894)
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
-- TOC entry 222 (class 1259 OID 27861)
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
-- TOC entry 212 (class 1259 OID 27728)
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
-- TOC entry 237 (class 1259 OID 28061)
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
-- TOC entry 207 (class 1259 OID 27661)
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
-- TOC entry 208 (class 1259 OID 27675)
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
-- TOC entry 213 (class 1259 OID 27742)
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
-- TOC entry 214 (class 1259 OID 27757)
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
-- TOC entry 235 (class 1259 OID 28045)
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
-- TOC entry 220 (class 1259 OID 27834)
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
-- TOC entry 230 (class 1259 OID 27990)
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
-- TOC entry 228 (class 1259 OID 27966)
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
-- TOC entry 229 (class 1259 OID 27975)
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
-- TOC entry 198 (class 1259 OID 27573)
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
-- TOC entry 196 (class 1259 OID 27557)
-- Name: sys_db_changelog; Type: TABLE; Schema: public; Owner: usuariocuba
--

CREATE TABLE public.sys_db_changelog (
    script_name character varying(300) NOT NULL,
    create_ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_init integer DEFAULT 0
);


ALTER TABLE public.sys_db_changelog OWNER TO usuariocuba;

--
-- TOC entry 227 (class 1259 OID 27949)
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
-- TOC entry 201 (class 1259 OID 27595)
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
-- TOC entry 199 (class 1259 OID 27582)
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
-- TOC entry 219 (class 1259 OID 27824)
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
-- TOC entry 223 (class 1259 OID 27885)
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
-- TOC entry 231 (class 1259 OID 28012)
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
-- TOC entry 200 (class 1259 OID 27590)
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
-- TOC entry 232 (class 1259 OID 28020)
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
-- TOC entry 233 (class 1259 OID 28022)
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
-- TOC entry 236 (class 1259 OID 28053)
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
-- TOC entry 203 (class 1259 OID 27611)
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
-- TOC entry 202 (class 1259 OID 27601)
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
-- TOC entry 226 (class 1259 OID 27930)
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
-- TOC entry 225 (class 1259 OID 27914)
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
-- TOC entry 197 (class 1259 OID 27564)
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
-- TOC entry 3457 (class 0 OID 28097)
-- Dependencies: 240
-- Data for Name: micuisine_cantidad; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_cantidad (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, peso) FROM stdin;
\.


--
-- TOC entry 3456 (class 0 OID 28092)
-- Dependencies: 239
-- Data for Name: micuisine_ingrediente; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_ingrediente (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, nombre) FROM stdin;
\.


--
-- TOC entry 3463 (class 0 OID 28130)
-- Dependencies: 246
-- Data for Name: micuisine_ingredientes_mas_utilizados; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_ingredientes_mas_utilizados (id, ingrediente, cantidad) FROM stdin;
\.


--
-- TOC entry 3458 (class 0 OID 28102)
-- Dependencies: 241
-- Data for Name: micuisine_receta; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_receta (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, categoria, nombre, personas, duracion, preparacion, visitas, consejos, uri, fecha_creacion, usuario_id) FROM stdin;
\.


--
-- TOC entry 3460 (class 0 OID 28115)
-- Dependencies: 243
-- Data for Name: micuisine_receta_cantidad_link; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_receta_cantidad_link (receta_id, cantidad_id) FROM stdin;
\.


--
-- TOC entry 3459 (class 0 OID 28110)
-- Dependencies: 242
-- Data for Name: micuisine_receta_ingrediente_link; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_receta_ingrediente_link (receta_id, ingrediente_id) FROM stdin;
\.


--
-- TOC entry 3462 (class 0 OID 28125)
-- Dependencies: 245
-- Data for Name: micuisine_recetas_por_dia; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_recetas_por_dia (id, fecha, cantidad_recetas) FROM stdin;
\.


--
-- TOC entry 3461 (class 0 OID 28120)
-- Dependencies: 244
-- Data for Name: micuisine_recetas_por_usuario; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_recetas_por_usuario (id, usuario, cantidad_recetas) FROM stdin;
\.


--
-- TOC entry 3455 (class 0 OID 28084)
-- Dependencies: 238
-- Data for Name: micuisine_usuario; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.micuisine_usuario (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, nombre, apellidos, email, telefono) FROM stdin;
\.


--
-- TOC entry 3427 (class 0 OID 27702)
-- Dependencies: 210
-- Data for Name: sec_constraint; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_constraint (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, code, check_type, operation_type, entity_name, join_clause, where_clause, groovy_script, filter_xml, is_active, group_id) FROM stdin;
\.


--
-- TOC entry 3434 (class 0 OID 27793)
-- Dependencies: 217
-- Data for Name: sec_entity_log; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_entity_log (id, create_ts, created_by, event_ts, user_id, change_type, entity, entity_instance_name, entity_id, string_entity_id, int_entity_id, long_entity_id, changes) FROM stdin;
\.


--
-- TOC entry 3435 (class 0 OID 27810)
-- Dependencies: 218
-- Data for Name: sec_filter; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_filter (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, component, name, code, xml, user_id, global_default) FROM stdin;
b61d18cb-e79a-46f3-b16d-eaf4aebb10dd	2019-06-14 20:44:37.839573	admin	0	\N	\N	\N	\N	[sec$User.browse].genericFilter	Search by role	\N	<?xml version="1.0" encoding="UTF-8"?><filter><and><c name="UrMxpkfMGn" class="com.haulmont.cuba.security.entity.Role" type="CUSTOM" locCaption="Role" entityAlias="u" join="join u.userRoles ur">ur.role.id = :component$genericFilter.UrMxpkfMGn32565<param name="component$genericFilter.UrMxpkfMGn32565">NULL</param></c></and></filter>	60885987-1b61-4247-94c7-dff348347f93	f
\.


--
-- TOC entry 3422 (class 0 OID 27635)
-- Dependencies: 205
-- Data for Name: sec_group; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_group (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, name, parent_id) FROM stdin;
0fa2b1a5-1d68-4d69-9fbd-dff348347f93	2019-06-14 20:44:37.761704	\N	0	\N	\N	\N	\N	Company	\N
\.


--
-- TOC entry 3423 (class 0 OID 27646)
-- Dependencies: 206
-- Data for Name: sec_group_hierarchy; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_group_hierarchy (id, create_ts, created_by, group_id, parent_id, hierarchy_level) FROM stdin;
\.


--
-- TOC entry 3428 (class 0 OID 27719)
-- Dependencies: 211
-- Data for Name: sec_localized_constraint_msg; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_localized_constraint_msg (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, entity_name, operation_type, values_) FROM stdin;
\.


--
-- TOC entry 3433 (class 0 OID 27780)
-- Dependencies: 216
-- Data for Name: sec_logged_attr; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_logged_attr (id, create_ts, created_by, entity_id, name) FROM stdin;
\.


--
-- TOC entry 3432 (class 0 OID 27773)
-- Dependencies: 215
-- Data for Name: sec_logged_entity; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_logged_entity (id, create_ts, created_by, name, auto, manual) FROM stdin;
\.


--
-- TOC entry 3426 (class 0 OID 27691)
-- Dependencies: 209
-- Data for Name: sec_permission; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, permission_type, target, value_, role_id) FROM stdin;
\.


--
-- TOC entry 3438 (class 0 OID 27847)
-- Dependencies: 221
-- Data for Name: sec_presentation; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_presentation (id, create_ts, created_by, update_ts, updated_by, component, name, xml, user_id, is_auto_save) FROM stdin;
\.


--
-- TOC entry 3451 (class 0 OID 28033)
-- Dependencies: 234
-- Data for Name: sec_remember_me; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_remember_me (id, create_ts, created_by, version, user_id, token) FROM stdin;
3c1fc52e-69c9-e73a-ac18-c6206222b8ef	\N	\N	\N	60885987-1b61-4247-94c7-dff348347f93	VhHLghAz8kgvpZujWV3bIxoVJD9Ds5jO
\.


--
-- TOC entry 3421 (class 0 OID 27626)
-- Dependencies: 204
-- Data for Name: sec_role; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_role (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, name, loc_name, description, is_default_role, role_type) FROM stdin;
0c018061-b26f-4de2-a5be-dff348347f93	2019-06-14 20:44:37.794996	\N	0	\N	\N	\N	\N	Administrators	\N	\N	\N	10
cd541dd4-eeb7-cd5b-847e-d32236552fa9	2019-06-14 20:44:37.806109	\N	0	\N	\N	\N	\N	Anonymous	\N	\N	\N	30
\.


--
-- TOC entry 3441 (class 0 OID 27894)
-- Dependencies: 224
-- Data for Name: sec_screen_history; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_screen_history (id, create_ts, created_by, user_id, caption, url, entity_id, substituted_user_id) FROM stdin;
62d28ced-c039-6b25-0e78-a9d0ed845912	2019-06-14 22:05:23.441	admin	60885987-1b61-4247-94c7-dff348347f93	User 'admin'	http://localhost:8080/app/open?screen=sec$User.edit&item=sec$User-60885987-1b61-4247-94c7-dff348347f93&params=item:sec$User-60885987-1b61-4247-94c7-dff348347f93	60885987-1b61-4247-94c7-dff348347f93	\N
\.


--
-- TOC entry 3439 (class 0 OID 27861)
-- Dependencies: 222
-- Data for Name: sec_search_folder; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_search_folder (folder_id, filter_component, filter_xml, user_id, presentation_id, apply_default, is_set, entity_type) FROM stdin;
\.


--
-- TOC entry 3429 (class 0 OID 27728)
-- Dependencies: 212
-- Data for Name: sec_session_attr; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_session_attr (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, name, str_value, datatype, group_id) FROM stdin;
\.


--
-- TOC entry 3454 (class 0 OID 28061)
-- Dependencies: 237
-- Data for Name: sec_session_log; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_session_log (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, session_id, user_id, substituted_user_id, user_data, last_action, client_info, client_type, address, started_ts, finished_ts, server_id) FROM stdin;
\.


--
-- TOC entry 3424 (class 0 OID 27661)
-- Dependencies: 207
-- Data for Name: sec_user; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_user (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, login, login_lc, password, password_encryption, name, first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active, group_id, ip_mask, change_password_at_logon) FROM stdin;
a405db59-e674-4f63-8afe-269dda788fe8	2019-06-14 20:44:37.783936	\N	0	\N	\N	\N	\N	anonymous	anonymous	\N	\N	Anonymous	\N	\N	\N	\N	\N	\N	\N	\N	t	0fa2b1a5-1d68-4d69-9fbd-dff348347f93	\N	\N
60885987-1b61-4247-94c7-dff348347f93	2019-06-14 20:44:37.772865	\N	1	2019-06-14 22:05:23.368	admin	\N	\N	cintia	cintia	$2a$10$vQx8b8B7jzZ0rQmtuK4YDOKp7nkmUCFjPx6DMT.voPtetNHFOsaOu	bcrypt	Cyntia Garcia	\N	\N	\N	\N	\N	\N	\N	\N	t	0fa2b1a5-1d68-4d69-9fbd-dff348347f93	\N	\N
\.


--
-- TOC entry 3425 (class 0 OID 27675)
-- Dependencies: 208
-- Data for Name: sec_user_role; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_user_role (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, user_id, role_id) FROM stdin;
c838be0a-96d0-4ef4-a7c0-dff348347f93	2019-06-14 20:44:37.817264	\N	0	\N	\N	\N	\N	60885987-1b61-4247-94c7-dff348347f93	0c018061-b26f-4de2-a5be-dff348347f93
f01fb532-c2f0-dc18-b86c-450cf8a8d8c5	2019-06-14 20:44:37.828358	\N	0	\N	\N	\N	\N	a405db59-e674-4f63-8afe-269dda788fe8	cd541dd4-eeb7-cd5b-847e-d32236552fa9
\.


--
-- TOC entry 3430 (class 0 OID 27742)
-- Dependencies: 213
-- Data for Name: sec_user_setting; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_user_setting (id, create_ts, created_by, user_id, client_type, name, value_) FROM stdin;
62fea6f5-8557-6fb1-2718-f9a67bf5b9af	2019-06-14 21:52:17.402	admin	60885987-1b61-4247-94c7-dff348347f93	W	micuisine_Usuario.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="usuariosTable"/>\n  </components>\n</settings>\n
466f8d6f-1161-55e1-5181-0db38ac8619d	2019-06-14 21:52:19.854	admin	60885987-1b61-4247-94c7-dff348347f93	W	micuisine_Receta.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="recetasTable"/>\n  </components>\n</settings>\n
2ae0ce3f-dc6e-a532-a989-09e31f48e898	2019-06-14 22:00:51.761	admin	60885987-1b61-4247-94c7-dff348347f93	W	micuisine_Cantidad.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="cantidadsTable"/>\n  </components>\n</settings>\n
7fb95555-cf87-4f2e-bdc4-4c423ce0a04c	2019-06-14 22:00:52.693	admin	60885987-1b61-4247-94c7-dff348347f93	W	micuisine_Ingrediente.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="ingredientesTable"/>\n  </components>\n</settings>\n
f937b0fa-2d94-44bb-f51d-d6e5b5539481	2019-06-14 22:05:28.877	admin	60885987-1b61-4247-94c7-dff348347f93	W	sec$User.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="genericFilter">\n      <defaultFilter/>\n    </component>\n    <component name="usersTable" presentation=""/>\n  </components>\n</settings>\n
\.


--
-- TOC entry 3431 (class 0 OID 27757)
-- Dependencies: 214
-- Data for Name: sec_user_substitution; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sec_user_substitution (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, user_id, substituted_user_id, start_date, end_date) FROM stdin;
\.


--
-- TOC entry 3452 (class 0 OID 28045)
-- Dependencies: 235
-- Data for Name: sys_access_token; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_access_token (id, create_ts, token_value, token_bytes, authentication_key, authentication_bytes, expiry, user_login, locale, refresh_token_value) FROM stdin;
\.


--
-- TOC entry 3437 (class 0 OID 27834)
-- Dependencies: 220
-- Data for Name: sys_app_folder; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_app_folder (folder_id, filter_component, filter_xml, visibility_script, quantity_script, apply_default) FROM stdin;
\.


--
-- TOC entry 3447 (class 0 OID 27990)
-- Dependencies: 230
-- Data for Name: sys_attr_value; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_attr_value (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, category_attr_id, code, entity_id, string_entity_id, int_entity_id, long_entity_id, string_value, integer_value, double_value, date_value, boolean_value, entity_value, string_entity_value, int_entity_value, long_entity_value, parent_id) FROM stdin;
\.


--
-- TOC entry 3445 (class 0 OID 27966)
-- Dependencies: 228
-- Data for Name: sys_category; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_category (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, name, special, entity_type, is_default, discriminator, locale_names) FROM stdin;
\.


--
-- TOC entry 3446 (class 0 OID 27975)
-- Dependencies: 229
-- Data for Name: sys_category_attr; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_category_attr (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, category_entity_type, name, code, category_id, entity_class, data_type, default_string, default_int, default_double, default_date, default_date_is_current, default_boolean, default_entity_value, default_str_entity_value, default_int_entity_value, default_long_entity_value, enumeration, order_no, screen, required, lookup, target_screens, width, rows_count, is_collection, join_clause, where_clause, filter_xml, locale_names, enumeration_locales) FROM stdin;
\.


--
-- TOC entry 3415 (class 0 OID 27573)
-- Dependencies: 198
-- Data for Name: sys_config; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_config (id, create_ts, created_by, version, update_ts, updated_by, name, value_) FROM stdin;
\.


--
-- TOC entry 3413 (class 0 OID 27557)
-- Dependencies: 196
-- Data for Name: sys_db_changelog; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_db_changelog (script_name, create_ts, is_init) FROM stdin;
10-cuba/init/postgres/create-db.sql	2019-06-14 20:44:37.851078	1
50-Micuisine/init/postgres/10.create-db.sql	2019-06-14 20:44:38.53002	1
10-cuba/update/postgres/01/01-010-addValueIdToEntityLog.sql	2019-06-14 20:44:38.547564	1
10-cuba/update/postgres/01/01-020-dropDbUpdatePKey.sql	2019-06-14 20:44:38.552098	1
10-cuba/update/postgres/01/01-030-add_EntityLogAttr_messagesPack.sql	2019-06-14 20:44:38.563206	1
10-cuba/update/postgres/01/01-040-renameUserPosition.sql	2019-06-14 20:44:38.574366	1
10-cuba/update/postgres/01/01-050-addUserLanguage.sql	2019-06-14 20:44:38.585535	1
10-cuba/update/postgres/01/01-050-sysFtsQueue.sql	2019-06-14 20:44:38.596518	1
10-cuba/update/postgres/01/01-055-createReportTables.sql	2019-06-14 20:44:38.607629	1
10-cuba/update/postgres/01/01-060-addReportParameterPosition.sql	2019-06-14 20:44:38.618952	1
10-cuba/update/postgres/01/01-070-addCodeInFolder.sql	2019-06-14 20:44:38.629965	1
10-cuba/update/postgres/01/01-080-SessionAttributes.sql	2019-06-14 20:44:38.641015	1
10-cuba/update/postgres/01/01-090-ChangeReportKeys.sql	2019-06-14 20:44:38.652071	1
10-cuba/update/postgres/01/01-100-EntityStatistics.sql	2019-06-14 20:44:38.663182	1
10-cuba/update/postgres/01/01-100-addPresentations.sql	2019-06-14 20:44:38.674346	1
10-cuba/update/postgres/01/01-110-AddFieldInSysFolder.sql	2019-06-14 20:44:38.690177	1
10-cuba/update/postgres/01/01-120-AddCodeFieldInSecFilter.sql	2019-06-14 20:44:38.696719	1
10-cuba/update/postgres/01/01-130-createReportValueFormatTable.sql	2019-06-14 20:44:38.707687	1
10-cuba/update/postgres/01/01-140-AddTabHistory.sql	2019-06-14 20:44:38.718892	1
10-cuba/update/postgres/01/01-150-CreateIndexes.sql	2019-06-14 20:44:38.729886	1
10-cuba/update/postgres/01/01-160-screenHistory.sql	2019-06-14 20:44:38.741181	1
10-cuba/update/postgres/01/01-170-entityStatisticsFetchUI.sql	2019-06-14 20:44:38.752184	1
10-cuba/update/postgres/01/01-180-changeAppFoldersScriptsLength.sql	2019-06-14 20:44:38.763279	1
10-cuba/update/postgres/01/01-190-renameDoubleNameInSysFolder.sql	2019-06-14 20:44:38.774356	1
10-cuba/update/postgres/01/01-200-deleteCodeInSysFolders.sql	2019-06-14 20:44:38.785539	1
10-cuba/update/postgres/01/01-210-updateTabNameInSysFolder.sql	2019-06-14 20:44:38.79678	1
10-cuba/update/postgres/01/01-220-reportTablesChangeColumns.sql	2019-06-14 20:44:38.807814	1
10-cuba/update/postgres/01/01-230-reportParameterAddEnumClass.sql	2019-06-14 20:44:38.819039	1
10-cuba/update/postgres/01/01-240-userIpMask.sql	2019-06-14 20:44:38.829976	1
10-cuba/update/postgres/01/01-250-entityStatLookupScreenThreshold.sql	2019-06-14 20:44:38.841084	1
10-cuba/update/postgres/01/01-260-reportTemplatesTable.sql	2019-06-14 20:44:38.85228	1
10-cuba/update/postgres/01/01-270-sendingMessagesHistory.sql	2019-06-14 20:44:38.863361	1
10-cuba/update/postgres/01/01-280-addApplyDefault.sql	2019-06-14 20:44:38.87457	1
10-cuba/update/postgres/01/01-290-addIsSetToSearchFolder.sql	2019-06-14 20:44:38.885829	1
10-cuba/update/postgres/01/01-300-addEntitySnapshotTable.sql	2019-06-14 20:44:38.896731	1
10-cuba/update/postgres/01/01-310-RuntimePropertiesTables.sql	2019-06-14 20:44:38.907802	1
10-cuba/update/postgres/01/01-320-RuntimePropertiesRework.sql	2019-06-14 20:44:38.919017	1
10-cuba/update/postgres/01/01-330-CategoryAttrAlterType.sql	2019-06-14 20:44:38.93022	1
10-cuba/update/postgres/01/01-340-CategoryDiscriminator.sql	2019-06-14 20:44:38.941314	1
10-cuba/update/postgres/01/01-350-categoryAttrOrderNo.sql	2019-06-14 20:44:38.952266	1
10-cuba/update/postgres/01/01-360-CategoryAttrScreen.sql	2019-06-14 20:44:38.963416	1
10-cuba/update/postgres/01/01-370-CategoryAttrRequired.sql	2019-06-14 20:44:38.974584	1
10-cuba/update/postgres/01/01-380-AlterTypeColumnUrlInScreenHistory.sql	2019-06-14 20:44:38.985594	1
10-cuba/update/postgres/01/01-390-AlterTableSysCategoryAttr.sql	2019-06-14 20:44:38.996745	1
10-cuba/update/postgres/01/01-400-AlterTableSysAttrValue.sql	2019-06-14 20:44:39.007811	1
10-cuba/update/postgres/01/01-410-addDataSetParams.sql	2019-06-14 20:44:39.019077	1
10-cuba/update/postgres/01/01-410-addStartDateToUserSubstitution.sql	2019-06-14 20:44:39.030052	1
10-cuba/update/postgres/01/01-420-addEntityIdToScreenHistory.sql	2019-06-14 20:44:39.041153	1
10-cuba/update/postgres/01/01-440-addDropdownToCategoryAttribute.sql	2019-06-14 20:44:39.052367	1
10-cuba/update/postgres/01/01-450-alterSecConstraint.sql	2019-06-14 20:44:39.063328	1
10-cuba/update/postgres/02/02-010-addScheduledTasks.sql	2019-06-14 20:44:39.074499	1
10-cuba/update/postgres/02/02-020-alterDoubleValueColumnInSysAttrValueTable.sql	2019-06-14 20:44:39.085543	1
10-cuba/update/postgres/02/02-030-addReportGroup.sql	2019-06-14 20:44:39.096807	1
10-cuba/update/postgres/02/02-040-addReportRefToBand.sql	2019-06-14 20:44:39.107869	1
10-cuba/update/postgres/02/02-050-reportLocales.sql	2019-06-14 20:44:39.119043	1
10-cuba/update/postgres/02/02-060-reportCode.sql	2019-06-14 20:44:39.130092	1
10-cuba/update/postgres/02/02-070-addRoleType.sql	2019-06-14 20:44:39.141217	1
10-cuba/update/postgres/02/02-080-addSnapshotDate.sql	2019-06-14 20:44:39.152381	1
10-cuba/update/postgres/02/02-090-schedulingDaylightSaving.sql	2019-06-14 20:44:39.163438	1
10-cuba/update/postgres/02/02-100-entitySnapshotAuthor.sql	2019-06-14 20:44:39.174579	1
10-cuba/update/postgres/02/02-110-addDefaultDateIsCurrent.sql	2019-06-14 20:44:39.185644	1
10-cuba/update/postgres/02/02-120-addUserDescriminator.sql	2019-06-14 20:44:39.196894	1
10-cuba/update/postgres/02/02-130-alterSecConstraint.sql	2019-06-14 20:44:39.20792	1
10-cuba/update/postgres/02/02-130-queryResults.sql	2019-06-14 20:44:39.219059	1
10-cuba/update/postgres/02/02-140-entityLogChanges.sql	2019-06-14 20:44:39.230099	1
10-cuba/update/postgres/02/02-150-alterSysScheduledTask.sql	2019-06-14 20:44:39.241207	1
10-cuba/update/postgres/12/121002-updateScreenPermissions.sql	2019-06-14 20:44:39.252344	1
10-cuba/update/postgres/12/121003-addCodeToCategoryAttribute.sql	2019-06-14 20:44:39.263423	1
10-cuba/update/postgres/12/121004-addFieldsToScheduledTasks.sql	2019-06-14 20:44:39.274606	1
10-cuba/update/postgres/12/121020-addLoginConstraintsForUser.sql	2019-06-14 20:44:39.28598	1
10-cuba/update/postgres/12/121024-addEncryptionParamsToUser.sql	2019-06-14 20:44:39.297039	1
10-cuba/update/postgres/12/121031-dropPasswordColumnFromScheduledTask.sql	2019-06-14 20:44:39.307975	1
10-cuba/update/postgres/12/121102-dropSaltColumn.sql	2019-06-14 20:44:39.31926	1
10-cuba/update/postgres/12/121114-addDescriptionToScheduledTask.sql	2019-06-14 20:44:39.330232	1
10-cuba/update/postgres/12/121228-addJmxInstance.sql	2019-06-14 20:44:39.341282	1
10-cuba/update/postgres/13/130110-removeJmxInstanceDescription.sql	2019-06-14 20:44:39.352563	1
10-cuba/update/postgres/13/130311-renameColumnsForOracle.sql	2019-06-14 20:44:39.363493	1
10-cuba/update/postgres/13/130731-changeServerEntity.sql	2019-06-14 20:44:39.374683	1
10-cuba/update/postgres/13/130918-email-attachment-options.sql	2019-06-14 20:44:39.385692	1
10-cuba/update/postgres/13/130920-email-file-storage.sql	2019-06-14 20:44:39.396839	1
10-cuba/update/postgres/13/130923-permissionsToRenamedScreens.sql	2019-06-14 20:44:39.408073	1
10-cuba/update/postgres/13/131108-sending-message-timeshift.sql	2019-06-14 20:44:39.41919	1
10-cuba/update/postgres/13/131112-scheduled-task-cron.sql	2019-06-14 20:44:39.430218	1
10-cuba/update/postgres/14/140313-ftsQueueIndexingHost.sql	2019-06-14 20:44:39.441303	1
10-cuba/update/postgres/14/140405-changeTypeForSysConfigValue.sql	2019-06-14 20:44:39.452449	1
10-cuba/update/postgres/14/140708-addRememberMeTable.sql	2019-06-14 20:44:39.463549	1
10-cuba/update/postgres/14/140716-changeSysFileSizeType.sql	2019-06-14 20:44:39.474727	1
10-cuba/update/postgres/14/141203-setNotNullSysFileName.sql	2019-06-14 20:44:39.485767	1
10-cuba/update/postgres/15/150203-sendingMessageEmailHeaders.sql	2019-06-14 20:44:39.497005	1
10-cuba/update/postgres/15/150203-userTimeZone.sql	2019-06-14 20:44:39.507999	1
10-cuba/update/postgres/15/150205-addSubstituteUserInScreenHistory.sql	2019-06-14 20:44:39.519165	1
10-cuba/update/postgres/15/150226-addIndexInScreenHistory.sql	2019-06-14 20:44:39.530227	1
10-cuba/update/postgres/15/150310-alterFilterXml.sql	2019-06-14 20:44:39.541364	1
10-cuba/update/postgres/15/150417-runtimePropertiesChanges.sql	2019-06-14 20:44:39.552496	1
10-cuba/update/postgres/15/150514-categoryEntityTypeInAttribute.sql	2019-06-14 20:44:39.563567	1
10-cuba/update/postgres/15/150630-entityClassToCategoryAttribute.sql	2019-06-14 20:44:39.574744	1
10-cuba/update/postgres/15/150805-fakeFtsQueue.sql	2019-06-14 20:44:39.585773	1
10-cuba/update/postgres/15/151106-extendScheduledTaskFields.sql	2019-06-14 20:44:39.596913	1
10-cuba/update/postgres/15/151116-rowLevelSecurity.sql	2019-06-14 20:44:39.607998	1
10-cuba/update/postgres/15/151228-sendingMessagesExtendFields.sql	2019-06-14 20:44:39.619165	1
10-cuba/update/postgres/15/1512282-addIsActiveToConstraint.sql	2019-06-14 20:44:39.630216	1
10-cuba/update/postgres/16/160322-dropUniqSysScheduledTaskBeanMethodConstraint.sql	2019-06-14 20:44:39.641351	1
10-cuba/update/postgres/16/160405-createUniqSysCategory.sql	2019-06-14 20:44:39.652674	1
10-cuba/update/postgres/16/160420-createUpdateTsIndexOnSysSendingMessage.sql	2019-06-14 20:44:39.663608	1
10-cuba/update/postgres/16/160616-addSizeCategoryAttribute.sql	2019-06-14 20:44:39.674802	1
10-cuba/update/postgres/16/160626-createIndexOnFinishTimeScheduledExecution.sql	2019-06-14 20:44:39.685814	1
10-cuba/update/postgres/16/160725-anonymousLogin.sql	2019-06-14 20:44:39.696994	1
10-cuba/update/postgres/16/160916-addEntityIdToFtsQueue.sql	2019-06-14 20:44:39.708109	1
10-cuba/update/postgres/16/161024-collectionDynamicAttributes.sql	2019-06-14 20:44:39.719308	1
10-cuba/update/postgres/16/161025-sysAttrValueParentConstraint.sql	2019-06-14 20:44:39.730327	1
10-cuba/update/postgres/16/161102-setIsCollectionForExistingCategoryAttrs.sql	2019-06-14 20:44:39.741436	1
10-cuba/update/postgres/16/161124-FilterXmlInCategoryAttr.sql	2019-06-14 20:44:39.752567	1
10-cuba/update/postgres/16/161124-joinAndWhereInCategoryAttr.sql	2019-06-14 20:44:39.763669	1
10-cuba/update/postgres/16/270916-addEntityIdToQueryResult.sql	2019-06-14 20:44:39.774843	1
10-cuba/update/postgres/17/170214-addEntityIdToSnapshot.sql	2019-06-14 20:44:39.78589	1
10-cuba/update/postgres/17/170215-addEntityIdToEntityLog.sql	2019-06-14 20:44:39.797249	1
10-cuba/update/postgres/17/170221-addEntityIdToAttributeValue.sql	2019-06-14 20:44:39.808266	1
10-cuba/update/postgres/17/170228-createRestApiTokenTable.sql	2019-06-14 20:44:39.819378	1
10-cuba/update/postgres/17/170502-createSessionHistoryTable.sql	2019-06-14 20:44:39.830397	1
10-cuba/update/postgres/17/170620-alterConstraints.sql	2019-06-14 20:44:39.841512	1
10-cuba/update/postgres/17/170712-createLocalizedConstraintMessageTable.sql	2019-06-14 20:44:39.852862	1
10-cuba/update/postgres/17/170829-addLocaleNameColumnToCategory.sql	2019-06-14 20:44:39.863964	1
10-cuba/update/postgres/17/171002-addUserLoginToRestApiToken.sql	2019-06-14 20:44:39.875009	1
10-cuba/update/postgres/17/171116-addGlobalDefaultToFilterEntity.sql	2019-06-14 20:44:39.886127	1
10-cuba/update/postgres/17/171121-addLocaleToRestApiToken.sql	2019-06-14 20:44:39.897113	1
10-cuba/update/postgres/17/1712011000-createRestApiRefreshTokenTable.sql	2019-06-14 20:44:39.908257	1
10-cuba/update/postgres/17/1712011010-renameRestApiTokenColumns.sql	2019-06-14 20:44:39.919356	1
10-cuba/update/postgres/17/1712011010-renameRestApiTokenTable.sql	2019-06-14 20:44:39.930778	1
10-cuba/update/postgres/17/171227-createIndexStartedTsDescToSessionLog.sql	2019-06-14 20:44:39.94176	1
10-cuba/update/postgres/17/171229-addRefreshTokenColumnToAccessTokenTable.sql	2019-06-14 20:44:39.952963	1
10-cuba/update/postgres/18/180112-alterDynamicAttributeDoubleType.sql	2019-06-14 20:44:39.963955	1
10-cuba/update/postgres/18/180312-renameColumns.sql	2019-06-14 20:44:39.975098	1
10-cuba/update/postgres/18/180321-addContentBodyTypeColumnToSendingMessage.sql	2019-06-14 20:44:39.986221	1
10-cuba/update/postgres/18/180331-truncateQueryResultTable.sql	2019-06-14 20:44:39.99731	1
10-cuba/update/postgres/18/180704-addNotNullForConfig.sql	2019-06-14 20:44:40.008484	1
10-cuba/update/postgres/18/181024-addCcAndBccToSendingMessage.sql	2019-06-14 20:44:40.019839	1
10-cuba/update/postgres/18/181210-addUserPasswordEncryption.sql	2019-06-14 20:44:40.030757	1
10-cuba/update/postgres/19/190321-addEntityLogInstanceName.sql	2019-06-14 20:44:40.041714	1
50-Micuisine/update/postgres/19/190605-2-updateReceta.sql	2019-06-14 20:44:40.052965	1
50-Micuisine/update/postgres/19/190605-2-updateReceta_DropScript.sql	2019-06-14 20:44:40.064109	1
50-Micuisine/update/postgres/19/190606-1-createRecetasPorDia.sql	2019-06-14 20:44:40.075177	1
50-Micuisine/update/postgres/19/190606-1-createRecetasPorUsuario.sql	2019-06-14 20:44:40.08626	1
50-Micuisine/update/postgres/19/190606-2-updateRecetasPorDia.sql	2019-06-14 20:44:40.097366	1
50-Micuisine/update/postgres/19/190606-2-updateRecetasPorDia_DropScript.sql	2019-06-14 20:44:40.108278	1
50-Micuisine/update/postgres/19/190607-0-dropRecetaUsuarioLink.sql	2019-06-14 20:44:40.119466	1
50-Micuisine/update/postgres/19/190607-0-dropRecetaUsuarioLink_DropScript.sql	2019-06-14 20:44:40.13048	1
50-Micuisine/update/postgres/19/190607-0-dropUsuarioRecetaLink.sql	2019-06-14 20:44:40.141573	1
50-Micuisine/update/postgres/19/190607-0-dropUsuarioRecetaLink_DropScript.sql	2019-06-14 20:44:40.152748	1
50-Micuisine/update/postgres/19/190607-1-createRecetaUsuarioLink.sql	2019-06-14 20:44:40.16383	1
50-Micuisine/update/postgres/19/190607-2-createRecetaUsuarioLink.sql	2019-06-14 20:44:40.175044	1
50-Micuisine/update/postgres/19/190607-2-updateReceta.sql	2019-06-14 20:44:40.18615	1
50-Micuisine/update/postgres/19/190607-2-updateReceta01.sql	2019-06-14 20:44:40.197529	1
50-Micuisine/update/postgres/19/190607-2-updateReceta02.sql	2019-06-14 20:44:40.230711	1
50-Micuisine/update/postgres/19/190607-2-updateReceta02_DropScript.sql	2019-06-14 20:44:40.284276	1
50-Micuisine/update/postgres/19/190607-2-updateReceta03.sql	2019-06-14 20:44:40.319743	1
50-Micuisine/update/postgres/19/190611-1-createIngredientesMasUtilizados.sql	2019-06-14 20:44:40.330482	1
50-Micuisine/update/postgres/19/190611-2-updateRecetasPorUsuario.sql	2019-06-14 20:44:40.341698	1
50-Micuisine/update/postgres/19/190611-2-updateRecetasPorUsuario_DropScript.sql	2019-06-14 20:44:40.352955	1
50-Micuisine/update/postgres/19/190614-2-updateReceta01.sql	2019-06-14 20:44:40.363998	1
50-Micuisine/update/postgres/19/190614-2-updateReceta.sql	2019-06-14 20:52:10.205368	0
50-Micuisine/update/postgres/19/190614-2-updateReceta_DropScript.sql	2019-06-14 20:52:10.22904	0
50-Micuisine/update/postgres/19/190614-2-updateReceta02.sql	2019-06-14 20:56:38.733749	0
50-Micuisine/update/postgres/19/190614-2-updateReceta03.sql	2019-06-14 21:47:14.538113	0
50-Micuisine/update/postgres/19/190614-2-updateReceta04.sql	2019-06-14 21:53:13.048418	0
\.


--
-- TOC entry 3444 (class 0 OID 27949)
-- Dependencies: 227
-- Data for Name: sys_entity_snapshot; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_entity_snapshot (id, create_ts, created_by, entity_meta_class, entity_id, string_entity_id, int_entity_id, long_entity_id, author_id, view_xml, snapshot_xml, snapshot_date) FROM stdin;
\.


--
-- TOC entry 3418 (class 0 OID 27595)
-- Dependencies: 201
-- Data for Name: sys_entity_statistics; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_entity_statistics (id, create_ts, created_by, update_ts, updated_by, name, instance_count, fetch_ui, max_fetch_ui, lazy_collection_threshold, lookup_screen_threshold) FROM stdin;
\.


--
-- TOC entry 3416 (class 0 OID 27582)
-- Dependencies: 199
-- Data for Name: sys_file; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_file (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, name, ext, file_size, create_date) FROM stdin;
\.


--
-- TOC entry 3436 (class 0 OID 27824)
-- Dependencies: 219
-- Data for Name: sys_folder; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_folder (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, folder_type, parent_id, name, tab_name, sort_order) FROM stdin;
\.


--
-- TOC entry 3440 (class 0 OID 27885)
-- Dependencies: 223
-- Data for Name: sys_fts_queue; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_fts_queue (id, create_ts, created_by, entity_id, string_entity_id, int_entity_id, long_entity_id, entity_name, change_type, source_host, indexing_host, fake) FROM stdin;
\.


--
-- TOC entry 3448 (class 0 OID 28012)
-- Dependencies: 231
-- Data for Name: sys_jmx_instance; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_jmx_instance (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, node_name, address, login, password) FROM stdin;
\.


--
-- TOC entry 3417 (class 0 OID 27590)
-- Dependencies: 200
-- Data for Name: sys_lock_config; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_lock_config (id, create_ts, created_by, name, timeout_sec) FROM stdin;
\.


--
-- TOC entry 3450 (class 0 OID 28022)
-- Dependencies: 233
-- Data for Name: sys_query_result; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_query_result (id, session_id, query_key, entity_id, string_entity_id, int_entity_id, long_entity_id) FROM stdin;
\.


--
-- TOC entry 3453 (class 0 OID 28053)
-- Dependencies: 236
-- Data for Name: sys_refresh_token; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_refresh_token (id, create_ts, token_value, token_bytes, authentication_bytes, expiry, user_login) FROM stdin;
\.


--
-- TOC entry 3420 (class 0 OID 27611)
-- Dependencies: 203
-- Data for Name: sys_scheduled_execution; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_scheduled_execution (id, create_ts, created_by, task_id, server, start_time, finish_time, result) FROM stdin;
\.


--
-- TOC entry 3419 (class 0 OID 27601)
-- Dependencies: 202
-- Data for Name: sys_scheduled_task; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_scheduled_task (id, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, defined_by, class_name, script_name, bean_name, method_name, method_params, user_name, is_singleton, is_active, period, timeout, start_date, time_frame, start_delay, permitted_servers, log_start, log_finish, last_start_time, last_start_server, description, cron, scheduling_type) FROM stdin;
\.


--
-- TOC entry 3443 (class 0 OID 27930)
-- Dependencies: 226
-- Data for Name: sys_sending_attachment; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_sending_attachment (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, message_id, content, content_file_id, content_id, name, disposition, text_encoding) FROM stdin;
\.


--
-- TOC entry 3442 (class 0 OID 27914)
-- Dependencies: 225
-- Data for Name: sys_sending_message; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_sending_message (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, address_to, address_cc, address_bcc, address_from, caption, email_headers, content_text, content_text_file_id, deadline, status, date_sent, attempts_count, attempts_made, attachments_name, body_content_type) FROM stdin;
\.


--
-- TOC entry 3414 (class 0 OID 27564)
-- Dependencies: 197
-- Data for Name: sys_server; Type: TABLE DATA; Schema: public; Owner: usuariocuba
--

COPY public.sys_server (id, create_ts, created_by, update_ts, updated_by, name, is_running, data) FROM stdin;
a335545f-9296-09c1-89f3-f2e231558173	2019-06-14 21:52:11.422	\N	2019-06-14 23:07:38.666	\N	localhost:8080/app-core	f	\N
\.


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 232
-- Name: sys_query_result_seq; Type: SEQUENCE SET; Schema: public; Owner: usuariocuba
--

SELECT pg_catalog.setval('public.sys_query_result_seq', 1, false);


--
-- TOC entry 3245 (class 2606 OID 28101)
-- Name: micuisine_cantidad micuisine_cantidad_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_cantidad
    ADD CONSTRAINT micuisine_cantidad_pkey PRIMARY KEY (id);


--
-- TOC entry 3243 (class 2606 OID 28096)
-- Name: micuisine_ingrediente micuisine_ingrediente_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_ingrediente
    ADD CONSTRAINT micuisine_ingrediente_pkey PRIMARY KEY (id);


--
-- TOC entry 3257 (class 2606 OID 28134)
-- Name: micuisine_ingredientes_mas_utilizados micuisine_ingredientes_mas_utilizados_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_ingredientes_mas_utilizados
    ADD CONSTRAINT micuisine_ingredientes_mas_utilizados_pkey PRIMARY KEY (id);


--
-- TOC entry 3251 (class 2606 OID 28119)
-- Name: micuisine_receta_cantidad_link micuisine_receta_cantidad_link_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_receta_cantidad_link
    ADD CONSTRAINT micuisine_receta_cantidad_link_pkey PRIMARY KEY (receta_id, cantidad_id);


--
-- TOC entry 3249 (class 2606 OID 28114)
-- Name: micuisine_receta_ingrediente_link micuisine_receta_ingrediente_link_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_receta_ingrediente_link
    ADD CONSTRAINT micuisine_receta_ingrediente_link_pkey PRIMARY KEY (receta_id, ingrediente_id);


--
-- TOC entry 3247 (class 2606 OID 28109)
-- Name: micuisine_receta micuisine_receta_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_receta
    ADD CONSTRAINT micuisine_receta_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 28129)
-- Name: micuisine_recetas_por_dia micuisine_recetas_por_dia_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_recetas_por_dia
    ADD CONSTRAINT micuisine_recetas_por_dia_pkey PRIMARY KEY (id);


--
-- TOC entry 3253 (class 2606 OID 28124)
-- Name: micuisine_recetas_por_usuario micuisine_recetas_por_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_recetas_por_usuario
    ADD CONSTRAINT micuisine_recetas_por_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3241 (class 2606 OID 28091)
-- Name: micuisine_usuario micuisine_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.micuisine_usuario
    ADD CONSTRAINT micuisine_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3141 (class 2606 OID 27712)
-- Name: sec_constraint sec_constraint_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_constraint
    ADD CONSTRAINT sec_constraint_pkey PRIMARY KEY (id);


--
-- TOC entry 3169 (class 2606 OID 27800)
-- Name: sec_entity_log sec_entity_log_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_entity_log
    ADD CONSTRAINT sec_entity_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3172 (class 2606 OID 27817)
-- Name: sec_filter sec_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_filter
    ADD CONSTRAINT sec_filter_pkey PRIMARY KEY (id);


--
-- TOC entry 3129 (class 2606 OID 27650)
-- Name: sec_group_hierarchy sec_group_hierarchy_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_group_hierarchy
    ADD CONSTRAINT sec_group_hierarchy_pkey PRIMARY KEY (id);


--
-- TOC entry 3127 (class 2606 OID 27639)
-- Name: sec_group sec_group_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_group
    ADD CONSTRAINT sec_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3144 (class 2606 OID 27726)
-- Name: sec_localized_constraint_msg sec_localized_constraint_msg_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_localized_constraint_msg
    ADD CONSTRAINT sec_localized_constraint_msg_pkey PRIMARY KEY (id);


--
-- TOC entry 3161 (class 2606 OID 27784)
-- Name: sec_logged_attr sec_logged_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_logged_attr
    ADD CONSTRAINT sec_logged_attr_pkey PRIMARY KEY (id);


--
-- TOC entry 3163 (class 2606 OID 27786)
-- Name: sec_logged_attr sec_logged_attr_uniq_name; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_logged_attr
    ADD CONSTRAINT sec_logged_attr_uniq_name UNIQUE (entity_id, name);


--
-- TOC entry 3156 (class 2606 OID 27777)
-- Name: sec_logged_entity sec_logged_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_logged_entity
    ADD CONSTRAINT sec_logged_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 3158 (class 2606 OID 27779)
-- Name: sec_logged_entity sec_logged_entity_uniq_name; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_logged_entity
    ADD CONSTRAINT sec_logged_entity_uniq_name UNIQUE (name);


--
-- TOC entry 3138 (class 2606 OID 27695)
-- Name: sec_permission sec_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_permission
    ADD CONSTRAINT sec_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3179 (class 2606 OID 27854)
-- Name: sec_presentation sec_presentation_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_presentation
    ADD CONSTRAINT sec_presentation_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 28037)
-- Name: sec_remember_me sec_remember_me_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_remember_me
    ADD CONSTRAINT sec_remember_me_pkey PRIMARY KEY (id);


--
-- TOC entry 3124 (class 2606 OID 27633)
-- Name: sec_role sec_role_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_role
    ADD CONSTRAINT sec_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3189 (class 2606 OID 27901)
-- Name: sec_screen_history sec_screen_history_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_screen_history
    ADD CONSTRAINT sec_screen_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3182 (class 2606 OID 27868)
-- Name: sec_search_folder sec_search_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_search_folder
    ADD CONSTRAINT sec_search_folder_pkey PRIMARY KEY (folder_id);


--
-- TOC entry 3147 (class 2606 OID 27735)
-- Name: sec_session_attr sec_session_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_session_attr
    ADD CONSTRAINT sec_session_attr_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 28068)
-- Name: sec_session_log sec_session_log_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_session_log
    ADD CONSTRAINT sec_session_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3132 (class 2606 OID 27668)
-- Name: sec_user sec_user_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user
    ADD CONSTRAINT sec_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3135 (class 2606 OID 27679)
-- Name: sec_user_role sec_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_role
    ADD CONSTRAINT sec_user_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3149 (class 2606 OID 27749)
-- Name: sec_user_setting sec_user_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_setting
    ADD CONSTRAINT sec_user_setting_pkey PRIMARY KEY (id);


--
-- TOC entry 3151 (class 2606 OID 27751)
-- Name: sec_user_setting sec_user_setting_uniq; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_setting
    ADD CONSTRAINT sec_user_setting_uniq UNIQUE (user_id, name, client_type);


--
-- TOC entry 3154 (class 2606 OID 27761)
-- Name: sec_user_substitution sec_user_substitution_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_substitution
    ADD CONSTRAINT sec_user_substitution_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 28052)
-- Name: sys_access_token sys_access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_access_token
    ADD CONSTRAINT sys_access_token_pkey PRIMARY KEY (id);


--
-- TOC entry 3176 (class 2606 OID 27841)
-- Name: sys_app_folder sys_app_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_app_folder
    ADD CONSTRAINT sys_app_folder_pkey PRIMARY KEY (folder_id);


--
-- TOC entry 3216 (class 2606 OID 27997)
-- Name: sys_attr_value sys_attr_value_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_attr_value
    ADD CONSTRAINT sys_attr_value_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 27982)
-- Name: sys_category_attr sys_category_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_category_attr
    ADD CONSTRAINT sys_category_attr_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 27973)
-- Name: sys_category sys_category_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_category
    ADD CONSTRAINT sys_category_pkey PRIMARY KEY (id);


--
-- TOC entry 3108 (class 2606 OID 27580)
-- Name: sys_config sys_config_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_config
    ADD CONSTRAINT sys_config_pkey PRIMARY KEY (id);


--
-- TOC entry 3102 (class 2606 OID 27563)
-- Name: sys_db_changelog sys_db_changelog_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_db_changelog
    ADD CONSTRAINT sys_db_changelog_pkey PRIMARY KEY (script_name);


--
-- TOC entry 3203 (class 2606 OID 27956)
-- Name: sys_entity_snapshot sys_entity_snapshot_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_entity_snapshot
    ADD CONSTRAINT sys_entity_snapshot_pkey PRIMARY KEY (id);


--
-- TOC entry 3115 (class 2606 OID 27599)
-- Name: sys_entity_statistics sys_entity_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_entity_statistics
    ADD CONSTRAINT sys_entity_statistics_pkey PRIMARY KEY (id);


--
-- TOC entry 3110 (class 2606 OID 27589)
-- Name: sys_file sys_file_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_file
    ADD CONSTRAINT sys_file_pkey PRIMARY KEY (id);


--
-- TOC entry 3174 (class 2606 OID 27828)
-- Name: sys_folder sys_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_folder
    ADD CONSTRAINT sys_folder_pkey PRIMARY KEY (id);


--
-- TOC entry 3185 (class 2606 OID 27892)
-- Name: sys_fts_queue sys_fts_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_fts_queue
    ADD CONSTRAINT sys_fts_queue_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 28019)
-- Name: sys_jmx_instance sys_jmx_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_jmx_instance
    ADD CONSTRAINT sys_jmx_instance_pkey PRIMARY KEY (id);


--
-- TOC entry 3112 (class 2606 OID 27594)
-- Name: sys_lock_config sys_lock_config_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_lock_config
    ADD CONSTRAINT sys_lock_config_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 28027)
-- Name: sys_query_result sys_query_result_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_query_result
    ADD CONSTRAINT sys_query_result_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 28060)
-- Name: sys_refresh_token sys_refresh_token_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_refresh_token
    ADD CONSTRAINT sys_refresh_token_pkey PRIMARY KEY (id);


--
-- TOC entry 3121 (class 2606 OID 27618)
-- Name: sys_scheduled_execution sys_scheduled_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_scheduled_execution
    ADD CONSTRAINT sys_scheduled_execution_pkey PRIMARY KEY (id);


--
-- TOC entry 3117 (class 2606 OID 27610)
-- Name: sys_scheduled_task sys_scheduled_task_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_scheduled_task
    ADD CONSTRAINT sys_scheduled_task_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 27937)
-- Name: sys_sending_attachment sys_sending_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_sending_attachment
    ADD CONSTRAINT sys_sending_attachment_pkey PRIMARY KEY (id);


--
-- TOC entry 3194 (class 2606 OID 27921)
-- Name: sys_sending_message sys_sending_message_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_sending_message
    ADD CONSTRAINT sys_sending_message_pkey PRIMARY KEY (id);


--
-- TOC entry 3105 (class 2606 OID 27571)
-- Name: sys_server sys_server_pkey; Type: CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_server
    ADD CONSTRAINT sys_server_pkey PRIMARY KEY (id);


--
-- TOC entry 3207 (class 1259 OID 27989)
-- Name: idx_cat_attr_ent_type_and_code; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_cat_attr_ent_type_and_code ON public.sys_category_attr USING btree (category_entity_type, code) WHERE (delete_ts IS NULL);


--
-- TOC entry 3139 (class 1259 OID 27718)
-- Name: idx_sec_constraint_group; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_constraint_group ON public.sec_constraint USING btree (group_id);


--
-- TOC entry 3164 (class 1259 OID 27806)
-- Name: idx_sec_entity_log_entity_id; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_entity_log_entity_id ON public.sec_entity_log USING btree (entity_id);


--
-- TOC entry 3165 (class 1259 OID 27808)
-- Name: idx_sec_entity_log_ientity_id; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_entity_log_ientity_id ON public.sec_entity_log USING btree (int_entity_id);


--
-- TOC entry 3166 (class 1259 OID 27809)
-- Name: idx_sec_entity_log_lentity_id; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_entity_log_lentity_id ON public.sec_entity_log USING btree (long_entity_id);


--
-- TOC entry 3167 (class 1259 OID 27807)
-- Name: idx_sec_entity_log_sentity_id; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_entity_log_sentity_id ON public.sec_entity_log USING btree (string_entity_id);


--
-- TOC entry 3170 (class 1259 OID 27823)
-- Name: idx_sec_filter_component_user; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_filter_component_user ON public.sec_filter USING btree (component, user_id);


--
-- TOC entry 3125 (class 1259 OID 27645)
-- Name: idx_sec_group_uniq_name; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sec_group_uniq_name ON public.sec_group USING btree (name) WHERE (delete_ts IS NULL);


--
-- TOC entry 3142 (class 1259 OID 27727)
-- Name: idx_sec_loc_cnstrnt_msg_unique; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sec_loc_cnstrnt_msg_unique ON public.sec_localized_constraint_msg USING btree (entity_name, operation_type) WHERE (delete_ts IS NULL);


--
-- TOC entry 3159 (class 1259 OID 27792)
-- Name: idx_sec_logged_attr_entity; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_logged_attr_entity ON public.sec_logged_attr USING btree (entity_id);


--
-- TOC entry 3136 (class 1259 OID 27701)
-- Name: idx_sec_permission_unique; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sec_permission_unique ON public.sec_permission USING btree (role_id, permission_type, target) WHERE (delete_ts IS NULL);


--
-- TOC entry 3177 (class 1259 OID 27860)
-- Name: idx_sec_presentation_component_user; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_presentation_component_user ON public.sec_presentation USING btree (component, user_id);


--
-- TOC entry 3226 (class 1259 OID 28044)
-- Name: idx_sec_remember_me_token; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_remember_me_token ON public.sec_remember_me USING btree (token);


--
-- TOC entry 3227 (class 1259 OID 28043)
-- Name: idx_sec_remember_me_user; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_remember_me_user ON public.sec_remember_me USING btree (user_id);


--
-- TOC entry 3122 (class 1259 OID 27634)
-- Name: idx_sec_role_uniq_name; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sec_role_uniq_name ON public.sec_role USING btree (name) WHERE (delete_ts IS NULL);


--
-- TOC entry 3186 (class 1259 OID 27913)
-- Name: idx_sec_screen_hist_sub_user; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_screen_hist_sub_user ON public.sec_screen_history USING btree (substituted_user_id);


--
-- TOC entry 3187 (class 1259 OID 27912)
-- Name: idx_sec_screen_history_user; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_screen_history_user ON public.sec_screen_history USING btree (user_id);


--
-- TOC entry 3180 (class 1259 OID 27884)
-- Name: idx_sec_search_folder_user; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_search_folder_user ON public.sec_search_folder USING btree (user_id);


--
-- TOC entry 3145 (class 1259 OID 27741)
-- Name: idx_sec_session_attr_group; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_session_attr_group ON public.sec_session_attr USING btree (group_id);


--
-- TOC entry 3234 (class 1259 OID 28081)
-- Name: idx_sec_session_log_session; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_session_log_session ON public.sec_session_log USING btree (session_id);


--
-- TOC entry 3235 (class 1259 OID 28080)
-- Name: idx_sec_session_log_subuser; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_session_log_subuser ON public.sec_session_log USING btree (substituted_user_id);


--
-- TOC entry 3236 (class 1259 OID 28074)
-- Name: idx_sec_session_log_user; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_session_log_user ON public.sec_session_log USING btree (user_id);


--
-- TOC entry 3133 (class 1259 OID 27690)
-- Name: idx_sec_user_role_uniq_role; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sec_user_role_uniq_role ON public.sec_user_role USING btree (user_id, role_id) WHERE (delete_ts IS NULL);


--
-- TOC entry 3152 (class 1259 OID 27772)
-- Name: idx_sec_user_substitution_user; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sec_user_substitution_user ON public.sec_user_substitution USING btree (user_id);


--
-- TOC entry 3130 (class 1259 OID 27674)
-- Name: idx_sec_user_uniq_login; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sec_user_uniq_login ON public.sec_user USING btree (login_lc) WHERE (delete_ts IS NULL);


--
-- TOC entry 3237 (class 1259 OID 28082)
-- Name: idx_session_log_started_ts; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_session_log_started_ts ON public.sec_session_log USING btree (started_ts DESC);


--
-- TOC entry 3211 (class 1259 OID 28008)
-- Name: idx_sys_attr_value_entity; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_attr_value_entity ON public.sys_attr_value USING btree (entity_id);


--
-- TOC entry 3212 (class 1259 OID 28010)
-- Name: idx_sys_attr_value_ientity; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_attr_value_ientity ON public.sys_attr_value USING btree (int_entity_id);


--
-- TOC entry 3213 (class 1259 OID 28011)
-- Name: idx_sys_attr_value_lentity; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_attr_value_lentity ON public.sys_attr_value USING btree (long_entity_id);


--
-- TOC entry 3214 (class 1259 OID 28009)
-- Name: idx_sys_attr_value_sentity; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_attr_value_sentity ON public.sys_attr_value USING btree (string_entity_id);


--
-- TOC entry 3208 (class 1259 OID 27988)
-- Name: idx_sys_category_attr_category; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_category_attr_category ON public.sys_category_attr USING btree (category_id);


--
-- TOC entry 3204 (class 1259 OID 27974)
-- Name: idx_sys_category_uniq_name_entity_type; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sys_category_uniq_name_entity_type ON public.sys_category USING btree (name, entity_type) WHERE (delete_ts IS NULL);


--
-- TOC entry 3106 (class 1259 OID 27581)
-- Name: idx_sys_config_uniq_name; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sys_config_uniq_name ON public.sys_config USING btree (name);


--
-- TOC entry 3198 (class 1259 OID 27962)
-- Name: idx_sys_entity_snapshot_entity_id; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_entity_snapshot_entity_id ON public.sys_entity_snapshot USING btree (entity_id);


--
-- TOC entry 3199 (class 1259 OID 27964)
-- Name: idx_sys_entity_snapshot_ientity_id; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_entity_snapshot_ientity_id ON public.sys_entity_snapshot USING btree (int_entity_id);


--
-- TOC entry 3200 (class 1259 OID 27965)
-- Name: idx_sys_entity_snapshot_lentity_id; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_entity_snapshot_lentity_id ON public.sys_entity_snapshot USING btree (long_entity_id);


--
-- TOC entry 3201 (class 1259 OID 27963)
-- Name: idx_sys_entity_snapshot_sentity_id; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_entity_snapshot_sentity_id ON public.sys_entity_snapshot USING btree (string_entity_id);


--
-- TOC entry 3113 (class 1259 OID 27600)
-- Name: idx_sys_entity_statistics_uniq_name; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sys_entity_statistics_uniq_name ON public.sys_entity_statistics USING btree (name);


--
-- TOC entry 3183 (class 1259 OID 27893)
-- Name: idx_sys_fts_queue_idxhost_crts; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_fts_queue_idxhost_crts ON public.sys_fts_queue USING btree (indexing_host, create_ts);


--
-- TOC entry 3219 (class 1259 OID 28028)
-- Name: idx_sys_query_result_entity_session_key; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_query_result_entity_session_key ON public.sys_query_result USING btree (entity_id, session_id, query_key);


--
-- TOC entry 3220 (class 1259 OID 28030)
-- Name: idx_sys_query_result_ientity_session_key; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_query_result_ientity_session_key ON public.sys_query_result USING btree (int_entity_id, session_id, query_key);


--
-- TOC entry 3221 (class 1259 OID 28031)
-- Name: idx_sys_query_result_lentity_session_key; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_query_result_lentity_session_key ON public.sys_query_result USING btree (long_entity_id, session_id, query_key);


--
-- TOC entry 3222 (class 1259 OID 28029)
-- Name: idx_sys_query_result_sentity_session_key; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_query_result_sentity_session_key ON public.sys_query_result USING btree (string_entity_id, session_id, query_key);


--
-- TOC entry 3223 (class 1259 OID 28032)
-- Name: idx_sys_query_result_session_key; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_query_result_session_key ON public.sys_query_result USING btree (session_id, query_key);


--
-- TOC entry 3118 (class 1259 OID 27625)
-- Name: idx_sys_scheduled_execution_task_finish_time; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_scheduled_execution_task_finish_time ON public.sys_scheduled_execution USING btree (task_id, finish_time);


--
-- TOC entry 3119 (class 1259 OID 27624)
-- Name: idx_sys_scheduled_execution_task_start_time; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_scheduled_execution_task_start_time ON public.sys_scheduled_execution USING btree (task_id, start_time);


--
-- TOC entry 3190 (class 1259 OID 27928)
-- Name: idx_sys_sending_message_date_sent; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_sending_message_date_sent ON public.sys_sending_message USING btree (date_sent);


--
-- TOC entry 3191 (class 1259 OID 27927)
-- Name: idx_sys_sending_message_status; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_sending_message_status ON public.sys_sending_message USING btree (status);


--
-- TOC entry 3192 (class 1259 OID 27929)
-- Name: idx_sys_sending_message_update_ts; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX idx_sys_sending_message_update_ts ON public.sys_sending_message USING btree (update_ts);


--
-- TOC entry 3103 (class 1259 OID 27572)
-- Name: idx_sys_server_uniq_name; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE UNIQUE INDEX idx_sys_server_uniq_name ON public.sys_server USING btree (name);


--
-- TOC entry 3195 (class 1259 OID 27948)
-- Name: sys_sending_attachment_message_idx; Type: INDEX; Schema: public; Owner: usuariocuba
--

CREATE INDEX sys_sending_attachment_message_idx ON public.sys_sending_attachment USING btree (message_id);


--
-- TOC entry 3272 (class 2606 OID 27801)
-- Name: sec_entity_log fk_sec_entity_log_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_entity_log
    ADD CONSTRAINT fk_sec_entity_log_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3273 (class 2606 OID 27818)
-- Name: sec_filter fk_sec_filter_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_filter
    ADD CONSTRAINT fk_sec_filter_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3281 (class 2606 OID 27907)
-- Name: sec_screen_history fk_sec_history_substituted_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_screen_history
    ADD CONSTRAINT fk_sec_history_substituted_user FOREIGN KEY (substituted_user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3280 (class 2606 OID 27902)
-- Name: sec_screen_history fk_sec_history_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_screen_history
    ADD CONSTRAINT fk_sec_history_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3271 (class 2606 OID 27787)
-- Name: sec_logged_attr fk_sec_logged_attr_entity; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_logged_attr
    ADD CONSTRAINT fk_sec_logged_attr_entity FOREIGN KEY (entity_id) REFERENCES public.sec_logged_entity(id);


--
-- TOC entry 3289 (class 2606 OID 28038)
-- Name: sec_remember_me fk_sec_remember_me_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_remember_me
    ADD CONSTRAINT fk_sec_remember_me_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3277 (class 2606 OID 27869)
-- Name: sec_search_folder fk_sec_search_folder_folder; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_search_folder
    ADD CONSTRAINT fk_sec_search_folder_folder FOREIGN KEY (folder_id) REFERENCES public.sys_folder(id);


--
-- TOC entry 3279 (class 2606 OID 27879)
-- Name: sec_search_folder fk_sec_search_folder_presentation; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_search_folder
    ADD CONSTRAINT fk_sec_search_folder_presentation FOREIGN KEY (presentation_id) REFERENCES public.sec_presentation(id) ON DELETE SET NULL;


--
-- TOC entry 3278 (class 2606 OID 27874)
-- Name: sec_search_folder fk_sec_search_folder_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_search_folder
    ADD CONSTRAINT fk_sec_search_folder_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3291 (class 2606 OID 28075)
-- Name: sec_session_log fk_sec_session_log_subuser; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_session_log
    ADD CONSTRAINT fk_sec_session_log_subuser FOREIGN KEY (substituted_user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3290 (class 2606 OID 28069)
-- Name: sec_session_log fk_sec_session_log_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_session_log
    ADD CONSTRAINT fk_sec_session_log_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3270 (class 2606 OID 27767)
-- Name: sec_user_substitution fk_sec_user_substitution_substituted_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_substitution
    ADD CONSTRAINT fk_sec_user_substitution_substituted_user FOREIGN KEY (substituted_user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3269 (class 2606 OID 27762)
-- Name: sec_user_substitution fk_sec_user_substitution_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_substitution
    ADD CONSTRAINT fk_sec_user_substitution_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3275 (class 2606 OID 27842)
-- Name: sys_app_folder fk_sys_app_folder_folder; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_app_folder
    ADD CONSTRAINT fk_sys_app_folder_folder FOREIGN KEY (folder_id) REFERENCES public.sys_folder(id);


--
-- TOC entry 3285 (class 2606 OID 27957)
-- Name: sys_entity_snapshot fk_sys_entity_snapshot_author_id; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_entity_snapshot
    ADD CONSTRAINT fk_sys_entity_snapshot_author_id FOREIGN KEY (author_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3274 (class 2606 OID 27829)
-- Name: sys_folder fk_sys_folder_parent; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_folder
    ADD CONSTRAINT fk_sys_folder_parent FOREIGN KEY (parent_id) REFERENCES public.sys_folder(id);


--
-- TOC entry 3284 (class 2606 OID 27943)
-- Name: sys_sending_attachment fk_sys_sending_attachment_content_file; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_sending_attachment
    ADD CONSTRAINT fk_sys_sending_attachment_content_file FOREIGN KEY (content_file_id) REFERENCES public.sys_file(id);


--
-- TOC entry 3283 (class 2606 OID 27938)
-- Name: sys_sending_attachment fk_sys_sending_attachment_sending_message; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_sending_attachment
    ADD CONSTRAINT fk_sys_sending_attachment_sending_message FOREIGN KEY (message_id) REFERENCES public.sys_sending_message(id);


--
-- TOC entry 3282 (class 2606 OID 27922)
-- Name: sys_sending_message fk_sys_sending_message_content_file; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_sending_message
    ADD CONSTRAINT fk_sys_sending_message_content_file FOREIGN KEY (content_text_file_id) REFERENCES public.sys_file(id);


--
-- TOC entry 3266 (class 2606 OID 27713)
-- Name: sec_constraint sec_constraint_group; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_constraint
    ADD CONSTRAINT sec_constraint_group FOREIGN KEY (group_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3260 (class 2606 OID 27651)
-- Name: sec_group_hierarchy sec_group_hierarchy_group; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_group_hierarchy
    ADD CONSTRAINT sec_group_hierarchy_group FOREIGN KEY (group_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3261 (class 2606 OID 27656)
-- Name: sec_group_hierarchy sec_group_hierarchy_parent; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_group_hierarchy
    ADD CONSTRAINT sec_group_hierarchy_parent FOREIGN KEY (parent_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3259 (class 2606 OID 27640)
-- Name: sec_group sec_group_parent; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_group
    ADD CONSTRAINT sec_group_parent FOREIGN KEY (parent_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3265 (class 2606 OID 27696)
-- Name: sec_permission sec_permission_role; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_permission
    ADD CONSTRAINT sec_permission_role FOREIGN KEY (role_id) REFERENCES public.sec_role(id);


--
-- TOC entry 3276 (class 2606 OID 27855)
-- Name: sec_presentation sec_presentation_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_presentation
    ADD CONSTRAINT sec_presentation_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3267 (class 2606 OID 27736)
-- Name: sec_session_attr sec_session_attr_group; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_session_attr
    ADD CONSTRAINT sec_session_attr_group FOREIGN KEY (group_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3262 (class 2606 OID 27669)
-- Name: sec_user sec_user_group; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user
    ADD CONSTRAINT sec_user_group FOREIGN KEY (group_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3263 (class 2606 OID 27680)
-- Name: sec_user_role sec_user_role_profile; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_role
    ADD CONSTRAINT sec_user_role_profile FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3264 (class 2606 OID 27685)
-- Name: sec_user_role sec_user_role_role; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_role
    ADD CONSTRAINT sec_user_role_role FOREIGN KEY (role_id) REFERENCES public.sec_role(id);


--
-- TOC entry 3268 (class 2606 OID 27752)
-- Name: sec_user_setting sec_user_setting_user; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sec_user_setting
    ADD CONSTRAINT sec_user_setting_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3288 (class 2606 OID 28003)
-- Name: sys_attr_value sys_attr_value_attr_value_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_attr_value
    ADD CONSTRAINT sys_attr_value_attr_value_parent_id FOREIGN KEY (parent_id) REFERENCES public.sys_attr_value(id);


--
-- TOC entry 3287 (class 2606 OID 27998)
-- Name: sys_attr_value sys_attr_value_category_attr_id; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_attr_value
    ADD CONSTRAINT sys_attr_value_category_attr_id FOREIGN KEY (category_attr_id) REFERENCES public.sys_category_attr(id);


--
-- TOC entry 3286 (class 2606 OID 27983)
-- Name: sys_category_attr sys_category_attr_category_id; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_category_attr
    ADD CONSTRAINT sys_category_attr_category_id FOREIGN KEY (category_id) REFERENCES public.sys_category(id);


--
-- TOC entry 3258 (class 2606 OID 27619)
-- Name: sys_scheduled_execution sys_scheduled_execution_task; Type: FK CONSTRAINT; Schema: public; Owner: usuariocuba
--

ALTER TABLE ONLY public.sys_scheduled_execution
    ADD CONSTRAINT sys_scheduled_execution_task FOREIGN KEY (task_id) REFERENCES public.sys_scheduled_task(id);


-- Completed on 2019-06-15 00:02:51 CEST

--
-- PostgreSQL database dump complete
--

