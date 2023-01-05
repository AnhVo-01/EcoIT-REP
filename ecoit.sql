--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: about_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.about_address (
    about_id bigint NOT NULL,
    address_id bigint NOT NULL
);


ALTER TABLE public.about_address OWNER TO postgres;

--
-- Name: about_us; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.about_us (
    about_id bigint NOT NULL,
    active boolean NOT NULL,
    content text,
    description text,
    email character varying(255),
    fax character varying(255),
    phone character varying(255),
    video_link text
);


ALTER TABLE public.about_us OWNER TO postgres;

--
-- Name: about_us_about_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.about_us_about_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_us_about_id_seq OWNER TO postgres;

--
-- Name: about_us_about_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.about_us_about_id_seq OWNED BY public.about_us.about_id;


--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    address_id bigint NOT NULL,
    active boolean NOT NULL,
    address text,
    district character varying(255),
    prefix character varying(255),
    province character varying(255),
    wards character varying(255)
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_address_id_seq OWNER TO postgres;

--
-- Name: address_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_address_id_seq OWNED BY public.address.address_id;


--
-- Name: banner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banner (
    banner_id bigint NOT NULL,
    active boolean NOT NULL,
    name character varying(255),
    path_file character varying(255),
    path_url character varying(255),
    type character varying(255),
    target character varying(255)
);


ALTER TABLE public.banner OWNER TO postgres;

--
-- Name: banner_banner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banner_banner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banner_banner_id_seq OWNER TO postgres;

--
-- Name: banner_banner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banner_banner_id_seq OWNED BY public.banner.banner_id;


--
-- Name: blog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blog (
    blog_id bigint NOT NULL,
    active boolean NOT NULL,
    created_date character varying(255),
    content text,
    description text,
    link character varying(255),
    title character varying(255),
    image_id bigint
);


ALTER TABLE public.blog OWNER TO postgres;

--
-- Name: blog_blog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blog_blog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blog_id_seq OWNER TO postgres;

--
-- Name: blog_blog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blog_blog_id_seq OWNED BY public.blog.blog_id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts (
    contacts_id bigint NOT NULL,
    content text,
    email character varying(255),
    name character varying(255),
    phone character varying(255),
    status integer
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- Name: contacts_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_contacts_id_seq OWNER TO postgres;

--
-- Name: contacts_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_contacts_id_seq OWNED BY public.contacts.contacts_id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id bigint NOT NULL,
    active boolean NOT NULL,
    bgicolor character varying(255),
    description character varying(255),
    icon character varying(255),
    name character varying(255),
    url character varying(255),
    banner_id bigint
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customer_id_seq OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;


--
-- Name: customer_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_product (
    customer_id bigint NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.customer_product OWNER TO postgres;

--
-- Name: districts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.districts (
    districts_id bigint NOT NULL,
    code bigint,
    codename character varying(255),
    division_type character varying(255),
    name character varying(255),
    province_code bigint
);


ALTER TABLE public.districts OWNER TO postgres;

--
-- Name: districts_districts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.districts_districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.districts_districts_id_seq OWNER TO postgres;

--
-- Name: districts_districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.districts_districts_id_seq OWNED BY public.districts.districts_id;


--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- Name: history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history (
    history_id bigint NOT NULL,
    date character varying(255),
    executor character varying(255),
    method character varying(255),
    page character varying(255),
    query_string character varying(255),
    type character varying(255)
);


ALTER TABLE public.history OWNER TO postgres;

--
-- Name: history_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.history_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_history_id_seq OWNER TO postgres;

--
-- Name: history_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.history_history_id_seq OWNED BY public.history.history_id;


--
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    image_id bigint NOT NULL,
    file_name character varying(255),
    path_file character varying(255),
    type character varying(255),
    path_url character varying(255)
);


ALTER TABLE public.image OWNER TO postgres;

--
-- Name: image_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_image_id_seq OWNER TO postgres;

--
-- Name: image_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_image_id_seq OWNED BY public.image.image_id;


--
-- Name: navigation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.navigation (
    nav_id bigint NOT NULL,
    active boolean NOT NULL,
    name character varying(255),
    parent_id bigint,
    url character varying(255)
);


ALTER TABLE public.navigation OWNER TO postgres;

--
-- Name: navigation_nav_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.navigation_nav_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.navigation_nav_id_seq OWNER TO postgres;

--
-- Name: navigation_nav_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.navigation_nav_id_seq OWNED BY public.navigation.nav_id;


--
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    post_id bigint NOT NULL,
    active boolean NOT NULL,
    content text,
    created_date character varying(255),
    description text,
    title character varying(255),
    url text,
    image_id bigint
);


ALTER TABLE public.post OWNER TO postgres;

--
-- Name: post_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_post_id_seq OWNER TO postgres;

--
-- Name: post_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_post_id_seq OWNED BY public.post.post_id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_id bigint NOT NULL,
    active boolean NOT NULL,
    content text,
    description character varying(255),
    name character varying(255),
    url character varying(255),
    image_id bigint,
    banner_id bigint
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_id_seq OWNER TO postgres;

--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- Name: provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinces (
    provinces_id bigint NOT NULL,
    code bigint,
    codename character varying(255),
    division_type character varying(255),
    name character varying(255),
    phone_code integer NOT NULL
);


ALTER TABLE public.provinces OWNER TO postgres;

--
-- Name: provinces_provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provinces_provinces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provinces_provinces_id_seq OWNER TO postgres;

--
-- Name: provinces_provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provinces_provinces_id_seq OWNED BY public.provinces.provinces_id;


--
-- Name: recruit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recruit (
    recruit_id bigint NOT NULL,
    active boolean NOT NULL,
    content text,
    create_date character varying(255),
    description text,
    title character varying(255),
    url text,
    image_id bigint
);


ALTER TABLE public.recruit OWNER TO postgres;

--
-- Name: recruit_recruit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recruit_recruit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recruit_recruit_id_seq OWNER TO postgres;

--
-- Name: recruit_recruit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recruit_recruit_id_seq OWNED BY public.recruit.recruit_id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    role_id bigint NOT NULL,
    name character varying(20)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_role_id_seq OWNER TO postgres;

--
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_role_id_seq OWNED BY public.role.role_id;


--
-- Name: sliders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sliders (
    slider_id bigint NOT NULL,
    active boolean,
    name character varying(255),
    path_file character varying(255),
    path_url character varying(255),
    type character varying(255),
    url character varying(255)
);


ALTER TABLE public.sliders OWNER TO postgres;

--
-- Name: sliders_slider_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sliders_slider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sliders_slider_id_seq OWNER TO postgres;

--
-- Name: sliders_slider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sliders_slider_id_seq OWNED BY public.sliders.slider_id;


--
-- Name: typical_customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.typical_customer (
    id bigint NOT NULL,
    active boolean NOT NULL,
    name character varying(255),
    url character varying(255),
    image_id bigint
);


ALTER TABLE public.typical_customer OWNER TO postgres;

--
-- Name: typical_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.typical_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.typical_customer_id_seq OWNER TO postgres;

--
-- Name: typical_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.typical_customer_id_seq OWNED BY public.typical_customer.id;


--
-- Name: typical_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.typical_image (
    id bigint NOT NULL,
    active boolean NOT NULL,
    caption character varying(255),
    description character varying(255),
    image_id bigint
);


ALTER TABLE public.typical_image OWNER TO postgres;

--
-- Name: typical_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.typical_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.typical_image_id_seq OWNER TO postgres;

--
-- Name: typical_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.typical_image_id_seq OWNED BY public.typical_image.id;


--
-- Name: typical_number; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.typical_number (
    id bigint NOT NULL,
    active boolean NOT NULL,
    description character varying(255),
    icon character varying(255),
    num integer NOT NULL
);


ALTER TABLE public.typical_number OWNER TO postgres;

--
-- Name: typical_number_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.typical_number_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.typical_number_id_seq OWNER TO postgres;

--
-- Name: typical_number_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.typical_number_id_seq OWNED BY public.typical_number.id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(50),
    first_name character varying(255),
    last_name character varying(255),
    password character varying(120),
    username character varying(20),
    status integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: wards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wards (
    wards_id bigint NOT NULL,
    code bigint,
    codename character varying(255),
    district_code bigint,
    division_type character varying(255),
    name character varying(255)
);


ALTER TABLE public.wards OWNER TO postgres;

--
-- Name: wards_wards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wards_wards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wards_wards_id_seq OWNER TO postgres;

--
-- Name: wards_wards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wards_wards_id_seq OWNED BY public.wards.wards_id;


--
-- Name: about_us about_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.about_us ALTER COLUMN about_id SET DEFAULT nextval('public.about_us_about_id_seq'::regclass);


--
-- Name: address address_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address ALTER COLUMN address_id SET DEFAULT nextval('public.address_address_id_seq'::regclass);


--
-- Name: banner banner_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banner ALTER COLUMN banner_id SET DEFAULT nextval('public.banner_banner_id_seq'::regclass);


--
-- Name: blog blog_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog ALTER COLUMN blog_id SET DEFAULT nextval('public.blog_blog_id_seq'::regclass);


--
-- Name: contacts contacts_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts ALTER COLUMN contacts_id SET DEFAULT nextval('public.contacts_contacts_id_seq'::regclass);


--
-- Name: customer customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- Name: districts districts_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts ALTER COLUMN districts_id SET DEFAULT nextval('public.districts_districts_id_seq'::regclass);


--
-- Name: history history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history ALTER COLUMN history_id SET DEFAULT nextval('public.history_history_id_seq'::regclass);


--
-- Name: image image_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN image_id SET DEFAULT nextval('public.image_image_id_seq'::regclass);


--
-- Name: navigation nav_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigation ALTER COLUMN nav_id SET DEFAULT nextval('public.navigation_nav_id_seq'::regclass);


--
-- Name: post post_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN post_id SET DEFAULT nextval('public.post_post_id_seq'::regclass);


--
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- Name: provinces provinces_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces ALTER COLUMN provinces_id SET DEFAULT nextval('public.provinces_provinces_id_seq'::regclass);


--
-- Name: recruit recruit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruit ALTER COLUMN recruit_id SET DEFAULT nextval('public.recruit_recruit_id_seq'::regclass);


--
-- Name: role role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN role_id SET DEFAULT nextval('public.role_role_id_seq'::regclass);


--
-- Name: sliders slider_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sliders ALTER COLUMN slider_id SET DEFAULT nextval('public.sliders_slider_id_seq'::regclass);


--
-- Name: typical_customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typical_customer ALTER COLUMN id SET DEFAULT nextval('public.typical_customer_id_seq'::regclass);


--
-- Name: typical_image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typical_image ALTER COLUMN id SET DEFAULT nextval('public.typical_image_id_seq'::regclass);


--
-- Name: typical_number id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typical_number ALTER COLUMN id SET DEFAULT nextval('public.typical_number_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: wards wards_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wards ALTER COLUMN wards_id SET DEFAULT nextval('public.wards_wards_id_seq'::regclass);


--
-- Data for Name: about_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.about_address (about_id, address_id) FROM stdin;
1	1
\.


--
-- Data for Name: about_us; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.about_us (about_id, active, content, description, email, fax, phone, video_link) FROM stdin;
1	t	<p><span style="color:#50b848"><strong>EcoIT&nbsp;</strong></span>được viết tắt từ &ldquo;Eco-System in Information Technology&rdquo; mang &yacute; nghĩa l&agrave; &ldquo;<span style="color:#50b848"><strong>Hệ sinh th&aacute;i trong c&ocirc;ng nghệ th&ocirc;ng tin</strong></span>&rdquo;.</p>\n\n<p>C&ocirc;ng ty Cổ phần EcoIT được đăng k&yacute; th&agrave;nh lập v&agrave;o ng&agrave;y 29/4/2010 với sứ mệnh cung cấp cho kh&aacute;ch h&agrave;ng c&aacute;c trang thiết bị, phần mềm chuy&ecirc;n dụng, dịch vụ hệ thống v&agrave; những giải ph&aacute;p đồng bộ li&ecirc;n quan đến lĩnh vực c&ocirc;ng nghệ th&ocirc;ng tin.</p>\n\n<p><strong>Chiến lược ph&aacute;t triển của EcoIT</strong></p>\n\n<p><strong><img alt="" src="https://ecoit.asia/wp-content/uploads/2019/08/chienluoc-1.png" style="width:100%" /></strong></p>\n\n<p>Với lịch sử h&igrave;nh th&agrave;nh từ những ng&agrave;y đầu của thời đại c&ocirc;ng nghệ số, C&ocirc;ng ty EcoIT lu&ocirc;n l&agrave; một trong những c&ocirc;ng ty đi đầu trong lĩnh vực gia c&ocirc;ng sản xuất phần mềm với c&aacute;c đối t&aacute;c trong v&agrave; ngo&agrave;i nước. Sản phẩm của EcoIT lu&ocirc;n đảm bảo chất lượng v&agrave; tạo dựng niềm tin sự uy t&iacute;n đối với kh&aacute;ch h&agrave;ng l&agrave; cơ quan nh&agrave; nước cũng như doanh nghiệp trong nước v&agrave; nước ngo&agrave;i.</p>\n\n<p>Phương ch&acirc;m của C&ocirc;ng ty l&agrave; lu&ocirc;n đi ti&ecirc;n phong trong việc nghi&ecirc;n cứu giải ph&aacute;p ứng dụng c&ocirc;ng nghệ số. Ngo&agrave;i c&aacute;c sản phẩm đ&atilde; khẳng định được t&ecirc;n tuổi v&agrave; chỗ đứng tr&ecirc;n thị trường như EcoECM, EcoEmail, EcoPortal, EcoOffice &hellip; một sản phẩm mang t&iacute;nh đột ph&aacute; trong thời đại c&ocirc;ng nghệ số của c&ocirc;ng ty l&agrave; &ldquo;EcoOCR- Số h&oacute;a v&agrave; chuyển đổi số&rdquo; cũng đang ph&aacute;t triển mạnh mẽ với những đ&aacute;nh gi&aacute; t&iacute;ch cực của kh&aacute;ch h&agrave;ng.</p>\n\n<p><strong>Tại sao n&ecirc;n chọn EcoIT?</strong></p>\n\n<p><strong><img alt="" src="https://ecoit.asia/wp-content/uploads/2019/08/taisaochonct-1.png" style="width:100%" /></strong></p>\n\n<p>&nbsp;</p>\n\n<p>Ch&uacute;ng t&ocirc;i tin tưởng rằng sức mạnh nổi trội của EcoIT thể hiện ở đội ngũ c&aacute;n bộ c&oacute; nhiều năm kinh nghiệm v&agrave; năng động, với c&aacute;c thiết bị m&aacute;y m&oacute;c v&agrave; c&ocirc;ng nghệ hiện đại, khả năng t&agrave;i ch&iacute;nh vững chắc sẽ mang lại sự h&agrave;i l&ograve;ng cho mọi Kh&aacute;ch h&agrave;ng.</p>\n\n<p>Ch&uacute;ng t&ocirc;i đ&atilde; v&agrave; đang li&ecirc;n tục thực hiện mọi nỗ lực của m&igrave;nh để tiếp tục cung cấp c&aacute;c dịch vụ v&agrave; sản phẩm tốt nhất thỏa m&atilde;n c&aacute;c y&ecirc;u cầu khắt khe nhất của Kh&aacute;ch h&agrave;ng.</p>\n\n<p><strong>Sơ đồ tổ chức của EcoIT</strong></p>\n\n<p><strong><img alt="" src="https://ecoit.asia/wp-content/uploads/2019/08/sodotochuc-1.png" style="width:100%" /></strong></p>\n	<p><span style="color:#50b848">C&ocirc;ng ty Cổ phần EcoIT</span>&nbsp;được đăng k&yacute; th&agrave;nh lập ng&agrave;y 29/4/2010 l&agrave; một C&ocirc;ng ty tin học chuy&ecirc;n cung cấp phần mềm, dịch vụ, hệ thống v&agrave; c&aacute;c giải ph&aacute;p về C&ocirc;ng nghệ th&ocirc;ng tin được s&aacute;ng lập v&agrave; l&atilde;nh đạo bởi c&aacute;c chuy&ecirc;n gia quản l&yacute;, chuy&ecirc;n gia c&ocirc;ng nghệ c&oacute; kinh nghiệm l&acirc;u năm trong lĩnh vực C&ocirc;ng nghệ th&ocirc;ng tin c&oacute; c&ugrave;ng &yacute; tưởng đến từ nhiều tổ chức, doanh nghiệp trong c&aacute;c lĩnh vực kh&aacute;c nhau.</p>\n	contact@ecoit.asia	(024) 62750064	(+84) 935 772 929	<iframe width="100%" height="282" src="https://www.youtube.com/embed/cG-zYVv4fVw" title="GIỚI THIỆU CÔNG TY CỔ PHẦN ECOIT" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
\.


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (address_id, active, address, district, prefix, province, wards) FROM stdin;
1	t	Tầng 3, Khu A-B Khu văn phòng, Imperia Garden, 203 Nguyễn Huy Tưởng	9	Trụ sở chính	1	\N
\.


--
-- Data for Name: banner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banner (banner_id, active, name, path_file, path_url, type, target) FROM stdin;
1	t	1666663397620_khối-kh-doanh-nghiệp-v2.jpg	static\\images\\2022_10	http://localhost:8080/images/2022_10/1666663397620_kh%E1%BB%91i-kh-doanh-nghi%E1%BB%87p-v2.jpg	image/jpeg	\N
2	t	1666665217749_khối-kh-chính-phủ.jpg	static\\images\\2022_10	http://localhost:8080/images/2022_10/1666665217749_kh%E1%BB%91i-kh-ch%C3%ADnh-ph%E1%BB%A7.jpg	image/jpeg	\N
3	t	1667558269609_banner-tin-tức.png	static\\images\\2022_11	http://localhost:8080/images/2022_11/1667558269609_banner-tin-t%E1%BB%A9c.png	image/png	post
\.


--
-- Data for Name: blog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blog (blog_id, active, created_date, content, description, link, title, image_id) FROM stdin;
1	t	2022-10-25		Lưu trữ hồ sơ là điều bắt buộc trong doanh nghiệp và rất quan trọng liên quan đến hoạt động trong kinh doanh cũng như đảm bảo về tính pháp…	luu-tru-ho-so-theo-tieu-chuan-iso	Lưu trữ hồ sơ theo tiêu chuẩn ISO	19
2	t	2022-11-01		Ngành điện lực trong nước là một trong những ngành được ưu tiên hàng đầu trong chiến lược chuyển đổi số của chính phủ. Cùng EcoIT tìm hiểu về những…	chuyen-doi-so-trong-nganh-dien-luc	CHUYỂN ĐỔI SỐ TRONG NGÀNH ĐIỆN LỰC	21
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts (contacts_id, content, email, name, phone, status) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, active, bgicolor, description, icon, name, url, banner_id) FROM stdin;
4	t	#476d8a	Bao gồm các tập đoàn, doanh nghiệp lớn trong và ngoài nước	fas fa-briefcase	Khách hàng doanh nghiệp	khach-hang-doanh-nghiep	1
3	t	\N	Bao gồm các Bộ, Ban, Ngành và các cơ quan nhà nước khác	fa fa-university	Khách hàng chính phủ	khach-hang-chinh-phu	2
\.


--
-- Data for Name: customer_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_product (customer_id, product_id) FROM stdin;
3	7
3	4
3	2
3	6
3	1
3	5
3	3
4	2
4	1
\.


--
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.districts (districts_id, code, codename, division_type, name, province_code) FROM stdin;
1	1	quan_ba_dinh	quận	Ba Đình	1
2	2	quan_hoan_kiem	quận	Hoàn Kiếm	1
3	3	quan_tay_ho	quận	Tây Hồ	1
4	4	quan_long_bien	quận	Long Biên	1
5	5	quan_cau_giay	quận	Cầu Giấy	1
6	6	quan_dong_da	quận	Đống Đa	1
7	7	quan_hai_ba_trung	quận	Hai Bà Trưng	1
8	8	quan_hoang_mai	quận	Hoàng Mai	1
9	9	quan_thanh_xuan	quận	Thanh Xuân	1
10	16	huyen_soc_son	huyện	Sóc Sơn	1
11	17	huyen_dong_anh	huyện	Đông Anh	1
12	18	huyen_gia_lam	huyện	Gia Lâm	1
13	19	quan_nam_tu_liem	quận	Nam Từ Liêm	1
14	20	huyen_thanh_tri	huyện	Thanh Trì	1
15	21	quan_bac_tu_liem	quận	Bắc Từ Liêm	1
16	250	huyen_me_linh	huyện	Mê Linh	1
17	268	quan_ha_dong	quận	Hà Đông	1
18	269	thi_xa_son_tay	thị xã	Sơn Tây	1
19	271	huyen_ba_vi	huyện	Ba Vì	1
20	272	huyen_phuc_tho	huyện	Phúc Thọ	1
21	273	huyen_dan_phuong	huyện	Đan Phượng	1
22	274	huyen_hoai_duc	huyện	Hoài Đức	1
23	275	huyen_quoc_oai	huyện	Quốc Oai	1
24	276	huyen_thach_that	huyện	Thạch Thất	1
25	277	huyen_chuong_my	huyện	Chương Mỹ	1
26	278	huyen_thanh_oai	huyện	Thanh Oai	1
27	279	huyen_thuong_tin	huyện	Thường Tín	1
28	280	huyen_phu_xuyen	huyện	Phú Xuyên	1
29	281	huyen_ung_hoa	huyện	Ứng Hòa	1
30	282	huyen_my_duc	huyện	Mỹ Đức	1
31	24	thanh_pho_ha_giang	thành phố	TP. Hà Giang	2
32	26	huyen_dong_van	huyện	Đồng Văn	2
33	27	huyen_meo_vac	huyện	Mèo Vạc	2
34	28	huyen_yen_minh	huyện	Yên Minh	2
35	29	huyen_quan_ba	huyện	Quản Bạ	2
36	30	huyen_vi_xuyen	huyện	Vị Xuyên	2
37	31	huyen_bac_me	huyện	Bắc Mê	2
38	32	huyen_hoang_su_phi	huyện	Hoàng Su Phì	2
39	33	huyen_xin_man	huyện	Xín Mần	2
40	34	huyen_bac_quang	huyện	Bắc Quang	2
41	35	huyen_quang_binh	huyện	Quang Bình	2
42	40	thanh_pho_cao_bang	thành phố	TP. Cao Bằng	3
43	42	huyen_bao_lam	huyện	Bảo Lâm	3
44	43	huyen_bao_lac	huyện	Bảo Lạc	3
45	45	huyen_ha_quang	huyện	Hà Quảng	3
46	47	huyen_trung_khanh	huyện	Trùng Khánh	3
47	48	huyen_ha_lang	huyện	Hạ Lang	3
48	49	huyen_quang_hoa	huyện	Quảng Hòa	3
49	51	huyen_hoa_an	huyện	Hoà An	3
50	52	huyen_nguyen_binh	huyện	Nguyên Bình	3
51	53	huyen_thach_an	huyện	Thạch An	3
52	58	thanh_pho_bac_kan	thành phố	TP. Bắc Kạn	4
53	60	huyen_pac_nam	huyện	Pác Nặm	4
54	61	huyen_ba_be	huyện	Ba Bể	4
55	62	huyen_ngan_son	huyện	Ngân Sơn	4
56	63	huyen_bach_thong	huyện	Bạch Thông	4
57	64	huyen_cho_don	huyện	Chợ Đồn	4
58	65	huyen_cho_moi	huyện	Chợ Mới	4
59	66	huyen_na_ri	huyện	Na Rì	4
60	70	thanh_pho_tuyen_quang	thành phố	TP. Tuyên Quang	5
61	71	huyen_lam_binh	huyện	Lâm Bình	5
62	72	huyen_na_hang	huyện	Na Hang	5
63	73	huyen_chiem_hoa	huyện	Chiêm Hóa	5
64	74	huyen_ham_yen	huyện	Hàm Yên	5
65	75	huyen_yen_son	huyện	Yên Sơn	5
66	76	huyen_son_duong	huyện	Sơn Dương	5
67	80	thanh_pho_lao_cai	thành phố	TP. Lào Cai	6
68	82	huyen_bat_xat	huyện	Bát Xát	6
69	83	huyen_muong_khuong	huyện	Mường Khương	6
70	84	huyen_si_ma_cai	huyện	Si Ma Cai	6
71	85	huyen_bac_ha	huyện	Bắc Hà	6
72	86	huyen_bao_thang	huyện	Bảo Thắng	6
73	87	huyen_bao_yen	huyện	Bảo Yên	6
74	88	thi_xa_sa_pa	thị xã	TX. Sa Pa	6
75	89	huyen_van_ban	huyện	Văn Bàn	6
76	94	thanh_pho_dien_bien_phu	thành phố	Điện Biên Phủ	7
77	95	thi_xa_muong_lay	thị xã	Mường Lay	7
78	96	huyen_muong_nhe	huyện	Mường Nhé	7
79	97	huyen_muong_cha	huyện	Mường Chà	7
80	98	huyen_tua_chua	huyện	Tủa Chùa	7
81	99	huyen_tuan_giao	huyện	Tuần Giáo	7
82	100	huyen_dien_bien	huyện	H. Điện Biên	7
83	101	huyen_dien_bien_dong	huyện	Điện Biên Đông	7
84	102	huyen_muong_ang	huyện	Mường Ảng	7
85	103	huyen_nam_po	huyện	Nậm Pồ	7
86	105	thanh_pho_lai_chau	thành phố	TP. Lai Châu	8
87	106	huyen_tam_duong	huyện	Tam Đường	8
88	107	huyen_muong_te	huyện	Mường Tè	8
89	108	huyen_sin_ho	huyện	Sìn Hồ	8
90	109	huyen_phong_tho	huyện	Phong Thổ	8
91	110	huyen_than_uyen	huyện	Than Uyên	8
92	111	huyen_tan_uyen	huyện	Tân Uyên	8
93	112	huyen_nam_nhun	huyện	Nậm Nhùn	8
94	116	thanh_pho_son_la	thành phố	TP. Sơn La	9
95	118	huyen_quynh_nhai	huyện	Quỳnh Nhai	9
96	119	huyen_thuan_chau	huyện	Thuận Châu	9
97	120	huyen_muong_la	huyện	Mường La	9
98	121	huyen_bac_yen	huyện	Bắc Yên	9
99	122	huyen_phu_yen	huyện	Phù Yên	9
100	123	huyen_moc_chau	huyện	Mộc Châu	9
101	124	huyen_yen_chau	huyện	Yên Châu	9
102	125	huyen_mai_son	huyện	Mai Sơn	9
103	126	huyen_song_ma	huyện	Sông Mã	9
104	127	huyen_sop_cop	huyện	Sốp Cộp	9
105	128	huyen_van_ho	huyện	Vân Hồ	9
106	132	thanh_pho_yen_bai	thành phố	TP. Yên Bái	10
107	133	thi_xa_nghia_lo	thị xã	TX. Nghĩa Lộ	10
108	135	huyen_luc_yen	huyện	Lục Yên	10
109	136	huyen_van_yen	huyện	Văn Yên	10
110	137	huyen_mu_cang_chai	huyện	Mù Căng Chải	10
111	138	huyen_tran_yen	huyện	Trấn Yên	10
112	139	huyen_tram_tau	huyện	Trạm Tấu	10
113	140	huyen_van_chan	huyện	Văn Chấn	10
114	141	huyen_yen_binh	huyện	Yên Bình	10
115	148	thanh_pho_hoa_binh	thành phố	TP. Hòa Bình	11
116	150	huyen_da_bac	huyện	Đà Bắc	11
117	152	huyen_luong_son	huyện	Lương Sơn	11
118	153	huyen_kim_boi	huyện	Kim Bôi	11
119	154	huyen_cao_phong	huyện	Cao Phong	11
120	155	huyen_tan_lac	huyện	Tân Lạc	11
121	156	huyen_mai_chau	huyện	Mai Châu	11
122	157	huyen_lac_son	huyện	Lạc Sơn	11
123	158	huyen_yen_thuy	huyện	Yên Thủy	11
124	159	huyen_lac_thuy	huyện	Lạc Thủy	11
125	164	thanh_pho_thai_nguyen	thành phố	TP. Thái Nguyên	12
126	165	thanh_pho_song_cong	thành phố	TP. Sông Công	12
127	167	huyen_dinh_hoa	huyện	Định Hóa	12
128	168	huyen_phu_luong	huyện	Phú Lương	12
129	169	huyen_dong_hy	huyện	Đồng Hỷ	12
130	170	huyen_vo_nhai	huyện	Võ Nhai	12
131	171	huyen_dai_tu	huyện	Đại Từ	12
132	172	thi_xa_pho_yen	thị xã	TX. Phổ Yên	12
133	173	huyen_phu_binh	huyện	Phú Bình	12
134	178	thanh_pho_lang_son	thành phố	TP. Lạng Sơn	13
135	180	huyen_trang_dinh	huyện	Tràng Định	13
136	181	huyen_binh_gia	huyện	Bình Gia	13
137	182	huyen_van_lang	huyện	Văn Lãng	13
138	183	huyen_cao_loc	huyện	Cao Lộc	13
139	184	huyen_van_quan	huyện	Văn Quan	13
140	185	huyen_bac_son	huyện	Bắc Sơn	13
141	186	huyen_huu_lung	huyện	Hữu Lũng	13
142	187	huyen_chi_lang	huyện	Chi Lăng	13
143	188	huyen_loc_binh	huyện	Lộc Bình	13
144	189	huyen_dinh_lap	huyện	Đình Lập	13
145	193	thanh_pho_ha_long	thành phố	Hạ Long	14
146	194	thanh_pho_mong_cai	thành phố	Móng Cái	14
147	195	thanh_pho_cam_pha	thành phố	Cẩm Phả	14
148	196	thanh_pho_uong_bi	thành phố	Uông Bí	14
149	198	huyen_binh_lieu	huyện	Bình Liêu	14
150	199	huyen_tien_yen	huyện	Tiên Yên	14
151	200	huyen_dam_ha	huyện	Đầm Hà	14
152	201	huyen_hai_ha	huyện	Hải Hà	14
153	202	huyen_ba_che	huyện	Ba Chẽ	14
154	203	huyen_van_don	huyện	Vân Đồn	14
155	205	thi_xa_dong_trieu	thị xã	Đông Triều	14
156	206	thi_xa_quang_yen	thị xã	Quảng Yên	14
157	207	huyen_co_to	huyện	Cô Tô	14
158	213	thanh_pho_bac_giang	thành phố	TP. Bắc Giang	15
159	215	huyen_yen_the	huyện	Yên Thế	15
160	216	huyen_tan_yen	huyện	Tân Yên	15
161	217	huyen_lang_giang	huyện	Lạng Giang	15
162	218	huyen_luc_nam	huyện	Lục Nam	15
163	219	huyen_luc_ngan	huyện	Lục Ngạn	15
164	220	huyen_son_dong	huyện	Sơn Động	15
165	221	huyen_yen_dung	huyện	Yên Dũng	15
166	222	huyen_viet_yen	huyện	Việt Yên	15
167	223	huyen_hiep_hoa	huyện	Hiệp Hòa	15
168	227	thanh_pho_viet_tri	thành phố	Việt Trì	16
169	228	thi_xa_phu_tho	thị xã	TX. Phú Thọ	16
170	230	huyen_doan_hung	huyện	Đoan Hùng	16
171	231	huyen_ha_hoa	huyện	Hạ Hoà	16
172	232	huyen_thanh_ba	huyện	Thanh Ba	16
173	233	huyen_phu_ninh	huyện	Phù Ninh	16
174	234	huyen_yen_lap	huyện	Yên Lập	16
175	235	huyen_cam_khe	huyện	Cẩm Khê	16
176	236	huyen_tam_nong	huyện	Tam Nông	16
177	237	huyen_lam_thao	huyện	Lâm Thao	16
178	238	huyen_thanh_son	huyện	Thanh Sơn	16
179	239	huyen_thanh_thuy	huyện	Thanh Thuỷ	16
180	240	huyen_tan_son	huyện	Tân Sơn	16
181	243	thanh_pho_vinh_yen	thành phố	Vĩnh Yên	17
182	244	thanh_pho_phuc_yen	thành phố	Phúc Yên	17
183	246	huyen_lap_thach	huyện	Lập Thạch	17
184	247	huyen_tam_duong	huyện	Tam Dương	17
185	248	huyen_tam_dao	huyện	Tam Đảo	17
186	249	huyen_binh_xuyen	huyện	Bình Xuyên	17
187	251	huyen_yen_lac	huyện	Yên Lạc	17
188	252	huyen_vinh_tuong	huyện	Vĩnh Tường	17
189	253	huyen_song_lo	huyện	Sông Lô	17
190	256	thanh_pho_bac_ninh	thành phố	TP. Bắc Ninh	18
191	258	huyen_yen_phong	huyện	Yên Phong	18
192	259	huyen_que_vo	huyện	Quế Võ	18
193	260	huyen_tien_du	huyện	Tiên Du	18
194	261	thi_xa_tu_son	thị xã	Từ Sơn	18
195	262	huyen_thuan_thanh	huyện	Thuận Thành	18
196	263	huyen_gia_binh	huyện	Gia Bình	18
197	264	huyen_luong_tai	huyện	Lương Tài	18
198	288	thanh_pho_hai_duong	thành phố	TP. Hải Dương	19
199	290	thanh_pho_chi_linh	thành phố	TP. Chí Linh	19
200	291	huyen_nam_sach	huyện	Nam Sách	19
201	292	thi_xa_kinh_mon	thị xã	Kinh Môn	19
202	293	huyen_kim_thanh	huyện	Kim Thành	19
203	294	huyen_thanh_ha	huyện	Thanh Hà	19
204	295	huyen_cam_giang	huyện	Cẩm Giàng	19
205	296	huyen_binh_giang	huyện	Bình Giang	19
206	297	huyen_gia_loc	huyện	Gia Lộc	19
207	298	huyen_tu_ky	huyện	Tứ Kỳ	19
208	299	huyen_ninh_giang	huyện	Ninh Giang	19
209	300	huyen_thanh_mien	huyện	Thanh Miện	19
210	303	quan_hong_bang	quận	Hồng Bàng	20
211	304	quan_ngo_quyen	quận	Ngô Quyền	20
212	305	quan_le_chan	quận	Lê Chân	20
213	306	quan_hai_an	quận	Hải An	20
214	307	quan_kien_an	quận	Kiến An	20
215	308	quan_do_son	quận	Đồ Sơn	20
216	309	quan_duong_kinh	quận	Dương Kinh	20
217	311	huyen_thuy_nguyen	huyện	Thuỷ Nguyên	20
218	312	huyen_an_duong	huyện	An Dương	20
219	313	huyen_an_lao	huyện	An Lão	20
220	314	huyen_kien_thuy	huyện	Kiến Thuỵ	20
221	315	huyen_tien_lang	huyện	Tiên Lãng	20
222	316	huyen_vinh_bao	huyện	Vĩnh Bảo	20
223	317	huyen_cat_hai	huyện	Cát Hải	20
224	318	huyen_bach_long_vi	huyện	Bạch Long Vĩ	20
225	323	thanh_pho_hung_yen	thành phố	TP. Hưng Yên	21
226	325	huyen_van_lam	huyện	Văn Lâm	21
227	326	huyen_van_giang	huyện	Văn Giang	21
228	327	huyen_yen_my	huyện	Yên Mỹ	21
229	328	thi_xa_my_hao	thị xã	Mỹ Hào	21
230	329	huyen_an_thi	huyện	Ân Thi	21
231	330	huyen_khoai_chau	huyện	Khoái Châu	21
232	331	huyen_kim_dong	huyện	Kim Động	21
233	332	huyen_tien_lu	huyện	Tiên Lữ	21
234	333	huyen_phu_cu	huyện	Phù Cừ	21
235	336	thanh_pho_thai_binh	thành phố	TP. Thái Bình	22
236	338	huyen_quynh_phu	huyện	Quỳnh Phụ	22
237	339	huyen_hung_ha	huyện	Hưng Hà	22
238	340	huyen_dong_hung	huyện	Đông Hưng	22
239	341	huyen_thai_thuy	huyện	Thái Thụy	22
240	342	huyen_tien_hai	huyện	Tiền Hải	22
241	343	huyen_kien_xuong	huyện	Kiến Xương	22
242	344	huyen_vu_thu	huyện	Vũ Thư	22
243	347	thanh_pho_phu_ly	thành phố	Phủ Lý	23
244	349	thi_xa_duy_tien	thị xã	Duy Tiên	23
245	350	huyen_kim_bang	huyện	Kim Bảng	23
246	351	huyen_thanh_liem	huyện	Thanh Liêm	23
247	352	huyen_binh_luc	huyện	Bình Lục	23
248	353	huyen_ly_nhan	huyện	Lý Nhân	23
249	356	thanh_pho_nam_dinh	thành phố	TP. Nam Định	24
250	358	huyen_my_loc	huyện	Mỹ Lộc	24
251	359	huyen_vu_ban	huyện	Vụ Bản	24
252	360	huyen_y_yen	huyện	Ý Yên	24
253	361	huyen_nghia_hung	huyện	Nghĩa Hưng	24
254	362	huyen_nam_truc	huyện	Nam Trực	24
255	363	huyen_truc_ninh	huyện	Trực Ninh	24
256	364	huyen_xuan_truong	huyện	Xuân Trường	24
257	365	huyen_giao_thuy	huyện	Giao Thủy	24
258	366	huyen_hai_hau	huyện	Hải Hậu	24
259	369	thanh_pho_ninh_binh	thành phố	TP. Ninh Bình	25
260	370	thanh_pho_tam_diep	thành phố	Tam Điệp	25
261	372	huyen_nho_quan	huyện	Nho Quan	25
262	373	huyen_gia_vien	huyện	Gia Viễn	25
263	374	huyen_hoa_lu	huyện	Hoa Lư	25
264	375	huyen_yen_khanh	huyện	Yên Khánh	25
265	376	huyen_kim_son	huyện	Kim Sơn	25
266	377	huyen_yen_mo	huyện	Yên Mô	25
267	380	thanh_pho_thanh_hoa	thành phố	TP. Thanh Hóa	26
268	381	thi_xa_bim_son	thị xã	Bỉm Sơn	26
269	382	thanh_pho_sam_son	thành phố	Sầm Sơn	26
270	384	huyen_muong_lat	huyện	Mường Lát	26
271	385	huyen_quan_hoa	huyện	Quan Hóa	26
272	386	huyen_ba_thuoc	huyện	Bá Thước	26
273	387	huyen_quan_son	huyện	Quan Sơn	26
274	388	huyen_lang_chanh	huyện	Lang Chánh	26
275	389	huyen_ngoc_lac	huyện	Ngọc Lặc	26
276	390	huyen_cam_thuy	huyện	Cẩm Thủy	26
277	391	huyen_thach_thanh	huyện	Thạch Thành	26
278	392	huyen_ha_trung	huyện	Hà Trung	26
279	393	huyen_vinh_loc	huyện	Vĩnh Lộc	26
280	394	huyen_yen_dinh	huyện	Yên Định	26
281	395	huyen_tho_xuan	huyện	Thọ Xuân	26
282	396	huyen_thuong_xuan	huyện	Thường Xuân	26
283	397	huyen_trieu_son	huyện	Triệu Sơn	26
284	398	huyen_thieu_hoa	huyện	Thiệu Hóa	26
285	399	huyen_hoang_hoa	huyện	Hoằng Hóa	26
286	400	huyen_hau_loc	huyện	Hậu Lộc	26
287	401	huyen_nga_son	huyện	Nga Sơn	26
288	402	huyen_nhu_xuan	huyện	Như Xuân	26
289	403	huyen_nhu_thanh	huyện	Như Thanh	26
290	404	huyen_nong_cong	huyện	Nông Cống	26
291	405	huyen_dong_son	huyện	Đông Sơn	26
292	406	huyen_quang_xuong	huyện	Quảng Xương	26
293	407	thi_xa_nghi_son	thị xã	Nghi Sơn	26
294	412	thanh_pho_vinh	thành phố	Thành phố Vinh	27
295	413	thi_xa_cua_lo	thị xã	Cửa Lò	27
296	414	thi_xa_thai_hoa	thị xã	Thái Hoà	27
297	415	huyen_que_phong	huyện	Quế Phong	27
298	416	huyen_quy_chau	huyện	Quỳ Châu	27
299	417	huyen_ky_son	huyện	Kỳ Sơn	27
300	418	huyen_tuong_duong	huyện	Tương Dương	27
301	419	huyen_nghia_dan	huyện	Nghĩa Đàn	27
302	420	huyen_quy_hop	huyện	Quỳ Hợp	27
303	421	huyen_quynh_luu	huyện	Quỳnh Lưu	27
304	422	huyen_con_cuong	huyện	Con Cuông	27
305	423	huyen_tan_ky	huyện	Tân Kỳ	27
306	424	huyen_anh_son	huyện	Anh Sơn	27
307	425	huyen_dien_chau	huyện	Diễn Châu	27
308	426	huyen_yen_thanh	huyện	Yên Thành	27
309	427	huyen_do_luong	huyện	Đô Lương	27
310	428	huyen_thanh_chuong	huyện	Thanh Chương	27
311	429	huyen_nghi_loc	huyện	Nghi Lộc	27
312	430	huyen_nam_dan	huyện	Nam Đàn	27
313	431	huyen_hung_nguyen	huyện	Hưng Nguyên	27
314	432	thi_xa_hoang_mai	thị xã	Hoàng Mai	27
315	436	thanh_pho_ha_tinh	thành phố	TP. Hà Tĩnh	28
316	437	thi_xa_hong_linh	thị xã	Hồng Lĩnh	28
317	439	huyen_huong_son	huyện	Hương Sơn	28
318	440	huyen_duc_tho	huyện	Đức Thọ	28
319	441	huyen_vu_quang	huyện	Vũ Quang	28
320	442	huyen_nghi_xuan	huyện	Nghi Xuân	28
321	443	huyen_can_loc	huyện	Can Lộc	28
322	444	huyen_huong_khe	huyện	Hương Khê	28
323	445	huyen_thach_ha	huyện	Thạch Hà	28
324	446	huyen_cam_xuyen	huyện	Cẩm Xuyên	28
325	447	huyen_ky_anh	huyện	Kỳ Anh	28
326	448	huyen_loc_ha	huyện	Lộc Hà	28
327	449	thi_xa_ky_anh	thị xã	Kỳ Anh	28
328	450	thanh_pho_dong_hoi	thành phố	Đồng Hới	29
329	452	huyen_minh_hoa	huyện	Minh Hóa	29
330	453	huyen_tuyen_hoa	huyện	Tuyên Hóa	29
331	454	huyen_quang_trach	huyện	Quảng Trạch	29
332	455	huyen_bo_trach	huyện	Bố Trạch	29
333	456	huyen_quang_ninh	huyện	H. Quảng Ninh	29
334	457	huyen_le_thuy	huyện	Lệ Thủy	29
335	458	thi_xa_ba_don	thị xã	Ba Đồn	29
336	461	thanh_pho_dong_ha	thành phố	Đông Hà	30
337	462	thi_xa_quang_tri	thị xã	TX. Quảng Trị	30
338	464	huyen_vinh_linh	huyện	Vĩnh Linh	30
339	465	huyen_huong_hoa	huyện	Hướng Hóa	30
340	466	huyen_gio_linh	huyện	Gio Linh	30
341	467	huyen_da_krong	huyện	Đa Krông	30
342	468	huyen_cam_lo	huyện	Cam Lộ	30
343	469	huyen_trieu_phong	huyện	Triệu Phong	30
344	470	huyen_hai_lang	huyện	Hải Lăng	30
345	471	huyen_con_co	huyện	Cồn Cỏ	30
346	474	thanh_pho_hue	thành phố	Thành phố Huế	31
347	476	huyen_phong_dien	huyện	Phong Điền	31
348	477	huyen_quang_dien	huyện	Quảng Điền	31
349	478	huyen_phu_vang	huyện	Phú Vang	31
350	479	thi_xa_huong_thuy	thị xã	Hương Thủy	31
351	480	thi_xa_huong_tra	thị xã	Hương Trà	31
352	481	huyen_a_luoi	huyện	A Lưới	31
353	482	huyen_phu_loc	huyện	Phú Lộc	31
354	483	huyen_nam_dong	huyện	Nam Đông	31
355	490	quan_lien_chieu	quận	Q. Liên Chiểu	32
356	491	quan_thanh_khe	quận	Q. Thanh Khê	32
357	492	quan_hai_chau	quận	Q. Hải Châu	32
358	493	quan_son_tra	quận	Q. Sơn Trà	32
359	494	quan_ngu_hanh_son	quận	Q. Ngũ Hành Sơn	32
360	495	quan_cam_le	quận	Q. Cẩm Lệ	32
361	497	huyen_hoa_vang	huyện	Hòa Vang	32
362	498	huyen_hoang_sa	huyện	Hoàng Sa	32
363	502	thanh_pho_tam_ky	thành phố	Tam Kỳ	33
364	503	thanh_pho_hoi_an	thành phố	TP. Hội An	33
365	504	huyen_tay_giang	huyện	Tây Giang	33
366	505	huyen_dong_giang	huyện	Đông Giang	33
367	506	huyen_dai_loc	huyện	Đại Lộc	33
368	507	thi_xa_dien_ban	thị xã	Điện Bàn	33
369	508	huyen_duy_xuyen	huyện	Duy Xuyên	33
370	509	huyen_que_son	huyện	Quế Sơn	33
371	510	huyen_nam_giang	huyện	Nam Giang	33
372	511	huyen_phuoc_son	huyện	Phước Sơn	33
373	512	huyen_hiep_duc	huyện	Hiệp Đức	33
374	513	huyen_thang_binh	huyện	Thăng Bình	33
375	514	huyen_tien_phuoc	huyện	Tiên Phước	33
376	515	huyen_bac_tra_my	huyện	Bắc Trà My	33
377	516	huyen_nam_tra_my	huyện	Nam Trà My	33
378	517	huyen_nui_thanh	huyện	Núi Thành	33
379	518	huyen_phu_ninh	huyện	Phú Ninh	33
380	519	huyen_nong_son	huyện	Nông Sơn	33
381	522	thanh_pho_quang_ngai	thành phố	Quảng Ngãi	51
382	524	huyen_binh_son	huyện	Bình Sơn	51
383	525	huyen_tra_bong	huyện	Trà Bồng	51
384	527	huyen_son_tinh	huyện	Sơn Tịnh	51
385	528	huyen_tu_nghia	huyện	Tư Nghĩa	51
386	529	huyen_son_ha	huyện	Sơn Hà	51
387	530	huyen_son_tay	huyện	Sơn Tây	51
388	531	huyen_minh_long	huyện	Minh Long	51
389	532	huyen_nghia_hanh	huyện	Nghĩa Hành	51
390	533	huyen_mo_duc	huyện	Mộ Đức	51
391	534	thi_xa_duc_pho	thị xã	Đức Phổ	51
392	535	huyen_ba_to	huyện	Ba Tơ	51
393	536	huyen_ly_son	huyện	Lý Sơn	51
394	540	thanh_pho_quy_nhon	thành phố	Quy Nhơn	52
395	542	huyen_an_lao	huyện	An Lão	52
396	543	thi_xa_hoai_nhon	thị xã	Hoài Nhơn	52
397	544	huyen_hoai_an	huyện	Hoài Ân	52
398	545	huyen_phu_my	huyện	Phù Mỹ	52
399	546	huyen_vinh_thanh	huyện	Vĩnh Thạnh	52
400	547	huyen_tay_son	huyện	Tây Sơn	52
401	548	huyen_phu_cat	huyện	Phù Cát	52
402	549	thi_xa_an_nhon	thị xã	An Nhơn	52
403	550	huyen_tuy_phuoc	huyện	Tuy Phước	52
404	551	huyen_van_canh	huyện	Vân Canh	52
405	555	thanh_pho_tuy_hoa	thành phố	Tuy Hoà	54
406	557	thi_xa_song_cau	thị xã	Sông Cầu	54
407	558	huyen_dong_xuan	huyện	Đồng Xuân	54
408	559	huyen_tuy_an	huyện	Tuy An	54
409	560	huyen_son_hoa	huyện	Sơn Hòa	54
410	561	huyen_song_hinh	huyện	Sông Hinh	54
411	562	huyen_tay_hoa	huyện	Tây Hoà	54
412	563	huyen_phu_hoa	huyện	Phú Hoà	54
413	564	thi_xa_dong_hoa	thị xã	Đông Hòa	54
414	568	thanh_pho_nha_trang	thành phố	Nha Trang	56
415	569	thanh_pho_cam_ranh	thành phố	Cam Ranh	56
416	570	huyen_cam_lam	huyện	Cam Lâm	56
417	571	huyen_van_ninh	huyện	Vạn Ninh	56
418	572	thi_xa_ninh_hoa	thị xã	Ninh Hòa	56
419	573	huyen_khanh_vinh	huyện	Khánh Vĩnh	56
420	574	huyen_dien_khanh	huyện	Diên Khánh	56
421	575	huyen_khanh_son	huyện	Khánh Sơn	56
422	576	huyen_truong_sa	huyện	Trường Sa	56
423	582	thanh_pho_phan_rang_thap_cham	thành phố	Tháp Chàm	58
424	584	huyen_bac_ai	huyện	Bác Ái	58
425	585	huyen_ninh_son	huyện	Ninh Sơn	58
426	586	huyen_ninh_hai	huyện	Ninh Hải	58
427	587	huyen_ninh_phuoc	huyện	Ninh Phước	58
428	588	huyen_thuan_bac	huyện	Thuận Bắc	58
429	589	huyen_thuan_nam	huyện	Thuận Nam	58
430	593	thanh_pho_phan_thiet	thành phố	Phan Thiết	60
431	594	thi_xa_la_gi	thị xã	La Gi	60
432	595	huyen_tuy_phong	huyện	Tuy Phong	60
433	596	huyen_bac_binh	huyện	Bắc Bình	60
434	597	huyen_ham_thuan_bac	huyện	Thuận Bắc	60
435	598	huyen_ham_thuan_nam	huyện	Thuận Nam	60
436	599	huyen_tanh_linh	huyện	Tánh Linh	60
437	600	huyen_duc_linh	huyện	Đức Linh	60
438	601	huyen_ham_tan	huyện	Hàm Tân	60
439	602	huyen_phu_qui	huyện	Phú Quí	60
440	608	thanh_pho_kon_tum	thành phố	Kon Tum	62
441	610	huyen_dak_glei	huyện	Đắk Glei	62
442	611	huyen_ngoc_hoi	huyện	Ngọc Hồi	62
443	612	huyen_dak_to	huyện	Đắk Tô	62
444	613	huyen_kon_plong	huyện	Kon Plông	62
445	614	huyen_kon_ray	huyện	Kon Rẫy	62
446	615	huyen_dak_ha	huyện	Đắk Hà	62
447	616	huyen_sa_thay	huyện	Sa Thầy	62
448	617	huyen_tu_mo_rong	huyện	Mơ Rông	62
449	618	huyen_ia_h_drai	huyện	H' Drai	62
450	622	thanh_pho_pleiku	thành phố	Thành phố Pleiku	64
451	623	thi_xa_an_khe	thị xã	An Khê	64
452	624	thi_xa_ayun_pa	thị xã	Ayun Pa	64
453	625	huyen_kbang	huyện	Huyện KBang	64
454	626	huyen_dak_doa	huyện	Đăk Đoa	64
455	627	huyen_chu_pah	huyện	Chư Păh	64
456	628	huyen_ia_grai	huyện	Ia Grai	64
457	629	huyen_mang_yang	huyện	Mang Yang	64
458	630	huyen_kong_chro	huyện	Kông Chro	64
459	631	huyen_duc_co	huyện	Đức Cơ	64
460	632	huyen_chu_prong	huyện	Chư Prông	64
461	633	huyen_chu_se	huyện	Chư Sê	64
462	634	huyen_dak_po	huyện	Đăk Pơ	64
463	635	huyen_ia_pa	huyện	Ia Pa	64
464	637	huyen_krong_pa	huyện	Krông Pa	64
465	638	huyen_phu_thien	huyện	Phú Thiện	64
466	639	huyen_chu_puh	huyện	Chư Pưh	64
467	643	thanh_pho_buon_ma_thuot	thành phố	Ma Thuột	66
468	644	thi_xa_buon_ho	thị xã	Buôn Hồ	66
469	645	huyen_ea_hleo	huyện	Ea H'leo	66
470	646	huyen_ea_sup	huyện	Ea Súp	66
471	647	huyen_buon_don	huyện	Buôn Đôn	66
472	648	huyen_cu_mgar	huyện	Cư M'gar	66
473	649	huyen_krong_buk	huyện	Krông Búk	66
474	650	huyen_krong_nang	huyện	Krông Năng	66
475	651	huyen_ea_kar	huyện	Ea Kar	66
476	652	huyen_mdrak	huyện	M'Đrắk	66
477	653	huyen_krong_bong	huyện	Krông Bông	66
478	654	huyen_krong_pac	huyện	Krông Pắc	66
479	655	huyen_krong_a_na	huyện	A Na	66
480	656	huyen_lak	huyện	Huyện Lắk	66
481	657	huyen_cu_kuin	huyện	Cư Kuin	66
482	660	thanh_pho_gia_nghia	thành phố	Gia Nghĩa	67
483	661	huyen_dak_glong	huyện	Đăk Glong	67
484	662	huyen_cu_jut	huyện	Cư Jút	67
485	663	huyen_dak_mil	huyện	Đắk Mil	67
486	664	huyen_krong_no	huyện	Krông Nô	67
487	665	huyen_dak_song	huyện	Đắk Song	67
488	666	huyen_dak_rlap	huyện	R'Lấp	67
489	667	huyen_tuy_duc	huyện	Tuy Đức	67
490	672	thanh_pho_da_lat	thành phố	Đà Lạt	68
491	673	thanh_pho_bao_loc	thành phố	Bảo Lộc	68
492	674	huyen_dam_rong	huyện	Đam Rông	68
493	675	huyen_lac_duong	huyện	Lạc Dương	68
494	676	huyen_lam_ha	huyện	Lâm Hà	68
495	677	huyen_don_duong	huyện	Đơn Dương	68
496	678	huyen_duc_trong	huyện	Đức Trọng	68
497	679	huyen_di_linh	huyện	Di Linh	68
498	680	huyen_bao_lam	huyện	Bảo Lâm	68
499	681	huyen_da_huoai	huyện	Đạ Huoai	68
500	682	huyen_da_teh	huyện	Đạ Tẻh	68
501	683	huyen_cat_tien	huyện	Cát Tiên	68
502	688	thi_xa_phuoc_long	thị xã	Phước Long	70
503	689	thanh_pho_dong_xoai	thành phố	Đồng Xoài	70
504	690	thi_xa_binh_long	thị xã	Bình Long	70
505	691	huyen_bu_gia_map	huyện	Gia Mập	70
506	692	huyen_loc_ninh	huyện	Lộc Ninh	70
507	693	huyen_bu_dop	huyện	Bù Đốp	70
508	694	huyen_hon_quan	huyện	Hớn Quản	70
509	695	huyen_dong_phu	huyện	Đồng Phú	70
510	696	huyen_bu_dang	huyện	Bù Đăng	70
511	697	huyen_chon_thanh	huyện	Chơn Thành	70
512	698	huyen_phu_rieng	huyện	Phú Riềng	70
513	703	thanh_pho_tay_ninh	thành phố	Tây Ninh	72
514	705	huyen_tan_bien	huyện	Tân Biên	72
515	706	huyen_tan_chau	huyện	Tân Châu	72
516	707	huyen_duong_minh_chau	huyện	Minh Châu	72
517	708	huyen_chau_thanh	huyện	Châu Thành	72
518	709	thi_xa_hoa_thanh	thị xã	Hòa Thành	72
519	710	huyen_go_dau	huyện	Gò Dầu	72
520	711	huyen_ben_cau	huyện	Bến Cầu	72
521	712	thi_xa_trang_bang	thị xã	Trảng Bàng	72
522	718	thanh_pho_thu_dau_mot	thành phố	Dầu Một	74
523	719	huyen_bau_bang	huyện	Bàu Bàng	74
524	720	huyen_dau_tieng	huyện	Dầu Tiếng	74
525	721	thi_xa_ben_cat	thị xã	Bến Cát	74
526	722	huyen_phu_giao	huyện	Phú Giáo	74
527	723	thi_xa_tan_uyen	thị xã	Tân Uyên	74
528	724	thanh_pho_di_an	thành phố	Dĩ An	74
529	725	thanh_pho_thuan_an	thành phố	Thuận An	74
530	726	huyen_bac_tan_uyen	huyện	Tân Uyên	74
531	731	thanh_pho_bien_hoa	thành phố	Biên Hòa	75
532	732	thanh_pho_long_khanh	thành phố	Long Khánh	75
533	734	huyen_tan_phu	huyện	Tân Phú	75
534	735	huyen_vinh_cuu	huyện	Vĩnh Cửu	75
535	736	huyen_dinh_quan	huyện	Định Quán	75
536	737	huyen_trang_bom	huyện	Trảng Bom	75
537	738	huyen_thong_nhat	huyện	Thống Nhất	75
538	739	huyen_cam_my	huyện	Cẩm Mỹ	75
539	740	huyen_long_thanh	huyện	Long Thành	75
540	741	huyen_xuan_loc	huyện	Xuân Lộc	75
541	742	huyen_nhon_trach	huyện	Nhơn Trạch	75
542	747	thanh_pho_vung_tau	thành phố	Vũng Tàu	77
543	748	thanh_pho_ba_ria	thành phố	Bà Rịa	77
544	750	huyen_chau_duc	huyện	Châu Đức	77
545	751	huyen_xuyen_moc	huyện	Xuyên Mộc	77
546	752	huyen_long_dien	huyện	Long Điền	77
547	753	huyen_dat_do	huyện	Đất Đỏ	77
548	754	thi_xa_phu_my	thị xã	Phú Mỹ	77
549	755	huyen_con_dao	huyện	Côn Đảo	77
550	760	quan_1	quận	Quận 1	79
551	761	quan_12	quận	Quận 12	79
552	764	quan_go_vap	quận	Gò Vấp	79
553	765	quan_binh_thanh	quận	Bình Thạnh	79
554	766	quan_tan_binh	quận	Tân Bình	79
555	767	quan_tan_phu	quận	Tân Phú	79
556	768	quan_phu_nhuan	quận	Phú Nhuận	79
557	769	thanh_pho_thu_duc	thành phố	Thủ Đức	79
558	770	quan_3	quận	Quận 3	79
559	771	quan_10	quận	Quận 10	79
560	772	quan_11	quận	Quận 11	79
561	773	quan_4	quận	Quận 4	79
562	774	quan_5	quận	Quận 5	79
563	775	quan_6	quận	Quận 6	79
564	776	quan_8	quận	Quận 8	79
565	777	quan_binh_tan	quận	Bình Tân	79
566	778	quan_7	quận	Quận 7	79
567	783	huyen_cu_chi	huyện	Củ Chi	79
568	784	huyen_hoc_mon	huyện	Hóc Môn	79
569	785	huyen_binh_chanh	huyện	Bình Chánh	79
570	786	huyen_nha_be	huyện	Nhà Bè	79
571	787	huyen_can_gio	huyện	Cần Giờ	79
572	794	thanh_pho_tan_an	thành phố	Tân An	80
573	795	thi_xa_kien_tuong	thị xã	Kiến Tường	80
574	796	huyen_tan_hung	huyện	Tân Hưng	80
575	797	huyen_vinh_hung	huyện	Vĩnh Hưng	80
576	798	huyen_moc_hoa	huyện	Mộc Hóa	80
577	799	huyen_tan_thanh	huyện	Tân Thạnh	80
578	800	huyen_thanh_hoa	huyện	Thạnh Hóa	80
579	801	huyen_duc_hue	huyện	Đức Huệ	80
580	802	huyen_duc_hoa	huyện	Đức Hòa	80
581	803	huyen_ben_luc	huyện	Bến Lức	80
582	804	huyen_thu_thua	huyện	Thủ Thừa	80
583	805	huyen_tan_tru	huyện	Tân Trụ	80
584	806	huyen_can_duoc	huyện	Cần Đước	80
585	807	huyen_can_giuoc	huyện	Cần Giuộc	80
586	808	huyen_chau_thanh	huyện	Châu Thành	80
587	815	thanh_pho_my_tho	thành phố	Mỹ Tho	82
588	816	thi_xa_go_cong	thị xã	Gò Công	82
589	817	thi_xa_cai_lay	thị xã	Cai Lậy	82
590	818	huyen_tan_phuoc	huyện	Tân Phước	82
591	819	huyen_cai_be	huyện	Cái Bè	82
592	820	huyen_cai_lay	huyện	Cai Lậy	82
593	821	huyen_chau_thanh	huyện	Châu Thành	82
594	822	huyen_cho_gao	huyện	Chợ Gạo	82
595	823	huyen_go_cong_tay	huyện	Công Tây	82
596	824	huyen_go_cong_dong	huyện	Công Đông	82
597	825	huyen_tan_phu_dong	huyện	Phú Đông	82
598	829	thanh_pho_ben_tre	thành phố	Bến Tre	83
599	831	huyen_chau_thanh	huyện	Châu Thành	83
600	832	huyen_cho_lach	huyện	Chợ Lách	83
601	833	huyen_mo_cay_nam	huyện	Cày Nam	83
602	834	huyen_giong_trom	huyện	Giồng Trôm	83
603	835	huyen_binh_dai	huyện	Bình Đại	83
604	836	huyen_ba_tri	huyện	Ba Tri	83
605	837	huyen_thanh_phu	huyện	Thạnh Phú	83
606	838	huyen_mo_cay_bac	huyện	Cày Bắc	83
607	842	thanh_pho_tra_vinh	thành phố	Trà Vinh	84
608	844	huyen_cang_long	huyện	Càng Long	84
609	845	huyen_cau_ke	huyện	Cầu Kè	84
610	846	huyen_tieu_can	huyện	Tiểu Cần	84
611	847	huyen_chau_thanh	huyện	Châu Thành	84
612	848	huyen_cau_ngang	huyện	Cầu Ngang	84
613	849	huyen_tra_cu	huyện	Trà Cú	84
614	850	huyen_duyen_hai	huyện	Duyên Hải	84
615	851	thi_xa_duyen_hai	thị xã	Duyên Hải	84
616	855	thanh_pho_vinh_long	thành phố	Vĩnh Long	86
617	857	huyen_long_ho	huyện	Long Hồ	86
618	858	huyen_mang_thit	huyện	Mang Thít	86
619	859	huyen_vung_liem	huyện	Vũng Liêm	86
620	860	huyen_tam_binh	huyện	Tam Bình	86
621	861	thi_xa_binh_minh	thị xã	Bình Minh	86
622	862	huyen_tra_on	huyện	Trà Ôn	86
623	863	huyen_binh_tan	huyện	Bình Tân	86
624	866	thanh_pho_cao_lanh	thành phố	Cao Lãnh	87
625	867	thanh_pho_sa_dec	thành phố	Sa Đéc	87
626	868	thanh_pho_hong_ngu	thành phố	Hồng Ngự	87
627	869	huyen_tan_hong	huyện	Tân Hồng	87
628	870	huyen_hong_ngu	huyện	Hồng Ngự	87
629	871	huyen_tam_nong	huyện	Tam Nông	87
630	872	huyen_thap_muoi	huyện	Tháp Mười	87
631	873	huyen_cao_lanh	huyện	Cao Lãnh	87
632	874	huyen_thanh_binh	huyện	Thanh Bình	87
633	875	huyen_lap_vo	huyện	Lấp Vò	87
634	876	huyen_lai_vung	huyện	Lai Vung	87
635	877	huyen_chau_thanh	huyện	Châu Thành	87
636	883	thanh_pho_long_xuyen	thành phố	Long Xuyên	89
637	884	thanh_pho_chau_doc	thành phố	Châu Đốc	89
638	886	huyen_an_phu	huyện	An Phú	89
639	887	thi_xa_tan_chau	thị xã	Tân Châu	89
640	888	huyen_phu_tan	huyện	Phú Tân	89
641	889	huyen_chau_phu	huyện	Châu Phú	89
642	890	huyen_tinh_bien	huyện	Tịnh Biên	89
643	891	huyen_tri_ton	huyện	Tri Tôn	89
644	892	huyen_chau_thanh	huyện	Châu Thành	89
645	893	huyen_cho_moi	huyện	Chợ Mới	89
646	894	huyen_thoai_son	huyện	Thoại Sơn	89
647	899	thanh_pho_rach_gia	thành phố	Rạch Giá	91
648	900	thanh_pho_ha_tien	thành phố	Hà Tiên	91
649	902	huyen_kien_luong	huyện	Kiên Lương	91
650	903	huyen_hon_dat	huyện	Hòn Đất	91
651	904	huyen_tan_hiep	huyện	Tân Hiệp	91
652	905	huyen_chau_thanh	huyện	Châu Thành	91
653	906	huyen_giong_rieng	huyện	Giồng Riềng	91
654	907	huyen_go_quao	huyện	Gò Quao	91
655	908	huyen_an_bien	huyện	An Biên	91
656	909	huyen_an_minh	huyện	An Minh	91
657	910	huyen_vinh_thuan	huyện	Vĩnh Thuận	91
658	911	thanh_pho_phu_quoc	thành phố	Phú Quốc	91
659	912	huyen_kien_hai	huyện	Kiên Hải	91
660	913	huyen_u_minh_thuong	huyện	Minh Thượng	91
661	914	huyen_giang_thanh	huyện	Giang Thành	91
662	916	quan_ninh_kieu	quận	Ninh Kiều	92
663	917	quan_o_mon	quận	Ô Môn	92
664	918	quan_binh_thuy	quận	Bình Thuỷ	92
665	919	quan_cai_rang	quận	Cái Răng	92
666	923	quan_thot_not	quận	Thốt Nốt	92
667	924	huyen_vinh_thanh	huyện	Vĩnh Thạnh	92
668	925	huyen_co_do	huyện	Cờ Đỏ	92
669	926	huyen_phong_dien	huyện	Phong Điền	92
670	927	huyen_thoi_lai	huyện	Thới Lai	92
671	930	thanh_pho_vi_thanh	thành phố	Vị Thanh	93
672	931	thanh_pho_nga_bay	thành phố	Ngã Bảy	93
673	932	huyen_chau_thanh_a	huyện	Thành A	93
674	933	huyen_chau_thanh	huyện	Châu Thành	93
675	934	huyen_phung_hiep	huyện	Phụng Hiệp	93
676	935	huyen_vi_thuy	huyện	Vị Thuỷ	93
677	936	huyen_long_my	huyện	Long Mỹ	93
678	937	thi_xa_long_my	thị xã	Long Mỹ	93
679	941	thanh_pho_soc_trang	thành phố	Sóc Trăng	94
680	942	huyen_chau_thanh	huyện	Châu Thành	94
681	943	huyen_ke_sach	huyện	Kế Sách	94
682	944	huyen_my_tu	huyện	Mỹ Tú	94
683	945	huyen_cu_lao_dung	huyện	Lao Dung	94
684	946	huyen_long_phu	huyện	Long Phú	94
685	947	huyen_my_xuyen	huyện	Mỹ Xuyên	94
686	948	thi_xa_nga_nam	thị xã	Ngã Năm	94
687	949	huyen_thanh_tri	huyện	Thạnh Trị	94
688	950	thi_xa_vinh_chau	thị xã	Vĩnh Châu	94
689	951	huyen_tran_de	huyện	Trần Đề	94
690	954	thanh_pho_bac_lieu	thành phố	Bạc Liêu	95
691	956	huyen_hong_dan	huyện	Hồng Dân	95
692	957	huyen_phuoc_long	huyện	Phước Long	95
693	958	huyen_vinh_loi	huyện	Vĩnh Lợi	95
694	959	thi_xa_gia_rai	thị xã	Giá Rai	95
695	960	huyen_dong_hai	huyện	Đông Hải	95
696	961	huyen_hoa_binh	huyện	Hoà Bình	95
697	964	thanh_pho_ca_mau	thành phố	Cà Mau	96
698	966	huyen_u_minh	huyện	U Minh	96
699	967	huyen_thoi_binh	huyện	Thới Bình	96
700	968	huyen_tran_van_thoi	huyện	Văn Thời	96
701	969	huyen_cai_nuoc	huyện	Cái Nước	96
702	970	huyen_dam_doi	huyện	Đầm Dơi	96
703	971	huyen_nam_can	huyện	Năm Căn	96
704	972	huyen_phu_tan	huyện	Phú Tân	96
705	973	huyen_ngoc_hien	huyện	Ngọc Hiển	96
\.


--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.history (history_id, date, executor, method, page, query_string, type) FROM stdin;
2	2022-11-01 15:49:06 ICT	admin	POST	/error	\N	\N
3	2022-11-01 15:50:30 ICT	admin	POST	/blogs	\N	\N
10	2022-11-02 08:58:13 ICT	admin	GET	/number/1	\N	UPDATE
11	2022-11-02 08:58:16 ICT	admin	POST	/number/1	\N	UPDATE
12	2022-11-02 09:01:45 ICT	admin	POST	/number/1	\N	UPDATE
13	2022-11-02 09:24:06 ICT	admin	POST	/history/delete	\N	DELETE
14	2022-11-02 11:13:58 ICT	\N	POST	/auth/login	\N	CREATE
15	2022-11-02 11:14:22 ICT	\N	POST	/auth/login	\N	CREATE
16	2022-11-02 11:14:50 ICT	\N	POST	/auth/login	\N	CREATE
17	2022-11-02 11:14:59 ICT	\N	POST	/auth/login	\N	CREATE
18	2022-11-02 11:15:04 ICT	\N	POST	/auth/login	\N	CREATE
19	2022-11-02 11:15:08 ICT	\N	POST	/auth/login	\N	CREATE
20	2022-11-02 11:23:50 ICT	\N	POST	/auth/login	\N	CREATE
21	2022-11-02 11:39:49 ICT	\N	POST	/auth/login	\N	CREATE
22	2022-11-02 11:40:24 ICT	\N	POST	/auth/login	\N	CREATE
23	2022-11-02 11:50:32 ICT	mod	POST	/news/5	\N	UPDATE
24	2022-11-02 11:50:46 ICT	mod	GET	/nav/delete/10	\N	DELETE
25	2022-11-02 11:54:31 ICT	\N	POST	/auth/login	\N	CREATE
26	2022-11-03 10:12:06 ICT	admin	POST	/customer/typical	\N	CREATE
27	2022-11-03 10:51:37 ICT	admin	POST	/customer/typical	\N	CREATE
28	2022-11-03 10:58:43 ICT	admin	POST	/customer/typical	\N	CREATE
29	2022-11-03 11:01:38 ICT	admin	POST	/customer/typical	\N	CREATE
30	2022-11-03 11:03:36 ICT	admin	POST	/customer/typical	\N	CREATE
31	2022-11-03 11:21:42 ICT	admin	POST	/customer/typical	\N	CREATE
32	2022-11-03 11:22:01 ICT	admin	POST	/customer/typical	\N	CREATE
33	2022-11-03 12:01:27 ICT	\N	POST	/auth/login	\N	CREATE
34	2022-11-03 15:20:13 ICT	\N	POST	/auth/login	\N	CREATE
35	2022-11-03 16:03:12 ICT	\N	POST	/auth/login	\N	CREATE
36	2022-11-04 10:27:10 ICT	mod	POST	/nav/12	\N	UPDATE
37	2022-11-04 10:32:40 ICT	mod	POST	/nav/12	\N	UPDATE
38	2022-11-04 16:20:15 ICT	\N	POST	/auth/login	\N	CREATE
39	2022-11-04 16:47:08 ICT	\N	POST	/auth/login	\N	CREATE
40	2022-11-04 17:06:03 ICT	\N	POST	/auth/login	\N	CREATE
41	2022-11-04 17:38:22 ICT	admin	POST	/banner	\N	CREATE
42	2022-11-05 10:05:26 ICT	admin	POST	/about-us	\N	CREATE
43	2022-11-05 10:07:13 ICT	admin	POST	/about-us	\N	CREATE
44	2022-11-05 10:16:41 ICT	admin	POST	/about-us	\N	CREATE
45	2022-11-05 10:16:55 ICT	admin	POST	/about-us	\N	CREATE
46	2022-11-05 10:19:10 ICT	admin	POST	/about-us	\N	CREATE
47	2022-11-05 12:01:17 ICT	admin	POST	/about-us	\N	CREATE
48	2022-11-05 12:27:41 ICT	admin	POST	/about-us	\N	CREATE
49	2022-11-05 15:01:14 ICT	admin	POST	/about-us	\N	CREATE
50	2022-11-05 15:01:14 ICT	admin	POST	/error	\N	CREATE
51	2022-11-05 15:30:19 ICT	admin	POST	/about-us	\N	CREATE
52	2022-11-05 15:33:06 ICT	admin	POST	/about-us	\N	CREATE
53	2022-11-05 15:36:51 ICT	admin	POST	/about-us	\N	CREATE
58	2022-11-07 08:58:07 ICT	admin	POST	/history/delete	\N	DELETE
59	2022-11-07 10:26:31 ICT	admin	POST	/history/delete	\N	DELETE
60	2022-12-19 11:31:14 ICT	mod	POST	/nav/2	\N	UPDATE
61	2022-12-19 11:31:27 ICT	mod	POST	/nav/2	\N	UPDATE
62	2022-12-19 11:34:36 ICT	mod	POST	/nav/5	\N	UPDATE
63	2022-12-19 11:35:41 ICT	mod	POST	/nav/5	\N	UPDATE
64	2022-12-21 09:43:01 ICT	admin	POST	/about-us	\N	CREATE
65	2022-12-21 09:50:26 ICT	admin	POST	/about-us	\N	CREATE
66	2022-12-21 13:59:29 ICT	admin	POST	/number	\N	CREATE
67	2022-12-21 14:04:43 ICT	admin	POST	/number	\N	CREATE
68	2022-12-22 09:31:10 ICT	admin	POST	/nav/deleteAll	\N	DELETE
69	2022-12-22 10:02:58 ICT	admin	POST	/nav/deleteAll	\N	DELETE
70	2022-12-22 15:15:08 ICT	admin	GET	/nav/delete/17	\N	DELETE
71	2022-12-22 15:16:53 ICT	admin	GET	/nav/delete/16	\N	DELETE
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.image (image_id, file_name, path_file, type, path_url) FROM stdin;
2	1666429418031_eco-INVOICE.png	static\\images\\2022_10	image/png	http://localhost:8080/images/2022_10/1666429418031_eco-INVOICE.png
15	1666671718895_COVID.jpg	static\\images\\2022_10	image/jpeg	http://localhost:8080/images/2022_10/1666671718895_COVID.jpg
4	1666593517249_hinh-anh-ve-tuyen-dung_012647551-250x200.png	static\\images\\2022_10	image/png	http://localhost:8080/images/2022_10/1666593517249_hinh-anh-ve-tuyen-dung_012647551-250x200.png
21	1667290680324_chuyen-doi-so-cho-nganh-dien-luc.jpg	static\\images\\2022_11	image/jpeg	http://localhost:8080/images/2022_11/1667290680324_chuyen-doi-so-cho-nganh-dien-luc.jpg
11	1667447888183_truyenthonghn.jpg	static\\images\\2022_11	image/jpeg	http://localhost:8080/images/2022_11/1667447888183_truyenthonghn.jpg
17	1666671718895_images.png	static\\images\\2022_10	image/png	http://localhost:8080/images/2022_10/1666671718895_images.png
1	1666336641136_ecoECM.png	static\\images\\2022_10	image/png	http://localhost:8080/images/2022_10/1666336641136_ecoECM.png
6	1666665217749_ecoOCR.png	static\\images\\2022_10	image/png	http://localhost:8080/images/2022_10/1666665217749_ecoOCR.png
16	1666671718895_gđ.jpg	static\\images\\2022_10	image/jpeg	http://localhost:8080/images/2022_10/1666671718895_g%C4%91.jpg
22	1667443866671_vpbank.jpg	static\\images\\2022_11	image/jpeg	http://localhost:8080/images/2022_11/1667443866671_vpbank.jpg
20	1666766279740_ac94e72749ffb4a1edee.jpg	static\\images\\2022_10	image/jpeg	http://localhost:8080/images/2022_10/1666766279740_ac94e72749ffb4a1edee.jpg
18	1667447888183_tainguyenmoitrg.jpg	static\\images\\2022_11	image/jpeg	http://localhost:8080/images/2022_11/1667447888183_tainguyenmoitrg.jpg
3	1666593517249_images-225x200.jpg	static\\images\\2022_10	image/jpeg	http://localhost:8080/images/2022_10/1666593517249_images-225x200.jpg
12	1667447888183_thanhtra.jpg	static\\images\\2022_11	image/jpeg	http://localhost:8080/images/2022_11/1667447888183_thanhtra.jpg
24	1667448342561_quanlithitrg.jpg	static\\images\\2022_11	image/jpeg	http://localhost:8080/images/2022_11/1667448342561_quanlithitrg.jpg
14	1666671718895_2222.jpg	static\\images\\2022_10	image/jpeg	http://localhost:8080/images/2022_10/1666671718895_2222.jpg
13	1666670356516_pacground.jpg	static\\images\\2022_10	image/jpeg	http://localhost:8080/images/2022_10/1666670356516_pacground.jpg
25	1667448342561_quochuy.jpg	static\\images\\2022_11	image/jpeg	http://localhost:8080/images/2022_11/1667448342561_quochuy.jpg
5	1666593517249_TKPM.png	static\\images\\2022_10	image/png	http://localhost:8080/images/2022_10/1666593517249_TKPM.png
23	1667446095238_viettel.jpg	static\\images\\2022_11	image/jpeg	http://localhost:8080/images/2022_11/1667446095238_viettel.jpg
9	1666665217749_ecoEMAIL.png	static\\images\\2022_10	image/png	http://localhost:8080/images/2022_10/1666665217749_ecoEMAIL.png
10	1666665217749_ecoOFFICE.png	static\\images\\2022_10	image/png	http://localhost:8080/images/2022_10/1666665217749_ecoOFFICE.png
19	1666681923956_iso-9001.jpg	static\\images\\2022_10	image/jpeg	http://localhost:8080/images/2022_10/1666681923956_iso-9001.jpg
8	1666665217749_ecoGOV.png	static\\images\\2022_10	image/png	http://localhost:8080/images/2022_10/1666665217749_ecoGOV.png
7	1666665217749_ecoPORTAL.png	static\\images\\2022_10	image/png	http://localhost:8080/images/2022_10/1666665217749_ecoPORTAL.png
\.


--
-- Data for Name: navigation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.navigation (nav_id, active, name, parent_id, url) FROM stdin;
12	t	Khách hàng tiêu biểu	6	/khach-hang-tieu-bieu
2	t	KHỐI KHÁCH HÀNG CHÍNH PHỦ	1	/khach-hang-chinh-phu
3	t	KHỐI KHÁCH HÀNG TÀI CHÍNH - NGÂN HÀNG	1	/khach-hang-tai-chinh-ngan-hang
4	t	KHỐI KHÁCH HÀNG DOANH NGHIỆP	1	/khach-hang-doanh-nghiep
5	t	KHỐI KHÁCH HÀNG AN NINH - QUỐC PHÒNG	1	/khach-hang-an-ninh-quoc-phong
10	t	AnhVo	\N	
6	t	Giới thiệu	\N	
7	t	Về chúng tôi	6	/ve-chung-toi
8	t	Tin tức	\N	/tin-tuc
9	t	Hồ sơ năng lực	6	/ho-so-nang-luc
11	f	Ngo Vu Anh Vo	\N	/
18	t	Tuyển dụng	\N	/tuyen-dung
19	t	Blog	\N	/blog
15	f	test1	1	/
14	f	Khach hang test	1	/test
20	t	test2	10	\N
13	f	test	10	/1
17	f	test2	1	/
16	f	test2	1	/
1	t	Sản phẩm	\N	
21	f	vo	6	/vo
\.


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post (post_id, active, content, created_date, description, title, url, image_id) FROM stdin;
1	t		2022-10-25	Ngày 28/04/2021, Ban Lãnh đạo Công ty Cổ phần ECOIT và Công đoàn tổ chức tiệc chúc mừng sinh nhật Công ty tròn 12 tuổi, CBNV quyết tâm hoàn thành…	CHÚC MỪNG SINH NHẬT CÔNG TY CỔ PHẦN ECOIT (29/04/2010 – 29/04/2021)	chuc-mung-sinh-nhat-cong-ty-co-phan-ecoit--29-04-2010-–-29-04-2021-	13
2	t		2022-10-25	Nhận thức rõ vai trò, tầm quan trọng trong việc phát huy trách nhiệm xã hội của doanh nghiệp đối với cộng đồng. Bên cạnh các hoạt động kinh doanh,…	Chúc mừng ngày Quốc tế Thiếu nhi 01/06	chuc-mung-ngay-quoc-te-thieu-nhi-01-06	14
3	t		2022-10-25	“Làn sóng” dịch Covid-19 lan rộng và diễn biến phức tạp làm đảo lộn cuộc sống của toàn nhân loại, tác động sâu sắc đến tình hình kinh tế, chính…	ECOIT chung tay cùng cộng đồng đẩy lùi đại dịch Covid-19	ecoit-chung-tay-cung-cong-dong-day-lui-dai-dich-covid-19	15
4	t		2022-10-25	Kỉ niệm 20 năm ngày “Gia đình Việt Nam 28/6” đại gia đình EcoIT hướng tới chủ đề: “Gia Đình Bình An – Xã Hội Hạnh Phúc”.   Ngày Gia…	CHÚC MỪNG NGÀY GIA ĐÌNH VIỆT NAM	chuc-mung-ngay-gia-dinh-viet-nam	16
5	t	<p>Qua hơn 10 năm h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển ECOIT đang dần chuyển dịch theo hướng ph&aacute;t triển s&acirc;u rộng hơn trong lĩnh vực thế mạnh của m&igrave;nh. ECOIT định hướng ph&aacute;t triển theo xu thế chuy&ecirc;n m&ocirc;n h&oacute;a v&agrave; li&ecirc;n tục mở rộngg cũng như n&acirc;ng tầm ảnh hưởng với thị trường nội địa. Sự h&igrave;nh th&agrave;nh c&ocirc;ng ty cổ phần c&ocirc;ng nghệ số DigiBiz l&agrave; bước đầu ti&ecirc;n trong việc h&igrave;nh th&agrave;nh hệ sinh th&aacute;i trong c&ocirc;ng nghệ th&ocirc;ng tin m&agrave; ECOIT lu&ocirc;n hướng tới.</p>\n\n<blockquote>\n<p><a href="https://prezi.com/view/xVjYaKE6zWSE5n8zB4Bg/"><span style="color:#50b848">Giới thiệu c&ocirc;ng ty Cổ phần c&ocirc;ng nghệ số DIGIBIZ</span></a></p>\n</blockquote>\n\n<p>Ra đời trong bối cảnh nền kinh tế gặp nhiều kh&oacute; khăn do đại dịch COVID, C&ocirc;ng ty cổ phần c&ocirc;ng nghệ số DigiBiz mong muốn biến nguy th&agrave;nh cơ để đ&oacute;n đầu xu hướng ph&aacute;t triển theo hướng c&ocirc;ng nghệ h&oacute;a của doanh nghiệp. C&ocirc;ng ty định hướng trở th&agrave;nh trung t&acirc;m tr&iacute; tuệ v&agrave; c&ocirc;ng nghệ h&agrave;ng đầu gi&uacute;p doanh nghiệp &ldquo;chuyển đổi số&rdquo; th&agrave;nh c&ocirc;ng v&agrave; hiệu quả nhất. Với sứ mệnh &ldquo;Đồng h&agrave;nh v&igrave; một m&ocirc;i trường kinh doanh đột ph&aacute; của doanh nghiệp&rdquo;, Digibiz chuy&ecirc;n cung cấp sản phẩm v&agrave; dịch vụ chuyển đổi số theo hướng &ldquo;C&aacute; nh&acirc;n h&oacute;a&rdquo; cho mỗi doanh nghiệp.</p>\n\n<p>C&ocirc;ng ty cổ phần c&ocirc;ng nghệ số DigiBiz hướng đến đối tượng kh&aacute;ch h&agrave;ng l&agrave; c&aacute;c doanh nghiệp vừa v&agrave; nhỏ, c&aacute;c doanh nghiệp đang cần t&aacute;i cơ cấu với chi ph&iacute; hợp l&yacute;.</p>\n\n<p>Sản phẩm của DigiBiz bao gồm c&aacute;c g&oacute;i dịch vụ được thiết kế dựa tr&ecirc;n ch&iacute;nh nhu cầu của kh&aacute;ch h&agrave;ng: Số h&oacute;a, th&uacute;c đẩy kinh doanh, ứng dụng số, tối ưu quản trị v&agrave; c&aacute;c giải ph&aacute;p th&ocirc;ng minh.</p>\n\n<p>Ch&agrave;o đ&oacute;n th&agrave;nh vi&ecirc;n mới trong hệ sinh th&aacute;i của m&igrave;nh, ECOIT ch&uacute;c mừng v&agrave; mong muốn DigiBiz sẽ đạt được những bước ph&aacute;t triển mạnh mẽ, để lại dấu ấn tr&ecirc;n thị trường, đ&oacute;ng g&oacute;p v&agrave;o sự thịnh vượng chung của c&ocirc;ng ty.</p>\n\n<p><img alt="" src="https://ecoit.asia/wp-content/uploads/2021/07/bf80c72964779329ca66-2-1000x410.jpg" style="width:50%" /><img alt="" src="https://ecoit.asia/wp-content/uploads/2021/07/e930709bd3c5249b7dd4-2-1000x410.jpg" style="width:50%" /></p>\n	2022-10-25	ECOIT vui mừng chào đón thành viên mới gia nhập hệ sinh thái của ECOIT l- công ty Cổ phần công nghệ số DIGIBIZ	Ra mắt thành viên trong “Hệ sinh thái của ECOIT”- Công ty CP công nghệ số DIGIBIZ	ra-mat-thanh-vien-trong-“he-sinh-thai-cua-ecoit”--cong-ty-cp-cong-nghe-so-digibiz	17
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_id, active, content, description, name, url, image_id, banner_id) FROM stdin;
2	t	\N	Phầm mềm hóa đơn điện tử Eco - Invoice	ECO-INVOICE	eco--invoice	2	\N
1	t	<p><strong>Đăng k&yacute; hội thảo v&agrave; tư vấn trực tiếp&nbsp;<a href="https://ecoecm.ecoit.asia/"><span style="color:#50b848">tại đ&acirc;y</span></a></strong></p>\n\n<p><strong>EcoECM &ndash; Hệ thống quản trị t&agrave;i liệu</strong></p>\n\n<p>Phần mềm Quản trị t&agrave;i liệu (ECM) hướng tới những chiến lược, phương thức v&agrave; c&ocirc;ng cụ được sử dụng để thu thập, quản l&yacute;, lưu trữ, bảo to&agrave;n v&agrave; ph&acirc;n phối c&aacute;c nội dung v&agrave; t&agrave;i liệu li&ecirc;n quan đến c&aacute;c quy tr&igrave;nh của một tổ chức. ECM bao tr&ugrave;m việc quản l&yacute; th&ocirc;ng tin tr&ecirc;n to&agrave;n bộ phạm vi một tổ chức d&ugrave; những th&ocirc;ng tin đ&oacute; c&oacute; ở dạng t&agrave;i liệu giấy, file dữ liệu, cơ sở dữ liệu hay thậm ch&iacute; l&agrave; Email.</p>\n\n<p>Tr&ecirc;n cơ sở th&ocirc;ng tư số 41/2009-BTTTT v&agrave; c&ocirc;ng văn số 282/ƯD-BTTTT về danh mục c&aacute;c phần mềm nguồn mở khuyến c&aacute;o sử dụng c&ugrave;ng c&aacute;c quy định về chức năng của một hệ thống quản l&yacute; th&ocirc;ng tin tổng thể ch&uacute;ng t&ocirc;i đ&atilde; nghi&ecirc;n cứu, lựa chọn framework nguồn mở Alfresco phi&ecirc;n bản Community l&agrave;m nền tảng cho việc x&acirc;y dựng v&agrave; ph&aacute;t triển một hệ thống quản trị t&agrave;i liệu tập trung l&agrave;m nền tảng cho c&aacute;c hệ thống th&ocirc;ng tin trong việc lưu trữ, bảo quản, xử l&yacute; v&agrave; ph&acirc;n phối t&agrave;i liệu qua lại giữa c&aacute;c hệ thống th&ocirc;ng tin với nhau.</p>\n\n<p>Xuất ph&aacute;t từ nhu cầu thực tế khi m&agrave; mọi hệ thống th&ocirc;ng tin, mọi hoạt động trong c&aacute;c tổ chức đều được thể hiện th&ocirc;ng qua c&aacute;c t&agrave;i liệu, ch&uacute;ng t&ocirc;i đ&atilde; ph&aacute;t triển c&aacute;c hệ thống phần mềm bổ sung l&ecirc;n framework Alfresco Community nhằm tăng cường t&iacute;nh ổn định, bổ sung th&ecirc;m c&aacute;c cải tiến mới như M&atilde; h&oacute;a t&agrave;i liệu; C&aacute;c bộ thuộc t&iacute;nh quản l&yacute;; Bộ ph&ocirc;ng lưu trữ; C&aacute;c b&aacute;o c&aacute;o thống k&ecirc;, tổng kết, kiểm so&aacute;t t&agrave;i liệu; Bộ ph&acirc;n t&iacute;ch ngữ nghĩa tiếng Việt trong t&igrave;m kiếm; Đối so&aacute;t th&ocirc;ng tin&hellip; đến nay đ&atilde; được nhiều kh&aacute;ch h&agrave;ng lựa chọn trong việc h&igrave;nh th&agrave;nh một kho lưu trữ, lu&acirc;n chuyển t&agrave;i liệu trung t&acirc;m giữa c&aacute;c hệ thống th&ocirc;ng tin với nhau.</p>\n\n<p>Tại EcoIT, EcoECM được định h&igrave;nh như một sản phẩm chiến lược l&agrave;m trung t&acirc;m cho việc ph&aacute;t triển c&aacute;c hệ thống dịch vụ cốt l&otilde;i của C&ocirc;ng ty như&nbsp;<strong><a href="http://my.metadata.vn/">My.metadata.vn</a>&nbsp;</strong>l&agrave; dịch vụ quản trị t&agrave;i liệu online d&agrave;nh cho c&aacute; nh&acirc;n;&nbsp;<strong><a href="http://biz.metadata.vn/">Biz.metadata.vn</a></strong>&nbsp;l&agrave; dịch vụ quản trị t&agrave;i liệu online d&agrave;nh cho c&aacute;c tổ chức, doanh nghiệp.</p>\n\n<p>Song song với hệ sinh th&aacute;i dịch vụ, ch&uacute;ng t&ocirc;i c&ograve;n ph&aacute;t triển c&aacute;c hệ sinh th&aacute;i ứng dụng th&ocirc;ng qua việc ph&aacute;t h&agrave;nh Zimlet kết nối kho t&agrave;i liệu cho hệ thống email nguồn mở Zimbra để lưu trữ v&agrave; lu&acirc;n chuyển t&agrave;i liệu qua lại giữa hai hệ thống; Ph&aacute;t triển Portlet tiếp nhận t&agrave;i liệu cho Liferay Portal (nằm trong bộ EcoPortal portlets) để đưa c&aacute;c kết quả xử l&yacute; từ EcoECM sang cổng th&ocirc;ng tin điện tử; Phổ biến chuẩn kết nối kho t&agrave;i liệu&nbsp;<strong><a href="http://en.wikipedia.org/wiki/Content_Management_Interoperability_Services">CMIS</a></strong>&nbsp;(Content Management Interoperability Services) đến c&aacute;c c&ocirc;ng ty ph&aacute;t triển phần mềm đối t&aacute;c nhằm tạo hệ sinh th&aacute;i cộng t&aacute;c dựa tr&ecirc;n t&agrave;i liệu; C&aacute;c ứng dụng mobile kết nối kho cho hệ điều h&agrave;nh Android, iOS, c&aacute;c ứng dụng đồng bộ kho với thư mục hướng tới t&iacute;nh tiện &iacute;ch tối đa cho người sử dụng.</p>\n\n<p><em><strong>EcoECM bao gồm c&aacute;c th&agrave;nh phần ch&iacute;nh như sau:</strong></em></p>\n\n<p>&ndash; Ph&acirc;n hệ quản l&yacute; kho th&ocirc;ng tin</p>\n\n<p>&ndash; Quản l&yacute; t&agrave;i liệu</p>\n\n<p>&ndash; Quản l&yacute; quy tr&igrave;nh, luồng nghiệp vụ</p>\n\n<p>&ndash; Quản l&yacute; hồ sơ</p>\n\n<p>&ndash; Cộng t&aacute;c theo nh&oacute;m</p>\n\n<p>&ndash; Xuất bản web</p>\n\n<p>&ndash; EcoOCR: Phần mềm scan nhận dạng v&agrave; t&aacute;ch bộ t&agrave;i liệu kết hợp&nbsp;<strong><a href="http://ecoit.asia/?p=193">m&aacute;y qu&eacute;t Kodak</a></strong></p>\n\n<p>Để xem th&ecirc;m chi tiết, c&aacute;c bạn c&oacute; thể xem t&agrave;i liệu giới thiệu&nbsp;<strong><a href="https://ecoecm.ecoit.asia/">tại đ&acirc;y</a></strong>&nbsp;hoặc đăng k&yacute; sử dụng phi&ecirc;n bản miễn ph&iacute; d&agrave;nh cho c&aacute; nh&acirc;n của ch&uacute;ng t&ocirc;i tại&nbsp;<strong><a href="http://my.metadata.vn/">my.metadata.vn</a></strong></p>\n\n<p><strong>Một số kh&aacute;ch h&agrave;ng ti&ecirc;u biểu sử dụng EcoECM:</strong></p>\n\n<p>&ndash;&nbsp;Hệ thống khai th&aacute;c dữ liệu v&agrave; văn bản số h&oacute;a trực tuyến tỉnh Quảng Ninh:&nbsp;<strong>http://sohoavanban.quangninh.gov.vn/page/</strong>&nbsp;&ndash; Sử dụng cho 13 Sở v&agrave; cơ quan chuy&ecirc;n ng&agrave;nh</p>\n\n<p>&ndash; Hệ thống khai th&aacute;c dữ liệu v&agrave; văn bản số h&oacute;a Th&agrave;nh phố Hạ Long: Sử dụng để khai th&aacute;c kho dữ liệu văn bản của UBND Th&agrave;nh phố</p>\n\n<p>&ndash;&nbsp;Hệ thống khai th&aacute;c dữ liệu v&agrave; văn bản số h&oacute;a Bộ T&agrave;i nguy&ecirc;n M&ocirc;i trường: Sử dụng khai th&aacute;c kho dữ liệu văn bản số h&oacute;a giữa c&aacute;c Cục, Vụ, Viện trực thuộc Bộ</p>\n\n<p>&ndash;&nbsp;Hệ thống khai th&aacute;c dữ liệu v&agrave; văn bản số h&oacute;a Thanh tra H&agrave; Tĩnh: Sử dụng khai th&aacute;c kho dữ liệu hồ sơ nội bộ Thanh tra Tỉnh tại địa chỉ:&nbsp;<strong>http://sohoa.thanhtrahatinh.gov.vn/page/</strong></p>\n\n<p>Li&ecirc;n hệ ngay: 0928988889/contact@ecoit.com.vn</p>\n\n<p><a href="https://ecm.ecoit.asia/#/login"><span style="color:#50b848">Bản demo</span></a><span style="color:#50b848">&nbsp;</span></p>\n	Phần mềm quản lý tài liệu	EcoECM	ecoecm	1	\N
3	t	\N	Phần mềm nhận dạng, bóc tách văn bản tiếng Việt	EcoOCR	ecoocr	6	\N
4	t	\N	Hệ thống cổng thông tin điện tử tích hợp	EcoPORTAL	ecoportal	7	\N
5	t	\N	Hệ thống dịch vụ công trực tuyến	EcoGOV	ecogov	8	\N
6	t	\N	Hệ thống thư điện tử dung lượng lớn	EcoMAIL	ecomail	9	\N
7	t	\N	Hệ thống quản lý công văn và điều hành tác nghiệp	EcoOFFICE	ecooffice	10	\N
\.


--
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provinces (provinces_id, code, codename, division_type, name, phone_code) FROM stdin;
1	1	thanh_pho_ha_noi	thành phố trung ương	Hà Nội	24
2	2	tinh_ha_giang	tỉnh	Hà Giang	219
3	3	tinh_cao_bang	tỉnh	Cao Bằng	206
4	4	tinh_bac_kan	tỉnh	Bắc Kạn	209
5	5	tinh_tuyen_quang	tỉnh	Tuyên Quang	207
6	6	tinh_lao_cai	tỉnh	Lào Cai	214
7	7	tinh_dien_bien	tỉnh	Điện Biên	215
8	8	tinh_lai_chau	tỉnh	Lai Châu	213
9	9	tinh_son_la	tỉnh	Sơn La	212
10	10	tinh_yen_bai	tỉnh	Yên Bái	216
11	11	tinh_hoa_binh	tỉnh	Hoà Bình	218
12	12	tinh_thai_nguyen	tỉnh	Thái Nguyên	208
13	13	tinh_lang_son	tỉnh	Lạng Sơn	205
14	14	tinh_quang_ninh	tỉnh	Quảng Ninh	203
15	15	tinh_bac_giang	tỉnh	Bắc Giang	204
16	16	tinh_phu_tho	tỉnh	Phú Thọ	210
17	17	tinh_vinh_phuc	tỉnh	Vĩnh Phúc	211
18	18	tinh_bac_ninh	tỉnh	Bắc Ninh	222
19	19	tinh_hai_duong	tỉnh	Hải Dương	220
20	20	thanh_pho_hai_phong	thành phố trung ương	Hải Phòng	225
21	21	tinh_hung_yen	tỉnh	Hưng Yên	221
22	22	tinh_thai_binh	tỉnh	Thái Bình	227
23	23	tinh_ha_nam	tỉnh	Hà Nam	226
24	24	tinh_nam_dinh	tỉnh	Nam Định	228
25	25	tinh_ninh_binh	tỉnh	Ninh Bình	229
26	26	tinh_thanh_hoa	tỉnh	Thanh Hóa	237
27	27	tinh_nghe_an	tỉnh	Nghệ An	238
28	28	tinh_ha_tinh	tỉnh	Hà Tĩnh	239
29	29	tinh_quang_binh	tỉnh	Quảng Bình	232
30	30	tinh_quang_tri	tỉnh	Quảng Trị	233
31	31	tinh_thua_thien_hue	tỉnh	Thừa Thiên Huế	234
32	32	thanh_pho_da_nang	thành phố trung ương	TP. Đà Nẵng	236
33	33	tinh_quang_nam	tỉnh	Quảng Nam	235
34	51	tinh_quang_ngai	tỉnh	Quảng Ngãi	255
35	52	tinh_binh_dinh	tỉnh	Bình Định	256
36	54	tinh_phu_yen	tỉnh	Phú Yên	257
37	56	tinh_khanh_hoa	tỉnh	Khánh Hòa	258
38	58	tinh_ninh_thuan	tỉnh	Ninh Thuận	259
39	60	tinh_binh_thuan	tỉnh	Bình Thuận	252
40	62	tinh_kon_tum	tỉnh	Kon Tum	260
41	64	tinh_gia_lai	tỉnh	Gia Lai	269
42	66	tinh_dak_lak	tỉnh	Đắk Lắk	262
43	67	tinh_dak_nong	tỉnh	Đắk Nông	261
44	68	tinh_lam_dong	tỉnh	Lâm Đồng	263
45	70	tinh_binh_phuoc	tỉnh	Bình Phước	271
46	72	tinh_tay_ninh	tỉnh	Tây Ninh	276
47	74	tinh_binh_duong	tỉnh	Bình Dương	274
48	75	tinh_dong_nai	tỉnh	Đồng Nai	251
49	77	tinh_ba_ria_vung_tau	tỉnh	Bà Rịa - Vũng Tàu	254
50	79	thanh_pho_ho_chi_minh	thành phố trung ương	Hồ Chí Minh	28
51	80	tinh_long_an	tỉnh	Long An	272
52	82	tinh_tien_giang	tỉnh	Tiền Giang	273
53	83	tinh_ben_tre	tỉnh	Bến Tre	275
54	84	tinh_tra_vinh	tỉnh	Trà Vinh	294
55	86	tinh_vinh_long	tỉnh	Vĩnh Long	270
56	87	tinh_dong_thap	tỉnh	Đồng Tháp	277
57	89	tinh_an_giang	tỉnh	An Giang	296
58	91	tinh_kien_giang	tỉnh	Kiên Giang	297
59	92	thanh_pho_can_tho	thành phố trung ương	Cần Thơ	292
60	93	tinh_hau_giang	tỉnh	Hậu Giang	293
61	94	tinh_soc_trang	tỉnh	Sóc Trăng	299
62	95	tinh_bac_lieu	tỉnh	Bạc Liêu	291
63	96	tinh_ca_mau	tỉnh	Cà Mau	290
\.


--
-- Data for Name: recruit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recruit (recruit_id, active, content, create_date, description, title, url, image_id) FROM stdin;
1	t	<p><strong>1. M&Ocirc; TẢ C&Ocirc;NG VIỆC&nbsp;</strong></p>\n\n<p>&ndash; Tư vấn cho kh&aacute;ch h&agrave;ng về c&aacute;c dự &aacute;n CNTT/ phần mềm mảng Ng&acirc;n h&agrave;ng/Ch&iacute;nh<br />\nPhủ/Doanh nghiệp&hellip;. đảm bảo đạt được c&aacute;c mục ti&ecirc;u về kinh doanh.</p>\n\n<p>&ndash; Tư vấn, t&igrave;m hiểu nhu cầu kh&aacute;ch h&agrave;ng v&agrave; đưa ra c&aacute;c &yacute; tưởng để đạt được mục<br />\nti&ecirc;u</p>\n\n<p>&ndash; Hỗ trợ v&agrave; x&acirc;y dựng c&aacute;c hoạt động marketing v&agrave; thương hiệu cho c&ocirc;ng ty.</p>\n\n<p>&ndash; C&aacute;c c&ocirc;ng việc kh&aacute;c theo y&ecirc;u cầu của trưởng nh&oacute;m kinh doanh.</p>\n\n<p><strong>2.THU NHẬP</strong></p>\n\n<p>&ndash; THU NHẬP từ&nbsp;<strong>8tr &ndash; 12tr</strong>&nbsp;(tuỳ theo năng lực v&agrave; kinh nghiệm<br />\nchuy&ecirc;n m&ocirc;n).</p>\n\n<p>&ndash; Thời gian l&agrave;m việc: Giờ h&agrave;nh ch&iacute;nh từ Thứ 2 đến hết s&aacute;ng Thứ 7.</p>\n\n<p>&ndash; ĐƯỢC tham gia Bảo hiểm x&atilde; hội, bảo hiểm y tế, bảo hiểm thất nghiệp theo quy định.<br />\n<br />\n&ndash; Thưởng th&aacute;ng 13, thưởng c&aacute;c dịp lễ tết, thưởng n&oacute;ng theo kết quả c&ocirc;ng việc.</p>\n\n<p>&ndash; Được l&agrave;m việc trong m&ocirc;i trường c&ocirc;ng bằng, chuy&ecirc;n nghiệp, trẻ trung, năng<br />\nđộng.</p>\n\n<p>&ndash; Được tham gia c&aacute;c hoạt động teambuilding, d&atilde; ngoại 03 th&aacute;ng/lần, chương tr&igrave;nh<br />\ndu lịch h&egrave; 01 năm/lần.</p>\n\n<p>&ndash; Chế độ ph&uacute;c lợi được đảm bảo theo luật Lao động.</p>\n\n<p><strong>3.Y&Ecirc;U CẦU</strong></p>\n\n<p>&ndash; Tốt nghiệp Cao đẳng c&aacute;c ng&agrave;nh Quản trị kinh doanh, Marketing hoặc tương<br />\ntự;</p>\n\n<p>&ndash; C&oacute; kinh nghiệm l&agrave;m Nh&acirc;n vi&ecirc;n kinh doanh hoặc c&aacute;c vị tr&iacute; li&ecirc;n quan;</p>\n\n<p>&ndash; C&oacute; khả năng tự th&uacute;c đẩy, tự vạch định mục ti&ecirc;u cụ thể v&agrave; tập trung thực hiện<br />\nmục ti&ecirc;u;</p>\n\n<p>&ndash; Nhiệt t&igrave;nh, năng động, độc lập, nhạy b&eacute;n;</p>\n\n<p>&ndash; Th&uacute;c đẩy kinh doanh, kỹ năng giao tiếp.</p>\n\n<p><strong>4.TH&Ocirc;NG TIN LI&Ecirc;N HỆ</strong></p>\n\n<ul>\n\t<li>C&ocirc;ng ty cổ phần EcoIT</li>\n\t<li>Website: www.ecoit.asia</li>\n\t<li>Địa chỉ: T&ograve;a A-B Imperia, 203 Nguyễn Huy Tưởng, Thanh Xu&acirc;n, H&agrave; Nội.</li>\n\t<li>Điện thoại:&nbsp;02462814275</li>\n\t<li>Email:&nbsp;<a href="mailto:tuyendung@ecoit.asia"><span style="color:#50b848">tuyendung@ecoit.asia</span></a></li>\n</ul>\n	2022-10-24	1. MÔ TẢ CÔNG VIỆC  – Tư vấn cho khách hàng về các dự án CNTT/ phần mềm mảng Ngân hàng/Chính Phủ/Doanh nghiệp…. đảm bảo đạt được các mục tiêu về kinh doanh. – Tư vấn, tìm hiểu nhu cầu khách hàng và đưa ra các ý tưởng để đạt được mục tiêu – Hỗ […]	ECOIT TUYỂN DỤNG NHÂN VIÊN KINH DOANH	ecoit-tuyen-dung-nhan-vien-kinh-doanh	3
2	t	<p><strong>1.M&Ocirc; TẢ C&Ocirc;NG VIỆC</strong></p>\n\n<p>&ndash; Định hướng chiến lược, x&acirc;y dựng kế hoạch ph&aacute;t triển chung cho to&agrave;n C&ocirc;ng ty.</p>\n\n<p>&ndash; Đề xuất hướng ph&aacute;t triển, mục ti&ecirc;u v&agrave; chiến lược.</p>\n\n<p>&ndash; Điều h&agrave;nh hoạt động C&ocirc;ng ty.</p>\n\n<p>&ndash; X&acirc;y dựng kế hoạch marketing, chiến lược kinh doanh.</p>\n\n<p>&ndash; Quản l&yacute; đội ngũ nh&acirc;n lực C&ocirc;ng ty.</p>\n\n<p>&ndash; S&aacute;t sao thực trạng hoạt động của c&aacute;c ph&ograve;ng ban trong C&ocirc;ng ty</p>\n\n<p><strong>2. QUYỀN LỢI</strong></p>\n\n<p>&ndash; THU NHẬP&nbsp;<strong>25tr &ndash; 40tr</strong>&nbsp;(t&ugrave;y theo năng lực);</p>\n\n<p>&ndash; Tham gia BHXH, BHYT, BHTN theo quy định;</p>\n\n<p>&ndash; C&aacute;c chế độ ph&uacute;c lợi kh&aacute;c theo quy định.</p>\n\n<p><strong>3. Y&Ecirc;U CẦU</strong></p>\n\n<p>&ndash; Nam/nữ;</p>\n\n<p>&ndash; Thời gian l&agrave;m việc giờ h&agrave;nh ch&iacute;nh, từ Thứ 2 đến s&aacute;ng Thứ 7.</p>\n\n<p>&ndash; Tốt nghiệp Đại học trở l&ecirc;n;</p>\n\n<p>&ndash; Phong c&aacute;ch điềm đạm, chững chạc;</p>\n\n<p>&ndash; Giao tiếp tốt, c&oacute; khả năng thuyết tr&igrave;nh;</p>\n\n<p>&ndash; Sử dụng th&agrave;nh thạo c&aacute;c phần mềm vi t&iacute;nh;</p>\n\n<p>&ndash; C&oacute; kỹ năng l&atilde;nh đạo, quản l&yacute; v&agrave; đ&agrave;o tạo nh&acirc;n vi&ecirc;n;</p>\n\n<p><strong>4. TH&Ocirc;NG TIN LI&Ecirc;N HỆ</strong></p>\n\n<ul>\n\t<li>C&ocirc;ng ty cổ phần EcoIT</li>\n\t<li>Website: www.ecoit.asia</li>\n\t<li>Địa chỉ: T&ograve;a A-B Imperia, 203 Nguyễn Huy Tưởng, Thanh Xu&acirc;n, H&agrave; Nội.</li>\n\t<li>Điện thoại:&nbsp;02462814275</li>\n\t<li>Email:&nbsp;<a href="mailto:tuyendung@ecoit.asia"><span style="color:#50b848">tuyendung@ecoit.asia</span></a></li>\n</ul>\n	2022-10-24	 1.MÔ TẢ CÔNG VIỆC – Định hướng chiến lược, xây dựng kế hoạch phát triển chung cho toàn Công ty. – Đề xuất hướng phát triển, mục tiêu và chiến lược. – Điều hành hoạt động Công ty. – Xây dựng kế hoạch marketing, chiến lược kinh doanh. – Quản lý đội ngũ nhân lực […]	ECOIT TUYỂN DỤNG VỊ TRÍ GIÁM ĐỐC ĐIỀU HÀNH – URGENT	ecoit-tuyen-dung-vi-tri-giam-doc-dieu-hanh-–-urgent	4
3	t	<p>Số lượng: 01 người;</p>\n\n<p>Mức lương: 15-20 triệu</p>\n\n<p><strong>Nội dung c&ocirc;ng việc:</strong></p>\n\n<ul>\n\t<li>Triển khai c&aacute;c phần mềm, giải ph&aacute;p phần mềm cho kh&aacute;ch h&agrave;ng;</li>\n\t<li>Thiết lập hướng dẫn sử dụng v&agrave; t&agrave;i liệu triển khai cho kh&aacute;ch h&agrave;ng;</li>\n\t<li>Thực hiện quản trị dự &aacute;n.</li>\n\t<li>Mục ti&ecirc;u: Ho&agrave;n th&agrave;nh triển khai dự &aacute;n để đi đến nghiệm thu.</li>\n</ul>\n\n<p><strong>Y&ecirc;u cầu:</strong></p>\n\n<ul>\n\t<li>Tốt nghiệp Cao Đẳng, Đại học chuy&ecirc;n ng&agrave;nh CNTT;</li>\n\t<li>C&oacute; kinh nghiệm triển khai c&aacute;c ứng dụng v&agrave; giải ph&aacute;p phần mềm;</li>\n\t<li>Đ&atilde; l&agrave;m quen với Cloud, PHP, API, JSON&hellip;;</li>\n\t<li>C&oacute; khả năng t&igrave;m hiểu nhanh về sản phẩm phần mềm v&agrave; truyền đạt lại cho kh&aacute;ch h&agrave;ng;</li>\n\t<li>Kỹ năng giao tiếp tốt.</li>\n</ul>\n\n<p><strong>Quyền lợi:</strong></p>\n\n<ul>\n\t<li>Thu nhập bao gồm lương cứng + KPI (t&ugrave;y theo năng lực v&agrave; kết quả đạt được);</li>\n\t<li>Thời gian l&agrave;m việc: Giờ h&agrave;nh ch&iacute;nh từ Thứ 2 đến hết s&aacute;ng Thứ 7 (c&aacute;ch tuần);</li>\n\t<li>Tham gia Bảo hiểm x&atilde; hội, bảo hiểm y tế, bảo hiểm thất nghiệp theo quy định;</li>\n\t<li>Thưởng th&aacute;ng 13, thưởng c&aacute;c dịp lễ tết, thưởng n&oacute;ng theo kết quả c&ocirc;ng việc;</li>\n\t<li>Được l&agrave;m việc trong m&ocirc;i trường c&ocirc;ng bằng, chuy&ecirc;n nghiệp, trẻ trung năng động, c&oacute; nhiều cơ hội thăng tiến;</li>\n\t<li>Được tham gia c&aacute;c hoạt động teambuilding, d&atilde; ngoại 03 th&aacute;ng/lần, chương tr&igrave;nh du lịch h&egrave; 01 năm/lần; Chế độ ph&uacute;c lợi kh&aacute;c được đảm bảo theo luật Lao động.</li>\n</ul>\n\n<p><img alt="" src="https://ecoit.asia/wp-content/uploads/2021/07/web-1-1000x410.png" style="width:100%" /></p>\n	2022-10-24	ECOIT tìm kiếm 01 ứng viên vị trí nhân viên triển khai phần mềm với mức đãi ngộ hấp dẫn.	TUYỂN DỤNG NHÂN VIÊN TRIỂN KHAI PHẦN MỀM	tuyen-dung-nhan-vien-trien-khai-phan-mem	5
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (role_id, name) FROM stdin;
1	ROLE_ADMIN
2	ROLE_MODERATOR
3	ROLE_USER
\.


--
-- Data for Name: sliders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sliders (slider_id, active, name, path_file, path_url, type, url) FROM stdin;
2	t	1666335873261_trangchuOCR-min.png	static\\images\\2022_10	http://localhost:8080/images/2022_10/1666335873261_trangchuOCR-min.png	image/png	/lien-he
1	t	1666335873261_trangchuECMp2-min.png	static\\images\\2022_10	http://localhost:8080/images/2022_10/1666335873261_trangchuECMp2-min.png	image/png	/lien-he
\.


--
-- Data for Name: typical_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.typical_customer (id, active, name, url, image_id) FROM stdin;
1	t	VPBank	vpbank	22
2	t	Viettel	viettel	23
3	t	Bộ thông tin và truyền thông Hà Nội	bo-thong-tin-va-truyen-thong-ha-noi	11
4	t	Thanh tra Việt Nam	thanh-tra-viet-nam	12
5	t	Tài nguyên và môi trường	tai-nguyen-va-moi-truong	18
6	t	Quản lý thị trường	quan-ly-thi-truong	24
7	t	Chính phủ	chinh-phu	25
\.


--
-- Data for Name: typical_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.typical_image (id, active, caption, description, image_id) FROM stdin;
2	t	\N	\N	15
4	f	\N	\N	14
1	f	\N	\N	1
5	f	\N	\N	21
3	t	Cúp	\N	20
\.


--
-- Data for Name: typical_number; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.typical_number (id, active, description, icon, num) FROM stdin;
2	t	Năm kinh nghiệm	fas fa-laptop	10
1	t	Người dùng	fa fa-users	100000
3	t	Dự án đã hoàn thành	fas fa-book	150
4	t	Cán bộ nhân viên	fa fa-user	50
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (user_id, role_id) FROM stdin;
1	1
2	2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, first_name, last_name, password, username, status) FROM stdin;
2	mod.test@pdm.com	\N	\N	$2a$10$Sr0w3wwKMTRASVsfagzfZeE.omOT3qrtm7vVX3auOzSZlcYIT5.fO	mod	1
1	admin@test.com	\N	\N	$2a$10$o/xz66ZxeAW7iS9q.Fv17uoCxbRGOQ.EzY3mQiBgAPTOis4ih8Z3e	admin	1
\.


--
-- Data for Name: wards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wards (wards_id, code, codename, district_code, division_type, name) FROM stdin;
1	1	phuong_phuc_xa	1	phường	Phúc Xá
2	4	phuong_truc_bach	1	phường	Trúc Bạch
3	6	phuong_vinh_phuc	1	phường	Vĩnh Phúc
4	7	phuong_cong_vi	1	phường	Cống Vị
5	8	phuong_lieu_giai	1	phường	Liễu Giai
6	10	phuong_nguyen_trung_truc	1	phường	Nguyễn Trung Trực
7	13	phuong_quan_thanh	1	phường	Quán Thánh
8	16	phuong_ngoc_ha	1	phường	Ngọc Hà
9	19	phuong_dien_bien	1	phường	Điện Biên
10	22	phuong_doi_can	1	phường	Đội Cấn
11	25	phuong_ngoc_khanh	1	phường	Ngọc Khánh
12	28	phuong_kim_ma	1	phường	Kim Mã
13	31	phuong_giang_vo	1	phường	Giảng Võ
14	34	phuong_thanh_cong	1	phường	Thành Công
15	37	phuong_phuc_tan	2	phường	Phúc Tân
16	40	phuong_dong_xuan	2	phường	Đồng Xuân
17	43	phuong_hang_ma	2	phường	Hàng Mã
18	46	phuong_hang_buom	2	phường	Hàng Buồm
19	49	phuong_hang_dao	2	phường	Hàng Đào
20	52	phuong_hang_bo	2	phường	Hàng Bồ
21	55	phuong_cua_dong	2	phường	Cửa Đông
22	58	phuong_ly_thai_to	2	phường	Lý Thái Tổ
23	61	phuong_hang_bac	2	phường	Hàng Bạc
24	64	phuong_hang_gai	2	phường	Hàng Gai
25	67	phuong_chuong_duong	2	phường	Chương Dương
26	70	phuong_hang_trong	2	phường	Hàng Trống
27	73	phuong_cua_nam	2	phường	Cửa Nam
28	76	phuong_hang_bong	2	phường	Hàng Bông
29	79	phuong_trang_tien	2	phường	Tràng Tiền
30	82	phuong_tran_hung_dao	2	phường	Trần Hưng Đạo
31	85	phuong_phan_chu_trinh	2	phường	Phan Chu Trinh
32	88	phuong_hang_bai	2	phường	Hàng Bài
33	91	phuong_phu_thuong	3	phường	Phú Thượng
34	94	phuong_nhat_tan	3	phường	Nhật Tân
35	97	phuong_tu_lien	3	phường	Tứ Liên
36	100	phuong_quang_an	3	phường	Quảng An
37	103	phuong_xuan_la	3	phường	Xuân La
38	106	phuong_yen_phu	3	phường	Yên Phụ
39	109	phuong_buoi	3	phường	Phường Bưởi
40	112	phuong_thuy_khue	3	phường	Thụy Khuê
41	115	phuong_thuong_thanh	4	phường	Thượng Thanh
42	118	phuong_ngoc_thuy	4	phường	Ngọc Thụy
43	121	phuong_giang_bien	4	phường	Giang Biên
44	124	phuong_duc_giang	4	phường	Đức Giang
45	127	phuong_viet_hung	4	phường	Việt Hưng
46	130	phuong_gia_thuy	4	phường	Gia Thụy
47	133	phuong_ngoc_lam	4	phường	Ngọc Lâm
48	136	phuong_phuc_loi	4	phường	Phúc Lợi
49	139	phuong_bo_de	4	phường	Bồ Đề
50	142	phuong_sai_dong	4	phường	Sài Đồng
51	145	phuong_long_bien	4	phường	Long Biên
52	148	phuong_thach_ban	4	phường	Thạch Bàn
53	151	phuong_phuc_dong	4	phường	Phúc Đồng
54	154	phuong_cu_khoi	4	phường	Cự Khối
55	157	phuong_nghia_do	5	phường	Nghĩa Đô
56	160	phuong_nghia_tan	5	phường	Nghĩa Tân
57	163	phuong_mai_dich	5	phường	Mai Dịch
58	166	phuong_dich_vong	5	phường	Dịch Vọng
59	167	phuong_dich_vong_hau	5	phường	Dịch Vọng Hậu
60	169	phuong_quan_hoa	5	phường	Quan Hoa
61	172	phuong_yen_hoa	5	phường	Yên Hoà
62	175	phuong_trung_hoa	5	phường	Trung Hoà
63	178	phuong_cat_linh	6	phường	Cát Linh
64	181	phuong_van_mieu	6	phường	Văn Miếu
65	184	phuong_quoc_tu_giam	6	phường	Quốc Tử Giám
66	187	phuong_lang_thuong	6	phường	Láng Thượng
67	190	phuong_o_cho_dua	6	phường	Ô Chợ Dừa
68	193	phuong_van_chuong	6	phường	Văn Chương
69	196	phuong_hang_bot	6	phường	Hàng Bột
70	199	phuong_lang_ha	6	phường	Láng Hạ
71	202	phuong_kham_thien	6	phường	Khâm Thiên
72	205	phuong_tho_quan	6	phường	Thổ Quan
73	208	phuong_nam_dong	6	phường	Nam Đồng
74	211	phuong_trung_phung	6	phường	Trung Phụng
75	214	phuong_quang_trung	6	phường	Quang Trung
76	217	phuong_trung_liet	6	phường	Trung Liệt
77	220	phuong_phuong_lien	6	phường	Phương Liên
78	223	phuong_thinh_quang	6	phường	Thịnh Quang
79	226	phuong_trung_tu	6	phường	Trung Tự
80	229	phuong_kim_lien	6	phường	Kim Liên
81	232	phuong_phuong_mai	6	phường	Phương Mai
82	235	phuong_nga_tu_so	6	phường	Ngã Tư Sở
83	238	phuong_khuong_thuong	6	phường	Khương Thượng
84	241	phuong_nguyen_du	7	phường	Nguyễn Du
85	244	phuong_bach_dang	7	phường	Bạch Đằng
86	247	phuong_pham_dinh_ho	7	phường	Phạm Đình Hổ
87	256	phuong_le_dai_hanh	7	phường	Lê Đại Hành
88	259	phuong_dong_nhan	7	phường	Đồng Nhân
89	262	phuong_pho_hue	7	phường	Phố Huế
90	265	phuong_dong_mac	7	phường	Đống Mác
91	268	phuong_thanh_luong	7	phường	Thanh Lương
92	271	phuong_thanh_nhan	7	phường	Thanh Nhàn
93	274	phuong_cau_den	7	phường	Cầu Dền
94	277	phuong_bach_khoa	7	phường	Bách Khoa
95	280	phuong_dong_tam	7	phường	Đồng Tâm
96	283	phuong_vinh_tuy	7	phường	Vĩnh Tuy
97	286	phuong_bach_mai	7	phường	Bạch Mai
98	289	phuong_quynh_mai	7	phường	Quỳnh Mai
99	292	phuong_quynh_loi	7	phường	Quỳnh Lôi
100	295	phuong_minh_khai	7	phường	Minh Khai
101	298	phuong_truong_dinh	7	phường	Trương Định
102	301	phuong_thanh_tri	8	phường	Thanh Trì
103	304	phuong_vinh_hung	8	phường	Vĩnh Hưng
104	307	phuong_dinh_cong	8	phường	Định Công
105	310	phuong_mai_dong	8	phường	Mai Động
106	313	phuong_tuong_mai	8	phường	Tương Mai
107	316	phuong_dai_kim	8	phường	Đại Kim
108	319	phuong_tan_mai	8	phường	Tân Mai
109	322	phuong_hoang_van_thu	8	phường	Hoàng Văn Thụ
110	325	phuong_giap_bat	8	phường	Giáp Bát
111	328	phuong_linh_nam	8	phường	Lĩnh Nam
112	331	phuong_thinh_liet	8	phường	Thịnh Liệt
113	334	phuong_tran_phu	8	phường	Trần Phú
114	337	phuong_hoang_liet	8	phường	Hoàng Liệt
115	340	phuong_yen_so	8	phường	Yên Sở
116	343	phuong_nhan_chinh	9	phường	Nhân Chính
117	346	phuong_thuong_dinh	9	phường	Thượng Đình
118	349	phuong_khuong_trung	9	phường	Khương Trung
119	352	phuong_khuong_mai	9	phường	Khương Mai
120	355	phuong_thanh_xuan_trung	9	phường	Thanh Xuân Trung
121	358	phuong_phuong_liet	9	phường	Phương Liệt
122	361	phuong_ha_dinh	9	phường	Hạ Đình
123	364	phuong_khuong_dinh	9	phường	Khương Đình
124	367	phuong_thanh_xuan_bac	9	phường	Thanh Xuân Bắc
125	370	phuong_thanh_xuan_nam	9	phường	Thanh Xuân Nam
126	373	phuong_kim_giang	9	phường	Kim Giang
127	376	thi_tran_soc_son	16	thị trấn	Sóc Sơn
128	379	xa_bac_son	16	xã	Bắc Sơn
129	382	xa_minh_tri	16	xã	Minh Trí
130	385	xa_hong_ky	16	xã	Hồng Kỳ
131	388	xa_nam_son	16	xã	Nam Sơn
132	391	xa_trung_gia	16	xã	Trung Giã
133	394	xa_tan_hung	16	xã	Tân Hưng
134	397	xa_minh_phu	16	xã	Minh Phú
135	400	xa_phu_linh	16	xã	Phù Linh
136	403	xa_bac_phu	16	xã	Bắc Phú
137	406	xa_tan_minh	16	xã	Tân Minh
138	409	xa_quang_tien	16	xã	Quang Tiến
139	412	xa_hien_ninh	16	xã	Hiền Ninh
140	415	xa_tan_dan	16	xã	Tân Dân
141	418	xa_tien_duoc	16	xã	Tiên Dược
142	421	xa_viet_long	16	xã	Việt Long
143	424	xa_xuan_giang	16	xã	Xuân Giang
144	427	xa_mai_dinh	16	xã	Mai Đình
145	430	xa_duc_hoa	16	xã	Đức Hoà
146	433	xa_thanh_xuan	16	xã	Thanh Xuân
147	436	xa_dong_xuan	16	xã	Đông Xuân
148	439	xa_kim_lu	16	xã	Kim Lũ
149	442	xa_phu_cuong	16	xã	Phú Cường
150	445	xa_phu_minh	16	xã	Phú Minh
151	448	xa_phu_lo	16	xã	Phù Lỗ
152	451	xa_xuan_thu	16	xã	Xuân Thu
153	454	thi_tran_dong_anh	17	thị trấn	Đông Anh
154	457	xa_xuan_non	17	xã	Xuân Nộn
155	460	xa_thuy_lam	17	xã	Thuỵ Lâm
156	463	xa_bac_hong	17	xã	Bắc Hồng
157	466	xa_nguyen_khe	17	xã	Nguyên Khê
158	469	xa_nam_hong	17	xã	Nam Hồng
159	472	xa_tien_duong	17	xã	Tiên Dương
160	475	xa_van_ha	17	xã	Vân Hà
161	478	xa_uy_no	17	xã	Uy Nỗ
162	481	xa_van_noi	17	xã	Vân Nội
163	484	xa_lien_ha	17	xã	Liên Hà
164	487	xa_viet_hung	17	xã	Việt Hùng
165	490	xa_kim_no	17	xã	Kim Nỗ
166	493	xa_kim_chung	17	xã	Kim Chung
167	496	xa_duc_tu	17	xã	Dục Tú
168	499	xa_dai_mach	17	xã	Đại Mạch
169	502	xa_vinh_ngoc	17	xã	Vĩnh Ngọc
170	505	xa_co_loa	17	xã	Cổ Loa
171	508	xa_hai_boi	17	xã	Hải Bối
172	511	xa_xuan_canh	17	xã	Xuân Canh
173	514	xa_vong_la	17	xã	Võng La
174	517	xa_tam_xa	17	xã	Tàm Xá
175	520	xa_mai_lam	17	xã	Mai Lâm
176	523	xa_dong_hoi	17	xã	Đông Hội
177	526	thi_tran_yen_vien	18	thị trấn	Yên Viên
178	529	xa_yen_thuong	18	xã	Yên Thường
179	532	xa_yen_vien	18	xã	Yên Viên
180	535	xa_ninh_hiep	18	xã	Ninh Hiệp
181	538	xa_dinh_xuyen	18	xã	Đình Xuyên
182	541	xa_duong_ha	18	xã	Dương Hà
183	544	xa_phu_dong	18	xã	Phù Đổng
184	547	xa_trung_mau	18	xã	Trung Mầu
185	550	xa_le_chi	18	xã	Lệ Chi
186	553	xa_co_bi	18	xã	Cổ Bi
187	556	xa_dang_xa	18	xã	Đặng Xá
188	559	xa_phu_thi	18	xã	Phú Thị
189	562	xa_kim_son	18	xã	Kim Sơn
190	565	thi_tran_trau_quy	18	thị trấn	Trâu Quỳ
191	568	xa_duong_quang	18	xã	Dương Quang
192	571	xa_duong_xa	18	xã	Dương Xá
193	574	xa_dong_du	18	xã	Đông Dư
194	577	xa_da_ton	18	xã	Đa Tốn
195	580	xa_kieu_ky	18	xã	Kiêu Kỵ
196	583	xa_bat_trang	18	xã	Bát Tràng
197	586	xa_kim_lan	18	xã	Kim Lan
198	589	xa_van_duc	18	xã	Văn Đức
199	592	phuong_cau_dien	19	phường	Cầu Diễn
200	622	phuong_xuan_phuong	19	phường	Xuân Phương
201	623	phuong_phuong_canh	19	phường	Phương Canh
202	625	phuong_my_dinh_1	19	phường	Mỹ Đình 1
203	626	phuong_my_dinh_2	19	phường	Mỹ Đình 2
204	628	phuong_tay_mo	19	phường	Tây Mỗ
205	631	phuong_me_tri	19	phường	Mễ Trì
206	632	phuong_phu_do	19	phường	Phú Đô
207	634	phuong_dai_mo	19	phường	Đại Mỗ
208	637	phuong_trung_van	19	phường	Trung Văn
209	640	thi_tran_van_dien	20	thị trấn	Văn Điển
210	643	xa_tan_trieu	20	xã	Tân Triều
211	646	xa_thanh_liet	20	xã	Thanh Liệt
212	649	xa_ta_thanh_oai	20	xã	Tả Thanh Oai
213	652	xa_huu_hoa	20	xã	Hữu Hoà
214	655	xa_tam_hiep	20	xã	Tam Hiệp
215	658	xa_tu_hiep	20	xã	Tứ Hiệp
216	661	xa_yen_my	20	xã	Yên Mỹ
217	664	xa_vinh_quynh	20	xã	Vĩnh Quỳnh
218	667	xa_ngu_hiep	20	xã	Ngũ Hiệp
219	670	xa_duyen_ha	20	xã	Duyên Hà
220	673	xa_ngoc_hoi	20	xã	Ngọc Hồi
221	676	xa_van_phuc	20	xã	Vạn Phúc
222	679	xa_dai_ang	20	xã	Xã Đại áng
223	682	xa_lien_ninh	20	xã	Liên Ninh
224	685	xa_dong_my	20	xã	Đông Mỹ
225	595	phuong_thuong_cat	21	phường	Thượng Cát
226	598	phuong_lien_mac	21	phường	Liên Mạc
227	601	phuong_dong_ngac	21	phường	Đông Ngạc
228	602	phuong_duc_thang	21	phường	Đức Thắng
229	604	phuong_thuy_phuong	21	phường	Thụy Phương
230	607	phuong_tay_tuu	21	phường	Tây Tựu
231	610	phuong_xuan_dinh	21	phường	Xuân Đỉnh
232	611	phuong_xuan_tao	21	phường	Xuân Tảo
233	613	phuong_minh_khai	21	phường	Minh Khai
234	616	phuong_co_nhue_1	21	phường	Cổ Nhuế 1
235	617	phuong_co_nhue_2	21	phường	Cổ Nhuế 2
236	619	phuong_phu_dien	21	phường	Phú Diễn
237	620	phuong_phuc_dien	21	phường	Phúc Diễn
238	8973	thi_tran_chi_dong	250	thị trấn	Chi Đông
239	8974	xa_dai_thinh	250	xã	Đại Thịnh
240	8977	xa_kim_hoa	250	xã	Kim Hoa
241	8980	xa_thach_da	250	xã	Thạch Đà
242	8983	xa_tien_thang	250	xã	Tiến Thắng
243	8986	xa_tu_lap	250	xã	Tự Lập
244	8989	thi_tran_quang_minh	250	thị trấn	Quang Minh
245	8992	xa_thanh_lam	250	xã	Thanh Lâm
246	8995	xa_tam_dong	250	xã	Tam Đồng
247	8998	xa_lien_mac	250	xã	Liên Mạc
248	9001	xa_van_yen	250	xã	Vạn Yên
249	9004	xa_chu_phan	250	xã	Chu Phan
250	9007	xa_tien_thinh	250	xã	Tiến Thịnh
251	9010	xa_me_linh	250	xã	Mê Linh
252	9013	xa_van_khe	250	xã	Văn Khê
253	9016	xa_hoang_kim	250	xã	Hoàng Kim
254	9019	xa_tien_phong	250	xã	Tiền Phong
255	9022	xa_trang_viet	250	xã	Tráng Việt
256	9538	phuong_nguyen_trai	268	phường	Nguyễn Trãi
257	9541	phuong_mo_lao	268	phường	Mộ Lao
258	9542	phuong_van_quan	268	phường	Văn Quán
259	9544	phuong_van_phuc	268	phường	Vạn Phúc
260	9547	phuong_yet_kieu	268	phường	Yết Kiêu
261	9550	phuong_quang_trung	268	phường	Quang Trung
262	9551	phuong_la_khe	268	phường	La Khê
263	9552	phuong_phu_la	268	phường	Phú La
264	9553	phuong_phuc_la	268	phường	Phúc La
265	9556	phuong_ha_cau	268	phường	Hà Cầu
266	9562	phuong_yen_nghia	268	phường	Yên Nghĩa
267	9565	phuong_kien_hung	268	phường	Kiến Hưng
268	9568	phuong_phu_lam	268	phường	Phú Lãm
269	9571	phuong_phu_luong	268	phường	Phú Lương
270	9886	phuong_duong_noi	268	phường	Dương Nội
271	10117	phuong_dong_mai	268	phường	Đồng Mai
272	10123	phuong_bien_giang	268	phường	Biên Giang
273	9574	phuong_le_loi	269	phường	Lê Lợi
274	9577	phuong_phu_thinh	269	phường	Phú Thịnh
275	9580	phuong_ngo_quyen	269	phường	Ngô Quyền
276	9583	phuong_quang_trung	269	phường	Quang Trung
277	9586	phuong_son_loc	269	phường	Sơn Lộc
278	9589	phuong_xuan_khanh	269	phường	Xuân Khanh
279	9592	xa_duong_lam	269	xã	Đường Lâm
280	9595	phuong_vien_son	269	phường	Viên Sơn
281	9598	xa_xuan_son	269	xã	Xuân Sơn
282	9601	phuong_trung_hung	269	phường	Trung Hưng
283	9604	xa_thanh_my	269	xã	Thanh Mỹ
284	9607	phuong_trung_son_tram	269	phường	Sơn Trầm
285	9610	xa_kim_son	269	xã	Kim Sơn
286	9613	xa_son_dong	269	xã	Sơn Đông
287	9616	xa_co_dong	269	xã	Cổ Đông
288	9619	thi_tran_tay_dang	271	thị trấn	Tây Đằng
289	9625	xa_phu_cuong	271	xã	Phú Cường
290	9628	xa_co_do	271	xã	Cổ Đô
291	9631	xa_tan_hong	271	xã	Tản Hồng
292	9634	xa_van_thang	271	xã	Vạn Thắng
293	9637	xa_chau_son	271	xã	Châu Sơn
294	9640	xa_phong_van	271	xã	Phong Vân
295	9643	xa_phu_dong	271	xã	Phú Đông
296	9646	xa_phu_phuong	271	xã	Phú Phương
297	9649	xa_phu_chau	271	xã	Phú Châu
298	9652	xa_thai_hoa	271	xã	Thái Hòa
299	9655	xa_dong_thai	271	xã	Đồng Thái
300	9658	xa_phu_son	271	xã	Phú Sơn
301	9661	xa_minh_chau	271	xã	Minh Châu
302	9664	xa_vat_lai	271	xã	Vật Lại
303	9667	xa_chu_minh	271	xã	Chu Minh
304	9670	xa_tong_bat	271	xã	Tòng Bạt
305	9673	xa_cam_linh	271	xã	Cẩm Lĩnh
306	9676	xa_son_da	271	xã	Sơn Đà
307	9679	xa_dong_quang	271	xã	Đông Quang
308	9682	xa_tien_phong	271	xã	Tiên Phong
309	9685	xa_thuy_an	271	xã	Thụy An
310	9688	xa_cam_thuong	271	xã	Cam Thượng
311	9691	xa_thuan_my	271	xã	Thuần Mỹ
312	9694	xa_tan_linh	271	xã	Tản Lĩnh
313	9697	xa_ba_trai	271	xã	Ba Trại
314	9700	xa_minh_quang	271	xã	Minh Quang
315	9703	xa_ba_vi	271	xã	Ba Vì
316	9706	xa_van_hoa	271	xã	Vân Hòa
317	9709	xa_yen_bai	271	xã	Yên Bài
318	9712	xa_khanh_thuong	271	xã	Khánh Thượng
319	9715	thi_tran_phuc_tho	272	thị trấn	Phúc Thọ
320	9718	xa_van_ha	272	xã	Vân Hà
321	9721	xa_van_phuc	272	xã	Vân Phúc
322	9724	xa_van_nam	272	xã	Vân Nam
323	9727	xa_xuan_dinh	272	xã	Xuân Đình
324	9733	xa_sen_phuong	272	xã	Sen Phương
325	9739	xa_vong_xuyen	272	xã	Võng Xuyên
326	9742	xa_tho_loc	272	xã	Thọ Lộc
327	9745	xa_long_xuyen	272	xã	Long Xuyên
328	9748	xa_thuong_coc	272	xã	Thượng Cốc
329	9751	xa_hat_mon	272	xã	Hát Môn
330	9754	xa_tich_giang	272	xã	Tích Giang
331	9757	xa_thanh_da	272	xã	Thanh Đa
332	9760	xa_trach_my_loc	272	xã	Mỹ Lộc
333	9763	xa_phuc_hoa	272	xã	Phúc Hòa
334	9766	xa_ngoc_tao	272	xã	Ngọc Tảo
335	9769	xa_phung_thuong	272	xã	Phụng Thượng
336	9772	xa_tam_thuan	272	xã	Tam Thuấn
337	9775	xa_tam_hiep	272	xã	Tam Hiệp
338	9778	xa_hiep_thuan	272	xã	Hiệp Thuận
339	9781	xa_lien_hiep	272	xã	Liên Hiệp
340	9784	thi_tran_phung	273	thị trấn	Thị trấn Phùng
341	9787	xa_trung_chau	273	xã	Trung Châu
342	9790	xa_tho_an	273	xã	Thọ An
343	9793	xa_tho_xuan	273	xã	Thọ Xuân
344	9796	xa_hong_ha	273	xã	Hồng Hà
345	9799	xa_lien_hong	273	xã	Liên Hồng
346	9802	xa_lien_ha	273	xã	Liên Hà
347	9805	xa_ha_mo	273	xã	Hạ Mỗ
348	9808	xa_lien_trung	273	xã	Liên Trung
349	9811	xa_phuong_dinh	273	xã	Phương Đình
350	9814	xa_thuong_mo	273	xã	Thượng Mỗ
351	9817	xa_tan_hoi	273	xã	Tân Hội
352	9820	xa_tan_lap	273	xã	Tân Lập
353	9823	xa_dan_phuong	273	xã	Đan Phượng
354	9826	xa_dong_thap	273	xã	Đồng Tháp
355	9829	xa_song_phuong	273	xã	Song Phượng
356	9832	thi_tran_tram_troi	274	thị trấn	Trạm Trôi
357	9835	xa_duc_thuong	274	xã	Đức Thượng
358	9838	xa_minh_khai	274	xã	Minh Khai
359	9841	xa_duong_lieu	274	xã	Dương Liễu
360	9844	xa_di_trach	274	xã	Di Trạch
361	9847	xa_duc_giang	274	xã	Đức Giang
362	9850	xa_cat_que	274	xã	Cát Quế
363	9853	xa_kim_chung	274	xã	Kim Chung
364	9856	xa_yen_so	274	xã	Yên Sở
365	9859	xa_son_dong	274	xã	Sơn Đồng
366	9862	xa_van_canh	274	xã	Vân Canh
367	9865	xa_dac_so	274	xã	Đắc Sở
368	9868	xa_lai_yen	274	xã	Lại Yên
369	9871	xa_tien_yen	274	xã	Tiền Yên
370	9874	xa_song_phuong	274	xã	Song Phương
371	9877	xa_an_khanh	274	xã	An Khánh
372	9880	xa_an_thuong	274	xã	An Thượng
373	9883	xa_van_con	274	xã	Vân Côn
374	9889	xa_la_phu	274	xã	La Phù
375	9892	xa_dong_la	274	xã	Đông La
376	4939	xa_dong_xuan	275	xã	Đông Xuân
377	9895	thi_tran_quoc_oai	275	thị trấn	Quốc Oai
378	9898	xa_sai_son	275	xã	Sài Sơn
379	9901	xa_phuong_cach	275	xã	Phượng Cách
380	9904	xa_yen_son	275	xã	Yên Sơn
381	9907	xa_ngoc_liep	275	xã	Ngọc Liệp
382	9910	xa_ngoc_my	275	xã	Ngọc Mỹ
383	9913	xa_liep_tuyet	275	xã	Liệp Tuyết
384	9916	xa_thach_than	275	xã	Thạch Thán
385	9919	xa_dong_quang	275	xã	Đồng Quang
386	9922	xa_phu_cat	275	xã	Phú Cát
387	9925	xa_tuyet_nghia	275	xã	Tuyết Nghĩa
388	9928	xa_nghia_huong	275	xã	Nghĩa Hương
389	9931	xa_cong_hoa	275	xã	Cộng Hòa
390	9934	xa_tan_phu	275	xã	Tân Phú
391	9937	xa_dai_thanh	275	xã	Đại Thành
392	9940	xa_phu_man	275	xã	Phú Mãn
393	9943	xa_can_huu	275	xã	Cấn Hữu
394	9946	xa_tan_hoa	275	xã	Tân Hòa
395	9949	xa_hoa_thach	275	xã	Hòa Thạch
396	9952	xa_dong_yen	275	xã	Đông Yên
397	4927	xa_yen_trung	276	xã	Yên Trung
398	4930	xa_yen_binh	276	xã	Yên Bình
399	4936	xa_tien_xuan	276	xã	Tiến Xuân
400	9955	thi_tran_lien_quan	276	thị trấn	Liên Quan
401	9958	xa_dai_dong	276	xã	Đại Đồng
402	9961	xa_cam_yen	276	xã	Cẩm Yên
403	9964	xa_lai_thuong	276	xã	Lại Thượng
404	9967	xa_phu_kim	276	xã	Phú Kim
405	9970	xa_huong_ngai	276	xã	Hương Ngải
406	9973	xa_canh_nau	276	xã	Canh Nậu
407	9976	xa_kim_quan	276	xã	Kim Quan
408	9979	xa_di_nau	276	xã	Dị Nậu
409	9982	xa_binh_yen	276	xã	Bình Yên
410	9985	xa_chang_son	276	xã	Chàng Sơn
411	9988	xa_thach_hoa	276	xã	Thạch Hoà
412	9991	xa_can_kiem	276	xã	Cần Kiệm
413	9994	xa_huu_bang	276	xã	Hữu Bằng
414	9997	xa_phung_xa	276	xã	Phùng Xá
415	10000	xa_tan_xa	276	xã	Tân Xã
416	10003	xa_thach_xa	276	xã	Thạch Xá
417	10006	xa_binh_phu	276	xã	Bình Phú
418	10009	xa_ha_bang	276	xã	Hạ Bằng
419	10012	xa_dong_truc	276	xã	Đồng Trúc
420	10015	thi_tran_chuc_son	277	thị trấn	Chúc Sơn
421	10018	thi_tran_xuan_mai	277	thị trấn	Xuân Mai
422	10021	xa_phung_chau	277	xã	Phụng Châu
423	10024	xa_tien_phuong	277	xã	Tiên Phương
424	10027	xa_dong_son	277	xã	Đông Sơn
425	10030	xa_dong_phuong_yen	277	xã	Phương Yên
426	10033	xa_phu_nghia	277	xã	Phú Nghĩa
427	10039	xa_truong_yen	277	xã	Trường Yên
428	10042	xa_ngoc_hoa	277	xã	Ngọc Hòa
429	10045	xa_thuy_xuan_tien	277	xã	Xuân Tiên
430	10048	xa_thanh_binh	277	xã	Thanh Bình
431	10051	xa_trung_hoa	277	xã	Trung Hòa
432	10054	xa_dai_yen	277	xã	Đại Yên
433	10057	xa_thuy_huong	277	xã	Thụy Hương
434	10060	xa_tot_dong	277	xã	Tốt Động
435	10063	xa_lam_dien	277	xã	Lam Điền
436	10066	xa_tan_tien	277	xã	Tân Tiến
437	10069	xa_nam_phuong_tien	277	xã	Phương Tiến
438	10072	xa_hop_dong	277	xã	Hợp Đồng
439	10075	xa_hoang_van_thu	277	xã	Văn Thụ
440	10078	xa_hoang_dieu	277	xã	Hoàng Diệu
441	10081	xa_huu_van	277	xã	Hữu Văn
442	10084	xa_quang_bi	277	xã	Quảng Bị
443	10087	xa_my_luong	277	xã	Mỹ Lương
444	10090	xa_thuong_vuc	277	xã	Thượng Vực
445	10093	xa_hong_phong	277	xã	Hồng Phong
446	10096	xa_dong_phu	277	xã	Đồng Phú
447	10099	xa_tran_phu	277	xã	Trần Phú
448	10102	xa_van_vo	277	xã	Văn Võ
449	10105	xa_dong_lac	277	xã	Đồng Lạc
450	10108	xa_hoa_chinh	277	xã	Hòa Chính
451	10111	xa_phu_nam_an	277	xã	Nam An
452	10114	thi_tran_kim_bai	278	thị trấn	Kim Bài
453	10120	xa_cu_khe	278	xã	Cự Khê
454	10126	xa_bich_hoa	278	xã	Bích Hòa
455	10129	xa_my_hung	278	xã	Mỹ Hưng
456	10132	xa_cao_vien	278	xã	Cao Viên
457	10135	xa_binh_minh	278	xã	Bình Minh
458	10138	xa_tam_hung	278	xã	Tam Hưng
459	10141	xa_thanh_cao	278	xã	Thanh Cao
460	10144	xa_thanh_thuy	278	xã	Thanh Thùy
461	10147	xa_thanh_mai	278	xã	Thanh Mai
462	10150	xa_thanh_van	278	xã	Thanh Văn
463	10153	xa_do_dong	278	xã	Đỗ Động
464	10156	xa_kim_an	278	xã	Kim An
465	10159	xa_kim_thu	278	xã	Kim Thư
466	10162	xa_phuong_trung	278	xã	Phương Trung
467	10165	xa_tan_uoc	278	xã	Tân Ước
468	10168	xa_dan_hoa	278	xã	Dân Hòa
469	10171	xa_lien_chau	278	xã	Liên Châu
470	10174	xa_cao_duong	278	xã	Cao Dương
471	10177	xa_xuan_duong	278	xã	Xuân Dương
472	10180	xa_hong_duong	278	xã	Hồng Dương
473	10183	thi_tran_thuong_tin	279	thị trấn	Thường Tín
474	10186	xa_ninh_so	279	xã	Ninh Sở
475	10189	xa_nhi_khe	279	xã	Nhị Khê
476	10192	xa_duyen_thai	279	xã	Duyên Thái
477	10195	xa_khanh_ha	279	xã	Khánh Hà
478	10198	xa_hoa_binh	279	xã	Hòa Bình
479	10201	xa_van_binh	279	xã	Văn Bình
480	10204	xa_hien_giang	279	xã	Hiền Giang
481	10207	xa_hong_van	279	xã	Hồng Vân
482	10210	xa_van_tao	279	xã	Vân Tảo
483	10213	xa_lien_phuong	279	xã	Liên Phương
484	10216	xa_van_phu	279	xã	Văn Phú
485	10219	xa_tu_nhien	279	xã	Tự Nhiên
486	10222	xa_tien_phong	279	xã	Tiền Phong
487	10225	xa_ha_hoi	279	xã	Hà Hồi
488	10228	xa_thu_phu	279	xã	Thư Phú
489	10231	xa_nguyen_trai	279	xã	Nguyễn Trãi
490	10234	xa_quat_dong	279	xã	Quất Động
491	10237	xa_chuong_duong	279	xã	Chương Dương
492	10240	xa_tan_minh	279	xã	Tân Minh
493	10243	xa_le_loi	279	xã	Lê Lợi
494	10246	xa_thang_loi	279	xã	Thắng Lợi
495	10249	xa_dung_tien	279	xã	Dũng Tiến
496	10252	xa_thong_nhat	279	xã	Thống Nhất
497	10255	xa_nghiem_xuyen	279	xã	Nghiêm Xuyên
498	10258	xa_to_hieu	279	xã	Tô Hiệu
499	10261	xa_van_tu	279	xã	Văn Tự
500	10264	xa_van_diem	279	xã	Vạn Điểm
501	10267	xa_minh_cuong	279	xã	Minh Cường
502	10270	thi_tran_phu_minh	280	thị trấn	Phú Minh
503	10273	thi_tran_phu_xuyen	280	thị trấn	Phú Xuyên
504	10276	xa_hong_minh	280	xã	Hồng Minh
505	10279	xa_phuong_duc	280	xã	Phượng Dực
506	10282	xa_nam_tien	280	xã	Nam Tiến
507	10288	xa_tri_trung	280	xã	Tri Trung
508	10291	xa_dai_thang	280	xã	Đại Thắng
509	10294	xa_phu_tuc	280	xã	Phú Túc
510	10297	xa_van_hoang	280	xã	Văn Hoàng
511	10300	xa_hong_thai	280	xã	Hồng Thái
512	10303	xa_hoang_long	280	xã	Hoàng Long
513	10306	xa_quang_trung	280	xã	Quang Trung
514	10309	xa_nam_phong	280	xã	Nam Phong
515	10312	xa_nam_trieu	280	xã	Nam Triều
516	10315	xa_tan_dan	280	xã	Tân Dân
517	10318	xa_son_ha	280	xã	Sơn Hà
518	10321	xa_chuyen_my	280	xã	Chuyên Mỹ
519	10324	xa_khai_thai	280	xã	Khai Thái
520	10327	xa_phuc_tien	280	xã	Phúc Tiến
521	10330	xa_van_tu	280	xã	Vân Từ
522	10333	xa_tri_thuy	280	xã	Tri Thủy
523	10336	xa_dai_xuyen	280	xã	Đại Xuyên
524	10339	xa_phu_yen	280	xã	Phú Yên
525	10342	xa_bach_ha	280	xã	Bạch Hạ
526	10345	xa_quang_lang	280	xã	Quang Lãng
527	10348	xa_chau_can	280	xã	Châu Can
528	10351	xa_minh_tan	280	xã	Minh Tân
529	10354	thi_tran_van_dinh	281	thị trấn	Vân Đình
530	10357	xa_vien_an	281	xã	Viên An
531	10360	xa_vien_noi	281	xã	Viên Nội
532	10363	xa_hoa_son	281	xã	Hoa Sơn
533	10366	xa_quang_phu_cau	281	xã	Phú Cầu
534	10369	xa_truong_thinh	281	xã	Trường Thịnh
535	10372	xa_cao_thanh	281	xã	Cao Thành
536	10375	xa_lien_bat	281	xã	Liên Bạt
537	10378	xa_son_cong	281	xã	Sơn Công
538	10381	xa_dong_tien	281	xã	Đồng Tiến
539	10384	xa_phuong_tu	281	xã	Phương Tú
540	10387	xa_trung_tu	281	xã	Trung Tú
541	10390	xa_dong_tan	281	xã	Đồng Tân
542	10393	xa_tao_duong_van	281	xã	Dương Văn
543	10396	xa_van_thai	281	xã	Vạn Thái
544	10399	xa_minh_duc	281	xã	Minh Đức
545	10402	xa_hoa_lam	281	xã	Hòa Lâm
546	10405	xa_hoa_xa	281	xã	Hòa Xá
547	10408	xa_tram_long	281	xã	Trầm Lộng
548	10411	xa_kim_duong	281	xã	Kim Đường
549	10414	xa_hoa_nam	281	xã	Hòa Nam
550	10417	xa_hoa_phu	281	xã	Hòa Phú
551	10420	xa_doi_binh	281	xã	Đội Bình
552	10423	xa_dai_hung	281	xã	Đại Hùng
553	10426	xa_dong_lo	281	xã	Đông Lỗ
554	10429	xa_phu_luu	281	xã	Phù Lưu
555	10432	xa_dai_cuong	281	xã	Đại Cường
556	10435	xa_luu_hoang	281	xã	Lưu Hoàng
557	10438	xa_hong_quang	281	xã	Hồng Quang
558	10441	thi_tran_dai_nghia	282	thị trấn	Đại Nghĩa
559	10444	xa_dong_tam	282	xã	Đồng Tâm
560	10447	xa_thuong_lam	282	xã	Thượng Lâm
561	10450	xa_tuy_lai	282	xã	Tuy Lai
562	10453	xa_phuc_lam	282	xã	Phúc Lâm
563	10456	xa_my_thanh	282	xã	Mỹ Thành
564	10459	xa_bot_xuyen	282	xã	Bột Xuyên
565	10462	xa_an_my	282	xã	An Mỹ
566	10465	xa_hong_son	282	xã	Hồng Sơn
567	10468	xa_le_thanh	282	xã	Lê Thanh
568	10471	xa_xuy_xa	282	xã	Xuy Xá
569	10474	xa_phung_xa	282	xã	Phùng Xá
570	10477	xa_phu_luu_te	282	xã	Lưu Tế
571	10480	xa_dai_hung	282	xã	Đại Hưng
572	10483	xa_van_kim	282	xã	Vạn Kim
573	10486	xa_doc_tin	282	xã	Đốc Tín
574	10489	xa_huong_son	282	xã	Hương Sơn
575	10492	xa_hung_tien	282	xã	Hùng Tiến
576	10495	xa_an_tien	282	xã	An Tiến
577	10498	xa_hop_tien	282	xã	Hợp Tiến
578	10501	xa_hop_thanh	282	xã	Hợp Thanh
579	10504	xa_an_phu	282	xã	An Phú
580	688	phuong_quang_trung	24	phường	Quang Trung
581	691	phuong_tran_phu	24	phường	Trần Phú
582	692	phuong_ngoc_ha	24	phường	Ngọc Hà
583	694	phuong_nguyen_trai	24	phường	Nguyễn Trãi
584	697	phuong_minh_khai	24	phường	Minh Khai
585	700	xa_ngoc_duong	24	xã	Ngọc Đường
586	946	xa_phuong_do	24	xã	Phương Độ
587	949	xa_phuong_thien	24	xã	Phương Thiện
588	712	thi_tran_pho_bang	26	thị trấn	Phó Bảng
589	715	xa_lung_cu	26	xã	Lũng Cú
590	718	xa_ma_le	26	xã	Má Lé
591	721	thi_tran_dong_van	26	thị trấn	Đồng Văn
592	724	xa_lung_tao	26	xã	Lũng Táo
593	727	xa_pho_la	26	xã	Phố Là
594	730	xa_thai_phin_tung	26	xã	Thài Phìn Tủng
595	733	xa_sung_la	26	xã	Sủng Là
596	736	xa_xa_phin	26	xã	Xà Phìn
597	739	xa_ta_phin	26	xã	Tả Phìn
598	742	xa_ta_lung	26	xã	Tả Lủng
599	745	xa_pho_cao	26	xã	Phố Cáo
600	748	xa_sinh_lung	26	xã	Sính Lủng
601	751	xa_sang_tung	26	xã	Sảng Tủng
602	754	xa_lung_thau	26	xã	Lũng Thầu
603	757	xa_ho_quang_phin	26	xã	Hố Quáng Phìn
604	760	xa_van_chai	26	xã	Vần Chải
605	763	xa_lung_phin	26	xã	Lũng Phìn
606	766	xa_sung_trai	26	xã	Sủng Trái
607	769	thi_tran_meo_vac	27	thị trấn	Mèo Vạc
608	772	xa_thuong_phung	27	xã	Thượng Phùng
609	775	xa_pai_lung	27	xã	Pải Lủng
610	778	xa_xin_cai	27	xã	Xín Cái
611	781	xa_pa_vi	27	xã	Pả Vi
612	784	xa_giang_chu_phin	27	xã	Giàng Chu Phìn
613	787	xa_sung_tra	27	xã	Sủng Trà
614	790	xa_sung_mang	27	xã	Sủng Máng
615	793	xa_son_vi	27	xã	Sơn Vĩ
616	796	xa_ta_lung	27	xã	Tả Lủng
617	799	xa_can_chu_phin	27	xã	Cán Chu Phìn
618	802	xa_lung_pu	27	xã	Lũng Pù
619	805	xa_lung_chinh	27	xã	Lũng Chinh
620	808	xa_tat_nga	27	xã	Tát Ngà
621	811	xa_nam_ban	27	xã	Nậm Ban
622	814	xa_khau_vai	27	xã	Khâu Vai
623	815	xa_niem_tong	27	xã	Niêm Tòng
624	817	xa_niem_son	27	xã	Niêm Sơn
625	820	thi_tran_yen_minh	28	thị trấn	Yên Minh
626	823	xa_thang_mo	28	xã	Thắng Mố
627	826	xa_phu_lung	28	xã	Phú Lũng
628	829	xa_sung_trang	28	xã	Sủng Tráng
629	832	xa_bach_dich	28	xã	Bạch Đích
630	835	xa_na_khe	28	xã	Na Khê
631	838	xa_sung_thai	28	xã	Sủng Thài
632	841	xa_huu_vinh	28	xã	Hữu Vinh
633	844	xa_lao_va_chai	28	xã	Lao Và Chải
634	847	xa_mau_due	28	xã	Mậu Duệ
635	850	xa_dong_minh	28	xã	Đông Minh
636	853	xa_mau_long	28	xã	Mậu Long
637	856	xa_ngam_la	28	xã	Ngam La
638	859	xa_ngoc_long	28	xã	Ngọc Long
639	862	xa_duong_thuong	28	xã	Đường Thượng
640	865	xa_lung_ho	28	xã	Lũng Hồ
641	868	xa_du_tien	28	xã	Du Tiến
642	871	xa_du_gia	28	xã	Du Già
643	874	thi_tran_tam_son	29	thị trấn	Tam Sơn
644	877	xa_bat_dai_son	29	xã	Đại Sơn
645	880	xa_nghia_thuan	29	xã	Nghĩa Thuận
646	883	xa_can_ty	29	xã	Cán Tỷ
647	886	xa_cao_ma_po	29	xã	Cao Mã Pờ
648	889	xa_thanh_van	29	xã	Thanh Vân
649	892	xa_tung_vai	29	xã	Tùng Vài
650	895	xa_dong_ha	29	xã	Đông Hà
651	898	xa_quan_ba	29	xã	Quản Bạ
652	901	xa_lung_tam	29	xã	Lùng Tám
653	904	xa_quyet_tien	29	xã	Quyết Tiến
654	907	xa_ta_van	29	xã	Tả Ván
655	910	xa_thai_an	29	xã	Thái An
656	703	xa_kim_thach	30	xã	Kim Thạch
657	706	xa_phu_linh	30	xã	Phú Linh
658	709	xa_kim_linh	30	xã	Kim Linh
659	913	thi_tran_vi_xuyen	30	thị trấn	Vị Xuyên
660	916	thi_tran_nong_truong_viet_lam	30	thị trấn	Nông Trường Việt Lâm
661	919	xa_minh_tan	30	xã	Minh Tân
662	922	xa_thuan_hoa	30	xã	Thuận Hoà
663	925	xa_tung_ba	30	xã	Tùng Bá
664	928	xa_thanh_thuy	30	xã	Thanh Thủy
665	931	xa_thanh_duc	30	xã	Thanh Đức
666	934	xa_phong_quang	30	xã	Phong Quang
667	937	xa_xin_chai	30	xã	Xín Chải
668	940	xa_phuong_tien	30	xã	Phương Tiến
669	943	xa_lao_chai	30	xã	Lao Chải
670	952	xa_cao_bo	30	xã	Cao Bồ
671	955	xa_dao_duc	30	xã	Đạo Đức
672	958	xa_thuong_son	30	xã	Thượng Sơn
673	961	xa_linh_ho	30	xã	Linh Hồ
674	964	xa_quang_ngan	30	xã	Quảng Ngần
675	967	xa_viet_lam	30	xã	Việt Lâm
676	970	xa_ngoc_linh	30	xã	Ngọc Linh
677	973	xa_ngoc_minh	30	xã	Ngọc Minh
678	976	xa_bach_ngoc	30	xã	Bạch Ngọc
679	979	xa_trung_thanh	30	xã	Trung Thành
680	982	xa_minh_son	31	xã	Minh Sơn
681	985	xa_giap_trung	31	xã	Giáp Trung
682	988	xa_yen_dinh	31	xã	Yên Định
683	991	thi_tran_yen_phu	31	thị trấn	Yên Phú
684	994	xa_minh_ngoc	31	xã	Minh Ngọc
685	997	xa_yen_phong	31	xã	Yên Phong
686	1000	xa_lac_nong	31	xã	Lạc Nông
687	1003	xa_phu_nam	31	xã	Phú Nam
688	1006	xa_yen_cuong	31	xã	Yên Cường
689	1009	xa_thuong_tan	31	xã	Thượng Tân
690	1012	xa_duong_am	31	xã	Đường Âm
691	1015	xa_duong_hong	31	xã	Đường Hồng
692	1018	xa_phieng_luong	31	xã	Phiêng Luông
693	1021	thi_tran_vinh_quang	32	thị trấn	Vinh Quang
694	1024	xa_ban_may	32	xã	Bản Máy
695	1027	xa_thang_tin	32	xã	Thàng Tín
696	1030	xa_then_chu_phin	32	xã	Thèn Chu Phìn
697	1033	xa_po_lo	32	xã	Pố Lồ
698	1036	xa_ban_phung	32	xã	Bản Phùng
699	1039	xa_tung_san	32	xã	Túng Sán
700	1042	xa_chien_pho	32	xã	Chiến Phố
701	1045	xa_dan_van	32	xã	Đản Ván
702	1048	xa_tu_nhan	32	xã	Tụ Nhân
703	1051	xa_tan_tien	32	xã	Tân Tiến
704	1054	xa_nang_don	32	xã	Nàng Đôn
705	1057	xa_po_ly_ngai	32	xã	Pờ Ly Ngài
706	1060	xa_san_xa_ho	32	xã	Sán Xả Hồ
707	1063	xa_ban_luoc	32	xã	Bản Luốc
708	1066	xa_ngam_dang_vai	32	xã	Ngàm Đăng Vài
709	1069	xa_ban_nhung	32	xã	Bản Nhùng
710	1072	xa_ta_su_choong	32	xã	Tả Sử Choóng
711	1075	xa_nam_dich	32	xã	Nậm Dịch
712	1081	xa_ho_thau	32	xã	Hồ Thầu
713	1084	xa_nam_son	32	xã	Nam Sơn
714	1087	xa_nam_ty	32	xã	Nậm Tỵ
715	1090	xa_thong_nguyen	32	xã	Thông Nguyên
716	1093	xa_nam_khoa	32	xã	Nậm Khòa
717	1096	thi_tran_coc_pai	33	thị trấn	Cốc Pài
718	1099	xa_nan_xin	33	xã	Nàn Xỉn
719	1102	xa_ban_diu	33	xã	Bản Díu
720	1105	xa_chi_ca	33	xã	Chí Cà
721	1108	xa_xin_man	33	xã	Xín Mần
722	1114	xa_then_phang	33	xã	Thèn Phàng
723	1117	xa_trung_thinh	33	xã	Trung Thịnh
724	1120	xa_pa_vay_su	33	xã	Pà Vầy Sủ
725	1123	xa_coc_re	33	xã	Cốc Rế
726	1126	xa_thu_ta	33	xã	Thu Tà
727	1129	xa_nan_ma	33	xã	Nàn Ma
728	1132	xa_ta_nhiu	33	xã	Tả Nhìu
729	1135	xa_ban_ngo	33	xã	Bản Ngò
730	1138	xa_che_la	33	xã	Chế Là
731	1141	xa_nam_dan	33	xã	Nấm Dẩn
732	1144	xa_quang_nguyen	33	xã	Quảng Nguyên
733	1147	xa_na_chi	33	xã	Nà Chì
734	1150	xa_khuon_lung	33	xã	Khuôn Lùng
735	1153	thi_tran_viet_quang	34	thị trấn	Việt Quang
736	1156	thi_tran_vinh_tuy	34	thị trấn	Vĩnh Tuy
737	1159	xa_tan_lap	34	xã	Tân Lập
738	1162	xa_tan_thanh	34	xã	Tân Thành
739	1165	xa_dong_tien	34	xã	Đồng Tiến
740	1168	xa_dong_tam	34	xã	Đồng Tâm
741	1171	xa_tan_quang	34	xã	Tân Quang
742	1174	xa_thuong_binh	34	xã	Thượng Bình
743	1177	xa_huu_san	34	xã	Hữu Sản
744	1180	xa_kim_ngoc	34	xã	Kim Ngọc
745	1183	xa_viet_vinh	34	xã	Việt Vinh
746	1186	xa_bang_hanh	34	xã	Bằng Hành
747	1189	xa_quang_minh	34	xã	Quang Minh
748	1192	xa_lien_hiep	34	xã	Liên Hiệp
749	1195	xa_vo_diem	34	xã	Vô Điếm
750	1198	xa_viet_hong	34	xã	Việt Hồng
751	1201	xa_hung_an	34	xã	Hùng An
752	1204	xa_duc_xuan	34	xã	Đức Xuân
753	1207	xa_tien_kieu	34	xã	Tiên Kiều
754	1210	xa_vinh_hao	34	xã	Vĩnh Hảo
755	1213	xa_vinh_phuc	34	xã	Vĩnh Phúc
756	1216	xa_dong_yen	34	xã	Đồng Yên
757	1219	xa_dong_thanh	34	xã	Đông Thành
758	1222	xa_xuan_minh	35	xã	Xuân Minh
759	1225	xa_tien_nguyen	35	xã	Tiên Nguyên
760	1228	xa_tan_nam	35	xã	Tân Nam
761	1231	xa_ban_ria	35	xã	Bản Rịa
762	1234	xa_yen_thanh	35	xã	Yên Thành
763	1237	thi_tran_yen_binh	35	thị trấn	Yên Bình
764	1240	xa_tan_trinh	35	xã	Tân Trịnh
765	1243	xa_tan_bac	35	xã	Tân Bắc
766	1246	xa_bang_lang	35	xã	Bằng Lang
767	1249	xa_yen_ha	35	xã	Yên Hà
768	1252	xa_huong_son	35	xã	Hương Sơn
769	1255	xa_xuan_giang	35	xã	Xuân Giang
770	1258	xa_na_khuong	35	xã	Nà Khương
771	1261	xa_tien_yen	35	xã	Tiên Yên
772	1264	xa_vi_thuong	35	xã	Vĩ Thượng
773	1267	phuong_song_hien	40	phường	Sông Hiến
774	1270	phuong_song_bang	40	phường	Sông Bằng
775	1273	phuong_hop_giang	40	phường	Hợp Giang
776	1276	phuong_tan_giang	40	phường	Tân Giang
777	1279	phuong_ngoc_xuan	40	phường	Ngọc Xuân
778	1282	phuong_de_tham	40	phường	Đề Thám
779	1285	phuong_hoa_chung	40	phường	Hoà Chung
780	1288	phuong_duyet_trung	40	phường	Duyệt Trung
781	1693	xa_vinh_quang	40	xã	Vĩnh Quang
782	1705	xa_hung_dao	40	xã	Hưng Đạo
783	1720	xa_chu_trinh	40	xã	Chu Trinh
784	1290	thi_tran_pac_miau	42	thị trấn	Pác Miầu
785	1291	xa_duc_hanh	42	xã	Đức Hạnh
786	1294	xa_ly_bon	42	xã	Lý Bôn
787	1296	xa_nam_cao	42	xã	Nam Cao
788	1297	xa_nam_quang	42	xã	Nam Quang
789	1300	xa_vinh_quang	42	xã	Vĩnh Quang
790	1303	xa_quang_lam	42	xã	Quảng Lâm
791	1304	xa_thach_lam	42	xã	Thạch Lâm
792	1309	xa_vinh_phong	42	xã	Vĩnh Phong
793	1312	xa_mong_an	42	xã	Mông Ân
794	1315	xa_thai_hoc	42	xã	Thái Học
795	1316	xa_thai_son	42	xã	Thái Sơn
796	1318	xa_yen_tho	42	xã	Yên Thổ
797	1321	thi_tran_bao_lac	43	thị trấn	Bảo Lạc
798	1324	xa_coc_pang	43	xã	Cốc Pàng
799	1327	xa_thuong_ha	43	xã	Thượng Hà
800	1330	xa_co_ba	43	xã	Cô Ba
801	1333	xa_bao_toan	43	xã	Bảo Toàn
802	1336	xa_khanh_xuan	43	xã	Khánh Xuân
803	1339	xa_xuan_truong	43	xã	Xuân Trường
804	1342	xa_hong_tri	43	xã	Hồng Trị
805	1343	xa_kim_cuc	43	xã	Kim Cúc
806	1345	xa_phan_thanh	43	xã	Phan Thanh
807	1348	xa_hong_an	43	xã	Hồng An
808	1351	xa_hung_dao	43	xã	Hưng Đạo
809	1352	xa_hung_thinh	43	xã	Hưng Thịnh
810	1354	xa_huy_giap	43	xã	Huy Giáp
811	1357	xa_dinh_phung	43	xã	Đình Phùng
812	1359	xa_son_lap	43	xã	Sơn Lập
813	1360	xa_son_lo	43	xã	Sơn Lộ
814	1363	thi_tran_thong_nong	45	thị trấn	Thông Nông
815	1366	xa_can_yen	45	xã	Cần Yên
816	1367	xa_can_nong	45	xã	Cần Nông
817	1372	xa_luong_thong	45	xã	Lương Thông
818	1375	xa_da_thong	45	xã	Đa Thông
819	1378	xa_ngoc_dong	45	xã	Ngọc Động
820	1381	xa_yen_son	45	xã	Yên Sơn
821	1384	xa_luong_can	45	xã	Lương Can
822	1387	xa_thanh_long	45	xã	Thanh Long
823	1392	thi_tran_xuan_hoa	45	thị trấn	Xuân Hòa
824	1393	xa_lung_nam	45	xã	Lũng Nặm
825	1399	xa_truong_ha	45	xã	Trường Hà
826	1402	xa_cai_vien	45	xã	Cải Viên
827	1411	xa_noi_thon	45	xã	Nội Thôn
828	1414	xa_tong_cot	45	xã	Tổng Cọt
829	1417	xa_soc_ha	45	xã	Sóc Hà
830	1420	xa_thuong_thon	45	xã	Thượng Thôn
831	1429	xa_hong_sy	45	xã	Hồng Sỹ
832	1432	xa_quy_quan	45	xã	Quý Quân
833	1435	xa_ma_ba	45	xã	Mã Ba
834	1438	xa_ngoc_dao	45	xã	Ngọc Đào
835	1447	thi_tran_tra_linh	47	thị trấn	Trà Lĩnh
836	1453	xa_tri_phuong	47	xã	Tri Phương
837	1456	xa_quang_han	47	xã	Quang Hán
838	1462	xa_xuan_noi	47	xã	Xuân Nội
839	1465	xa_quang_trung	47	xã	Quang Trung
840	1468	xa_quang_vinh	47	xã	Quang Vinh
841	1471	xa_cao_chuong	47	xã	Cao Chương
842	1477	thi_tran_trung_khanh	47	thị trấn	Trùng Khánh
843	1480	xa_ngoc_khe	47	xã	Ngọc Khê
844	1481	xa_ngoc_con	47	xã	Ngọc Côn
845	1483	xa_phong_nam	47	xã	Phong Nậm
846	1489	xa_dinh_phong	47	xã	Đình Phong
847	1495	xa_dam_thuy	47	xã	Đàm Thuỷ
848	1498	xa_kham_thanh	47	xã	Khâm Thành
849	1501	xa_chi_vien	47	xã	Chí Viễn
850	1504	xa_lang_hieu	47	xã	Lăng Hiếu
851	1507	xa_phong_chau	47	xã	Phong Châu
852	1516	xa_trung_phuc	47	xã	Trung Phúc
853	1519	xa_cao_thang	47	xã	Cao Thăng
854	1522	xa_duc_hong	47	xã	Đức Hồng
855	1525	xa_doai_duong	47	xã	Đoài Dương
856	1534	xa_minh_long	48	xã	Minh Long
857	1537	xa_ly_quoc	48	xã	Lý Quốc
858	1540	xa_thang_loi	48	xã	Thắng Lợi
859	1543	xa_dong_loan	48	xã	Đồng Loan
860	1546	xa_duc_quang	48	xã	Đức Quang
861	1549	xa_kim_loan	48	xã	Kim Loan
862	1552	xa_quang_long	48	xã	Quang Long
863	1555	xa_an_lac	48	xã	An Lạc
864	1558	thi_tran_thanh_nhat	48	thị trấn	Thanh Nhật
865	1561	xa_vinh_quy	48	xã	Vinh Quý
866	1564	xa_thong_nhat	48	xã	Thống Nhất
867	1567	xa_co_ngan	48	xã	Cô Ngân
868	1573	xa_thi_hoa	48	xã	Thị Hoa
869	1474	xa_quoc_toan	49	xã	Quốc Toản
870	1576	thi_tran_quang_uyen	49	thị trấn	Quảng Uyên
871	1579	xa_phi_hai	49	xã	Phi Hải
872	1582	xa_quang_hung	49	xã	Quảng Hưng
873	1594	xa_doc_lap	49	xã	Độc Lập
874	1597	xa_cai_bo	49	xã	Cai Bộ
875	1603	xa_phuc_sen	49	xã	Phúc Sen
876	1606	xa_chi_thao	49	xã	Chí Thảo
877	1609	xa_tu_do	49	xã	Tự Do
878	1615	xa_hong_quang	49	xã	Hồng Quang
879	1618	xa_ngoc_dong	49	xã	Ngọc Động
880	1624	xa_hanh_phuc	49	xã	Hạnh Phúc
881	1627	thi_tran_ta_lung	49	thị trấn	Tà Lùng
882	1630	xa_be_van_dan	49	xã	Bế Văn Đàn
883	1636	xa_cach_linh	49	xã	Cách Linh
884	1639	xa_dai_son	49	xã	Đại Sơn
885	1645	xa_tien_thanh	49	xã	Tiên Thành
886	1648	thi_tran_hoa_thuan	49	thị trấn	Hoà Thuận
887	1651	xa_my_hung	49	xã	Mỹ Hưng
888	1654	thi_tran_nuoc_hai	51	thị trấn	Nước Hai
889	1657	xa_dan_chu	51	xã	Dân Chủ
890	1660	xa_nam_tuan	51	xã	Nam Tuấn
891	1666	xa_dai_tien	51	xã	Đại Tiến
892	1669	xa_duc_long	51	xã	Đức Long
893	1672	xa_ngu_lao	51	xã	Ngũ Lão
894	1675	xa_truong_luong	51	xã	Trương Lương
895	1687	xa_hong_viet	51	xã	Hồng Việt
896	1696	xa_hoang_tung	51	xã	Hoàng Tung
897	1699	xa_nguyen_hue	51	xã	Nguyễn Huệ
898	1702	xa_quang_trung	51	xã	Quang Trung
899	1708	xa_bach_dang	51	xã	Bạch Đằng
900	1711	xa_binh_duong	51	xã	Bình Dương
901	1714	xa_le_chung	51	xã	Lê Chung
902	1723	xa_hong_nam	51	xã	Hồng Nam
903	1726	thi_tran_nguyen_binh	52	thị trấn	Nguyên Bình
904	1729	thi_tran_tinh_tuc	52	thị trấn	Tĩnh Túc
905	1732	xa_yen_lac	52	xã	Yên Lạc
906	1735	xa_trieu_nguyen	52	xã	Triệu Nguyên
907	1738	xa_ca_thanh	52	xã	Ca Thành
908	1744	xa_vu_nong	52	xã	Vũ Nông
909	1747	xa_minh_tam	52	xã	Minh Tâm
910	1750	xa_the_duc	52	xã	Thể Dục
911	1756	xa_mai_long	52	xã	Mai Long
912	1762	xa_vu_minh	52	xã	Vũ Minh
913	1765	xa_hoa_tham	52	xã	Hoa Thám
914	1768	xa_phan_thanh	52	xã	Phan Thanh
915	1771	xa_quang_thanh	52	xã	Quang Thành
916	1774	xa_tam_kim	52	xã	Tam Kim
917	1777	xa_thanh_cong	52	xã	Thành Công
918	1780	xa_thinh_vuong	52	xã	Thịnh Vượng
919	1783	xa_hung_dao	52	xã	Hưng Đạo
920	1786	thi_tran_dong_khe	53	thị trấn	Đông Khê
921	1789	xa_canh_tan	53	xã	Canh Tân
922	1792	xa_kim_dong	53	xã	Kim Đồng
923	1795	xa_minh_khai	53	xã	Minh Khai
924	1801	xa_duc_thong	53	xã	Đức Thông
925	1804	xa_thai_cuong	53	xã	Thái Cường
926	1807	xa_van_trinh	53	xã	Vân Trình
927	1810	xa_thuy_hung	53	xã	Thụy Hùng
928	1813	xa_quang_trong	53	xã	Quang Trọng
929	1816	xa_trong_con	53	xã	Trọng Con
930	1819	xa_le_lai	53	xã	Lê Lai
931	1822	xa_duc_long	53	xã	Đức Long
932	1828	xa_le_loi	53	xã	Lê Lợi
933	1831	xa_duc_xuan	53	xã	Đức Xuân
934	1834	phuong_nguyen_thi_minh_khai	58	phường	Nguyễn Thị Minh Khai
935	1837	phuong_song_cau	58	phường	Sông Cầu
936	1840	phuong_duc_xuan	58	phường	Đức Xuân
937	1843	phuong_phung_chi_kien	58	phường	Phùng Chí Kiên
938	1846	phuong_huyen_tung	58	phường	Huyền Tụng
939	1849	xa_duong_quang	58	xã	Dương Quang
940	1852	xa_nong_thuong	58	xã	Nông Thượng
941	1855	phuong_xuat_hoa	58	phường	Xuất Hóa
942	1858	xa_bang_thanh	60	xã	Bằng Thành
943	1861	xa_nhan_mon	60	xã	Nhạn Môn
944	1864	xa_boc_bo	60	xã	Bộc Bố
945	1867	xa_cong_bang	60	xã	Công Bằng
946	1870	xa_giao_hieu	60	xã	Giáo Hiệu
947	1873	xa_xuan_la	60	xã	Xuân La
948	1876	xa_an_thang	60	xã	An Thắng
949	1879	xa_co_linh	60	xã	Cổ Linh
950	1882	xa_nghien_loan	60	xã	Nghiên Loan
951	1885	xa_cao_tan	60	xã	Cao Tân
952	1888	thi_tran_cho_ra	61	thị trấn	Chợ Rã
953	1891	xa_banh_trach	61	xã	Bành Trạch
954	1894	xa_phuc_loc	61	xã	Phúc Lộc
955	1897	xa_ha_hieu	61	xã	Hà Hiệu
956	1900	xa_cao_thuong	61	xã	Cao Thượng
957	1906	xa_khang_ninh	61	xã	Khang Ninh
958	1909	xa_nam_mau	61	xã	Nam Mẫu
959	1912	xa_thuong_giao	61	xã	Thượng Giáo
960	1915	xa_dia_linh	61	xã	Địa Linh
961	1918	xa_yen_duong	61	xã	Yến Dương
962	1921	xa_chu_huong	61	xã	Chu Hương
963	1924	xa_quang_khe	61	xã	Quảng Khê
964	1927	xa_my_phuong	61	xã	Mỹ Phương
965	1930	xa_hoang_tri	61	xã	Hoàng Trĩ
966	1933	xa_dong_phuc	61	xã	Đồng Phúc
967	1936	thi_tran_na_phac	62	thị trấn	Nà Phặc
968	1939	xa_thuong_an	62	xã	Thượng Ân
969	1942	xa_bang_van	62	xã	Bằng Vân
970	1945	xa_coc_dan	62	xã	Cốc Đán
971	1948	xa_trung_hoa	62	xã	Trung Hoà
972	1951	xa_duc_van	62	xã	Đức Vân
973	1954	xa_van_tung	62	xã	Vân Tùng
974	1957	xa_thuong_quan	62	xã	Thượng Quan
975	1960	xa_hiep_luc	62	xã	Hiệp Lực
976	1963	xa_thuan_mang	62	xã	Thuần Mang
977	1969	thi_tran_phu_thong	63	thị trấn	Phủ Thông
978	1975	xa_vi_huong	63	xã	Vi Hương
979	1978	xa_si_binh	63	xã	Sĩ Bình
980	1981	xa_vu_muon	63	xã	Vũ Muộn
981	1984	xa_don_phong	63	xã	Đôn Phong
982	1990	xa_luc_binh	63	xã	Lục Bình
983	1993	xa_tan_tu	63	xã	Tân Tú
984	1999	xa_nguyen_phuc	63	xã	Nguyên Phúc
985	2002	xa_cao_son	63	xã	Cao Sơn
986	2005	xa_quan_ha	63	xã	Quân Hà
987	2008	xa_cam_giang	63	xã	Cẩm Giàng
988	2011	xa_my_thanh	63	xã	Mỹ Thanh
989	2014	xa_duong_phong	63	xã	Dương Phong
990	2017	xa_quang_thuan	63	xã	Quang Thuận
991	2020	thi_tran_bang_lung	64	thị trấn	Bằng Lũng
992	2023	xa_xuan_lac	64	xã	Xuân Lạc
993	2026	xa_nam_cuong	64	xã	Nam Cường
994	2029	xa_dong_lac	64	xã	Đồng Lạc
995	2032	xa_tan_lap	64	xã	Tân Lập
996	2035	xa_ban_thi	64	xã	Bản Thi
997	2038	xa_quang_bach	64	xã	Quảng Bạch
998	2041	xa_bang_phuc	64	xã	Bằng Phúc
999	2044	xa_yen_thinh	64	xã	Yên Thịnh
1000	2047	xa_yen_thuong	64	xã	Yên Thượng
1001	2050	xa_phuong_vien	64	xã	Phương Viên
1002	2053	xa_ngoc_phai	64	xã	Ngọc Phái
1003	2059	xa_dong_thang	64	xã	Đồng Thắng
1004	2062	xa_luong_bang	64	xã	Lương Bằng
1005	2065	xa_bang_lang	64	xã	Bằng Lãng
1006	2068	xa_dai_sao	64	xã	Đại Sảo
1007	2071	xa_nghia_ta	64	xã	Nghĩa Tá
1008	2077	xa_yen_my	64	xã	Yên Mỹ
1009	2080	xa_binh_trung	64	xã	Bình Trung
1010	2083	xa_yen_phong	64	xã	Yên Phong
1011	2086	thi_tran_dong_tam	65	thị trấn	Đồng Tâm
1012	2089	xa_tan_son	65	xã	Tân Sơn
1013	2092	xa_thanh_van	65	xã	Thanh Vận
1014	2095	xa_mai_lap	65	xã	Mai Lạp
1015	2098	xa_hoa_muc	65	xã	Hoà Mục
1016	2101	xa_thanh_mai	65	xã	Thanh Mai
1017	2104	xa_cao_ky	65	xã	Cao Kỳ
1018	2107	xa_nong_ha	65	xã	Nông Hạ
1019	2110	xa_yen_cu	65	xã	Yên Cư
1020	2113	xa_thanh_thinh	65	xã	Thanh Thịnh
1021	2116	xa_yen_han	65	xã	Yên Hân
1022	2122	xa_nhu_co	65	xã	Như Cố
1023	2125	xa_binh_van	65	xã	Bình Văn
1024	2131	xa_quang_chu	65	xã	Quảng Chu
1025	2137	xa_van_vu	66	xã	Văn Vũ
1026	2140	xa_van_lang	66	xã	Văn Lang
1027	2143	xa_luong_thuong	66	xã	Lương Thượng
1028	2146	xa_kim_hy	66	xã	Kim Hỷ
1029	2152	xa_cuong_loi	66	xã	Cường Lợi
1030	2155	thi_tran_yen_lac	66	thị trấn	Yến Lạc
1031	2158	xa_kim_lu	66	xã	Kim Lư
1032	2161	xa_son_thanh	66	xã	Sơn Thành
1033	2170	xa_van_minh	66	xã	Văn Minh
1034	2173	xa_con_minh	66	xã	Côn Minh
1035	2176	xa_cu_le	66	xã	Cư Lễ
1036	2179	xa_tran_phu	66	xã	Trần Phú
1037	2185	xa_quang_phong	66	xã	Quang Phong
1038	2188	xa_duong_son	66	xã	Dương Sơn
1039	2191	xa_xuan_duong	66	xã	Xuân Dương
1040	2194	xa_dong_xa	66	xã	Đổng Xá
1041	2197	xa_liem_thuy	66	xã	Liêm Thuỷ
1042	2200	phuong_phan_thiet	70	phường	Phan Thiết
1043	2203	phuong_minh_xuan	70	phường	Minh Xuân
1044	2206	phuong_tan_quang	70	phường	Tân Quang
1045	2209	xa_trang_da	70	xã	Tràng Đà
1046	2212	phuong_nong_tien	70	phường	Nông Tiến
1047	2215	phuong_y_la	70	phường	Ỷ La
1048	2216	phuong_tan_ha	70	phường	Tân Hà
1049	2218	phuong_hung_thanh	70	phường	Hưng Thành
1050	2497	xa_kim_phu	70	xã	Kim Phú
1051	2503	xa_an_khang	70	xã	An Khang
1052	2509	phuong_my_lam	70	phường	Mỹ Lâm
1053	2512	phuong_an_tuong	70	phường	An Tường
1054	2515	xa_luong_vuong	70	xã	Lưỡng Vượng
1055	2521	xa_thai_long	70	xã	Thái Long
1056	2524	phuong_doi_can	70	phường	Đội Cấn
1057	2233	xa_phuc_yen	71	xã	Phúc Yên
1058	2242	xa_xuan_lap	71	xã	Xuân Lập
1059	2251	xa_khuon_ha	71	xã	Khuôn Hà
1060	2266	xa_lang_can	71	xã	Lăng Can
1061	2269	xa_thuong_lam	71	xã	Thượng Lâm
1062	2290	xa_binh_an	71	xã	Bình An
1063	2293	xa_hong_quang	71	xã	Hồng Quang
1064	2296	xa_tho_binh	71	xã	Thổ Bình
1065	2221	thi_tran_na_hang	72	thị trấn	Na Hang
1066	2227	xa_sinh_long	72	xã	Sinh Long
1067	2230	xa_thuong_giap	72	xã	Thượng Giáp
1068	2239	xa_thuong_nong	72	xã	Thượng Nông
1069	2245	xa_con_lon	72	xã	Côn Lôn
1070	2248	xa_yen_hoa	72	xã	Yên Hoa
1071	2254	xa_hong_thai	72	xã	Hồng Thái
1072	2260	xa_da_vi	72	xã	Đà Vị
1073	2263	xa_khau_tinh	72	xã	Khau Tinh
1074	2275	xa_son_phu	72	xã	Sơn Phú
1075	2281	xa_nang_kha	72	xã	Năng Khả
1076	2284	xa_thanh_tuong	72	xã	Thanh Tương
1077	2287	thi_tran_vinh_loc	73	thị trấn	Vĩnh Lộc
1078	2299	xa_phuc_son	73	xã	Phúc Sơn
1079	2302	xa_minh_quang	73	xã	Minh Quang
1080	2305	xa_trung_ha	73	xã	Trung Hà
1081	2308	xa_tan_my	73	xã	Tân Mỹ
1082	2311	xa_ha_lang	73	xã	Hà Lang
1083	2314	xa_hung_my	73	xã	Hùng Mỹ
1084	2317	xa_yen_lap	73	xã	Yên Lập
1085	2320	xa_tan_an	73	xã	Tân An
1086	2323	xa_binh_phu	73	xã	Bình Phú
1087	2326	xa_xuan_quang	73	xã	Xuân Quang
1088	2329	xa_ngoc_hoi	73	xã	Ngọc Hội
1089	2332	xa_phu_binh	73	xã	Phú Bình
1090	2335	xa_hoa_phu	73	xã	Hòa Phú
1091	2338	xa_phuc_thinh	73	xã	Phúc Thịnh
1092	2341	xa_kien_dai	73	xã	Kiên Đài
1093	2344	xa_tan_thinh	73	xã	Tân Thịnh
1094	2347	xa_trung_hoa	73	xã	Trung Hòa
1095	2350	xa_kim_binh	73	xã	Kim Bình
1096	2353	xa_hoa_an	73	xã	Hòa An
1097	2356	xa_vinh_quang	73	xã	Vinh Quang
1098	2359	xa_tri_phu	73	xã	Tri Phú
1099	2362	xa_nhan_ly	73	xã	Nhân Lý
1100	2365	xa_yen_nguyen	73	xã	Yên Nguyên
1101	2368	xa_linh_phu	73	xã	Linh Phú
1102	2371	xa_binh_nhan	73	xã	Bình Nhân
1103	2374	thi_tran_tan_yen	74	thị trấn	Tân Yên
1104	2377	xa_yen_thuan	74	xã	Yên Thuận
1105	2380	xa_bach_xa	74	xã	Bạch Xa
1106	2383	xa_minh_khuong	74	xã	Minh Khương
1107	2386	xa_yen_lam	74	xã	Yên Lâm
1108	2389	xa_minh_dan	74	xã	Minh Dân
1109	2392	xa_phu_luu	74	xã	Phù Lưu
1110	2395	xa_minh_huong	74	xã	Minh Hương
1111	2398	xa_yen_phu	74	xã	Yên Phú
1112	2401	xa_tan_thanh	74	xã	Tân Thành
1113	2404	xa_binh_xa	74	xã	Bình Xa
1114	2407	xa_thai_son	74	xã	Thái Sơn
1115	2410	xa_nhan_muc	74	xã	Nhân Mục
1116	2413	xa_thanh_long	74	xã	Thành Long
1117	2416	xa_bang_coc	74	xã	Bằng Cốc
1118	2419	xa_thai_hoa	74	xã	Thái Hòa
1119	2422	xa_duc_ninh	74	xã	Đức Ninh
1120	2425	xa_hung_duc	74	xã	Hùng Đức
1121	2431	xa_qui_quan	75	xã	Quí Quân
1122	2434	xa_luc_hanh	75	xã	Lực Hành
1123	2437	xa_kien_thiet	75	xã	Kiến Thiết
1124	2440	xa_trung_minh	75	xã	Trung Minh
1125	2443	xa_chieu_yen	75	xã	Chiêu Yên
1126	2446	xa_trung_truc	75	xã	Trung Trực
1127	2449	xa_xuan_van	75	xã	Xuân Vân
1128	2452	xa_phuc_ninh	75	xã	Phúc Ninh
1129	2455	xa_hung_loi	75	xã	Hùng Lợi
1130	2458	xa_trung_son	75	xã	Trung Sơn
1131	2461	xa_tan_tien	75	xã	Tân Tiến
1132	2464	xa_tu_quan	75	xã	Tứ Quận
1133	2467	xa_dao_vien	75	xã	Đạo Viện
1134	2470	xa_tan_long	75	xã	Tân Long
1135	2473	xa_thang_quan	75	xã	Thắng Quân
1136	2476	xa_kim_quan	75	xã	Kim Quan
1137	2479	xa_lang_quan	75	xã	Lang Quán
1138	2482	xa_phu_thinh	75	xã	Phú Thịnh
1139	2485	xa_cong_da	75	xã	Công Đa
1140	2488	xa_trung_mon	75	xã	Trung Môn
1141	2491	xa_chan_son	75	xã	Chân Sơn
1142	2494	xa_thai_binh	75	xã	Thái Bình
1143	2500	xa_tien_bo	75	xã	Tiến Bộ
1144	2506	xa_my_bang	75	xã	Mỹ Bằng
1145	2518	xa_hoang_khai	75	xã	Hoàng Khai
1146	2527	xa_nhu_han	75	xã	Nhữ Hán
1147	2530	xa_nhu_khe	75	xã	Nhữ Khê
1148	2533	xa_doi_binh	75	xã	Đội Bình
1149	2536	thi_tran_son_duong	76	thị trấn	Sơn Dương
1150	2539	xa_trung_yen	76	xã	Trung Yên
1151	2542	xa_minh_thanh	76	xã	Minh Thanh
1152	2545	xa_tan_trao	76	xã	Tân Trào
1153	2548	xa_vinh_loi	76	xã	Vĩnh Lợi
1154	2551	xa_thuong_am	76	xã	Thượng Ấm
1155	2554	xa_binh_yen	76	xã	Bình Yên
1156	2557	xa_luong_thien	76	xã	Lương Thiện
1157	2560	xa_tu_thinh	76	xã	Tú Thịnh
1158	2563	xa_cap_tien	76	xã	Cấp Tiến
1159	2566	xa_hop_thanh	76	xã	Hợp Thành
1160	2569	xa_phuc_ung	76	xã	Phúc Ứng
1161	2572	xa_dong_tho	76	xã	Đông Thọ
1162	2575	xa_khang_nhat	76	xã	Kháng Nhật
1163	2578	xa_hop_hoa	76	xã	Hợp Hòa
1164	2584	xa_quyet_thang	76	xã	Quyết Thắng
1165	2587	xa_dong_quy	76	xã	Đồng Quý
1166	2590	xa_tan_thanh	76	xã	Tân Thanh
1167	2593	xa_van_son	76	xã	Vân Sơn
1168	2596	xa_van_phu	76	xã	Văn Phú
1169	2599	xa_chi_thiet	76	xã	Chi Thiết
1170	2602	xa_dong_loi	76	xã	Đông Lợi
1171	2605	xa_thien_ke	76	xã	Thiện Kế
1172	2608	xa_hong_lac	76	xã	Hồng Lạc
1173	2611	xa_phu_luong	76	xã	Phú Lương
1174	2614	xa_ninh_lai	76	xã	Ninh Lai
1175	2617	xa_dai_phu	76	xã	Đại Phú
1176	2620	xa_son_nam	76	xã	Sơn Nam
1177	2623	xa_hao_phu	76	xã	Hào Phú
1178	2626	xa_tam_da	76	xã	Tam Đa
1179	2632	xa_truong_sinh	76	xã	Trường Sinh
1180	2635	phuong_duyen_hai	80	phường	Duyên Hải
1181	2641	phuong_lao_cai	80	phường	Lào Cai
1182	2644	phuong_coc_leu	80	phường	Cốc Lếu
1183	2647	phuong_kim_tan	80	phường	Kim Tân
1184	2650	phuong_bac_lenh	80	phường	Bắc Lệnh
1185	2653	phuong_pom_han	80	phường	Pom Hán
1186	2656	phuong_xuan_tang	80	phường	Xuân Tăng
1187	2658	phuong_binh_minh	80	phường	Bình Minh
1188	2659	xa_thong_nhat	80	xã	Thống Nhất
1189	2662	xa_dong_tuyen	80	xã	Đồng Tuyển
1190	2665	xa_van_hoa	80	xã	Vạn Hoà
1191	2668	phuong_bac_cuong	80	phường	Bắc Cường
1192	2671	phuong_nam_cuong	80	phường	Nam Cường
1193	2674	xa_cam_duong	80	xã	Cam Đường
1194	2677	xa_ta_phoi	80	xã	Tả Phời
1195	2680	xa_hop_thanh	80	xã	Hợp Thành
1196	2746	xa_coc_san	80	xã	Cốc San
1197	2683	thi_tran_bat_xat	82	thị trấn	Bát Xát
1198	2686	xa_a_mu_sung	82	xã	Mú Sung
1199	2689	xa_nam_chac	82	xã	Nậm Chạc
1200	2692	xa_a_lu	82	xã	A Lù
1201	2695	xa_trinh_tuong	82	xã	Trịnh Tường
1202	2701	xa_y_ty	82	xã	Y Tý
1203	2704	xa_coc_my	82	xã	Cốc Mỳ
1204	2707	xa_den_sang	82	xã	Dền Sáng
1205	2710	xa_ban_vuoc	82	xã	Bản Vược
1206	2713	xa_sang_ma_sao	82	xã	Ma Sáo
1207	2716	xa_ban_qua	82	xã	Bản Qua
1208	2719	xa_muong_vi	82	xã	Mường Vi
1209	2722	xa_den_thang	82	xã	Dền Thàng
1210	2725	xa_ban_xeo	82	xã	Bản Xèo
1211	2728	xa_muong_hum	82	xã	Mường Hum
1212	2731	xa_trung_leng_ho	82	xã	Lèng Hồ
1213	2734	xa_quang_kim	82	xã	Quang Kim
1214	2737	xa_pa_cheo	82	xã	Pa Cheo
1215	2740	xa_nam_pung	82	xã	Nậm Pung
1216	2743	xa_phin_ngan	82	xã	Phìn Ngan
1217	2749	xa_tong_sanh	82	xã	Tòng Sành
1218	2752	xa_pha_long	83	xã	Pha Long
1219	2755	xa_ta_ngai_cho	83	xã	Ngải Chồ
1220	2758	xa_tung_chung_pho	83	xã	Chung Phố
1221	2761	thi_tran_muong_khuong	83	thị trấn	Mường Khương
1222	2764	xa_din_chin	83	xã	Dìn Chin
1223	2767	xa_ta_gia_khau	83	xã	Gia Khâu
1224	2770	xa_nam_chay	83	xã	Nậm Chảy
1225	2773	xa_nam_lu	83	xã	Nấm Lư
1226	2776	xa_lung_khau_nhin	83	xã	Khấu Nhin
1227	2779	xa_thanh_binh	83	xã	Thanh Bình
1228	2782	xa_cao_son	83	xã	Cao Sơn
1229	2785	xa_lung_vai	83	xã	Lùng Vai
1230	2788	xa_ban_lau	83	xã	Bản Lầu
1231	2791	xa_la_pan_tan	83	xã	Pan Tẩn
1232	2794	xa_ta_thang	83	xã	Tả Thàng
1233	2797	xa_ban_sen	83	xã	Bản Sen
1234	2800	xa_nan_san	84	xã	Nàn Sán
1235	2803	xa_thao_chu_phin	84	xã	Chư Phìn
1236	2806	xa_ban_me	84	xã	Bản Mế
1237	2809	thi_tran_si_ma_cai	84	thị trấn	Ma Cai
1238	2812	xa_san_chai	84	xã	Sán Chải
1239	2818	xa_lung_than	84	xã	Lùng Thẩn
1240	2821	xa_can_cau	84	xã	Cán Cấu
1241	2824	xa_sin_cheng	84	xã	Sín Chéng
1242	2827	xa_quan_ho_than	84	xã	Hồ Thẩn
1243	2836	xa_nan_xin	84	xã	Nàn Xín
1244	2839	thi_tran_bac_ha	85	thị trấn	Bắc Hà
1245	2842	xa_lung_cai	85	xã	Lùng Cải
1246	2848	xa_lung_phinh	85	xã	Lùng Phình
1247	2851	xa_ta_van_chu	85	xã	Van Chư
1248	2854	xa_ta_cu_ty	85	xã	Củ Tỷ
1249	2857	xa_thai_giang_pho	85	xã	Giàng Phố
1250	2863	xa_hoang_thu_pho	85	xã	Thu Phố
1251	2866	xa_ban_pho	85	xã	Bản Phố
1252	2869	xa_ban_lien	85	xã	Bản Liền
1253	2872	xa_ta_chai	85	xã	Tà Chải
1254	2875	xa_na_hoi	85	xã	Na Hối
1255	2878	xa_coc_ly	85	xã	Cốc Ly
1256	2881	xa_nam_mon	85	xã	Nậm Mòn
1257	2884	xa_nam_det	85	xã	Nậm Đét
1258	2887	xa_nam_khanh	85	xã	Nậm Khánh
1259	2890	xa_bao_nhai	85	xã	Bảo Nhai
1260	2893	xa_nam_luc	85	xã	Nậm Lúc
1261	2896	xa_coc_lau	85	xã	Cốc Lầu
1262	2899	xa_ban_cai	85	xã	Bản Cái
1263	2902	thi_tran_n_t_phong_hai	86	thị trấn	Phong Hải
1264	2905	thi_tran_pho_lu	86	thị trấn	Phố Lu
1265	2908	thi_tran_tang_loong	86	thị trấn	Tằng Loỏng
1266	2911	xa_ban_phiet	86	xã	Bản Phiệt
1267	2914	xa_ban_cam	86	xã	Bản Cầm
1268	2917	xa_thai_nien	86	xã	Thái Niên
1269	2920	xa_phong_nien	86	xã	Phong Niên
1270	2923	xa_gia_phu	86	xã	Gia Phú
1271	2926	xa_xuan_quang	86	xã	Xuân Quang
1272	2929	xa_son_hai	86	xã	Sơn Hải
1273	2932	xa_xuan_giao	86	xã	Xuân Giao
1274	2935	xa_tri_quang	86	xã	Trì Quang
1275	2938	xa_son_ha	86	xã	Sơn Hà
1276	2944	xa_phu_nhuan	86	xã	Phú Nhuận
1277	2947	thi_tran_pho_rang	87	thị trấn	Phố Ràng
1278	2950	xa_tan_tien	87	xã	Tân Tiến
1279	2953	xa_nghia_do	87	xã	Nghĩa Đô
1280	2956	xa_vinh_yen	87	xã	Vĩnh Yên
1281	2959	xa_dien_quan	87	xã	Điện Quan
1282	2962	xa_xuan_hoa	87	xã	Xuân Hoà
1283	2965	xa_tan_duong	87	xã	Tân Dương
1284	2968	xa_thuong_ha	87	xã	Thượng Hà
1285	2971	xa_kim_son	87	xã	Kim Sơn
1286	2974	xa_cam_con	87	xã	Cam Cọn
1287	2977	xa_minh_tan	87	xã	Minh Tân
1288	2980	xa_xuan_thuong	87	xã	Xuân Thượng
1289	2983	xa_viet_tien	87	xã	Việt Tiến
1290	2986	xa_yen_son	87	xã	Yên Sơn
1291	2989	xa_bao_ha	87	xã	Bảo Hà
1292	2992	xa_luong_son	87	xã	Lương Sơn
1293	2998	xa_phuc_khanh	87	xã	Phúc Khánh
1294	3001	phuong_sa_pa	88	phường	Sa Pa
1295	3002	phuong_sa_pa	88	phường	Sa Pả
1296	3003	phuong_o_quy_ho	88	phường	Quý Hồ
1297	3004	xa_ngu_chi_son	88	xã	Chỉ Sơn
1298	3006	phuong_phan_si_pang	88	phường	Si Păng
1299	3010	xa_trung_chai	88	xã	Trung Chải
1300	3013	xa_ta_phin	88	xã	Tả Phìn
1301	3016	phuong_ham_rong	88	phường	Hàm Rồng
1302	3019	xa_hoang_lien	88	xã	Hoàng Liên
1303	3022	xa_thanh_binh	88	xã	Thanh Bình
1304	3028	phuong_cau_may	88	phường	Cầu Mây
1305	3037	xa_muong_hoa	88	xã	Mường Hoa
1306	3040	xa_ta_van	88	xã	Tả Van
1307	3043	xa_muong_bo	88	xã	Mường Bo
1308	3046	xa_ban_ho	88	xã	Bản Hồ
1309	3052	xa_lien_minh	88	xã	Liên Minh
1310	3055	thi_tran_khanh_yen	89	thị trấn	Khánh Yên
1311	3061	xa_vo_lao	89	xã	Võ Lao
1312	3064	xa_son_thuy	89	xã	Sơn Thuỷ
1313	3067	xa_nam_ma	89	xã	Nậm Mả
1314	3070	xa_tan_thuong	89	xã	Tân Thượng
1315	3073	xa_nam_rang	89	xã	Nậm Rạng
1316	3076	xa_nam_chay	89	xã	Nậm Chầy
1317	3079	xa_tan_an	89	xã	Tân An
1318	3082	xa_khanh_yen_thuong	89	xã	Yên Thượng
1319	3085	xa_nam_xe	89	xã	Nậm Xé
1320	3088	xa_dan_thang	89	xã	Dần Thàng
1321	3091	xa_chieng_ken	89	xã	Chiềng Ken
1322	3094	xa_lang_giang	89	xã	Làng Giàng
1323	3097	xa_hoa_mac	89	xã	Hoà Mạc
1324	3100	xa_khanh_yen_trung	89	xã	Yên Trung
1325	3103	xa_khanh_yen_ha	89	xã	Yên Hạ
1326	3106	xa_duong_quy	89	xã	Dương Quỳ
1327	3109	xa_nam_tha	89	xã	Nậm Tha
1328	3112	xa_minh_luong	89	xã	Minh Lương
1329	3115	xa_tham_duong	89	xã	Thẩm Dương
1330	3118	xa_liem_phu	89	xã	Liêm Phú
1331	3121	xa_nam_xay	89	xã	Nậm Xây
1332	3124	phuong_noong_bua	94	phường	Noong Bua
1333	3127	phuong_him_lam	94	phường	Him Lam
1334	3130	phuong_thanh_binh	94	phường	Thanh Bình
1335	3133	phuong_tan_thanh	94	phường	Tân Thanh
1336	3136	phuong_muong_thanh	94	phường	Mường Thanh
1337	3139	phuong_nam_thanh	94	phường	Nam Thanh
1338	3142	phuong_thanh_truong	94	phường	Thanh Trường
1339	3145	xa_thanh_minh	94	xã	Thanh Minh
1340	3316	xa_na_tau	94	xã	Nà Tấu
1341	3317	xa_na_nhan	94	xã	Nà Nhạn
1342	3325	xa_muong_phang	94	xã	Mường Phăng
1343	3326	xa_pa_khoang	94	xã	Pá Khoang
1344	3148	phuong_song_da	95	phường	Sông Đà
1345	3151	phuong_na_lay	95	phường	Na Lay
1346	3184	xa_lay_nua	95	xã	Lay Nưa
1347	3154	xa_sin_thau	96	xã	Sín Thầu
1348	3155	xa_sen_thuong	96	xã	Sen Thượng
1349	3157	xa_chung_chai	96	xã	Chung Chải
1350	3158	xa_leng_su_sin	96	xã	Su Sìn
1351	3159	xa_pa_my	96	xã	Pá Mỳ
1352	3160	xa_muong_nhe	96	xã	Mường Nhé
1353	3161	xa_nam_vi	96	xã	Nậm Vì
1354	3162	xa_nam_ke	96	xã	Nậm Kè
1355	3163	xa_muong_toong	96	xã	Mường Toong
1356	3164	xa_quang_lam	96	xã	Quảng Lâm
1357	3177	xa_huoi_lenh	96	xã	Huổi Lếnh
1358	3172	thi_tran_muong_cha	97	thị trấn	Mường Chà
1359	3178	xa_xa_tong	97	xã	Xá Tổng
1360	3181	xa_muong_tung	97	xã	Mường Tùng
1361	3190	xa_hua_ngai	97	xã	Hừa Ngài
1362	3191	xa_huoi_mi	97	xã	Huổi Mí
1363	3193	xa_pa_ham	97	xã	Pa Ham
1364	3194	xa_nam_nen	97	xã	Nậm Nèn
1365	3196	xa_huoi_leng	97	xã	Huổi Lèng
1366	3197	xa_sa_long	97	xã	Sa Lông
1367	3200	xa_ma_thi_ho	97	xã	Thì Hồ
1368	3201	xa_na_sang	97	xã	Na Sang
1369	3202	xa_muong_muon	97	xã	Mường Mươn
1370	3217	thi_tran_tua_chua	98	thị trấn	Tủa Chùa
1371	3220	xa_huoi_so	98	xã	Huổi Só
1372	3223	xa_xin_chai	98	xã	Xín Chải
1373	3226	xa_ta_sin_thang	98	xã	Sìn Thàng
1374	3229	xa_lao_xa_phinh	98	xã	Xả Phình
1375	3232	xa_ta_phin	98	xã	Tả Phìn
1376	3235	xa_tua_thang	98	xã	Tủa Thàng
1377	3238	xa_trung_thu	98	xã	Trung Thu
1378	3241	xa_sinh_phinh	98	xã	Sính Phình
1379	3244	xa_sang_nhe	98	xã	Sáng Nhè
1380	3247	xa_muong_dun	98	xã	Mường Đun
1381	3250	xa_muong_bang	98	xã	Mường Báng
1382	3253	thi_tran_tuan_giao	99	thị trấn	Tuần Giáo
1383	3259	xa_phinh_sang	99	xã	Phình Sáng
1384	3260	xa_rang_dong	99	xã	Rạng Đông
1385	3262	xa_mun_chung	99	xã	Mùn Chung
1386	3263	xa_na_tong	99	xã	Nà Tòng
1387	3265	xa_ta_ma	99	xã	Ta Ma
1388	3268	xa_muong_mun	99	xã	Mường Mùn
1389	3269	xa_pu_xi	99	xã	Pú Xi
1390	3271	xa_pu_nhung	99	xã	Pú Nhung
1391	3274	xa_quai_nua	99	xã	Quài Nưa
1392	3277	xa_muong_thin	99	xã	Mường Thín
1393	3280	xa_toa_tinh	99	xã	Tỏa Tình
1394	3283	xa_na_say	99	xã	Nà Sáy
1395	3284	xa_muong_khong	99	xã	Mường Khong
1396	3289	xa_quai_cang	99	xã	Quài Cang
1397	3295	xa_quai_to	99	xã	Quài Tở
1398	3298	xa_chieng_sinh	99	xã	Chiềng Sinh
1399	3299	xa_chieng_dong	99	xã	Chiềng Đông
1400	3304	xa_tenh_phong	99	xã	Tênh Phông
1401	3319	xa_muong_pon	100	xã	Mường Pồn
1402	3322	xa_thanh_nua	100	xã	Thanh Nưa
1403	3323	xa_hua_thanh	100	xã	Hua Thanh
1404	3328	xa_thanh_luong	100	xã	Thanh Luông
1405	3331	xa_thanh_hung	100	xã	Thanh Hưng
1406	3334	xa_thanh_xuong	100	xã	Thanh Xương
1407	3337	xa_thanh_chan	100	xã	Thanh Chăn
1408	3340	xa_pa_thom	100	xã	Pa Thơm
1409	3343	xa_thanh_an	100	xã	Thanh An
1410	3346	xa_thanh_yen	100	xã	Thanh Yên
1411	3349	xa_noong_luong	100	xã	Noong Luống
1412	3352	xa_noong_het	100	xã	Noọng Hẹt
1413	3355	xa_sam_mun	100	xã	Sam Mứn
1414	3356	xa_pom_lot	100	xã	Pom Lót
1415	3358	xa_nua_ngam	100	xã	Núa Ngam
1416	3359	xa_he_muong	100	xã	Hẹ Muông
1417	3361	xa_na_u	100	xã	Na Ư
1418	3364	xa_muong_nha	100	xã	Mường Nhà
1419	3365	xa_na_tong	100	xã	Na Tông
1420	3367	xa_muong_loi	100	xã	Mường Lói
1421	3368	xa_phu_luong	100	xã	Phu Luông
1422	3203	thi_tran_dien_bien_dong	101	thị trấn	Biên Đông
1423	3205	xa_na_son	101	xã	Na Son
1424	3208	xa_phi_nhu	101	xã	Phì Nhừ
1425	3211	xa_chieng_so	101	xã	Chiềng Sơ
1426	3214	xa_muong_luan	101	xã	Mường Luân
1427	3370	xa_pu_nhi	101	xã	Pú Nhi
1428	3371	xa_nong_u	101	xã	Nong U
1429	3373	xa_xa_dung	101	xã	Xa Dung
1430	3376	xa_keo_lom	101	xã	Keo Lôm
1431	3379	xa_luan_gioi	101	xã	Luân Giới
1432	3382	xa_phinh_giang	101	xã	Phình Giàng
1433	3383	xa_pu_hong	101	xã	Pú Hồng
1434	3384	xa_tia_dinh	101	xã	Tìa Dình
1435	3385	xa_hang_lia	101	xã	Háng Lìa
1436	3256	thi_tran_muong_ang	102	thị trấn	Mường Ảng
1437	3286	xa_muong_dang	102	xã	Mường Đăng
1438	3287	xa_ngoi_cay	102	xã	Ngối Cáy
1439	3292	xa_ang_to	102	xã	Ẳng Tở
1440	3301	xa_bung_lao	102	xã	Búng Lao
1441	3302	xa_xuan_lao	102	xã	Xuân Lao
1442	3307	xa_ang_nua	102	xã	Ẳng Nưa
1443	3310	xa_ang_cang	102	xã	Ẳng Cang
1444	3312	xa_nam_lich	102	xã	Nặm Lịch
1445	3313	xa_muong_lan	102	xã	Mường Lạn
1446	3156	xa_nam_tin	103	xã	Nậm Tin
1447	3165	xa_pa_tan	103	xã	Pa Tần
1448	3166	xa_cha_cang	103	xã	Chà Cang
1449	3167	xa_na_co_sa	103	xã	Cô Sa
1450	3168	xa_na_khoa	103	xã	Nà Khoa
1451	3169	xa_na_hy	103	xã	Nà Hỳ
1452	3170	xa_na_bung	103	xã	Nà Bủng
1453	3171	xa_nam_nhu	103	xã	Nậm Nhừ
1454	3173	xa_nam_chua	103	xã	Nậm Chua
1455	3174	xa_nam_khan	103	xã	Nậm Khăn
1456	3175	xa_cha_to	103	xã	Chà Tở
1457	3176	xa_vang_dan	103	xã	Vàng Đán
1458	3187	xa_cha_nua	103	xã	Chà Nưa
1459	3198	xa_phin_ho	103	xã	Phìn Hồ
1460	3199	xa_si_pa_phin	103	xã	Pa Phìn
1461	3386	phuong_quyet_thang	105	phường	Quyết Thắng
1462	3387	phuong_tan_phong	105	phường	Tân Phong
1463	3388	phuong_quyet_tien	105	phường	Quyết Tiến
1464	3389	phuong_doan_ket	105	phường	Đoàn Kết
1465	3403	xa_sung_phai	105	xã	Sùng Phài
1466	3408	phuong_dong_phong	105	phường	Đông Phong
1467	3409	xa_san_thang	105	xã	San Thàng
1468	3390	thi_tran_tam_duong	106	thị trấn	Tam Đường
1469	3394	xa_then_sin	106	xã	Thèn Sin
1470	3400	xa_ta_leng	106	xã	Tả Lèng
1471	3405	xa_giang_ma	106	xã	Giang Ma
1472	3406	xa_ho_thau	106	xã	Hồ Thầu
1473	3412	xa_binh_lu	106	xã	Bình Lư
1474	3413	xa_son_binh	106	xã	Sơn Bình
1475	3415	xa_nung_nang	106	xã	Nùng Nàng
1476	3418	xa_ban_giang	106	xã	Bản Giang
1477	3421	xa_ban_hon	106	xã	Bản Hon
1478	3424	xa_ban_bo	106	xã	Bản Bo
1479	3427	xa_na_tam	106	xã	Nà Tăm
1480	3430	xa_khun_ha	106	xã	Khun Há
1481	3433	thi_tran_muong_te	107	thị trấn	Mường Tè
1482	3436	xa_thu_lum	107	xã	Thu Lũm
1483	3439	xa_ka_lang	107	xã	Ka Lăng
1484	3440	xa_ta_ba	107	xã	Tá Bạ
1485	3442	xa_pa_u	107	xã	Xã Pa ủ
1486	3445	xa_muong_te	107	xã	Mường Tè
1487	3448	xa_pa_ve_su	107	xã	Vệ Sử
1488	3451	xa_mu_ca	107	xã	Mù Cả
1489	3454	xa_bum_to	107	xã	Bum Tở
1490	3457	xa_nam_khao	107	xã	Nậm Khao
1491	3463	xa_ta_tong	107	xã	Tà Tổng
1492	3466	xa_bum_nua	107	xã	Bum Nưa
1493	3467	xa_vang_san	107	xã	Vàng San
1494	3469	xa_kan_ho	107	xã	Kan Hồ
1495	3478	thi_tran_sin_ho	108	thị trấn	Sìn Hồ
1496	3487	xa_chan_nua	108	xã	Chăn Nưa
1497	3493	xa_pa_tan	108	xã	Pa Tần
1498	3496	xa_phin_ho	108	xã	Phìn Hồ
1499	3499	xa_hong_thu	108	xã	Hồng Thu
1500	3505	xa_phang_so_lin	108	xã	Sô Lin
1501	3508	xa_ma_quai	108	xã	Ma Quai
1502	3509	xa_lung_thang	108	xã	Lùng Thàng
1503	3511	xa_ta_phin	108	xã	Tả Phìn
1504	3514	xa_sa_de_phin	108	xã	Dề Phìn
1505	3517	xa_nam_tam	108	xã	Nậm Tăm
1506	3520	xa_ta_ngao	108	xã	Tả Ngảo
1507	3523	xa_pu_sam_cap	108	xã	Sam Cáp
1508	3526	xa_nam_cha	108	xã	Nậm Cha
1509	3527	xa_pa_khoa	108	xã	Pa Khoá
1510	3529	xa_lang_mo	108	xã	Làng Mô
1511	3532	xa_noong_heo	108	xã	Noong Hẻo
1512	3535	xa_nam_ma	108	xã	Nậm Mạ
1513	3538	xa_can_co	108	xã	Căn Co
1514	3541	xa_tua_sin_chai	108	xã	Sín Chải
1515	3544	xa_nam_cuoi	108	xã	Nậm Cuổi
1516	3547	xa_nam_han	108	xã	Nậm Hăn
1517	3391	xa_la_nhi_thang	109	xã	Nhì Thàng
1518	3490	xa_huoi_luong	109	xã	Huổi Luông
1519	3549	thi_tran_phong_tho	109	thị trấn	Phong Thổ
1520	3550	xa_si_lo_lau	109	xã	Lở Lầu
1521	3553	xa_mo_si_san	109	xã	Sì San
1522	3559	xa_pa_vay_su	109	xã	Vây Sử
1523	3562	xa_vang_ma_chai	109	xã	Ma Chải
1524	3565	xa_tong_qua_lin	109	xã	Qua Lìn
1525	3568	xa_mu_sang	109	xã	Mù Sang
1526	3571	xa_dao_san	109	xã	Dào San
1527	3574	xa_ma_ly_pho	109	xã	Ly Pho
1528	3577	xa_ban_lang	109	xã	Bản Lang
1529	3580	xa_hoang_then	109	xã	Hoang Thèn
1530	3583	xa_khong_lao	109	xã	Khổng Lào
1531	3586	xa_nam_xe	109	xã	Nậm Xe
1532	3589	xa_muong_so	109	xã	Mường So
1533	3592	xa_sin_suoi_ho	109	xã	Suối Hồ
1534	3595	thi_tran_than_uyen	110	thị trấn	Than Uyên
1535	3618	xa_phuc_than	110	xã	Phúc Than
1536	3619	xa_muong_than	110	xã	Mường Than
1537	3625	xa_muong_mit	110	xã	Mường Mít
1538	3628	xa_pha_mu	110	xã	Pha Mu
1539	3631	xa_muong_cang	110	xã	Mường Cang
1540	3632	xa_hua_na	110	xã	Hua Nà
1541	3634	xa_ta_hua	110	xã	Tà Hừa
1542	3637	xa_muong_kim	110	xã	Mường Kim
1543	3638	xa_ta_mung	110	xã	Tà Mung
1544	3640	xa_ta_gia	110	xã	Tà Gia
1545	3643	xa_khoen_on	110	xã	Khoen On
1546	3598	thi_tran_tan_uyen	111	thị trấn	Tân Uyên
1547	3601	xa_muong_khoa	111	xã	Mường Khoa
1548	3602	xa_phuc_khoa	111	xã	Phúc Khoa
1549	3604	xa_than_thuoc	111	xã	Thân Thuộc
1550	3605	xa_trung_dong	111	xã	Trung Đồng
1551	3607	xa_ho_mit	111	xã	Hố Mít
1552	3610	xa_nam_can	111	xã	Nậm Cần
1553	3613	xa_nam_so	111	xã	Nậm Sỏ
1554	3616	xa_pac_ta	111	xã	Pắc Ta
1555	3622	xa_ta_mit	111	xã	Tà Mít
1556	3434	thi_tran_nam_nhun	112	thị trấn	Nậm Nhùn
1557	3460	xa_hua_bun	112	xã	Hua Bun
1558	3472	xa_muong_mo	112	xã	Mường Mô
1559	3473	xa_nam_cha	112	xã	Nậm Chà
1560	3474	xa_nam_manh	112	xã	Nậm Manh
1561	3475	xa_nam_hang	112	xã	Nậm Hàng
1562	3481	xa_le_loi	112	xã	Lê Lợi
1563	3484	xa_pu_dao	112	xã	Pú Đao
1564	3488	xa_nam_pi	112	xã	Nậm Pì
1565	3502	xa_nam_ban	112	xã	Nậm Ban
1566	3503	xa_trung_chai	112	xã	Trung Chải
1567	3646	phuong_chieng_le	116	phường	Chiềng Lề
1568	3649	phuong_to_hieu	116	phường	Tô Hiệu
1569	3652	phuong_quyet_thang	116	phường	Quyết Thắng
1570	3655	phuong_quyet_tam	116	phường	Quyết Tâm
1571	3658	xa_chieng_co	116	xã	Chiềng Cọ
1572	3661	xa_chieng_den	116	xã	Chiềng Đen
1573	3664	xa_chieng_xom	116	xã	Chiềng Xôm
1574	3667	phuong_chieng_an	116	phường	Chiềng An
1575	3670	phuong_chieng_coi	116	phường	Chiềng Cơi
1576	3673	xa_chieng_ngan	116	xã	Chiềng Ngần
1577	3676	xa_hua_la	116	xã	Hua La
1578	3679	phuong_chieng_sinh	116	phường	Chiềng Sinh
1579	3682	xa_muong_chien	118	xã	Mường Chiên
1580	3685	xa_ca_nang	118	xã	Cà Nàng
1581	3688	xa_chieng_khay	118	xã	Chiềng Khay
1582	3694	xa_muong_gion	118	xã	Mường Giôn
1583	3697	xa_pa_ma_pha_khinh	118	xã	Pha Khinh
1584	3700	xa_chieng_on	118	xã	Chiềng Ơn
1585	3703	xa_muong_giang	118	xã	Mường Giàng
1586	3706	xa_chieng_bang	118	xã	Chiềng Bằng
1587	3709	xa_muong_sai	118	xã	Mường Sại
1588	3712	xa_nam_et	118	xã	Xã Nậm ét
1589	3718	xa_chieng_khoang	118	xã	Chiềng Khoang
1590	3721	thi_tran_thuan_chau	119	thị trấn	Thuận Châu
1591	3724	xa_phong_lai	119	xã	Phổng Lái
1592	3727	xa_muong_e	119	xã	Xã Mường é
1593	3730	xa_chieng_pha	119	xã	Chiềng Pha
1594	3733	xa_chieng_la	119	xã	Chiềng La
1595	3736	xa_chieng_ngam	119	xã	Chiềng Ngàm
1596	3739	xa_liep_te	119	xã	Liệp Tè
1597	3742	xa_e_tong	119	xã	Xã é Tòng
1598	3745	xa_phong_lap	119	xã	Phổng Lập
1599	3748	xa_phong_lang	119	xã	Phổng Lăng
1600	3751	xa_chieng_ly	119	xã	Chiềng Ly
1601	3754	xa_noong_lay	119	xã	Noong Lay
1602	3757	xa_muong_khieng	119	xã	Mường Khiêng
1603	3760	xa_muong_bam	119	xã	Mường Bám
1604	3763	xa_long_he	119	xã	Long Hẹ
1605	3766	xa_chieng_bom	119	xã	Chiềng Bôm
1606	3769	xa_thom_mon	119	xã	Thôm Mòn
1607	3772	xa_tong_lanh	119	xã	Tông Lạnh
1608	3775	xa_tong_co	119	xã	Tông Cọ
1609	3778	xa_bo_muoi	119	xã	Bó Mười
1610	3781	xa_co_ma	119	xã	Co Mạ
1611	3784	xa_pung_tra	119	xã	Púng Tra
1612	3787	xa_chieng_pac	119	xã	Chiềng Pấc
1613	3790	xa_nam_lau	119	xã	Nậm Lầu
1614	3793	xa_bon_phang	119	xã	Bon Phặng
1615	3796	xa_co_tong	119	xã	Co Tòng
1616	3799	xa_muoi_noi	119	xã	Muổi Nọi
1617	3802	xa_pa_long	119	xã	Pá Lông
1618	3805	xa_ban_lam	119	xã	Bản Lầm
1619	3808	thi_tran_it_ong	120	thị trấn	Ít Ong
1620	3811	xa_nam_gion	120	xã	Nậm Giôn
1621	3814	xa_chieng_lao	120	xã	Chiềng Lao
1622	3817	xa_hua_trai	120	xã	Hua Trai
1623	3820	xa_ngoc_chien	120	xã	Ngọc Chiến
1624	3823	xa_muong_trai	120	xã	Mường Trai
1625	3826	xa_nam_pam	120	xã	Nậm Păm
1626	3829	xa_chieng_muon	120	xã	Chiềng Muôn
1627	3832	xa_chieng_an	120	xã	Chiềng Ân
1628	3835	xa_pi_toong	120	xã	Pi Toong
1629	3838	xa_chieng_cong	120	xã	Chiềng Công
1630	3841	xa_ta_bu	120	xã	Tạ Bú
1631	3844	xa_chieng_san	120	xã	Chiềng San
1632	3847	xa_muong_bu	120	xã	Mường Bú
1633	3850	xa_chieng_hoa	120	xã	Chiềng Hoa
1634	3853	xa_muong_chum	120	xã	Mường Chùm
1635	3856	thi_tran_bac_yen	121	thị trấn	Bắc Yên
1636	3859	xa_phieng_ban	121	xã	Phiêng Ban
1637	3862	xa_hang_chu	121	xã	Hang Chú
1638	3865	xa_xim_vang	121	xã	Xím Vàng
1639	3868	xa_ta_xua	121	xã	Tà Xùa
1640	3869	xa_hang_dong	121	xã	Háng Đồng
1641	3871	xa_pac_nga	121	xã	Pắc Ngà
1642	3874	xa_lang_cheu	121	xã	Làng Chếu
1643	3877	xa_chim_van	121	xã	Chim Vàn
1644	3880	xa_muong_khoa	121	xã	Mường Khoa
1645	3883	xa_song_pe	121	xã	Song Pe
1646	3886	xa_hong_ngai	121	xã	Hồng Ngài
1647	3889	xa_ta_khoa	121	xã	Tạ Khoa
1648	3890	xa_hua_nhan	121	xã	Hua Nhàn
1649	3892	xa_phieng_con	121	xã	Phiêng Côn
1650	3895	xa_chieng_sai	121	xã	Chiềng Sại
1651	3898	thi_tran_phu_yen	122	thị trấn	Phù Yên
1652	3901	xa_suoi_to	122	xã	Suối Tọ
1653	3904	xa_muong_thai	122	xã	Mường Thải
1654	3907	xa_muong_coi	122	xã	Mường Cơi
1655	3910	xa_quang_huy	122	xã	Quang Huy
1656	3913	xa_huy_bac	122	xã	Huy Bắc
1657	3916	xa_huy_thuong	122	xã	Huy Thượng
1658	3919	xa_tan_lang	122	xã	Tân Lang
1659	3922	xa_gia_phu	122	xã	Gia Phù
1660	3925	xa_tuong_phu	122	xã	Tường Phù
1661	3928	xa_huy_ha	122	xã	Huy Hạ
1662	3931	xa_huy_tan	122	xã	Huy Tân
1663	3934	xa_muong_lang	122	xã	Mường Lang
1664	3937	xa_suoi_bau	122	xã	Suối Bau
1665	3940	xa_huy_tuong	122	xã	Huy Tường
1666	3943	xa_muong_do	122	xã	Mường Do
1667	3946	xa_sap_xa	122	xã	Sập Xa
1668	3949	xa_tuong_thuong	122	xã	Tường Thượng
1669	3952	xa_tuong_tien	122	xã	Tường Tiến
1670	3955	xa_tuong_phong	122	xã	Tường Phong
1671	3958	xa_tuong_ha	122	xã	Tường Hạ
1672	3961	xa_kim_bon	122	xã	Kim Bon
1673	3964	xa_muong_bang	122	xã	Mường Bang
1674	3967	xa_da_do	122	xã	Đá Đỏ
1675	3970	xa_tan_phong	122	xã	Tân Phong
1676	3973	xa_nam_phong	122	xã	Nam Phong
1677	3976	xa_bac_phong	122	xã	Bắc Phong
1678	3979	thi_tran_moc_chau	123	thị trấn	Mộc Châu
1679	3982	thi_tran_nt_moc_chau	123	thị trấn	Mộc Châu
1680	3985	xa_chieng_son	123	xã	Chiềng Sơn
1681	3988	xa_tan_hop	123	xã	Tân Hợp
1682	3991	xa_qui_huong	123	xã	Qui Hướng
1683	3997	xa_tan_lap	123	xã	Tân Lập
1684	4000	xa_na_muong	123	xã	Nà Mường
1685	4003	xa_ta_lai	123	xã	Tà Lai
1686	4012	xa_chieng_hac	123	xã	Chiềng Hắc
1687	4015	xa_hua_pang	123	xã	Hua Păng
1688	4024	xa_chieng_khua	123	xã	Chiềng Khừa
1689	4027	xa_muong_sang	123	xã	Mường Sang
1690	4030	xa_dong_sang	123	xã	Đông Sang
1691	4033	xa_phieng_luong	123	xã	Phiêng Luông
1692	4045	xa_long_sap	123	xã	Lóng Sập
1693	4060	thi_tran_yen_chau	124	thị trấn	Yên Châu
1694	4063	xa_chieng_dong	124	xã	Chiềng Đông
1695	4066	xa_sap_vat	124	xã	Sập Vạt
1696	4069	xa_chieng_sang	124	xã	Chiềng Sàng
1697	4072	xa_chieng_pan	124	xã	Chiềng Pằn
1698	4075	xa_vieng_lan	124	xã	Viêng Lán
1699	4078	xa_chieng_hac	124	xã	Chiềng Hặc
1700	4081	xa_muong_lum	124	xã	Mường Lựm
1701	4084	xa_chieng_on	124	xã	Chiềng On
1702	4087	xa_yen_son	124	xã	Yên Sơn
1703	4090	xa_chieng_khoi	124	xã	Chiềng Khoi
1704	4093	xa_tu_nang	124	xã	Tú Nang
1705	4096	xa_long_phieng	124	xã	Lóng Phiêng
1706	4099	xa_phieng_khoai	124	xã	Phiêng Khoài
1707	4102	xa_chieng_tuong	124	xã	Chiềng Tương
1708	4105	thi_tran_hat_lot	125	thị trấn	Hát Lót
1709	4108	xa_chieng_sung	125	xã	Chiềng Sung
1710	4111	xa_muong_bang	125	xã	Mường Bằng
1711	4114	xa_chieng_chan	125	xã	Chiềng Chăn
1712	4117	xa_muong_chanh	125	xã	Mương Chanh
1713	4120	xa_chieng_ban	125	xã	Chiềng Ban
1714	4123	xa_chieng_mung	125	xã	Chiềng Mung
1715	4126	xa_muong_bon	125	xã	Mường Bon
1716	4129	xa_chieng_chung	125	xã	Chiềng Chung
1717	4132	xa_chieng_mai	125	xã	Chiềng Mai
1718	4135	xa_hat_lot	125	xã	Hát Lót
1719	4136	xa_na_po	125	xã	Nà Pó
1720	4138	xa_co_noi	125	xã	Cò Nòi
1721	4141	xa_chieng_noi	125	xã	Chiềng Nơi
1722	4144	xa_phieng_cam	125	xã	Phiêng Cằm
1723	4147	xa_chieng_dong	125	xã	Chiềng Dong
1724	4150	xa_chieng_kheo	125	xã	Chiềng Kheo
1725	4153	xa_chieng_ve	125	xã	Chiềng Ve
1726	4156	xa_chieng_luong	125	xã	Chiềng Lương
1727	4159	xa_phieng_pan	125	xã	Phiêng Pằn
1728	4162	xa_na_ot	125	xã	Nà Ơt
1729	4165	xa_ta_hoc	125	xã	Tà Hộc
1730	4168	thi_tran_song_ma	126	thị trấn	Sông Mã
1731	4171	xa_bo_sinh	126	xã	Bó Sinh
1732	4174	xa_pu_pau	126	xã	Pú Pẩu
1733	4177	xa_chieng_phung	126	xã	Chiềng Phung
1734	4180	xa_chieng_en	126	xã	Chiềng En
1735	4183	xa_muong_lam	126	xã	Mường Lầm
1736	4186	xa_nam_ty	126	xã	Nậm Ty
1737	4189	xa_dua_mon	126	xã	Đứa Mòn
1738	4192	xa_yen_hung	126	xã	Yên Hưng
1739	4195	xa_chieng_so	126	xã	Chiềng Sơ
1740	4198	xa_na_nghiu	126	xã	Nà Nghịu
1741	4201	xa_nam_man	126	xã	Nậm Mằn
1742	4204	xa_chieng_khoong	126	xã	Chiềng Khoong
1743	4207	xa_chieng_cang	126	xã	Chiềng Cang
1744	4210	xa_huoi_mot	126	xã	Huổi Một
1745	4213	xa_muong_sai	126	xã	Mường Sai
1746	4216	xa_muong_cai	126	xã	Mường Cai
1747	4219	xa_muong_hung	126	xã	Mường Hung
1748	4222	xa_chieng_khuong	126	xã	Chiềng Khương
1749	4225	xa_sam_kha	127	xã	Sam Kha
1750	4228	xa_pung_banh	127	xã	Púng Bánh
1751	4231	xa_sop_cop	127	xã	Sốp Cộp
1752	4234	xa_dom_cang	127	xã	Dồm Cang
1753	4237	xa_nam_lanh	127	xã	Nậm Lạnh
1754	4240	xa_muong_leo	127	xã	Mường Lèo
1755	4243	xa_muong_va	127	xã	Mường Và
1756	4246	xa_muong_lan	127	xã	Mường Lạn
1757	3994	xa_suoi_bang	128	xã	Suối Bàng
1758	4006	xa_song_khua	128	xã	Song Khủa
1759	4009	xa_lien_hoa	128	xã	Liên Hoà
1760	4018	xa_to_mua	128	xã	Tô Múa
1761	4021	xa_muong_te	128	xã	Mường Tè
1762	4036	xa_chieng_khoa	128	xã	Chiềng Khoa
1763	4039	xa_muong_men	128	xã	Mường Men
1764	4042	xa_quang_minh	128	xã	Quang Minh
1765	4048	xa_van_ho	128	xã	Vân Hồ
1766	4051	xa_long_luong	128	xã	Lóng Luông
1767	4054	xa_chieng_yen	128	xã	Chiềng Yên
1768	4056	xa_chieng_xuan	128	xã	Chiềng Xuân
1769	4057	xa_xuan_nha	128	xã	Xuân Nha
1770	4058	xa_tan_xuan	128	xã	Tân Xuân
1771	4249	phuong_yen_thinh	132	phường	Yên Thịnh
1772	4252	phuong_yen_ninh	132	phường	Yên Ninh
1773	4255	phuong_minh_tan	132	phường	Minh Tân
1774	4258	phuong_nguyen_thai_hoc	132	phường	Thái Học
1775	4261	phuong_dong_tam	132	phường	Đồng Tâm
1776	4264	phuong_nguyen_phuc	132	phường	Nguyễn Phúc
1777	4267	phuong_hong_ha	132	phường	Hồng Hà
1778	4270	xa_minh_bao	132	xã	Minh Bảo
1779	4273	phuong_nam_cuong	132	phường	Nam Cường
1780	4276	xa_tuy_loc	132	xã	Tuy Lộc
1781	4279	xa_tan_thinh	132	xã	Tân Thịnh
1782	4540	xa_au_lau	132	xã	Âu Lâu
1783	4543	xa_gioi_phien	132	xã	Giới Phiên
1784	4546	phuong_hop_minh	132	phường	Hợp Minh
1785	4558	xa_van_phu	132	xã	Văn Phú
1786	4282	phuong_pu_trang	133	phường	Pú Trạng
1787	4285	phuong_trung_tam	133	phường	Trung Tâm
1788	4288	phuong_tan_an	133	phường	Tân An
1789	4291	phuong_cau_thia	133	phường	Cầu Thia
1790	4294	xa_nghia_loi	133	xã	Nghĩa Lợi
1791	4297	xa_nghia_phuc	133	xã	Nghĩa Phúc
1792	4300	xa_nghia_an	133	xã	Nghĩa An
1793	4624	xa_nghia_lo	133	xã	Nghĩa Lộ
1794	4660	xa_son_a	133	xã	Sơn A
1795	4663	xa_phu_nham	133	xã	Phù Nham
1796	4675	xa_thanh_luong	133	xã	Thanh Lương
1797	4678	xa_hanh_son	133	xã	Hạnh Sơn
1798	4681	xa_phuc_son	133	xã	Phúc Sơn
1799	4684	xa_thach_luong	133	xã	Thạch Lương
1800	4303	thi_tran_yen_the	135	thị trấn	Yên Thế
1801	4306	xa_tan_phuong	135	xã	Tân Phượng
1802	4309	xa_lam_thuong	135	xã	Lâm Thượng
1803	4312	xa_khanh_thien	135	xã	Khánh Thiện
1804	4315	xa_minh_chuan	135	xã	Minh Chuẩn
1805	4318	xa_mai_son	135	xã	Mai Sơn
1806	4321	xa_khai_trung	135	xã	Khai Trung
1807	4324	xa_muong_lai	135	xã	Mường Lai
1808	4327	xa_an_lac	135	xã	An Lạc
1809	4330	xa_minh_xuan	135	xã	Minh Xuân
1810	4333	xa_to_mau	135	xã	Tô Mậu
1811	4336	xa_tan_linh	135	xã	Tân Lĩnh
1812	4339	xa_yen_thang	135	xã	Yên Thắng
1813	4342	xa_khanh_hoa	135	xã	Khánh Hoà
1814	4345	xa_vinh_lac	135	xã	Vĩnh Lạc
1815	4348	xa_lieu_do	135	xã	Liễu Đô
1816	4351	xa_dong_quan	135	xã	Động Quan
1817	4354	xa_tan_lap	135	xã	Tân Lập
1818	4357	xa_minh_tien	135	xã	Minh Tiến
1819	4360	xa_truc_lau	135	xã	Trúc Lâu
1820	4363	xa_phuc_loi	135	xã	Phúc Lợi
1821	4366	xa_phan_thanh	135	xã	Phan Thanh
1822	4369	xa_an_phu	135	xã	An Phú
1823	4372	xa_trung_tam	135	xã	Trung Tâm
1824	4375	thi_tran_mau_a	136	thị trấn	Mậu A
1825	4378	xa_lang_thip	136	xã	Lang Thíp
1826	4381	xa_lam_giang	136	xã	Lâm Giang
1827	4384	xa_chau_que_thuong	136	xã	Quế Thượng
1828	4387	xa_chau_que_ha	136	xã	Quế Hạ
1829	4390	xa_an_binh	136	xã	An Bình
1830	4393	xa_quang_minh	136	xã	Quang Minh
1831	4396	xa_dong_an	136	xã	Đông An
1832	4399	xa_dong_cuong	136	xã	Đông Cuông
1833	4402	xa_phong_du_ha	136	xã	Dụ Hạ
1834	4405	xa_mau_dong	136	xã	Mậu Đông
1835	4408	xa_ngoi_a	136	xã	Ngòi A
1836	4411	xa_xuan_tam	136	xã	Xuân Tầm
1837	4414	xa_tan_hop	136	xã	Tân Hợp
1838	4417	xa_an_thinh	136	xã	An Thịnh
1839	4420	xa_yen_thai	136	xã	Yên Thái
1840	4423	xa_phong_du_thuong	136	xã	Dụ Thượng
1841	4426	xa_yen_hop	136	xã	Yên Hợp
1842	4429	xa_dai_son	136	xã	Đại Sơn
1843	4435	xa_dai_phac	136	xã	Đại Phác
1844	4438	xa_yen_phu	136	xã	Yên Phú
1845	4441	xa_xuan_ai	136	xã	Xuân Ái
1846	4447	xa_vien_son	136	xã	Viễn Sơn
1847	4450	xa_mo_vang	136	xã	Mỏ Vàng
1848	4453	xa_na_hau	136	xã	Nà Hẩu
1849	4456	thi_tran_mu_cang_chai	137	thị trấn	Căng Chải
1850	4459	xa_ho_bon	137	xã	Hồ Bốn
1851	4462	xa_nam_co	137	xã	Nậm Có
1852	4465	xa_khao_mang	137	xã	Khao Mang
1853	4468	xa_mo_de	137	xã	Mồ Dề
1854	4471	xa_che_cu_nha	137	xã	Cu Nha
1855	4474	xa_lao_chai	137	xã	Lao Chải
1856	4477	xa_kim_noi	137	xã	Kim Nọi
1857	4480	xa_cao_pha	137	xã	Cao Phạ
1858	4483	xa_la_pan_tan	137	xã	Pán Tẩn
1859	4486	xa_de_su_phinh	137	xã	Su Phình
1860	4489	xa_che_tao	137	xã	Chế Tạo
1861	4492	xa_pung_luong	137	xã	Púng Luông
1862	4495	xa_nam_khat	137	xã	Nậm Khắt
1863	4498	thi_tran_co_phuc	138	thị trấn	Cổ Phúc
1864	4501	xa_tan_dong	138	xã	Tân Đồng
1865	4504	xa_bao_dap	138	xã	Báo Đáp
1866	4507	xa_dao_thinh	138	xã	Đào Thịnh
1867	4510	xa_viet_thanh	138	xã	Việt Thành
1868	4513	xa_hoa_cuong	138	xã	Hòa Cuông
1869	4516	xa_minh_quan	138	xã	Minh Quán
1870	4519	xa_quy_mong	138	xã	Quy Mông
1871	4522	xa_cuong_thinh	138	xã	Cường Thịnh
1872	4525	xa_kien_thanh	138	xã	Kiên Thành
1873	4528	xa_nga_quan	138	xã	Nga Quán
1874	4531	xa_y_can	138	xã	Y Can
1875	4537	xa_luong_thinh	138	xã	Lương Thịnh
1876	4561	xa_bao_hung	138	xã	Bảo Hưng
1877	4564	xa_viet_cuong	138	xã	Việt Cường
1878	4567	xa_minh_quan	138	xã	Minh Quân
1879	4570	xa_hong_ca	138	xã	Hồng Ca
1880	4573	xa_hung_thinh	138	xã	Hưng Thịnh
1881	4576	xa_hung_khanh	138	xã	Hưng Khánh
1882	4579	xa_viet_hong	138	xã	Việt Hồng
1883	4582	xa_van_hoi	138	xã	Vân Hội
1884	4585	thi_tran_tram_tau	139	thị trấn	Trạm Tấu
1885	4588	xa_tuc_dan	139	xã	Túc Đán
1886	4591	xa_pa_lau	139	xã	Pá Lau
1887	4594	xa_xa_ho	139	xã	Xà Hồ
1888	4597	xa_phinh_ho	139	xã	Phình Hồ
1889	4600	xa_tram_tau	139	xã	Trạm Tấu
1890	4603	xa_ta_si_lang	139	xã	Si Láng
1891	4606	xa_pa_hu	139	xã	Pá Hu
1892	4609	xa_lang_nhi	139	xã	Làng Nhì
1893	4612	xa_ban_cong	139	xã	Bản Công
1894	4615	xa_ban_mu	139	xã	Bản Mù
1895	4618	xa_hat_liu	139	xã	Hát Lìu
1896	4621	thi_tran_nt_lien_son	140	thị trấn	Liên Sơn
1897	4627	thi_tran_nt_tran_phu	140	thị trấn	Trần Phú
1898	4630	xa_tu_le	140	xã	Tú Lệ
1899	4633	xa_nam_bung	140	xã	Nậm Búng
1900	4636	xa_gia_hoi	140	xã	Gia Hội
1901	4639	xa_sung_do	140	xã	Sùng Đô
1902	4642	xa_nam_muoi	140	xã	Nậm Mười
1903	4645	xa_an_luong	140	xã	An Lương
1904	4648	xa_nam_lanh	140	xã	Nậm Lành
1905	4651	xa_son_luong	140	xã	Sơn Lương
1906	4654	xa_suoi_quyen	140	xã	Suối Quyền
1907	4657	xa_suoi_giang	140	xã	Suối Giàng
1908	4666	xa_nghia_son	140	xã	Nghĩa Sơn
1909	4669	xa_suoi_bu	140	xã	Suối Bu
1910	4672	thi_tran_son_thinh	140	thị trấn	Sơn Thịnh
1911	4687	xa_dai_lich	140	xã	Đại Lịch
1912	4690	xa_dong_khe	140	xã	Đồng Khê
1913	4693	xa_cat_thinh	140	xã	Cát Thịnh
1914	4696	xa_tan_thinh	140	xã	Tân Thịnh
1915	4699	xa_chan_thinh	140	xã	Chấn Thịnh
1916	4702	xa_binh_thuan	140	xã	Bình Thuận
1917	4705	xa_thuong_bang_la	140	xã	Bằng La
1918	4708	xa_minh_an	140	xã	Minh An
1919	4711	xa_nghia_tam	140	xã	Nghĩa Tâm
1920	4714	thi_tran_yen_binh	141	thị trấn	Yên Bình
1921	4717	thi_tran_thac_ba	141	thị trấn	Thác Bà
1922	4720	xa_xuan_long	141	xã	Xuân Long
1923	4726	xa_cam_nhan	141	xã	Cảm Nhân
1924	4729	xa_ngoc_chan	141	xã	Ngọc Chấn
1925	4732	xa_tan_nguyen	141	xã	Tân Nguyên
1926	4735	xa_phuc_ninh	141	xã	Phúc Ninh
1927	4738	xa_bao_ai	141	xã	Bảo Ái
1928	4741	xa_my_gia	141	xã	Mỹ Gia
1929	4744	xa_xuan_lai	141	xã	Xuân Lai
1930	4747	xa_mong_son	141	xã	Mông Sơn
1931	4750	xa_cam_an	141	xã	Cảm Ân
1932	4753	xa_yen_thanh	141	xã	Yên Thành
1933	4756	xa_tan_huong	141	xã	Tân Hương
1934	4759	xa_phuc_an	141	xã	Phúc An
1935	4762	xa_bach_ha	141	xã	Bạch Hà
1936	4765	xa_vu_linh	141	xã	Vũ Linh
1937	4768	xa_dai_dong	141	xã	Đại Đồng
1938	4771	xa_vinh_kien	141	xã	Vĩnh Kiên
1939	4774	xa_yen_binh	141	xã	Yên Bình
1940	4777	xa_thinh_hung	141	xã	Thịnh Hưng
1941	4780	xa_han_da	141	xã	Hán Đà
1942	4783	xa_phu_thinh	141	xã	Phú Thịnh
1943	4786	xa_dai_minh	141	xã	Đại Minh
1944	4789	phuong_thai_binh	148	phường	Thái Bình
1945	4792	phuong_tan_hoa	148	phường	Tân Hòa
1946	4795	phuong_thinh_lang	148	phường	Thịnh Lang
1947	4798	phuong_huu_nghi	148	phường	Hữu Nghị
1948	4801	phuong_tan_thinh	148	phường	Tân Thịnh
1949	4804	phuong_dong_tien	148	phường	Đồng Tiến
1950	4807	phuong_phuong_lam	148	phường	Phương Lâm
1951	4813	xa_yen_mong	148	xã	Yên Mông
1952	4816	phuong_quynh_lam	148	phường	Quỳnh Lâm
1953	4819	phuong_dan_chu	148	phường	Dân Chủ
1954	4825	xa_hoa_binh	148	xã	Hòa Bình
1955	4828	phuong_thong_nhat	148	phường	Thống Nhất
1956	4894	phuong_ky_son	148	phường	Kỳ Sơn
1957	4897	xa_thinh_minh	148	xã	Thịnh Minh
1958	4903	xa_hop_thanh	148	xã	Hợp Thành
1959	4906	xa_quang_tien	148	xã	Quang Tiến
1960	4912	xa_mong_hoa	148	xã	Mông Hóa
1961	4918	phuong_trung_minh	148	phường	Trung Minh
1962	4921	xa_doc_lap	148	xã	Độc Lập
1963	4831	thi_tran_da_bac	150	thị trấn	Đà Bắc
1964	4834	xa_nanh_nghe	150	xã	Nánh Nghê
1965	4840	xa_giap_dat	150	xã	Giáp Đắt
1966	4846	xa_muong_chieng	150	xã	Mường Chiềng
1967	4849	xa_tan_pheo	150	xã	Tân Pheo
1968	4852	xa_dong_chum	150	xã	Đồng Chum
1969	4855	xa_tan_minh	150	xã	Tân Minh
1970	4858	xa_doan_ket	150	xã	Đoàn Kết
1971	4861	xa_dong_ruong	150	xã	Đồng Ruộng
1972	4867	xa_tu_ly	150	xã	Tú Lý
1973	4870	xa_trung_thanh	150	xã	Trung Thành
1974	4873	xa_yen_hoa	150	xã	Yên Hòa
1975	4876	xa_cao_son	150	xã	Cao Sơn
1976	4879	xa_toan_son	150	xã	Toàn Sơn
1977	4885	xa_hien_luong	150	xã	Hiền Lương
1978	4888	xa_tien_phong	150	xã	Tiền Phong
1979	4891	xa_vay_nua	150	xã	Vầy Nưa
1980	4924	thi_tran_luong_son	152	thị trấn	Lương Sơn
1981	4942	xa_lam_son	152	xã	Lâm Sơn
1982	4945	xa_hoa_son	152	xã	Hòa Sơn
1983	4951	xa_tan_vinh	152	xã	Tân Vinh
1984	4954	xa_nhuan_trach	152	xã	Nhuận Trạch
1985	4957	xa_cao_son	152	xã	Cao Sơn
1986	4960	xa_cu_yen	152	xã	Cư Yên
1987	4969	xa_lien_son	152	xã	Liên Sơn
1988	5008	xa_cao_duong	152	xã	Cao Dương
1989	5041	xa_thanh_son	152	xã	Thanh Sơn
1990	5047	xa_thanh_cao	152	xã	Thanh Cao
1991	4978	thi_tran_bo	153	thị trấn	Thị trấn Bo
1992	4984	xa_du_sang	153	xã	Đú Sáng
1993	4987	xa_hung_son	153	xã	Hùng Sơn
1994	4990	xa_binh_son	153	xã	Bình Sơn
1995	4999	xa_tu_son	153	xã	Tú Sơn
1996	5005	xa_vinh_tien	153	xã	Vĩnh Tiến
1997	5014	xa_dong_bac	153	xã	Đông Bắc
1998	5017	xa_xuan_thuy	153	xã	Xuân Thủy
1999	5026	xa_vinh_dong	153	xã	Vĩnh Đồng
2000	5035	xa_kim_lap	153	xã	Kim Lập
2001	5038	xa_hop_tien	153	xã	Hợp Tiến
2002	5065	xa_kim_boi	153	xã	Kim Bôi
2003	5068	xa_nam_thuong	153	xã	Nam Thượng
2004	5077	xa_cuoi_ha	153	xã	Cuối Hạ
2005	5080	xa_sao_bay	153	xã	Sào Báy
2006	5083	xa_mi_hoa	153	xã	Mi Hòa
2007	5086	xa_nuong_dam	153	xã	Nuông Dăm
2008	5089	thi_tran_cao_phong	154	thị trấn	Cao Phong
2009	5092	xa_binh_thanh	154	xã	Bình Thanh
2010	5095	xa_thung_nai	154	xã	Thung Nai
2011	5098	xa_bac_phong	154	xã	Bắc Phong
2012	5101	xa_thu_phong	154	xã	Thu Phong
2013	5104	xa_hop_phong	154	xã	Hợp Phong
2014	5110	xa_tay_phong	154	xã	Tây Phong
2015	5116	xa_dung_phong	154	xã	Dũng Phong
2016	5119	xa_nam_phong	154	xã	Nam Phong
2017	5125	xa_thach_yen	154	xã	Thạch Yên
2018	5128	thi_tran_man_duc	155	thị trấn	Mãn Đức
2019	5134	xa_suoi_hoa	155	xã	Suối Hoa
2020	5137	xa_phu_vinh	155	xã	Phú Vinh
2021	5140	xa_phu_cuong	155	xã	Phú Cường
2022	5143	xa_my_hoa	155	xã	Mỹ Hòa
2023	5152	xa_quyet_chien	155	xã	Quyết Chiến
2024	5158	xa_phong_phu	155	xã	Phong Phú
2025	5164	xa_tu_ne	155	xã	Tử Nê
2026	5167	xa_thanh_hoi	155	xã	Thanh Hối
2027	5170	xa_ngoc_my	155	xã	Ngọc Mỹ
2028	5173	xa_dong_lai	155	xã	Đông Lai
2029	5176	xa_van_son	155	xã	Vân Sơn
2030	5182	xa_nhan_my	155	xã	Nhân Mỹ
2031	5191	xa_lo_son	155	xã	Lỗ Sơn
2032	5194	xa_ngo_luong	155	xã	Ngổ Luông
2033	5197	xa_gia_mo	155	xã	Gia Mô
2034	4882	xa_tan_thanh	156	xã	Tân Thành
2035	5200	thi_tran_mai_chau	156	thị trấn	Mai Châu
2036	5206	xa_son_thuy	156	xã	Sơn Thủy
2037	5209	xa_pa_co	156	xã	Pà Cò
2038	5212	xa_hang_kia	156	xã	Hang Kia
2039	5221	xa_dong_tan	156	xã	Đồng Tân
2040	5224	xa_cun_pheo	156	xã	Cun Pheo
2041	5227	xa_bao_la	156	xã	Bao La
2042	5233	xa_tong_dau	156	xã	Tòng Đậu
2043	5242	xa_na_phon	156	xã	Nà Phòn
2044	5245	xa_sam_khoe	156	xã	Săm Khóe
2045	5248	xa_chieng_chau	156	xã	Chiềng Châu
2046	5251	xa_mai_ha	156	xã	Mai Hạ
2047	5254	xa_thanh_son	156	xã	Thành Sơn
2048	5257	xa_mai_hich	156	xã	Mai Hịch
2049	5263	xa_van_mai	156	xã	Vạn Mai
2050	5266	thi_tran_vu_ban	157	thị trấn	Vụ Bản
2051	5269	xa_quy_hoa	157	xã	Quý Hòa
2052	5272	xa_mien_doi	157	xã	Miền Đồi
2053	5275	xa_my_thanh	157	xã	Mỹ Thành
2054	5278	xa_tuan_dao	157	xã	Tuân Đạo
2055	5281	xa_van_nghia	157	xã	Văn Nghĩa
2056	5284	xa_van_son	157	xã	Văn Sơn
2057	5287	xa_tan_lap	157	xã	Tân Lập
2058	5290	xa_nhan_nghia	157	xã	Nhân Nghĩa
2059	5293	xa_thuong_coc	157	xã	Thượng Cốc
2060	5299	xa_quyet_thang	157	xã	Quyết Thắng
2061	5302	xa_xuat_hoa	157	xã	Xuất Hóa
2062	5305	xa_yen_phu	157	xã	Yên Phú
2063	5308	xa_binh_hem	157	xã	Bình Hẻm
2064	5320	xa_dinh_cu	157	xã	Định Cư
2065	5323	xa_chi_dao	157	xã	Chí Đạo
2066	5329	xa_ngoc_son	157	xã	Ngọc Sơn
2067	5332	xa_huong_nhuong	157	xã	Hương Nhượng
2068	5335	xa_vu_binh	157	xã	Vũ Bình
2069	5338	xa_tu_do	157	xã	Tự Do
2070	5341	xa_yen_nghiep	157	xã	Yên Nghiệp
2071	5344	xa_tan_my	157	xã	Tân Mỹ
2072	5347	xa_an_nghia	157	xã	Ân Nghĩa
2073	5350	xa_ngoc_lau	157	xã	Ngọc Lâu
2074	5353	thi_tran_hang_tram	158	thị trấn	Hàng Trạm
2075	5356	xa_lac_sy	158	xã	Lạc Sỹ
2076	5362	xa_lac_luong	158	xã	Lạc Lương
2077	5365	xa_bao_hieu	158	xã	Bảo Hiệu
2078	5368	xa_da_phuc	158	xã	Đa Phúc
2079	5371	xa_huu_loi	158	xã	Hữu Lợi
2080	5374	xa_lac_thinh	158	xã	Lạc Thịnh
2081	5380	xa_doan_ket	158	xã	Đoàn Kết
2082	5383	xa_phu_lai	158	xã	Phú Lai
2083	5386	xa_yen_tri	158	xã	Yên Trị
2084	5389	xa_ngoc_luong	158	xã	Ngọc Lương
2085	4981	thi_tran_ba_hang_doi	159	thị trấn	Hàng Đồi
2086	5392	thi_tran_chi_ne	159	thị trấn	Chi Nê
2087	5395	xa_phu_nghia	159	xã	Phú Nghĩa
2088	5398	xa_phu_thanh	159	xã	Phú Thành
2089	5404	xa_hung_thi	159	xã	Hưng Thi
2090	5413	xa_khoan_du	159	xã	Khoan Dụ
2091	5419	xa_dong_tam	159	xã	Đồng Tâm
2092	5422	xa_yen_bong	159	xã	Yên Bồng
2093	5425	xa_thong_nhat	159	xã	Thống Nhất
2094	5428	xa_an_binh	159	xã	An Bình
2095	5431	phuong_quan_trieu	164	phường	Quán Triều
2096	5434	phuong_quang_vinh	164	phường	Quang Vinh
2097	5437	phuong_tuc_duyen	164	phường	Túc Duyên
2098	5440	phuong_hoang_van_thu	164	phường	Văn Thụ
2099	5443	phuong_trung_vuong	164	phường	Trưng Vương
2100	5446	phuong_quang_trung	164	phường	Quang Trung
2101	5449	phuong_phan_dinh_phung	164	phường	Đình Phùng
2102	5452	phuong_tan_thinh	164	phường	Tân Thịnh
2103	5455	phuong_thinh_dan	164	phường	Thịnh Đán
2104	5458	phuong_dong_quang	164	phường	Đồng Quang
2105	5461	phuong_gia_sang	164	phường	Gia Sàng
2106	5464	phuong_tan_lap	164	phường	Tân Lập
2107	5467	phuong_cam_gia	164	phường	Cam Giá
2108	5470	phuong_phu_xa	164	phường	Phú Xá
2109	5473	phuong_huong_son	164	phường	Hương Sơn
2110	5476	phuong_trung_thanh	164	phường	Trung Thành
2111	5479	phuong_tan_thanh	164	phường	Tân Thành
2112	5482	phuong_tan_long	164	phường	Tân Long
2113	5485	xa_phuc_ha	164	xã	Phúc Hà
2114	5488	xa_phuc_xuan	164	xã	Phúc Xuân
2115	5491	xa_quyet_thang	164	xã	Quyết Thắng
2116	5494	xa_phuc_triu	164	xã	Phúc Trìu
2117	5497	xa_thinh_duc	164	xã	Thịnh Đức
2118	5500	phuong_tich_luong	164	phường	Tích Lương
2119	5503	xa_tan_cuong	164	xã	Tân Cương
2120	5653	xa_son_cam	164	xã	Sơn Cẩm
2121	5659	phuong_chua_hang	164	phường	Chùa Hang
2122	5695	xa_cao_ngan	164	xã	Cao Ngạn
2123	5701	xa_linh_son	164	xã	Linh Sơn
2124	5710	phuong_dong_bam	164	phường	Đồng Bẩm
2125	5713	xa_huong_thuong	164	xã	Huống Thượng
2126	5914	xa_dong_lien	164	xã	Đồng Liên
2127	5506	phuong_luong_son	165	phường	Lương Sơn
2128	5509	phuong_chau_son	165	phường	Châu Sơn
2129	5512	phuong_mo_che	165	phường	Mỏ Chè
2130	5515	phuong_cai_dan	165	phường	Cải Đan
2131	5518	phuong_thang_loi	165	phường	Thắng Lợi
2132	5521	phuong_pho_co	165	phường	Phố Cò
2133	5527	xa_tan_quang	165	xã	Tân Quang
2134	5528	phuong_bach_quang	165	phường	Bách Quang
2135	5530	xa_binh_son	165	xã	Bình Sơn
2136	5533	xa_ba_xuyen	165	xã	Bá Xuyên
2137	5536	thi_tran_cho_chu	167	thị trấn	Chợ Chu
2138	5539	xa_linh_thong	167	xã	Linh Thông
2139	5542	xa_lam_vy	167	xã	Lam Vỹ
2140	5545	xa_quy_ky	167	xã	Quy Kỳ
2141	5548	xa_tan_thinh	167	xã	Tân Thịnh
2142	5551	xa_kim_phuong	167	xã	Kim Phượng
2143	5554	xa_bao_linh	167	xã	Bảo Linh
2144	5560	xa_phuc_chu	167	xã	Phúc Chu
2145	5563	xa_tan_duong	167	xã	Tân Dương
2146	5566	xa_phuong_tien	167	xã	Phượng Tiến
2147	5569	xa_bao_cuong	167	xã	Bảo Cường
2148	5572	xa_dong_thinh	167	xã	Đồng Thịnh
2149	5575	xa_dinh_bien	167	xã	Định Biên
2150	5578	xa_thanh_dinh	167	xã	Thanh Định
2151	5581	xa_trung_hoi	167	xã	Trung Hội
2152	5584	xa_trung_luong	167	xã	Trung Lương
2153	5587	xa_binh_yen	167	xã	Bình Yên
2154	5590	xa_diem_mac	167	xã	Điềm Mặc
2155	5593	xa_phu_tien	167	xã	Phú Tiến
2156	5596	xa_boc_nhieu	167	xã	Bộc Nhiêu
2157	5599	xa_son_phu	167	xã	Sơn Phú
2158	5602	xa_phu_dinh	167	xã	Phú Đình
2159	5605	xa_binh_thanh	167	xã	Bình Thành
2160	5608	thi_tran_giang_tien	168	thị trấn	Giang Tiên
2161	5611	thi_tran_du	168	thị trấn	Thị trấn Đu
2162	5614	xa_yen_ninh	168	xã	Yên Ninh
2163	5617	xa_yen_trach	168	xã	Yên Trạch
2164	5620	xa_yen_do	168	xã	Yên Đổ
2165	5623	xa_yen_lac	168	xã	Yên Lạc
2166	5626	xa_on_luong	168	xã	Ôn Lương
2167	5629	xa_dong_dat	168	xã	Động Đạt
2168	5632	xa_phu_ly	168	xã	Phủ Lý
2169	5635	xa_phu_do	168	xã	Phú Đô
2170	5638	xa_hop_thanh	168	xã	Hợp Thành
2171	5641	xa_tuc_tranh	168	xã	Tức Tranh
2172	5644	xa_phan_me	168	xã	Phấn Mễ
2173	5647	xa_vo_tranh	168	xã	Vô Tranh
2174	5650	xa_co_lung	168	xã	Cổ Lũng
2175	5656	thi_tran_song_cau	169	thị trấn	Sông Cầu
2176	5662	thi_tran_trai_cau	169	thị trấn	Trại Cau
2177	5665	xa_van_lang	169	xã	Văn Lăng
2178	5668	xa_tan_long	169	xã	Tân Long
2179	5671	xa_hoa_binh	169	xã	Hòa Bình
2180	5674	xa_quang_son	169	xã	Quang Sơn
2181	5677	xa_minh_lap	169	xã	Minh Lập
2182	5680	xa_van_han	169	xã	Văn Hán
2183	5683	xa_hoa_trung	169	xã	Hóa Trung
2184	5686	xa_khe_mo	169	xã	Khe Mo
2185	5689	xa_cay_thi	169	xã	Cây Thị
2186	5692	xa_hoa_thuong	169	xã	Hóa Thượng
2187	5698	xa_hop_tien	169	xã	Hợp Tiến
2188	5704	xa_tan_loi	169	xã	Tân Lợi
2189	5707	xa_nam_hoa	169	xã	Nam Hòa
2190	5716	thi_tran_dinh_ca	170	thị trấn	Đình Cả
2191	5719	xa_sang_moc	170	xã	Sảng Mộc
2192	5722	xa_nghinh_tuong	170	xã	Nghinh Tường
2193	5725	xa_than_xa	170	xã	Thần Xa
2194	5728	xa_vu_chan	170	xã	Vũ Chấn
2195	5731	xa_thuong_nung	170	xã	Thượng Nung
2196	5734	xa_phu_thuong	170	xã	Phú Thượng
2197	5737	xa_cuc_duong	170	xã	Cúc Đường
2198	5740	xa_la_hien	170	xã	La Hiên
2199	5743	xa_lau_thuong	170	xã	Lâu Thượng
2200	5746	xa_trang_xa	170	xã	Tràng Xá
2201	5749	xa_phuong_giao	170	xã	Phương Giao
2202	5752	xa_lien_minh	170	xã	Liên Minh
2203	5755	xa_dan_tien	170	xã	Dân Tiến
2204	5758	xa_binh_long	170	xã	Bình Long
2205	5761	thi_tran_hung_son	171	thị trấn	Hùng Sơn
2206	5764	thi_tran_quan_chu	171	thị trấn	Quân Chu
2207	5767	xa_phuc_luong	171	xã	Phúc Lương
2208	5770	xa_minh_tien	171	xã	Minh Tiến
2209	5773	xa_yen_lang	171	xã	Yên Lãng
2210	5776	xa_duc_luong	171	xã	Đức Lương
2211	5779	xa_phu_cuong	171	xã	Phú Cường
2212	5782	xa_na_mao	171	xã	Na Mao
2213	5785	xa_phu_lac	171	xã	Phú Lạc
2214	5788	xa_tan_linh	171	xã	Tân Linh
2215	5791	xa_phu_thinh	171	xã	Phú Thịnh
2216	5794	xa_phuc_linh	171	xã	Phục Linh
2217	5797	xa_phu_xuyen	171	xã	Phú Xuyên
2218	5800	xa_ban_ngoai	171	xã	Bản Ngoại
2219	5803	xa_tien_hoi	171	xã	Tiên Hội
2220	5809	xa_cu_van	171	xã	Cù Vân
2221	5812	xa_ha_thuong	171	xã	Hà Thượng
2222	5815	xa_la_bang	171	xã	La Bằng
2223	5818	xa_hoang_nong	171	xã	Hoàng Nông
2224	5821	xa_khoi_ky	171	xã	Khôi Kỳ
2225	5824	xa_an_khanh	171	xã	An Khánh
2226	5827	xa_tan_thai	171	xã	Tân Thái
2227	5830	xa_binh_thuan	171	xã	Bình Thuận
2228	5833	xa_luc_ba	171	xã	Lục Ba
2229	5836	xa_my_yen	171	xã	Mỹ Yên
2230	5839	xa_van_tho	171	xã	Vạn Thọ
2231	5842	xa_van_yen	171	xã	Văn Yên
2232	5845	xa_ky_phu	171	xã	Ký Phú
2233	5848	xa_cat_ne	171	xã	Cát Nê
2234	5851	xa_quan_chu	171	xã	Quân Chu
2235	5854	phuong_bai_bong	172	phường	Bãi Bông
2236	5857	phuong_bac_son	172	phường	Bắc Sơn
2237	5860	phuong_ba_hang	172	phường	Ba Hàng
2238	5863	xa_phuc_tan	172	xã	Phúc Tân
2239	5866	xa_phuc_thuan	172	xã	Phúc Thuận
2240	5869	xa_hong_tien	172	xã	Hồng Tiến
2241	5872	xa_minh_duc	172	xã	Minh Đức
2242	5875	xa_dac_son	172	xã	Đắc Sơn
2243	5878	phuong_dong_tien	172	phường	Đồng Tiến
2244	5881	xa_thanh_cong	172	xã	Thành Công
2245	5884	xa_tien_phong	172	xã	Tiên Phong
2246	5887	xa_van_phai	172	xã	Vạn Phái
2247	5890	xa_nam_tien	172	xã	Nam Tiến
2248	5893	xa_tan_huong	172	xã	Tân Hương
2249	5896	xa_dong_cao	172	xã	Đông Cao
2250	5899	xa_trung_thanh	172	xã	Trung Thành
2251	5902	xa_tan_phu	172	xã	Tân Phú
2252	5905	xa_thuan_thanh	172	xã	Thuận Thành
2253	5908	thi_tran_huong_son	173	thị trấn	Hương Sơn
2254	5911	xa_ban_dat	173	xã	Bàn Đạt
2255	5917	xa_tan_khanh	173	xã	Tân Khánh
2256	5920	xa_tan_kim	173	xã	Tân Kim
2257	5923	xa_tan_thanh	173	xã	Tân Thành
2258	5926	xa_dao_xa	173	xã	Đào Xá
2259	5929	xa_bao_ly	173	xã	Bảo Lý
2260	5932	xa_thuong_dinh	173	xã	Thượng Đình
2261	5935	xa_tan_hoa	173	xã	Tân Hòa
2262	5938	xa_nha_long	173	xã	Nhã Lộng
2263	5941	xa_diem_thuy	173	xã	Điềm Thụy
2264	5944	xa_xuan_phuong	173	xã	Xuân Phương
2265	5947	xa_tan_duc	173	xã	Tân Đức
2266	5950	xa_uc_ky	173	xã	Úc Kỳ
2267	5953	xa_luong_phu	173	xã	Lương Phú
2268	5956	xa_nga_my	173	xã	Nga My
2269	5959	xa_kha_son	173	xã	Kha Sơn
2270	5962	xa_thanh_ninh	173	xã	Thanh Ninh
2271	5965	xa_duong_thanh	173	xã	Dương Thành
2272	5968	xa_ha_chau	173	xã	Hà Châu
2273	5971	phuong_hoang_van_thu	178	phường	Văn Thụ
2274	5974	phuong_tam_thanh	178	phường	Tam Thanh
2275	5977	phuong_vinh_trai	178	phường	Vĩnh Trại
2276	5980	phuong_dong_kinh	178	phường	Đông Kinh
2277	5983	phuong_chi_lang	178	phường	Chi Lăng
2278	5986	xa_hoang_dong	178	xã	Hoàng Đồng
2279	5989	xa_quang_lac	178	xã	Quảng Lạc
2280	5992	xa_mai_pha	178	xã	Mai Pha
2281	5995	thi_tran_that_khe	180	thị trấn	Thất Khê
2282	5998	xa_khanh_long	180	xã	Khánh Long
2283	6001	xa_doan_ket	180	xã	Đoàn Kết
2284	6004	xa_quoc_khanh	180	xã	Quốc Khánh
2285	6007	xa_vinh_tien	180	xã	Vĩnh Tiến
2286	6010	xa_cao_minh	180	xã	Cao Minh
2287	6013	xa_chi_minh	180	xã	Chí Minh
2288	6016	xa_tri_phuong	180	xã	Tri Phương
2289	6019	xa_tan_tien	180	xã	Tân Tiến
2290	6022	xa_tan_yen	180	xã	Tân Yên
2291	6025	xa_doi_can	180	xã	Đội Cấn
2292	6028	xa_tan_minh	180	xã	Tân Minh
2293	6031	xa_kim_dong	180	xã	Kim Đồng
2294	6034	xa_chi_lang	180	xã	Chi Lăng
2295	6037	xa_trung_thanh	180	xã	Trung Thành
2296	6040	xa_dai_dong	180	xã	Đại Đồng
2297	6043	xa_dao_vien	180	xã	Đào Viên
2298	6046	xa_de_tham	180	xã	Đề Thám
2299	6049	xa_khang_chien	180	xã	Kháng Chiến
2300	6055	xa_hung_son	180	xã	Hùng Sơn
2301	6058	xa_quoc_viet	180	xã	Quốc Việt
2302	6061	xa_hung_viet	180	xã	Hùng Việt
2303	6067	xa_hung_dao	181	xã	Hưng Đạo
2304	6070	xa_vinh_yen	181	xã	Vĩnh Yên
2305	6073	xa_hoa_tham	181	xã	Hoa Thám
2306	6076	xa_quy_hoa	181	xã	Quý Hòa
2307	6079	xa_hong_phong	181	xã	Hồng Phong
2308	6082	xa_yen_lo	181	xã	Yên Lỗ
2309	6085	xa_thien_hoa	181	xã	Thiện Hòa
2310	6088	xa_quang_trung	181	xã	Quang Trung
2311	6091	xa_thien_thuat	181	xã	Thiện Thuật
2312	6094	xa_minh_khai	181	xã	Minh Khai
2313	6097	xa_thien_long	181	xã	Thiện Long
2314	6100	xa_hoang_van_thu	181	xã	Văn Thụ
2315	6103	xa_hoa_binh	181	xã	Hòa Bình
2316	6106	xa_mong_an	181	xã	Mông Ân
2317	6109	xa_tan_hoa	181	xã	Tân Hòa
2318	6112	thi_tran_binh_gia	181	thị trấn	Bình Gia
2319	6115	xa_hong_thai	181	xã	Hồng Thái
2320	6118	xa_binh_la	181	xã	Bình La
2321	6121	xa_tan_van	181	xã	Tân Văn
2322	6124	thi_tran_na_sam	182	thị trấn	Na Sầm
2323	6127	xa_trung_khanh	182	xã	Trùng Khánh
2324	6133	xa_bac_la	182	xã	Bắc La
2325	6136	xa_thuy_hung	182	xã	Thụy Hùng
2326	6139	xa_bac_hung	182	xã	Bắc Hùng
2327	6142	xa_tan_tac	182	xã	Tân Tác
2328	6148	xa_thanh_long	182	xã	Thanh Long
2329	6151	xa_hoi_hoan	182	xã	Hội Hoan
2330	6154	xa_bac_viet	182	xã	Bắc Việt
2331	6157	xa_hoang_viet	182	xã	Hoàng Việt
2332	6160	xa_gia_mien	182	xã	Gia Miễn
2333	6163	xa_thanh_hoa	182	xã	Thành Hòa
2334	6166	xa_tan_thanh	182	xã	Tân Thanh
2335	6172	xa_tan_my	182	xã	Tân Mỹ
2336	6175	xa_hong_thai	182	xã	Hồng Thái
2337	6178	xa_hoang_van_thu	182	xã	Văn Thụ
2338	6181	xa_nhac_ky	182	xã	Nhạc Kỳ
2339	6184	thi_tran_dong_dang	183	thị trấn	Đồng Đăng
2340	6187	thi_tran_cao_loc	183	thị trấn	Cao Lộc
2341	6190	xa_bao_lam	183	xã	Bảo Lâm
2342	6193	xa_thanh_loa	183	xã	Thanh Lòa
2343	6196	xa_cao_lau	183	xã	Cao Lâu
2344	6199	xa_thach_dan	183	xã	Thạch Đạn
2345	6202	xa_xuat_le	183	xã	Xuất Lễ
2346	6205	xa_hong_phong	183	xã	Hồng Phong
2347	6208	xa_thuy_hung	183	xã	Thụy Hùng
2348	6211	xa_loc_yen	183	xã	Lộc Yên
2349	6214	xa_phu_xa	183	xã	Phú Xá
2350	6217	xa_binh_trung	183	xã	Bình Trung
2351	6220	xa_hai_yen	183	xã	Hải Yến
2352	6223	xa_hoa_cu	183	xã	Hòa Cư
2353	6226	xa_hop_thanh	183	xã	Hợp Thành
2354	6232	xa_cong_son	183	xã	Công Sơn
2355	6235	xa_gia_cat	183	xã	Gia Cát
2356	6238	xa_mau_son	183	xã	Mẫu Sơn
2357	6241	xa_xuan_long	183	xã	Xuân Long
2358	6244	xa_tan_lien	183	xã	Tân Liên
2359	6247	xa_yen_trach	183	xã	Yên Trạch
2360	6250	xa_tan_thanh	183	xã	Tân Thành
2361	6253	thi_tran_van_quan	184	thị trấn	Văn Quan
2362	6256	xa_tran_ninh	184	xã	Trấn Ninh
2363	6268	xa_lien_hoi	184	xã	Liên Hội
2364	6274	xa_hoa_binh	184	xã	Hòa Bình
2365	6277	xa_tu_xuyen	184	xã	Tú Xuyên
2366	6280	xa_diem_he	184	xã	Điềm He
2367	6283	xa_an_son	184	xã	An Sơn
2368	6286	xa_khanh_khe	184	xã	Khánh Khê
2369	6292	xa_luong_nang	184	xã	Lương Năng
2370	6295	xa_dong_giap	184	xã	Đồng Giáp
2371	6298	xa_binh_phuc	184	xã	Bình Phúc
2372	6301	xa_trang_cac	184	xã	Tràng Các
2373	6307	xa_tan_doan	184	xã	Tân Đoàn
2374	6313	xa_tri_le	184	xã	Tri Lễ
2375	6316	xa_trang_phai	184	xã	Tràng Phái
2376	6319	xa_yen_phuc	184	xã	Yên Phúc
2377	6322	xa_huu_le	184	xã	Hữu Lễ
2378	6325	thi_tran_bac_son	185	thị trấn	Bắc Sơn
2379	6328	xa_long_dong	185	xã	Long Đống
2380	6331	xa_van_thuy	185	xã	Vạn Thủy
2381	6337	xa_dong_y	185	xã	Xã Đồng ý
2382	6340	xa_tan_tri	185	xã	Tân Tri
2383	6343	xa_bac_quynh	185	xã	Bắc Quỳnh
2384	6349	xa_hung_vu	185	xã	Hưng Vũ
2385	6352	xa_tan_lap	185	xã	Tân Lập
2386	6355	xa_vu_son	185	xã	Vũ Sơn
2387	6358	xa_chieu_vu	185	xã	Chiêu Vũ
2388	6361	xa_tan_huong	185	xã	Tân Hương
2389	6364	xa_chien_thang	185	xã	Chiến Thắng
2390	6367	xa_vu_lang	185	xã	Vũ Lăng
2391	6370	xa_tran_yen	185	xã	Trấn Yên
2392	6373	xa_vu_le	185	xã	Vũ Lễ
2393	6376	xa_nhat_hoa	185	xã	Nhất Hòa
2394	6379	xa_tan_thanh	185	xã	Tân Thành
2395	6382	xa_nhat_tien	185	xã	Nhất Tiến
2396	6385	thi_tran_huu_lung	186	thị trấn	Hữu Lũng
2397	6388	xa_huu_lien	186	xã	Hữu Liên
2398	6391	xa_yen_binh	186	xã	Yên Bình
2399	6394	xa_quyet_thang	186	xã	Quyết Thắng
2400	6397	xa_hoa_binh	186	xã	Hòa Bình
2401	6400	xa_yen_thinh	186	xã	Yên Thịnh
2402	6403	xa_yen_son	186	xã	Yên Sơn
2403	6406	xa_thien_tan	186	xã	Thiện Tân
2404	6412	xa_yen_vuong	186	xã	Yên Vượng
2405	6415	xa_minh_tien	186	xã	Minh Tiến
2406	6418	xa_nhat_tien	186	xã	Nhật Tiến
2407	6421	xa_thanh_son	186	xã	Thanh Sơn
2408	6424	xa_dong_tan	186	xã	Đồng Tân
2409	6427	xa_cai_kinh	186	xã	Cai Kinh
2410	6430	xa_hoa_lac	186	xã	Hòa Lạc
2411	6433	xa_van_nham	186	xã	Vân Nham
2412	6436	xa_dong_tien	186	xã	Đồng Tiến
2413	6442	xa_tan_thanh	186	xã	Tân Thành
2414	6445	xa_hoa_son	186	xã	Hòa Sơn
2415	6448	xa_minh_son	186	xã	Minh Sơn
2416	6451	xa_ho_son	186	xã	Hồ Sơn
2417	6454	xa_son_ha	186	xã	Sơn Hà
2418	6457	xa_minh_hoa	186	xã	Minh Hòa
2419	6460	xa_hoa_thang	186	xã	Hòa Thắng
2420	6463	thi_tran_dong_mo	187	thị trấn	Đồng Mỏ
2421	6466	thi_tran_chi_lang	187	thị trấn	Chi Lăng
2422	6469	xa_van_an	187	xã	Vân An
2423	6472	xa_van_thuy	187	xã	Vân Thủy
2424	6475	xa_gia_loc	187	xã	Gia Lộc
2425	6478	xa_bac_thuy	187	xã	Bắc Thủy
2426	6481	xa_chien_thang	187	xã	Chiến Thắng
2427	6484	xa_mai_sao	187	xã	Mai Sao
2428	6487	xa_bang_huu	187	xã	Bằng Hữu
2429	6490	xa_thuong_cuong	187	xã	Thượng Cường
2430	6493	xa_bang_mac	187	xã	Bằng Mạc
2431	6496	xa_nhan_ly	187	xã	Nhân Lý
2432	6499	xa_lam_son	187	xã	Lâm Sơn
2433	6502	xa_lien_son	187	xã	Liên Sơn
2434	6505	xa_van_linh	187	xã	Vạn Linh
2435	6508	xa_hoa_binh	187	xã	Hòa Bình
2436	6514	xa_huu_kien	187	xã	Hữu Kiên
2437	6517	xa_quan_son	187	xã	Quan Sơn
2438	6520	xa_y_tich	187	xã	Y Tịch
2439	6523	xa_chi_lang	187	xã	Chi Lăng
2440	6526	thi_tran_na_duong	188	thị trấn	Na Dương
2441	6529	thi_tran_loc_binh	188	thị trấn	Lộc Bình
2442	6532	xa_mau_son	188	xã	Mẫu Sơn
2443	6541	xa_yen_khoai	188	xã	Yên Khoái
2444	6544	xa_khanh_xuan	188	xã	Khánh Xuân
2445	6547	xa_tu_mich	188	xã	Tú Mịch
2446	6550	xa_huu_khanh	188	xã	Hữu Khánh
2447	6553	xa_dong_buc	188	xã	Đồng Bục
2448	6559	xa_tam_gia	188	xã	Tam Gia
2449	6562	xa_tu_doan	188	xã	Tú Đoạn
2450	6565	xa_khuat_xa	188	xã	Khuất Xá
2451	6574	xa_tinh_bac	188	xã	Tĩnh Bắc
2452	6577	xa_thong_nhat	188	xã	Thống Nhất
2453	6589	xa_san_vien	188	xã	Sàn Viên
2454	6592	xa_dong_quan	188	xã	Đông Quan
2455	6595	xa_minh_hiep	188	xã	Minh Hiệp
2456	6598	xa_huu_lan	188	xã	Hữu Lân
2457	6601	xa_loi_bac	188	xã	Lợi Bác
2458	6604	xa_nam_quan	188	xã	Nam Quan
2459	6607	xa_xuan_duong	188	xã	Xuân Dương
2460	6610	xa_ai_quoc	188	xã	Ái Quốc
2461	6613	thi_tran_dinh_lap	189	thị trấn	Đình Lập
2462	6616	thi_tran_nt_thai_binh	189	thị trấn	Thái Bình
2463	6619	xa_bac_xa	189	xã	Bắc Xa
2464	6622	xa_binh_xa	189	xã	Bính Xá
2465	6625	xa_kien_moc	189	xã	Kiên Mộc
2466	6628	xa_dinh_lap	189	xã	Đình Lập
2467	6631	xa_thai_binh	189	xã	Thái Bình
2468	6634	xa_cuong_loi	189	xã	Cường Lợi
2469	6637	xa_chau_son	189	xã	Châu Sơn
2470	6640	xa_lam_ca	189	xã	Lâm Ca
2471	6643	xa_dong_thang	189	xã	Đồng Thắng
2472	6646	xa_bac_lang	189	xã	Bắc Lãng
2473	6649	phuong_ha_khanh	193	phường	Hà Khánh
2474	6652	phuong_ha_phong	193	phường	Hà Phong
2475	6655	phuong_ha_khau	193	phường	Hà Khẩu
2476	6658	phuong_cao_xanh	193	phường	Cao Xanh
2477	6661	phuong_gieng_day	193	phường	Giếng Đáy
2478	6664	phuong_ha_tu	193	phường	Hà Tu
2479	6667	phuong_ha_trung	193	phường	Hà Trung
2480	6670	phuong_ha_lam	193	phường	Hà Lầm
2481	6673	phuong_bai_chay	193	phường	Bãi Cháy
2482	6676	phuong_cao_thang	193	phường	Cao Thắng
2483	6679	phuong_hung_thang	193	phường	Hùng Thắng
2484	6682	phuong_yet_kieu	193	phường	Yết Kiêu
2485	6685	phuong_tran_hung_dao	193	phường	Hưng Đạo
2486	6688	phuong_hong_hai	193	phường	Hồng Hải
2487	6691	phuong_hong_gai	193	phường	Hồng Gai
2488	6694	phuong_bach_dang	193	phường	Bạch Đằng
2489	6697	phuong_hong_ha	193	phường	Hồng Hà
2490	6700	phuong_tuan_chau	193	phường	Tuần Châu
2491	6703	phuong_viet_hung	193	phường	Việt Hưng
2492	6706	phuong_dai_yen	193	phường	Đại Yên
2493	7030	phuong_hoanh_bo	193	phường	Hoành Bồ
2494	7033	xa_ky_thuong	193	xã	Kỳ Thượng
2495	7036	xa_dong_son	193	xã	Đồng Sơn
2496	7039	xa_tan_dan	193	xã	Tân Dân
2497	7042	xa_dong_lam	193	xã	Đồng Lâm
2498	7045	xa_hoa_binh	193	xã	Hòa Bình
2499	7048	xa_vu_oai	193	xã	Vũ Oai
2500	7051	xa_dan_chu	193	xã	Dân Chủ
2501	7054	xa_quang_la	193	xã	Quảng La
2502	7057	xa_bang_ca	193	xã	Bằng Cả
2503	7060	xa_thong_nhat	193	xã	Thống Nhất
2504	7063	xa_son_duong	193	xã	Sơn Dương
2505	7066	xa_le_loi	193	xã	Lê Lợi
2506	6709	phuong_ka_long	194	phường	Ka Long
2507	6712	phuong_tran_phu	194	phường	Trần Phú
2508	6715	phuong_ninh_duong	194	phường	Ninh Dương
2509	6718	phuong_hoa_lac	194	phường	Hoà Lạc
2510	6721	phuong_tra_co	194	phường	Trà Cổ
2511	6724	xa_hai_son	194	xã	Hải Sơn
2512	6727	xa_bac_son	194	xã	Bắc Sơn
2513	6730	xa_hai_dong	194	xã	Hải Đông
2514	6733	xa_hai_tien	194	xã	Hải Tiến
2515	6736	phuong_hai_yen	194	phường	Hải Yên
2516	6739	xa_quang_nghia	194	xã	Quảng Nghĩa
2517	6742	phuong_hai_hoa	194	phường	Hải Hoà
2518	6745	xa_hai_xuan	194	xã	Hải Xuân
2519	6748	xa_van_ninh	194	xã	Vạn Ninh
2520	6751	phuong_binh_ngoc	194	phường	Bình Ngọc
2521	6754	xa_vinh_trung	194	xã	Vĩnh Trung
2522	6757	xa_vinh_thuc	194	xã	Vĩnh Thực
2523	6760	phuong_mong_duong	195	phường	Mông Dương
2524	6763	phuong_cua_ong	195	phường	Cửa Ông
2525	6766	phuong_cam_son	195	phường	Cẩm Sơn
2526	6769	phuong_cam_dong	195	phường	Cẩm Đông
2527	6772	phuong_cam_phu	195	phường	Cẩm Phú
2528	6775	phuong_cam_tay	195	phường	Cẩm Tây
2529	6778	phuong_quang_hanh	195	phường	Quang Hanh
2530	6781	phuong_cam_thinh	195	phường	Cẩm Thịnh
2531	6784	phuong_cam_thuy	195	phường	Cẩm Thủy
2532	6787	phuong_cam_thach	195	phường	Cẩm Thạch
2533	6790	phuong_cam_thanh	195	phường	Cẩm Thành
2534	6793	phuong_cam_trung	195	phường	Cẩm Trung
2535	6796	phuong_cam_binh	195	phường	Cẩm Bình
2536	6799	xa_cong_hoa	195	xã	Cộng Hòa
2537	6802	xa_cam_hai	195	xã	Cẩm Hải
2538	6805	xa_duong_huy	195	xã	Dương Huy
2539	6808	phuong_vang_danh	196	phường	Vàng Danh
2540	6811	phuong_thanh_son	196	phường	Thanh Sơn
2541	6814	phuong_bac_son	196	phường	Bắc Sơn
2542	6817	phuong_quang_trung	196	phường	Quang Trung
2543	6820	phuong_trung_vuong	196	phường	Trưng Vương
2544	6823	phuong_nam_khe	196	phường	Nam Khê
2545	6826	phuong_yen_thanh	196	phường	Yên Thanh
2546	6829	xa_thuong_yen_cong	196	xã	Yên Công
2547	6832	phuong_phuong_dong	196	phường	Phương Đông
2548	6835	phuong_phuong_nam	196	phường	Phương Nam
2549	6838	thi_tran_binh_lieu	198	thị trấn	Bình Liêu
2550	6841	xa_hoanh_mo	198	xã	Hoành Mô
2551	6844	xa_dong_tam	198	xã	Đồng Tâm
2552	6847	xa_dong_van	198	xã	Đồng Văn
2553	6853	xa_vo_ngai	198	xã	Vô Ngại
2554	6856	xa_luc_hon	198	xã	Lục Hồn
2555	6859	xa_huc_dong	198	xã	Húc Động
2556	6862	thi_tran_tien_yen	199	thị trấn	Tiên Yên
2557	6865	xa_ha_lau	199	xã	Hà Lâu
2558	6868	xa_dai_duc	199	xã	Đại Dực
2559	6871	xa_phong_du	199	xã	Phong Dụ
2560	6874	xa_dien_xa	199	xã	Điền Xá
2561	6877	xa_dong_ngu	199	xã	Đông Ngũ
2562	6880	xa_yen_than	199	xã	Yên Than
2563	6883	xa_dong_hai	199	xã	Đông Hải
2564	6886	xa_hai_lang	199	xã	Hải Lạng
2565	6889	xa_tien_lang	199	xã	Tiên Lãng
2566	6892	xa_dong_rui	199	xã	Đồng Rui
2567	6895	thi_tran_dam_ha	200	thị trấn	Đầm Hà
2568	6898	xa_quang_lam	200	xã	Quảng Lâm
2569	6901	xa_quang_an	200	xã	Quảng An
2570	6904	xa_tan_binh	200	xã	Tân Bình
2571	6910	xa_duc_yen	200	xã	Dực Yên
2572	6913	xa_quang_tan	200	xã	Quảng Tân
2573	6916	xa_dam_ha	200	xã	Đầm Hà
2574	6917	xa_tan_lap	200	xã	Tân Lập
2575	6919	xa_dai_binh	200	xã	Đại Bình
2576	6922	thi_tran_quang_ha	201	thị trấn	Quảng Hà
2577	6925	xa_quang_duc	201	xã	Quảng Đức
2578	6928	xa_quang_son	201	xã	Quảng Sơn
2579	6931	xa_quang_thanh	201	xã	Quảng Thành
2580	6937	xa_quang_thinh	201	xã	Quảng Thịnh
2581	6940	xa_quang_minh	201	xã	Quảng Minh
2582	6943	xa_quang_chinh	201	xã	Quảng Chính
2583	6946	xa_quang_long	201	xã	Quảng Long
2584	6949	xa_duong_hoa	201	xã	Đường Hoa
2585	6952	xa_quang_phong	201	xã	Quảng Phong
2586	6967	xa_cai_chien	201	xã	Cái Chiên
2587	6970	thi_tran_ba_che	202	thị trấn	Ba Chẽ
2588	6973	xa_thanh_son	202	xã	Thanh Sơn
2589	6976	xa_thanh_lam	202	xã	Thanh Lâm
2590	6979	xa_dap_thanh	202	xã	Đạp Thanh
2591	6982	xa_nam_son	202	xã	Nam Sơn
2592	6985	xa_luong_mong	202	xã	Lương Mông
2593	6988	xa_don_dac	202	xã	Đồn Đạc
2594	6991	xa_minh_cam	202	xã	Minh Cầm
2595	6994	thi_tran_cai_rong	203	thị trấn	Cái Rồng
2596	6997	xa_dai_xuyen	203	xã	Đài Xuyên
2597	7000	xa_binh_dan	203	xã	Bình Dân
2598	7003	xa_van_yen	203	xã	Vạn Yên
2599	7006	xa_minh_chau	203	xã	Minh Châu
2600	7009	xa_doan_ket	203	xã	Đoàn Kết
2601	7012	xa_ha_long	203	xã	Hạ Long
2602	7015	xa_dong_xa	203	xã	Đông Xá
2603	7018	xa_ban_sen	203	xã	Bản Sen
2604	7021	xa_thang_loi	203	xã	Thắng Lợi
2605	7024	xa_quan_lan	203	xã	Quan Lạn
2606	7027	xa_ngoc_vung	203	xã	Ngọc Vừng
2607	7069	phuong_mao_khe	205	phường	Mạo Khê
2608	7072	phuong_dong_trieu	205	phường	Đông Triều
2609	7075	xa_an_sinh	205	xã	An Sinh
2610	7078	xa_trang_luong	205	xã	Tràng Lương
2611	7081	xa_binh_khe	205	xã	Bình Khê
2612	7084	xa_viet_dan	205	xã	Việt Dân
2613	7087	xa_tan_viet	205	xã	Tân Việt
2614	7090	xa_binh_duong	205	xã	Bình Dương
2615	7093	phuong_duc_chinh	205	phường	Đức Chính
2616	7096	phuong_trang_an	205	phường	Tràng An
2617	7099	xa_nguyen_hue	205	xã	Nguyễn Huệ
2618	7102	xa_thuy_an	205	xã	Thủy An
2619	7105	phuong_xuan_son	205	phường	Xuân Sơn
2620	7108	xa_hong_thai_tay	205	xã	Thái Tây
2621	7111	xa_hong_thai_dong	205	xã	Thái Đông
2622	7114	phuong_hoang_que	205	phường	Hoàng Quế
2623	7117	phuong_yen_tho	205	phường	Yên Thọ
2624	7120	phuong_hong_phong	205	phường	Hồng Phong
2625	7123	phuong_kim_son	205	phường	Kim Sơn
2626	7126	phuong_hung_dao	205	phường	Hưng Đạo
2627	7129	xa_yen_duc	205	xã	Yên Đức
2628	7132	phuong_quang_yen	206	phường	Quảng Yên
2629	7135	phuong_dong_mai	206	phường	Đông Mai
2630	7138	phuong_minh_thanh	206	phường	Minh Thành
2631	7144	xa_song_khoai	206	xã	Sông Khoai
2632	7147	xa_hiep_hoa	206	xã	Hiệp Hòa
2633	7150	phuong_cong_hoa	206	phường	Cộng Hòa
2634	7153	xa_tien_an	206	xã	Tiền An
2635	7156	xa_hoang_tan	206	xã	Hoàng Tân
2636	7159	phuong_tan_an	206	phường	Tân An
2637	7162	phuong_yen_giang	206	phường	Yên Giang
2638	7165	phuong_nam_hoa	206	phường	Nam Hoà
2639	7168	phuong_ha_an	206	phường	Hà An
2640	7171	xa_cam_la	206	xã	Cẩm La
2641	7174	phuong_phong_hai	206	phường	Phong Hải
2642	7177	phuong_yen_hai	206	phường	Yên Hải
2643	7180	xa_lien_hoa	206	xã	Liên Hòa
2644	7183	phuong_phong_coc	206	phường	Phong Cốc
2645	7186	xa_lien_vi	206	xã	Liên Vị
2646	7189	xa_tien_phong	206	xã	Tiền Phong
2647	7192	thi_tran_co_to	207	thị trấn	Cô Tô
2648	7195	xa_dong_tien	207	xã	Đồng Tiến
2649	7198	xa_thanh_lan	207	xã	Thanh Lân
2650	7201	phuong_tho_xuong	213	phường	Thọ Xương
2651	7204	phuong_tran_nguyen_han	213	phường	Nguyên Hãn
2652	7207	phuong_ngo_quyen	213	phường	Ngô Quyền
2653	7210	phuong_hoang_van_thu	213	phường	Văn Thụ
2654	7213	phuong_tran_phu	213	phường	Trần Phú
2655	7216	phuong_my_do	213	phường	Mỹ Độ
2656	7219	phuong_le_loi	213	phường	Lê Lợi
2657	7222	xa_song_mai	213	xã	Song Mai
2658	7225	phuong_xuong_giang	213	phường	Xương Giang
2659	7228	phuong_da_mai	213	phường	Đa Mai
2660	7231	phuong_dinh_ke	213	phường	Dĩnh Kế
2661	7441	xa_dinh_tri	213	xã	Dĩnh Trì
2662	7687	xa_tan_my	213	xã	Tân Mỹ
2663	7696	xa_dong_son	213	xã	Đồng Sơn
2664	7699	xa_tan_tien	213	xã	Tân Tiến
2665	7705	xa_song_khe	213	xã	Song Khê
2666	7243	xa_dong_tien	215	xã	Đồng Tiến
2667	7246	xa_canh_nau	215	xã	Canh Nậu
2668	7249	xa_xuan_luong	215	xã	Xuân Lương
2669	7252	xa_tam_tien	215	xã	Tam Tiến
2670	7255	xa_dong_vuong	215	xã	Đồng Vương
2671	7258	xa_dong_huu	215	xã	Đồng Hưu
2672	7260	xa_dong_tam	215	xã	Đồng Tâm
2673	7261	xa_tam_hiep	215	xã	Tam Hiệp
2674	7264	xa_tien_thang	215	xã	Tiến Thắng
2675	7267	xa_hong_ky	215	xã	Hồng Kỳ
2676	7270	xa_dong_lac	215	xã	Đồng Lạc
2677	7273	xa_dong_son	215	xã	Đông Sơn
2678	7276	xa_tan_hiep	215	xã	Tân Hiệp
2679	7279	xa_huong_vi	215	xã	Hương Vĩ
2680	7282	xa_dong_ky	215	xã	Đồng Kỳ
2681	7285	xa_an_thuong	215	xã	An Thượng
2682	7288	thi_tran_phon_xuong	215	thị trấn	Phồn Xương
2683	7291	xa_tan_soi	215	xã	Tân Sỏi
2684	7294	thi_tran_bo_ha	215	thị trấn	Bố Hạ
2685	7303	xa_lan_gioi	216	xã	Lan Giới
2686	7306	thi_tran_nha_nam	216	thị trấn	Nhã Nam
2687	7309	xa_tan_trung	216	xã	Tân Trung
2688	7312	xa_dai_hoa	216	xã	Đại Hóa
2689	7315	xa_quang_tien	216	xã	Quang Tiến
2690	7318	xa_phuc_son	216	xã	Phúc Sơn
2691	7321	xa_an_duong	216	xã	An Dương
2692	7324	xa_phuc_hoa	216	xã	Phúc Hòa
2693	7327	xa_lien_son	216	xã	Liên Sơn
2694	7330	xa_hop_duc	216	xã	Hợp Đức
2695	7333	xa_lam_cot	216	xã	Lam Cốt
2696	7336	xa_cao_xa	216	xã	Cao Xá
2697	7339	thi_tran_cao_thuong	216	thị trấn	Cao Thượng
2698	7342	xa_viet_ngoc	216	xã	Việt Ngọc
2699	7345	xa_song_van	216	xã	Song Vân
2700	7348	xa_ngoc_chau	216	xã	Ngọc Châu
2701	7351	xa_ngoc_van	216	xã	Ngọc Vân
2702	7354	xa_viet_lap	216	xã	Việt Lập
2703	7357	xa_lien_chung	216	xã	Liên Chung
2704	7360	xa_ngoc_thien	216	xã	Ngọc Thiện
2705	7363	xa_ngoc_ly	216	xã	Ngọc Lý
2706	7366	xa_que_nham	216	xã	Quế Nham
2707	7375	thi_tran_voi	217	thị trấn	Thị trấn Vôi
2708	7378	xa_nghia_hoa	217	xã	Nghĩa Hòa
2709	7381	xa_nghia_hung	217	xã	Nghĩa Hưng
2710	7384	xa_quang_thinh	217	xã	Quang Thịnh
2711	7387	xa_huong_son	217	xã	Hương Sơn
2712	7390	xa_dao_my	217	xã	Đào Mỹ
2713	7393	xa_tien_luc	217	xã	Tiên Lục
2714	7396	xa_an_ha	217	xã	An Hà
2715	7399	thi_tran_kep	217	thị trấn	Thị trấn Kép
2716	7402	xa_my_ha	217	xã	Mỹ Hà
2717	7405	xa_huong_lac	217	xã	Hương Lạc
2718	7408	xa_duong_duc	217	xã	Dương Đức
2719	7411	xa_tan_thanh	217	xã	Tân Thanh
2720	7414	xa_yen_my	217	xã	Yên Mỹ
2721	7417	xa_tan_hung	217	xã	Tân Hưng
2722	7420	xa_my_thai	217	xã	Mỹ Thái
2723	7426	xa_xuong_lam	217	xã	Xương Lâm
2724	7429	xa_xuan_huong	217	xã	Xuân Hương
2725	7432	xa_tan_dinh	217	xã	Tân Dĩnh
2726	7435	xa_dai_lam	217	xã	Đại Lâm
2727	7438	xa_thai_dao	217	xã	Thái Đào
2728	7444	thi_tran_doi_ngo	218	thị trấn	Đồi Ngô
2729	7450	xa_dong_hung	218	xã	Đông Hưng
2730	7453	xa_dong_phu	218	xã	Đông Phú
2731	7456	xa_tam_di	218	xã	Tam Dị
2732	7459	xa_bao_son	218	xã	Bảo Sơn
2733	7462	xa_bao_dai	218	xã	Bảo Đài
2734	7465	xa_thanh_lam	218	xã	Thanh Lâm
2735	7468	xa_tien_nha	218	xã	Tiên Nha
2736	7471	xa_truong_giang	218	xã	Trường Giang
2737	7477	xa_phuong_son	218	xã	Phương Sơn
2738	7480	xa_chu_dien	218	xã	Chu Điện
2739	7483	xa_cuong_son	218	xã	Cương Sơn
2740	7486	xa_nghia_phuong	218	xã	Nghĩa Phương
2741	7489	xa_vo_tranh	218	xã	Vô Tranh
2742	7492	xa_binh_son	218	xã	Bình Sơn
2743	7495	xa_lan_mau	218	xã	Lan Mẫu
2744	7498	xa_yen_son	218	xã	Yên Sơn
2745	7501	xa_kham_lang	218	xã	Khám Lạng
2746	7504	xa_huyen_son	218	xã	Huyền Sơn
2747	7507	xa_truong_son	218	xã	Trường Sơn
2748	7510	xa_luc_son	218	xã	Lục Sơn
2749	7513	xa_bac_lung	218	xã	Bắc Lũng
2750	7516	xa_vu_xa	218	xã	Vũ Xá
2751	7519	xa_cam_ly	218	xã	Cẩm Lý
2752	7522	xa_dan_hoi	218	xã	Đan Hội
2753	7525	thi_tran_chu	219	thị trấn	Thị trấn Chũ
2754	7528	xa_cam_son	219	xã	Cấm Sơn
2755	7531	xa_tan_son	219	xã	Tân Sơn
2756	7534	xa_phong_minh	219	xã	Phong Minh
2757	7537	xa_phong_van	219	xã	Phong Vân
2758	7540	xa_xa_ly	219	xã	Xa Lý
2759	7543	xa_ho_dap	219	xã	Hộ Đáp
2760	7546	xa_son_hai	219	xã	Sơn Hải
2761	7549	xa_thanh_hai	219	xã	Thanh Hải
2762	7552	xa_kien_lao	219	xã	Kiên Lao
2763	7555	xa_bien_son	219	xã	Biên Sơn
2764	7558	xa_kien_thanh	219	xã	Kiên Thành
2765	7561	xa_hong_giang	219	xã	Hồng Giang
2766	7564	xa_kim_son	219	xã	Kim Sơn
2767	7567	xa_tan_hoa	219	xã	Tân Hoa
2768	7570	xa_giap_son	219	xã	Giáp Sơn
2769	7573	xa_bien_dong	219	xã	Biển Động
2770	7576	xa_quy_son	219	xã	Quý Sơn
2771	7579	xa_tru_huu	219	xã	Trù Hựu
2772	7582	xa_phi_dien	219	xã	Phì Điền
2773	7588	xa_tan_quang	219	xã	Tân Quang
2774	7591	xa_dong_coc	219	xã	Đồng Cốc
2775	7594	xa_tan_lap	219	xã	Tân Lập
2776	7597	xa_phu_nhuan	219	xã	Phú Nhuận
2777	7600	xa_my_an	219	xã	Mỹ An
2778	7603	xa_nam_duong	219	xã	Nam Dương
2779	7606	xa_tan_moc	219	xã	Tân Mộc
2780	7609	xa_deo_gia	219	xã	Đèo Gia
2781	7612	xa_phuong_son	219	xã	Phượng Sơn
2782	7615	thi_tran_an_chau	220	thị trấn	An Châu
2783	7616	thi_tran_tay_yen_tu	220	thị trấn	Yên Tử
2784	7621	xa_van_son	220	xã	Vân Sơn
2785	7624	xa_huu_san	220	xã	Hữu Sản
2786	7627	xa_dai_son	220	xã	Đại Sơn
2787	7630	xa_phuc_son	220	xã	Phúc Sơn
2788	7636	xa_giao_liem	220	xã	Giáo Liêm
2789	7642	xa_cam_dan	220	xã	Cẩm Đàn
2790	7645	xa_an_lac	220	xã	An Lạc
2791	7648	xa_vinh_an	220	xã	Vĩnh An
2792	7651	xa_yen_dinh	220	xã	Yên Định
2793	7654	xa_le_vien	220	xã	Lệ Viễn
2794	7660	xa_an_ba	220	xã	An Bá
2795	7663	xa_tuan_dao	220	xã	Tuấn Đạo
2796	7666	xa_duong_huu	220	xã	Dương Hưu
2797	7672	xa_long_son	220	xã	Long Sơn
2798	7678	xa_thanh_luan	220	xã	Thanh Luận
2799	7681	thi_tran_nham_bien	221	thị trấn	Nham Biền
2800	7682	thi_tran_tan_an	221	thị trấn	Tân An
2801	7684	xa_lao_ho	221	xã	Lão Hộ
2802	7690	xa_huong_gian	221	xã	Hương Gián
2803	7702	xa_quynh_son	221	xã	Quỳnh Sơn
2804	7708	xa_noi_hoang	221	xã	Nội Hoàng
2805	7711	xa_tien_phong	221	xã	Tiền Phong
2806	7714	xa_xuan_phu	221	xã	Xuân Phú
2807	7717	xa_tan_lieu	221	xã	Tân Liễu
2808	7720	xa_tri_yen	221	xã	Trí Yên
2809	7723	xa_lang_son	221	xã	Lãng Sơn
2810	7726	xa_yen_lu	221	xã	Yên Lư
2811	7729	xa_tien_dung	221	xã	Tiến Dũng
2812	7735	xa_duc_giang	221	xã	Đức Giang
2813	7738	xa_canh_thuy	221	xã	Cảnh Thụy
2814	7741	xa_tu_mai	221	xã	Tư Mại
2815	7747	xa_dong_viet	221	xã	Đồng Việt
2816	7750	xa_dong_phuc	221	xã	Đồng Phúc
2817	7759	xa_thuong_lan	222	xã	Thượng Lan
2818	7762	xa_viet_tien	222	xã	Việt Tiến
2819	7765	xa_nghia_trung	222	xã	Nghĩa Trung
2820	7768	xa_minh_duc	222	xã	Minh Đức
2821	7771	xa_huong_mai	222	xã	Hương Mai
2822	7774	xa_tu_lan	222	xã	Tự Lạn
2823	7777	thi_tran_bich_dong	222	thị trấn	Bích Động
2824	7780	xa_trung_son	222	xã	Trung Sơn
2825	7783	xa_hong_thai	222	xã	Hồng Thái
2826	7786	xa_tien_son	222	xã	Tiên Sơn
2827	7789	xa_tang_tien	222	xã	Tăng Tiến
2828	7792	xa_quang_minh	222	xã	Quảng Minh
2829	7795	thi_tran_nenh	222	thị trấn	Thị trấn Nếnh
2830	7798	xa_ninh_son	222	xã	Ninh Sơn
2831	7801	xa_van_trung	222	xã	Vân Trung
2832	7804	xa_van_ha	222	xã	Vân Hà
2833	7807	xa_quang_chau	222	xã	Quang Châu
2834	7813	xa_dong_tan	223	xã	Đồng Tân
2835	7816	xa_thanh_van	223	xã	Thanh Vân
2836	7819	xa_hoang_luong	223	xã	Hoàng Lương
2837	7822	xa_hoang_van	223	xã	Hoàng Vân
2838	7825	xa_hoang_thanh	223	xã	Hoàng Thanh
2839	7828	xa_hoang_an	223	xã	Hoàng An
2840	7831	xa_ngoc_son	223	xã	Ngọc Sơn
2841	7834	xa_thai_son	223	xã	Thái Sơn
2842	7837	xa_hoa_son	223	xã	Hòa Sơn
2843	7840	thi_tran_thang	223	thị trấn	Thị trấn Thắng
2844	7843	xa_quang_minh	223	xã	Quang Minh
2845	7846	xa_luong_phong	223	xã	Lương Phong
2846	7849	xa_hung_son	223	xã	Hùng Sơn
2847	7852	xa_dai_thanh	223	xã	Đại Thành
2848	7855	xa_thuong_thang	223	xã	Thường Thắng
2849	7858	xa_hop_thinh	223	xã	Hợp Thịnh
2850	7861	xa_danh_thang	223	xã	Danh Thắng
2851	7864	xa_mai_trung	223	xã	Mai Trung
2852	7867	xa_doan_bai	223	xã	Đoan Bái
2853	7870	xa_bac_ly	223	xã	Bắc Lý
2854	7873	xa_xuan_cam	223	xã	Xuân Cẩm
2855	7876	xa_huong_lam	223	xã	Hương Lâm
2856	7879	xa_dong_lo	223	xã	Đông Lỗ
2857	7882	xa_chau_minh	223	xã	Châu Minh
2858	7885	xa_mai_dinh	223	xã	Mai Đình
2859	7888	phuong_duu_lau	227	phường	Dữu Lâu
2860	7891	phuong_van_co	227	phường	Vân Cơ
2861	7894	phuong_nong_trang	227	phường	Nông Trang
2862	7897	phuong_tan_dan	227	phường	Tân Dân
2863	7900	phuong_gia_cam	227	phường	Gia Cẩm
2864	7903	phuong_tien_cat	227	phường	Tiên Cát
2865	7906	phuong_tho_son	227	phường	Thọ Sơn
2866	7909	phuong_thanh_mieu	227	phường	Thanh Miếu
2867	7912	phuong_bach_hac	227	phường	Bạch Hạc
2868	7915	phuong_ben_got	227	phường	Bến Gót
2869	7918	phuong_van_phu	227	phường	Vân Phú
2870	7921	xa_phuong_lau	227	xã	Phượng Lâu
2871	7924	xa_thuy_van	227	xã	Thụy Vân
2872	7927	phuong_minh_phuong	227	phường	Minh Phương
2873	7930	xa_trung_vuong	227	xã	Trưng Vương
2874	7933	phuong_minh_nong	227	phường	Minh Nông
2875	7936	xa_song_lo	227	xã	Sông Lô
2876	8281	xa_kim_duc	227	xã	Kim Đức
2877	8287	xa_hung_lo	227	xã	Hùng Lô
2878	8503	xa_hy_cuong	227	xã	Hy Cương
2879	8506	xa_chu_hoa	227	xã	Chu Hóa
2880	8515	xa_thanh_dinh	227	xã	Thanh Đình
2881	7942	phuong_hung_vuong	228	phường	Hùng Vương
2882	7945	phuong_phong_chau	228	phường	Phong Châu
2883	7948	phuong_au_co	228	phường	Âu Cơ
2884	7951	xa_ha_loc	228	xã	Hà Lộc
2885	7954	xa_phu_ho	228	xã	Phú Hộ
2886	7957	xa_van_lung	228	xã	Văn Lung
2887	7960	xa_thanh_minh	228	xã	Thanh Minh
2888	7963	xa_ha_thach	228	xã	Hà Thạch
2889	7966	phuong_thanh_vinh	228	phường	Thanh Vinh
2890	7969	thi_tran_doan_hung	230	thị trấn	Đoan Hùng
2891	7975	xa_hung_xuyen	230	xã	Hùng Xuyên
2892	7981	xa_bang_luan	230	xã	Bằng Luân
2893	7984	xa_van_du	230	xã	Vân Du
2894	7987	xa_phu_lam	230	xã	Phú Lâm
2895	7993	xa_minh_luong	230	xã	Minh Lương
2896	7996	xa_bang_doan	230	xã	Bằng Doãn
2897	7999	xa_chi_dam	230	xã	Chí Đám
2898	8005	xa_phuc_lai	230	xã	Phúc Lai
2899	8008	xa_ngoc_quan	230	xã	Ngọc Quan
2900	8014	xa_hop_nhat	230	xã	Hợp Nhất
2901	8017	xa_soc_dang	230	xã	Sóc Đăng
2902	8023	xa_tay_coc	230	xã	Tây Cốc
2903	8026	xa_yen_kien	230	xã	Yên Kiện
2904	8029	xa_hung_long	230	xã	Hùng Long
2905	8032	xa_vu_quang	230	xã	Vụ Quang
2906	8035	xa_van_don	230	xã	Vân Đồn
2907	8038	xa_tieu_son	230	xã	Tiêu Sơn
2908	8041	xa_minh_tien	230	xã	Minh Tiến
2909	8044	xa_minh_phu	230	xã	Minh Phú
2910	8047	xa_chan_mong	230	xã	Chân Mộng
2911	8050	xa_ca_dinh	230	xã	Ca Đình
2912	8053	thi_tran_ha_hoa	231	thị trấn	Hạ Hoà
2913	8056	xa_dai_pham	231	xã	Đại Phạm
2914	8062	xa_dan_thuong	231	xã	Đan Thượng
2915	8065	xa_ha_luong	231	xã	Hà Lương
2916	8071	xa_tu_hiep	231	xã	Tứ Hiệp
2917	8080	xa_hien_luong	231	xã	Hiền Lương
2918	8089	xa_phuong_vien	231	xã	Phương Viên
2919	8092	xa_gia_dien	231	xã	Gia Điền
2920	8095	xa_am_ha	231	xã	Ấm Hạ
2921	8104	xa_huong_xa	231	xã	Hương Xạ
2922	8110	xa_xuan_ang	231	xã	Xuân Áng
2923	8113	xa_yen_ky	231	xã	Yên Kỳ
2924	8119	xa_minh_hac	231	xã	Minh Hạc
2925	8122	xa_lang_son	231	xã	Lang Sơn
2926	8125	xa_bang_gia	231	xã	Bằng Giã
2927	8128	xa_yen_luat	231	xã	Yên Luật
2928	8131	xa_vo_tranh	231	xã	Vô Tranh
2929	8134	xa_van_lang	231	xã	Văn Lang
2930	8140	xa_minh_coi	231	xã	Minh Côi
2931	8143	xa_vinh_chan	231	xã	Vĩnh Chân
2932	8152	thi_tran_thanh_ba	232	thị trấn	Thanh Ba
2933	8156	xa_van_linh	232	xã	Vân Lĩnh
2934	8158	xa_dong_linh	232	xã	Đông Lĩnh
2935	8161	xa_dai_an	232	xã	Đại An
2936	8164	xa_hanh_cu	232	xã	Hanh Cù
2937	8170	xa_dong_xuan	232	xã	Đồng Xuân
2938	8173	xa_quang_yen	232	xã	Quảng Yên
2939	8179	xa_ninh_dan	232	xã	Ninh Dân
2940	8194	xa_vo_lao	232	xã	Võ Lao
2941	8197	xa_khai_xuan	232	xã	Khải Xuân
2942	8200	xa_man_lan	232	xã	Mạn Lạn
2943	8203	xa_hoang_cuong	232	xã	Hoàng Cương
2944	8206	xa_chi_tien	232	xã	Chí Tiên
2945	8209	xa_dong_thanh	232	xã	Đông Thành
2946	8215	xa_son_cuong	232	xã	Sơn Cương
2947	8218	xa_thanh_ha	232	xã	Thanh Hà
2948	8221	xa_do_son	232	xã	Đỗ Sơn
2949	8224	xa_do_xuyen	232	xã	Đỗ Xuyên
2950	8227	xa_luong_lo	232	xã	Lương Lỗ
2951	8230	thi_tran_phong_chau	233	thị trấn	Phong Châu
2952	8233	xa_phu_my	233	xã	Phú Mỹ
2953	8234	xa_le_my	233	xã	Lệ Mỹ
2954	8236	xa_lien_hoa	233	xã	Liên Hoa
2955	8239	xa_tram_than	233	xã	Trạm Thản
2956	8242	xa_tri_quan	233	xã	Trị Quận
2957	8245	xa_trung_giap	233	xã	Trung Giáp
2958	8248	xa_tien_phu	233	xã	Tiên Phú
2959	8251	xa_ha_giap	233	xã	Hạ Giáp
2960	8254	xa_bao_thanh	233	xã	Bảo Thanh
2961	8257	xa_phu_loc	233	xã	Phú Lộc
2962	8260	xa_gia_thanh	233	xã	Gia Thanh
2963	8263	xa_tien_du	233	xã	Tiên Du
2964	8266	xa_phu_nham	233	xã	Phú Nham
2965	8272	xa_an_dao	233	xã	An Đạo
2966	8275	xa_binh_phu	233	xã	Bình Phú
2967	8278	xa_phu_ninh	233	xã	Phù Ninh
2968	8290	thi_tran_yen_lap	234	thị trấn	Yên Lập
2969	8293	xa_my_lung	234	xã	Mỹ Lung
2970	8296	xa_my_luong	234	xã	Mỹ Lương
2971	8299	xa_luong_son	234	xã	Lương Sơn
2972	8302	xa_xuan_an	234	xã	Xuân An
2973	8305	xa_xuan_vien	234	xã	Xuân Viên
2974	8308	xa_xuan_thuy	234	xã	Xuân Thủy
2975	8311	xa_trung_son	234	xã	Trung Sơn
2976	8314	xa_hung_long	234	xã	Hưng Long
2977	8317	xa_nga_hoang	234	xã	Nga Hoàng
2978	8320	xa_dong_lac	234	xã	Đồng Lạc
2979	8323	xa_thuong_long	234	xã	Thượng Long
2980	8326	xa_dong_thinh	234	xã	Đồng Thịnh
2981	8329	xa_phuc_khanh	234	xã	Phúc Khánh
2982	8332	xa_minh_hoa	234	xã	Minh Hòa
2983	8335	xa_ngoc_lap	234	xã	Ngọc Lập
2984	8338	xa_ngoc_dong	234	xã	Ngọc Đồng
2985	8341	thi_tran_cam_khe	235	thị trấn	Cẩm Khê
2986	8344	xa_tien_luong	235	xã	Tiên Lương
2987	8347	xa_tuy_loc	235	xã	Tuy Lộc
2988	8350	xa_ngo_xa	235	xã	Ngô Xá
2989	8353	xa_minh_tan	235	xã	Minh Tân
2990	8356	xa_phuong_vi	235	xã	Phượng Vĩ
2991	8362	xa_thuy_lieu	235	xã	Thụy Liễu
2992	8374	xa_tung_khe	235	xã	Tùng Khê
2993	8377	xa_tam_son	235	xã	Tam Sơn
2994	8380	xa_van_ban	235	xã	Văn Bán
2995	8383	xa_cap_dan	235	xã	Cấp Dẫn
2996	8389	xa_xuong_thinh	235	xã	Xương Thịnh
2997	8392	xa_phu_khe	235	xã	Phú Khê
2998	8395	xa_son_tinh	235	xã	Sơn Tình
2999	8398	xa_yen_tap	235	xã	Yên Tập
3000	8401	xa_huong_lung	235	xã	Hương Lung
3001	8404	xa_ta_xa	235	xã	Tạ Xá
3002	8407	xa_phu_lac	235	xã	Phú Lạc
3003	8413	xa_chuong_xa	235	xã	Chương Xá
3004	8416	xa_hung_viet	235	xã	Hùng Việt
3005	8419	xa_van_khuc	235	xã	Văn Khúc
3006	8422	xa_yen_duong	235	xã	Yên Dưỡng
3007	8428	xa_dieu_luong	235	xã	Điêu Lương
3008	8431	xa_dong_luong	235	xã	Đồng Lương
3009	8434	thi_tran_hung_hoa	236	thị trấn	Hưng Hoá
3010	8440	xa_hien_quan	236	xã	Hiền Quan
3011	8443	xa_bac_son	236	xã	Bắc Sơn
3012	8446	xa_thanh_uyen	236	xã	Thanh Uyên
3013	8461	xa_lam_son	236	xã	Lam Sơn
3014	8467	xa_van_xuan	236	xã	Vạn Xuân
3015	8470	xa_quang_huc	236	xã	Quang Húc
3016	8473	xa_huong_non	236	xã	Hương Nộn
3017	8476	xa_te_le	236	xã	Tề Lễ
3018	8479	xa_tho_van	236	xã	Thọ Văn
3019	8482	xa_di_nau	236	xã	Dị Nậu
3020	8491	xa_dan_quyen	236	xã	Dân Quyền
3021	8494	thi_tran_lam_thao	237	thị trấn	Lâm Thao
3022	8497	xa_tien_kien	237	xã	Tiên Kiên
3023	8498	thi_tran_hung_son	237	thị trấn	Hùng Sơn
3024	8500	xa_xuan_lung	237	xã	Xuân Lũng
3025	8509	xa_xuan_huy	237	xã	Xuân Huy
3026	8512	xa_thach_son	237	xã	Thạch Sơn
3027	8518	xa_son_vi	237	xã	Sơn Vi
3028	8521	xa_phung_nguyen	237	xã	Phùng Nguyên
3029	8527	xa_cao_xa	237	xã	Cao Xá
3030	8533	xa_vinh_lai	237	xã	Vĩnh Lại
3031	8536	xa_tu_xa	237	xã	Tứ Xã
3032	8539	xa_ban_nguyen	237	xã	Bản Nguyên
3033	8542	thi_tran_thanh_son	238	thị trấn	Thanh Sơn
3034	8563	xa_son_hung	238	xã	Sơn Hùng
3035	8572	xa_dich_qua	238	xã	Địch Quả
3036	8575	xa_giap_lai	238	xã	Giáp Lai
3037	8581	xa_thuc_luyen	238	xã	Thục Luyện
3038	8584	xa_vo_mieu	238	xã	Võ Miếu
3039	8587	xa_thach_khoan	238	xã	Thạch Khoán
3040	8602	xa_cu_thang	238	xã	Cự Thắng
3041	8605	xa_tat_thang	238	xã	Tất Thắng
3042	8611	xa_van_mieu	238	xã	Văn Miếu
3043	8614	xa_cu_dong	238	xã	Cự Đồng
3044	8623	xa_thang_son	238	xã	Thắng Sơn
3045	8629	xa_tan_minh	238	xã	Tân Minh
3046	8632	xa_huong_can	238	xã	Hương Cần
3047	8635	xa_kha_cuu	238	xã	Khả Cửu
3048	8638	xa_dong_cuu	238	xã	Đông Cửu
3049	8641	xa_tan_lap	238	xã	Tân Lập
3050	8644	xa_yen_lang	238	xã	Yên Lãng
3051	8647	xa_yen_luong	238	xã	Yên Lương
3052	8650	xa_thuong_cuu	238	xã	Thượng Cửu
3053	8653	xa_luong_nha	238	xã	Lương Nha
3054	8656	xa_yen_son	238	xã	Yên Sơn
3055	8659	xa_tinh_nhue	238	xã	Tinh Nhuệ
3056	8662	xa_dao_xa	239	xã	Đào Xá
3057	8665	xa_thach_dong	239	xã	Thạch Đồng
3058	8668	xa_xuan_loc	239	xã	Xuân Lộc
3059	8671	xa_tan_phuong	239	xã	Tân Phương
3060	8674	thi_tran_thanh_thuy	239	thị trấn	Thanh Thủy
3061	8677	xa_son_thuy	239	xã	Sơn Thủy
3062	8680	xa_bao_yen	239	xã	Bảo Yên
3063	8683	xa_doan_ha	239	xã	Đoan Hạ
3064	8686	xa_dong_trung	239	xã	Đồng Trung
3065	8689	xa_hoang_xa	239	xã	Hoàng Xá
3066	8701	xa_tu_vu	239	xã	Tu Vũ
3067	8545	xa_thu_cuc	240	xã	Thu Cúc
3068	8548	xa_thach_kiet	240	xã	Thạch Kiệt
3069	8551	xa_thu_ngac	240	xã	Thu Ngạc
3070	8554	xa_kiet_son	240	xã	Kiệt Sơn
3071	8557	xa_dong_son	240	xã	Đồng Sơn
3072	8560	xa_lai_dong	240	xã	Lai Đồng
3073	8566	xa_tan_phu	240	xã	Tân Phú
3074	8569	xa_my_thuan	240	xã	Mỹ Thuận
3075	8578	xa_tan_son	240	xã	Tân Sơn
3076	8590	xa_xuan_dai	240	xã	Xuân Đài
3077	8593	xa_minh_dai	240	xã	Minh Đài
3078	8596	xa_van_luong	240	xã	Văn Luông
3079	8599	xa_xuan_son	240	xã	Xuân Sơn
3080	8608	xa_long_coc	240	xã	Long Cốc
3081	8617	xa_kim_thuong	240	xã	Kim Thượng
3082	8620	xa_tam_thanh	240	xã	Tam Thanh
3083	8626	xa_vinh_tien	240	xã	Vinh Tiền
3084	8707	phuong_tich_son	243	phường	Tích Sơn
3085	8710	phuong_lien_bao	243	phường	Liên Bảo
3086	8713	phuong_hoi_hop	243	phường	Hội Hợp
3087	8716	phuong_dong_da	243	phường	Đống Đa
3088	8719	phuong_ngo_quyen	243	phường	Ngô Quyền
3089	8722	phuong_dong_tam	243	phường	Đồng Tâm
3090	8725	xa_dinh_trung	243	xã	Định Trung
3091	8728	phuong_khai_quang	243	phường	Khai Quang
3092	8731	xa_thanh_tru	243	xã	Thanh Trù
3093	8734	phuong_trung_trac	244	phường	Trưng Trắc
3094	8737	phuong_hung_vuong	244	phường	Hùng Vương
3095	8740	phuong_trung_nhi	244	phường	Trưng Nhị
3096	8743	phuong_phuc_thang	244	phường	Phúc Thắng
3097	8746	phuong_xuan_hoa	244	phường	Xuân Hoà
3098	8747	phuong_dong_xuan	244	phường	Đồng Xuân
3099	8749	xa_ngoc_thanh	244	xã	Ngọc Thanh
3100	8752	xa_cao_minh	244	xã	Cao Minh
3101	8755	phuong_nam_viem	244	phường	Nam Viêm
3102	8758	phuong_tien_chau	244	phường	Tiền Châu
3103	8761	thi_tran_lap_thach	246	thị trấn	Lập Thạch
3104	8764	xa_quang_son	246	xã	Quang Sơn
3105	8767	xa_ngoc_my	246	xã	Ngọc Mỹ
3106	8770	xa_hop_ly	246	xã	Hợp Lý
3107	8785	xa_bac_binh	246	xã	Bắc Bình
3108	8788	xa_thai_hoa	246	xã	Thái Hòa
3109	8789	thi_tran_hoa_son	246	thị trấn	Hoa Sơn
3110	8791	xa_lien_son	246	xã	Liễn Sơn
3111	8794	xa_xuan_hoa	246	xã	Xuân Hòa
3112	8797	xa_van_truc	246	xã	Vân Trục
3113	8812	xa_lien_hoa	246	xã	Liên Hòa
3114	8815	xa_tu_du	246	xã	Tử Du
3115	8833	xa_ban_gian	246	xã	Bàn Giản
3116	8836	xa_xuan_loi	246	xã	Xuân Lôi
3117	8839	xa_dong_ich	246	xã	Đồng Ích
3118	8842	xa_tien_lu	246	xã	Tiên Lữ
3119	8845	xa_van_quan	246	xã	Văn Quán
3120	8857	xa_dinh_chu	246	xã	Đình Chu
3121	8863	xa_trieu_de	246	xã	Triệu Đề
3122	8866	xa_son_dong	246	xã	Sơn Đông
3123	8869	thi_tran_hop_hoa	247	thị trấn	Hợp Hòa
3124	8872	xa_hoang_hoa	247	xã	Hoàng Hoa
3125	8875	xa_dong_tinh	247	xã	Đồng Tĩnh
3126	8878	xa_kim_long	247	xã	Kim Long
3127	8881	xa_huong_dao	247	xã	Hướng Đạo
3128	8884	xa_dao_tu	247	xã	Đạo Tú
3129	8887	xa_an_hoa	247	xã	An Hòa
3130	8890	xa_thanh_van	247	xã	Thanh Vân
3131	8893	xa_duy_phien	247	xã	Duy Phiên
3132	8896	xa_hoang_dan	247	xã	Hoàng Đan
3133	8899	xa_hoang_lau	247	xã	Hoàng Lâu
3134	8902	xa_van_hoi	247	xã	Vân Hội
3135	8905	xa_hop_thinh	247	xã	Hợp Thịnh
3136	8908	thi_tran_tam_dao	248	thị trấn	Tam Đảo
3137	8911	thi_tran_hop_chau	248	thị trấn	Hợp Châu
3138	8914	xa_dao_tru	248	xã	Đạo Trù
3139	8917	xa_yen_duong	248	xã	Yên Dương
3140	8920	xa_bo_ly	248	xã	Bồ Lý
3141	8923	thi_tran_dai_dinh	248	thị trấn	Đại Đình
3142	8926	xa_tam_quan	248	xã	Tam Quan
3143	8929	xa_ho_son	248	xã	Hồ Sơn
3144	8932	xa_minh_quang	248	xã	Minh Quang
3145	8935	thi_tran_huong_canh	249	thị trấn	Hương Canh
3146	8936	thi_tran_gia_khanh	249	thị trấn	Gia Khánh
3147	8938	xa_trung_my	249	xã	Trung Mỹ
3148	8944	thi_tran_ba_hien	249	thị trấn	Bá Hiến
3149	8947	xa_thien_ke	249	xã	Thiện Kế
3150	8950	xa_huong_son	249	xã	Hương Sơn
3151	8953	xa_tam_hop	249	xã	Tam Hợp
3152	8956	xa_quat_luu	249	xã	Quất Lưu
3153	8959	xa_son_loi	249	xã	Sơn Lôi
3154	8962	thi_tran_dao_duc	249	thị trấn	Đạo Đức
3155	8965	xa_tan_phong	249	xã	Tân Phong
3156	8968	thi_tran_thanh_lang	249	thị trấn	Thanh Lãng
3157	8971	xa_phu_xuan	249	xã	Phú Xuân
3158	9025	thi_tran_yen_lac	251	thị trấn	Yên Lạc
3159	9028	xa_dong_cuong	251	xã	Đồng Cương
3160	9031	xa_dong_van	251	xã	Đồng Văn
3161	9034	xa_binh_dinh	251	xã	Bình Định
3162	9037	xa_trung_nguyen	251	xã	Trung Nguyên
3163	9040	xa_te_lo	251	xã	Tề Lỗ
3164	9043	xa_tam_hong	251	xã	Tam Hồng
3165	9046	xa_yen_dong	251	xã	Yên Đồng
3166	9049	xa_van_tien	251	xã	Văn Tiến
3167	9052	xa_nguyet_duc	251	xã	Nguyệt Đức
3168	9055	xa_yen_phuong	251	xã	Yên Phương
3169	9058	xa_hong_phuong	251	xã	Hồng Phương
3170	9061	xa_trung_kien	251	xã	Trung Kiên
3171	9064	xa_lien_chau	251	xã	Liên Châu
3172	9067	xa_dai_tu	251	xã	Đại Tự
3173	9070	xa_hong_chau	251	xã	Hồng Châu
3174	9073	xa_trung_ha	251	xã	Trung Hà
3175	9076	thi_tran_vinh_tuong	252	thị trấn	Vĩnh Tường
3176	9079	xa_kim_xa	252	xã	Kim Xá
3177	9082	xa_yen_binh	252	xã	Yên Bình
3178	9085	xa_chan_hung	252	xã	Chấn Hưng
3179	9088	xa_nghia_hung	252	xã	Nghĩa Hưng
3180	9091	xa_yen_lap	252	xã	Yên Lập
3181	9094	xa_viet_xuan	252	xã	Việt Xuân
3182	9097	xa_bo_sao	252	xã	Bồ Sao
3183	9100	xa_dai_dong	252	xã	Đại Đồng
3184	9103	xa_tan_tien	252	xã	Tân Tiến
3185	9106	xa_lung_hoa	252	xã	Lũng Hoà
3186	9109	xa_cao_dai	252	xã	Cao Đại
3187	9112	thi_tran_tho_tang	252	thị trấn	Thổ Tang
3188	9115	xa_vinh_son	252	xã	Vĩnh Sơn
3189	9118	xa_binh_duong	252	xã	Bình Dương
3190	9124	xa_tan_phu	252	xã	Tân Phú
3191	9127	xa_thuong_trung	252	xã	Thượng Trưng
3192	9130	xa_vu_di	252	xã	Vũ Di
3193	9133	xa_ly_nhan	252	xã	Lý Nhân
3194	9136	xa_tuan_chinh	252	xã	Tuân Chính
3195	9139	xa_van_xuan	252	xã	Vân Xuân
3196	9142	xa_tam_phuc	252	xã	Tam Phúc
3197	9145	thi_tran_tu_trung	252	thị trấn	Tứ Trưng
3198	9148	xa_ngu_kien	252	xã	Ngũ Kiên
3199	9151	xa_an_tuong	252	xã	An Tường
3200	9154	xa_vinh_thinh	252	xã	Vĩnh Thịnh
3201	9157	xa_phu_da	252	xã	Phú Đa
3202	9160	xa_vinh_ninh	252	xã	Vĩnh Ninh
3203	8773	xa_lang_cong	253	xã	Lãng Công
3204	8776	xa_quang_yen	253	xã	Quang Yên
3205	8779	xa_bach_luu	253	xã	Bạch Lưu
3206	8782	xa_hai_luu	253	xã	Hải Lựu
3207	8800	xa_dong_que	253	xã	Đồng Quế
3208	8803	xa_nhan_dao	253	xã	Nhân Đạo
3209	8806	xa_don_nhan	253	xã	Đôn Nhân
3210	8809	xa_phuong_khoan	253	xã	Phương Khoan
3211	8818	xa_tan_lap	253	xã	Tân Lập
3212	8821	xa_nhao_son	253	xã	Nhạo Sơn
3213	8824	thi_tran_tam_son	253	thị trấn	Tam Sơn
3214	8827	xa_nhu_thuy	253	xã	Như Thụy
3215	8830	xa_yen_thach	253	xã	Yên Thạch
3216	8848	xa_dong_thinh	253	xã	Đồng Thịnh
3217	8851	xa_tu_yen	253	xã	Tứ Yên
3218	8854	xa_duc_bac	253	xã	Đức Bác
3219	8860	xa_cao_phong	253	xã	Cao Phong
3220	9163	phuong_vu_ninh	256	phường	Vũ Ninh
3221	9166	phuong_dap_cau	256	phường	Đáp Cầu
3222	9169	phuong_thi_cau	256	phường	Thị Cầu
3223	9172	phuong_kinh_bac	256	phường	Kinh Bắc
3224	9175	phuong_ve_an	256	phường	Vệ An
3225	9178	phuong_tien_an	256	phường	Tiền An
3226	9181	phuong_dai_phuc	256	phường	Đại Phúc
3227	9184	phuong_ninh_xa	256	phường	Ninh Xá
3228	9187	phuong_suoi_hoa	256	phường	Suối Hoa
3229	9190	phuong_vo_cuong	256	phường	Võ Cường
3230	9214	phuong_hoa_long	256	phường	Hòa Long
3231	9226	phuong_van_an	256	phường	Vạn An
3232	9235	phuong_khuc_xuyen	256	phường	Khúc Xuyên
3233	9244	phuong_phong_khe	256	phường	Phong Khê
3234	9256	phuong_kim_chan	256	phường	Kim Chân
3235	9271	phuong_van_duong	256	phường	Vân Dương
3236	9286	phuong_nam_son	256	phường	Nam Sơn
3237	9325	phuong_khac_niem	256	phường	Khắc Niệm
3238	9331	phuong_hap_linh	256	phường	Hạp Lĩnh
3239	9193	thi_tran_cho	258	thị trấn	Thị trấn Chờ
3240	9196	xa_dung_liet	258	xã	Dũng Liệt
3241	9199	xa_tam_da	258	xã	Tam Đa
3242	9202	xa_tam_giang	258	xã	Tam Giang
3243	9205	xa_yen_trung	258	xã	Yên Trung
3244	9208	xa_thuy_hoa	258	xã	Thụy Hòa
3245	9211	xa_hoa_tien	258	xã	Hòa Tiến
3246	9217	xa_dong_tien	258	xã	Đông Tiến
3247	9220	xa_yen_phu	258	xã	Yên Phụ
3248	9223	xa_trung_nghia	258	xã	Trung Nghĩa
3249	9229	xa_dong_phong	258	xã	Đông Phong
3250	9232	xa_long_chau	258	xã	Long Châu
3251	9238	xa_van_mon	258	xã	Văn Môn
3252	9241	xa_dong_tho	258	xã	Đông Thọ
3253	9247	thi_tran_pho_moi	259	thị trấn	Phố Mới
3254	9250	xa_viet_thong	259	xã	Việt Thống
3255	9253	xa_dai_xuan	259	xã	Đại Xuân
3256	9259	xa_nhan_hoa	259	xã	Nhân Hòa
3257	9262	xa_bang_an	259	xã	Bằng An
3258	9265	xa_phuong_lieu	259	xã	Phương Liễu
3259	9268	xa_que_tan	259	xã	Quế Tân
3260	9274	xa_phu_luong	259	xã	Phù Lương
3261	9277	xa_phu_lang	259	xã	Phù Lãng
3262	9280	xa_phuong_mao	259	xã	Phượng Mao
3263	9283	xa_viet_hung	259	xã	Việt Hùng
3264	9289	xa_ngoc_xa	259	xã	Ngọc Xá
3265	9292	xa_chau_phong	259	xã	Châu Phong
3266	9295	xa_bong_lai	259	xã	Bồng Lai
3267	9298	xa_cach_bi	259	xã	Cách Bi
3268	9301	xa_dao_vien	259	xã	Đào Viên
3269	9304	xa_yen_gia	259	xã	Yên Giả
3270	9307	xa_mo_dao	259	xã	Mộ Đạo
3271	9310	xa_duc_long	259	xã	Đức Long
3272	9313	xa_chi_lang	259	xã	Chi Lăng
3273	9316	xa_han_quang	259	xã	Hán Quảng
3274	9319	thi_tran_lim	260	thị trấn	Thị trấn Lim
3275	9322	xa_phu_lam	260	xã	Phú Lâm
3276	9328	xa_noi_due	260	xã	Nội Duệ
3277	9334	xa_lien_bao	260	xã	Liên Bão
3278	9337	xa_hien_van	260	xã	Hiên Vân
3279	9340	xa_hoan_son	260	xã	Hoàn Sơn
3280	9343	xa_lac_ve	260	xã	Lạc Vệ
3281	9346	xa_viet_doan	260	xã	Việt Đoàn
3282	9349	xa_phat_tich	260	xã	Phật Tích
3283	9352	xa_tan_chi	260	xã	Tân Chi
3284	9355	xa_dai_dong	260	xã	Đại Đồng
3285	9358	xa_tri_phuong	260	xã	Tri Phương
3286	9361	xa_minh_dao	260	xã	Minh Đạo
3287	9364	xa_canh_hung	260	xã	Cảnh Hưng
3288	9367	phuong_dong_ngan	261	phường	Đông Ngàn
3289	9370	phuong_tam_son	261	phường	Tam Sơn
3290	9373	phuong_huong_mac	261	phường	Hương Mạc
3291	9376	phuong_tuong_giang	261	phường	Tương Giang
3292	9379	phuong_phu_khe	261	phường	Phù Khê
3293	9382	phuong_dong_ky	261	phường	Đồng Kỵ
3294	9383	phuong_trang_ha	261	phường	Trang Hạ
3295	9385	phuong_dong_nguyen	261	phường	Đồng Nguyên
3296	9388	phuong_chau_khe	261	phường	Châu Khê
3297	9391	phuong_tan_hong	261	phường	Tân Hồng
3298	9394	phuong_dinh_bang	261	phường	Đình Bảng
3299	9397	phuong_phu_chan	261	phường	Phù Chẩn
3300	9400	thi_tran_ho	262	thị trấn	Thị trấn Hồ
3301	9403	xa_hoai_thuong	262	xã	Hoài Thượng
3302	9406	xa_dai_dong_thanh	262	xã	Đồng Thành
3303	9409	xa_mao_dien	262	xã	Mão Điền
3304	9412	xa_song_ho	262	xã	Song Hồ
3305	9415	xa_dinh_to	262	xã	Đình Tổ
3306	9418	xa_an_binh	262	xã	An Bình
3307	9421	xa_tri_qua	262	xã	Trí Quả
3308	9424	xa_gia_dong	262	xã	Gia Đông
3309	9427	xa_thanh_khuong	262	xã	Thanh Khương
3310	9430	xa_tram_lo	262	xã	Trạm Lộ
3311	9433	xa_xuan_lam	262	xã	Xuân Lâm
3312	9436	xa_ha_man	262	xã	Hà Mãn
3313	9439	xa_ngu_thai	262	xã	Ngũ Thái
3314	9442	xa_nguyet_duc	262	xã	Nguyệt Đức
3315	9445	xa_ninh_xa	262	xã	Ninh Xá
3316	9448	xa_nghia_dao	262	xã	Nghĩa Đạo
3317	9451	xa_song_lieu	262	xã	Song Liễu
3318	9454	thi_tran_gia_binh	263	thị trấn	Gia Bình
3319	9457	xa_van_ninh	263	xã	Vạn Ninh
3320	9460	xa_thai_bao	263	xã	Thái Bảo
3321	9463	xa_giang_son	263	xã	Giang Sơn
3322	9466	xa_cao_duc	263	xã	Cao Đức
3323	9469	xa_dai_lai	263	xã	Đại Lai
3324	9472	xa_song_giang	263	xã	Song Giang
3325	9475	xa_binh_duong	263	xã	Bình Dương
3326	9478	xa_lang_ngam	263	xã	Lãng Ngâm
3327	9481	xa_nhan_thang	263	xã	Nhân Thắng
3328	9484	xa_xuan_lai	263	xã	Xuân Lai
3329	9487	xa_dong_cuu	263	xã	Đông Cứu
3330	9490	xa_dai_bai	263	xã	Đại Bái
3331	9493	xa_quynh_phu	263	xã	Quỳnh Phú
3332	9496	thi_tran_thua	264	thị trấn	Thị trấn Thứa
3333	9499	xa_an_thinh	264	xã	An Thịnh
3334	9502	xa_trung_kenh	264	xã	Trung Kênh
3335	9505	xa_phu_hoa	264	xã	Phú Hòa
3336	9508	xa_my_huong	264	xã	Mỹ Hương
3337	9511	xa_tan_lang	264	xã	Tân Lãng
3338	9514	xa_quang_phu	264	xã	Quảng Phú
3339	9517	xa_trung_xa	264	xã	Trừng Xá
3340	9520	xa_lai_ha	264	xã	Lai Hạ
3341	9523	xa_trung_chinh	264	xã	Trung Chính
3342	9526	xa_minh_tan	264	xã	Minh Tân
3343	9529	xa_binh_dinh	264	xã	Bình Định
3344	9532	xa_phu_luong	264	xã	Phú Lương
3345	9535	xa_lam_thao	264	xã	Lâm Thao
3346	10507	phuong_cam_thuong	288	phường	Cẩm Thượng
3347	10510	phuong_binh_han	288	phường	Bình Hàn
3348	10513	phuong_ngoc_chau	288	phường	Ngọc Châu
3349	10514	phuong_nhi_chau	288	phường	Nhị Châu
3350	10516	phuong_quang_trung	288	phường	Quang Trung
3351	10519	phuong_nguyen_trai	288	phường	Nguyễn Trãi
3352	10522	phuong_pham_ngu_lao	288	phường	Ngũ Lão
3353	10525	phuong_tran_hung_dao	288	phường	Hưng Đạo
3354	10528	phuong_tran_phu	288	phường	Trần Phú
3355	10531	phuong_thanh_binh	288	phường	Thanh Bình
3356	10532	phuong_tan_binh	288	phường	Tân Bình
3357	10534	phuong_le_thanh_nghi	288	phường	Thanh Nghị
3358	10537	phuong_hai_tan	288	phường	Hải Tân
3359	10540	phuong_tu_minh	288	phường	Tứ Minh
3360	10543	phuong_viet_hoa	288	phường	Việt Hoà
3361	10660	phuong_ai_quoc	288	phường	Ái Quốc
3362	10663	xa_an_thuong	288	xã	An Thượng
3363	10672	phuong_nam_dong	288	phường	Nam Đồng
3364	10822	xa_quyet_thang	288	xã	Quyết Thắng
3365	10837	xa_tien_tien	288	xã	Tiền Tiến
3366	11002	phuong_thach_khoi	288	phường	Thạch Khôi
3367	11005	xa_lien_hong	288	xã	Liên Hồng
3368	11011	phuong_tan_hung	288	phường	Tân Hưng
3369	11017	xa_gia_xuyen	288	xã	Gia Xuyên
3370	11077	xa_ngoc_son	288	xã	Ngọc Sơn
3371	10546	phuong_pha_lai	290	phường	Phả Lại
3372	10549	phuong_sao_do	290	phường	Sao Đỏ
3373	10552	phuong_ben_tam	290	phường	Bến Tắm
3374	10555	xa_hoang_hoa_tham	290	xã	Hoa Thám
3375	10558	xa_bac_an	290	xã	Bắc An
3376	10561	xa_hung_dao	290	xã	Hưng Đạo
3377	10564	xa_le_loi	290	xã	Lê Lợi
3378	10567	phuong_hoang_tien	290	phường	Hoàng Tiến
3379	10570	phuong_cong_hoa	290	phường	Cộng Hoà
3380	10573	phuong_hoang_tan	290	phường	Hoàng Tân
3381	10576	phuong_co_thanh	290	phường	Cổ Thành
3382	10579	phuong_van_an	290	phường	Văn An
3383	10582	phuong_chi_minh	290	phường	Chí Minh
3384	10585	phuong_van_duc	290	phường	Văn Đức
3385	10588	phuong_thai_hoc	290	phường	Thái Học
3386	10591	xa_nhan_hue	290	xã	Nhân Huệ
3387	10594	phuong_an_lac	290	phường	An Lạc
3388	10600	phuong_dong_lac	290	phường	Đồng Lạc
3389	10603	phuong_tan_dan	290	phường	Tân Dân
3390	10606	thi_tran_nam_sach	291	thị trấn	Nam Sách
3391	10609	xa_nam_hung	291	xã	Nam Hưng
3392	10612	xa_nam_tan	291	xã	Nam Tân
3393	10615	xa_hop_tien	291	xã	Hợp Tiến
3394	10618	xa_hiep_cat	291	xã	Hiệp Cát
3395	10621	xa_thanh_quang	291	xã	Thanh Quang
3396	10624	xa_quoc_tuan	291	xã	Quốc Tuấn
3397	10627	xa_nam_chinh	291	xã	Nam Chính
3398	10630	xa_an_binh	291	xã	An Bình
3399	10633	xa_nam_trung	291	xã	Nam Trung
3400	10636	xa_an_son	291	xã	An Sơn
3401	10639	xa_cong_hoa	291	xã	Cộng Hòa
3402	10642	xa_thai_tan	291	xã	Thái Tân
3403	10645	xa_an_lam	291	xã	An Lâm
3404	10648	xa_phu_dien	291	xã	Phú Điền
3405	10651	xa_nam_hong	291	xã	Nam Hồng
3406	10654	xa_hong_phong	291	xã	Hồng Phong
3407	10657	xa_dong_lac	291	xã	Đồng Lạc
3408	10666	xa_minh_tan	291	xã	Minh Tân
3409	10675	phuong_an_luu	292	phường	An Lưu
3410	10678	xa_bach_dang	292	xã	Bạch Đằng
3411	10681	phuong_that_hung	292	phường	Thất Hùng
3412	10684	xa_le_ninh	292	xã	Lê Ninh
3413	10687	xa_hoanh_son	292	xã	Hoành Sơn
3414	10693	phuong_pham_thai	292	phường	Phạm Thái
3415	10696	phuong_duy_tan	292	phường	Duy Tân
3416	10699	phuong_tan_dan	292	phường	Tân Dân
3417	10702	phuong_minh_tan	292	phường	Minh Tân
3418	10705	xa_quang_thanh	292	xã	Quang Thành
3419	10708	xa_hiep_hoa	292	xã	Hiệp Hòa
3420	10714	phuong_phu_thu	292	phường	Phú Thứ
3421	10717	xa_thang_long	292	xã	Thăng Long
3422	10720	xa_lac_long	292	xã	Lạc Long
3423	10723	phuong_an_sinh	292	phường	An Sinh
3424	10726	phuong_hiep_son	292	phường	Hiệp Sơn
3425	10729	xa_thuong_quan	292	xã	Thượng Quận
3426	10732	phuong_an_phu	292	phường	An Phụ
3427	10735	phuong_hiep_an	292	phường	Hiệp An
3428	10738	phuong_long_xuyen	292	phường	Long Xuyên
3429	10741	phuong_thai_thinh	292	phường	Thái Thịnh
3430	10744	phuong_hien_thanh	292	phường	Hiến Thành
3431	10747	xa_minh_hoa	292	xã	Minh Hòa
3432	10750	thi_tran_phu_thai	293	thị trấn	Phú Thái
3433	10753	xa_lai_vu	293	xã	Lai Vu
3434	10756	xa_cong_hoa	293	xã	Cộng Hòa
3435	10759	xa_thuong_vu	293	xã	Thượng Vũ
3436	10762	xa_co_dung	293	xã	Cổ Dũng
3437	10768	xa_tuan_viet	293	xã	Tuấn Việt
3438	10771	xa_kim_xuyen	293	xã	Kim Xuyên
3439	10774	xa_phuc_thanh_a	293	xã	Thành A
3440	10777	xa_ngu_phuc	293	xã	Ngũ Phúc
3441	10780	xa_kim_anh	293	xã	Kim Anh
3442	10783	xa_kim_lien	293	xã	Kim Liên
3443	10786	xa_kim_tan	293	xã	Kim Tân
3444	10792	xa_kim_dinh	293	xã	Kim Đính
3445	10798	xa_binh_dan	293	xã	Bình Dân
3446	10801	xa_tam_ky	293	xã	Tam Kỳ
3447	10804	xa_dong_cam	293	xã	Đồng Cẩm
3448	10807	xa_lien_hoa	293	xã	Liên Hòa
3449	10810	xa_dai_duc	293	xã	Đại Đức
3450	10813	thi_tran_thanh_ha	294	thị trấn	Thanh Hà
3451	10816	xa_hong_lac	294	xã	Hồng Lạc
3452	10819	xa_viet_hong	294	xã	Việt Hồng
3453	10825	xa_tan_viet	294	xã	Tân Việt
3454	10828	xa_cam_che	294	xã	Cẩm Chế
3455	10831	xa_thanh_an	294	xã	Thanh An
3456	10834	xa_thanh_lang	294	xã	Thanh Lang
3457	10840	xa_tan_an	294	xã	Tân An
3458	10843	xa_lien_mac	294	xã	Liên Mạc
3459	10846	xa_thanh_hai	294	xã	Thanh Hải
3460	10849	xa_thanh_khe	294	xã	Thanh Khê
3461	10852	xa_thanh_xa	294	xã	Thanh Xá
3462	10855	xa_thanh_xuan	294	xã	Thanh Xuân
3463	10861	xa_thanh_thuy	294	xã	Thanh Thủy
3464	10864	xa_an_phuong	294	xã	An Phượng
3465	10867	xa_thanh_son	294	xã	Thanh Sơn
3466	10876	xa_thanh_quang	294	xã	Thanh Quang
3467	10879	xa_thanh_hong	294	xã	Thanh Hồng
3468	10882	xa_thanh_cuong	294	xã	Thanh Cường
3469	10885	xa_vinh_lap	294	xã	Vĩnh Lập
3470	10888	thi_tran_cam_giang	295	thị trấn	Cẩm Giang
3471	10891	thi_tran_lai_cach	295	thị trấn	Lai Cách
3472	10894	xa_cam_hung	295	xã	Cẩm Hưng
3473	10897	xa_cam_hoang	295	xã	Cẩm Hoàng
3474	10900	xa_cam_van	295	xã	Cẩm Văn
3475	10903	xa_ngoc_lien	295	xã	Ngọc Liên
3476	10906	xa_thach_loi	295	xã	Thạch Lỗi
3477	10909	xa_cam_vu	295	xã	Cẩm Vũ
3478	10912	xa_duc_chinh	295	xã	Đức Chính
3479	10918	xa_dinh_son	295	xã	Định Sơn
3480	10924	xa_luong_dien	295	xã	Lương Điền
3481	10927	xa_cao_an	295	xã	Cao An
3482	10930	xa_tan_truong	295	xã	Tân Trường
3483	10933	xa_cam_phuc	295	xã	Cẩm Phúc
3484	10936	xa_cam_dien	295	xã	Cẩm Điền
3485	10939	xa_cam_dong	295	xã	Cẩm Đông
3486	10942	xa_cam_doai	295	xã	Cẩm Đoài
3487	10945	thi_tran_ke_sat	296	thị trấn	Kẻ Sặt
3488	10951	xa_vinh_hung	296	xã	Vĩnh Hưng
3489	10954	xa_hung_thang	296	xã	Hùng Thắng
3490	10960	xa_vinh_hong	296	xã	Vĩnh Hồng
3491	10963	xa_long_xuyen	296	xã	Long Xuyên
3492	10966	xa_tan_viet	296	xã	Tân Việt
3493	10969	xa_thuc_khang	296	xã	Thúc Kháng
3494	10972	xa_tan_hong	296	xã	Tân Hồng
3495	10975	xa_binh_minh	296	xã	Bình Minh
3496	10978	xa_hong_khe	296	xã	Hồng Khê
3497	10981	xa_thai_hoc	296	xã	Thái Học
3498	10984	xa_co_bi	296	xã	Cổ Bì
3499	10987	xa_nhan_quyen	296	xã	Nhân Quyền
3500	10990	xa_thai_duong	296	xã	Thái Dương
3501	10993	xa_thai_hoa	296	xã	Thái Hòa
3502	10996	xa_binh_xuyen	296	xã	Bình Xuyên
3503	10999	thi_tran_gia_loc	297	thị trấn	Gia Lộc
3504	11008	xa_thong_nhat	297	xã	Thống Nhất
3505	11020	xa_yet_kieu	297	xã	Yết Kiêu
3506	11029	xa_gia_tan	297	xã	Gia Tân
3507	11032	xa_tan_tien	297	xã	Tân Tiến
3508	11035	xa_gia_khanh	297	xã	Gia Khánh
3509	11038	xa_gia_luong	297	xã	Gia Lương
3510	11041	xa_le_loi	297	xã	Lê Lợi
3511	11044	xa_toan_thang	297	xã	Toàn Thắng
3512	11047	xa_hoang_dieu	297	xã	Hoàng Diệu
3513	11050	xa_hong_hung	297	xã	Hồng Hưng
3514	11053	xa_pham_tran	297	xã	Phạm Trấn
3515	11056	xa_doan_thuong	297	xã	Đoàn Thượng
3516	11059	xa_thong_kenh	297	xã	Thống Kênh
3517	11062	xa_quang_minh	297	xã	Quang Minh
3518	11065	xa_dong_quang	297	xã	Đồng Quang
3519	11068	xa_nhat_tan	297	xã	Nhật Tân
3520	11071	xa_duc_xuong	297	xã	Đức Xương
3521	11074	thi_tran_tu_ky	298	thị trấn	Tứ Kỳ
3522	11083	xa_dai_son	298	xã	Đại Sơn
3523	11086	xa_hung_dao	298	xã	Hưng Đạo
3524	11089	xa_ngoc_ky	298	xã	Ngọc Kỳ
3525	11092	xa_binh_lang	298	xã	Bình Lăng
3526	11095	xa_chi_minh	298	xã	Chí Minh
3527	11098	xa_tai_son	298	xã	Tái Sơn
3528	11101	xa_quang_phuc	298	xã	Quang Phục
3529	11110	xa_dan_chu	298	xã	Dân Chủ
3530	11113	xa_tan_ky	298	xã	Tân Kỳ
3531	11116	xa_quang_khai	298	xã	Quang Khải
3532	11119	xa_dai_hop	298	xã	Đại Hợp
3533	11122	xa_quang_nghiep	298	xã	Quảng Nghiệp
3534	11125	xa_an_thanh	298	xã	An Thanh
3535	11128	xa_minh_duc	298	xã	Minh Đức
3536	11131	xa_van_to	298	xã	Văn Tố
3537	11134	xa_quang_trung	298	xã	Quang Trung
3538	11137	xa_phuong_ky	298	xã	Phượng Kỳ
3539	11140	xa_cong_lac	298	xã	Cộng Lạc
3540	11143	xa_tien_dong	298	xã	Tiên Động
3541	11146	xa_nguyen_giap	298	xã	Nguyên Giáp
3542	11149	xa_ha_ky	298	xã	Hà Kỳ
3543	11152	xa_ha_thanh	298	xã	Hà Thanh
3544	11155	thi_tran_ninh_giang	299	thị trấn	Ninh Giang
3545	11161	xa_ung_hoe	299	xã	Ứng Hoè
3546	11164	xa_nghia_an	299	xã	Nghĩa An
3547	11167	xa_hong_duc	299	xã	Hồng Đức
3548	11173	xa_an_duc	299	xã	An Đức
3549	11176	xa_van_phuc	299	xã	Vạn Phúc
3550	11179	xa_tan_huong	299	xã	Tân Hương
3551	11185	xa_vinh_hoa	299	xã	Vĩnh Hòa
3552	11188	xa_dong_xuyen	299	xã	Đông Xuyên
3553	11197	xa_tan_phong	299	xã	Tân Phong
3554	11200	xa_ninh_hai	299	xã	Ninh Hải
3555	11203	xa_dong_tam	299	xã	Đồng Tâm
3556	11206	xa_tan_quang	299	xã	Tân Quang
3557	11209	xa_kien_quoc	299	xã	Kiến Quốc
3558	11215	xa_hong_du	299	xã	Hồng Dụ
3559	11218	xa_van_hoi	299	xã	Văn Hội
3560	11224	xa_hong_phong	299	xã	Hồng Phong
3561	11227	xa_hiep_luc	299	xã	Hiệp Lực
3562	11230	xa_hong_phuc	299	xã	Hồng Phúc
3563	11233	xa_hung_long	299	xã	Hưng Long
3564	11239	thi_tran_thanh_mien	300	thị trấn	Thanh Miện
3565	11242	xa_thanh_tung	300	xã	Thanh Tùng
3566	11245	xa_pham_kha	300	xã	Phạm Kha
3567	11248	xa_ngo_quyen	300	xã	Ngô Quyền
3568	11251	xa_doan_tung	300	xã	Đoàn Tùng
3569	11254	xa_hong_quang	300	xã	Hồng Quang
3570	11257	xa_tan_trao	300	xã	Tân Trào
3571	11260	xa_lam_son	300	xã	Lam Sơn
3572	11263	xa_doan_ket	300	xã	Đoàn Kết
3573	11266	xa_le_hong	300	xã	Lê Hồng
3574	11269	xa_tu_cuong	300	xã	Tứ Cường
3575	11275	xa_ngu_hung	300	xã	Ngũ Hùng
3576	11278	xa_cao_thang	300	xã	Cao Thắng
3577	11281	xa_chi_lang_bac	300	xã	Lăng Bắc
3578	11284	xa_chi_lang_nam	300	xã	Lăng Nam
3579	11287	xa_thanh_giang	300	xã	Thanh Giang
3580	11293	xa_hong_phong	300	xã	Hồng Phong
3581	11296	phuong_quan_toan	303	phường	Quán Toan
3582	11299	phuong_hung_vuong	303	phường	Hùng Vương
3583	11302	phuong_so_dau	303	phường	Sở Dầu
3584	11305	phuong_thuong_ly	303	phường	Thượng Lý
3585	11308	phuong_ha_ly	303	phường	Hạ Lý
3586	11311	phuong_minh_khai	303	phường	Minh Khai
3587	11314	phuong_trai_chuoi	303	phường	Trại Chuối
3588	11320	phuong_hoang_van_thu	303	phường	Văn Thụ
3589	11323	phuong_phan_boi_chau	303	phường	Bội Châu
3590	11329	phuong_may_chai	304	phường	Máy Chai
3591	11332	phuong_may_to	304	phường	Máy Tơ
3592	11335	phuong_van_my	304	phường	Vạn Mỹ
3593	11338	phuong_cau_tre	304	phường	Cầu Tre
3594	11341	phuong_lac_vien	304	phường	Lạc Viên
3595	11347	phuong_gia_vien	304	phường	Gia Viên
3596	11350	phuong_dong_khe	304	phường	Đông Khê
3597	11353	phuong_cau_dat	304	phường	Cầu Đất
3598	11356	phuong_le_loi	304	phường	Lê Lợi
3599	11359	phuong_dang_giang	304	phường	Đằng Giang
3600	11362	phuong_lach_tray	304	phường	Lạch Tray
3601	11365	phuong_dong_quoc_binh	304	phường	Quốc Bình
3602	11368	phuong_cat_dai	305	phường	Cát Dài
3603	11371	phuong_an_bien	305	phường	An Biên
3604	11374	phuong_lam_son	305	phường	Lam Sơn
3605	11377	phuong_an_duong	305	phường	An Dương
3606	11380	phuong_tran_nguyen_han	305	phường	Nguyên Hãn
3607	11383	phuong_ho_nam	305	phường	Hồ Nam
3608	11386	phuong_trai_cau	305	phường	Trại Cau
3609	11389	phuong_du_hang	305	phường	Dư Hàng
3610	11392	phuong_hang_kenh	305	phường	Hàng Kênh
3611	11395	phuong_dong_hai	305	phường	Đông Hải
3612	11398	phuong_niem_nghia	305	phường	Niệm Nghĩa
3613	11401	phuong_nghia_xa	305	phường	Nghĩa Xá
3614	11404	phuong_du_hang_kenh	305	phường	Hàng Kênh
3615	11405	phuong_kenh_duong	305	phường	Kênh Dương
3616	11407	phuong_vinh_niem	305	phường	Vĩnh Niệm
3617	11410	phuong_dong_hai_1	306	phường	Đông Hải 1
3618	11411	phuong_dong_hai_2	306	phường	Đông Hải 2
3619	11413	phuong_dang_lam	306	phường	Đằng Lâm
3620	11414	phuong_thanh_to	306	phường	Thành Tô
3621	11416	phuong_dang_hai	306	phường	Đằng Hải
3622	11419	phuong_nam_hai	306	phường	Nam Hải
3623	11422	phuong_cat_bi	306	phường	Cát Bi
3624	11425	phuong_trang_cat	306	phường	Tràng Cát
3625	11428	phuong_quan_tru	307	phường	Quán Trữ
3626	11429	phuong_lam_ha	307	phường	Lãm Hà
3627	11431	phuong_dong_hoa	307	phường	Đồng Hoà
3628	11434	phuong_bac_son	307	phường	Bắc Sơn
3629	11437	phuong_nam_son	307	phường	Nam Sơn
3630	11440	phuong_ngoc_son	307	phường	Ngọc Sơn
3631	11443	phuong_tran_thanh_ngo	307	phường	Thành Ngọ
3632	11446	phuong_van_dau	307	phường	Văn Đẩu
3633	11449	phuong_phu_lien	307	phường	Phù Liễn
3634	11452	phuong_trang_minh	307	phường	Tràng Minh
3635	11455	phuong_ngoc_xuyen	308	phường	Ngọc Xuyên
3636	11458	phuong_hai_son	308	phường	Hải Sơn
3637	11461	phuong_van_huong	308	phường	Vạn Hương
3638	11465	phuong_minh_duc	308	phường	Minh Đức
3639	11467	phuong_bang_la	308	phường	Bàng La
3640	11737	phuong_hop_duc	308	phường	Hợp Đức
3641	11683	phuong_da_phuc	309	phường	Đa Phúc
3642	11686	phuong_hung_dao	309	phường	Hưng Đạo
3643	11689	phuong_anh_dung	309	phường	Anh Dũng
3644	11692	phuong_hai_thanh	309	phường	Hải Thành
3645	11707	phuong_hoa_nghia	309	phường	Hoà Nghĩa
3646	11740	phuong_tan_thanh	309	phường	Tân Thành
3647	11470	thi_tran_nui_deo	311	thị trấn	Núi Đèo
3648	11473	thi_tran_minh_duc	311	thị trấn	Minh Đức
3649	11476	xa_lai_xuan	311	xã	Lại Xuân
3650	11479	xa_an_son	311	xã	An Sơn
3651	11482	xa_ky_son	311	xã	Kỳ Sơn
3652	11485	xa_lien_khe	311	xã	Liên Khê
3653	11488	xa_luu_kiem	311	xã	Lưu Kiếm
3654	11491	xa_luu_ky	311	xã	Lưu Kỳ
3655	11494	xa_gia_minh	311	xã	Gia Minh
3656	11497	xa_gia_duc	311	xã	Gia Đức
3657	11500	xa_minh_tan	311	xã	Minh Tân
3658	11503	xa_phu_ninh	311	xã	Phù Ninh
3659	11506	xa_quang_thanh	311	xã	Quảng Thanh
3660	11509	xa_chinh_my	311	xã	Chính Mỹ
3661	11512	xa_kenh_giang	311	xã	Kênh Giang
3662	11515	xa_hop_thanh	311	xã	Hợp Thành
3663	11518	xa_cao_nhan	311	xã	Cao Nhân
3664	11521	xa_my_dong	311	xã	Mỹ Đồng
3665	11524	xa_dong_son	311	xã	Đông Sơn
3666	11527	xa_hoa_binh	311	xã	Hoà Bình
3667	11530	xa_trung_ha	311	xã	Trung Hà
3668	11533	xa_an_lu	311	xã	An Lư
3669	11536	xa_thuy_trieu	311	xã	Thuỷ Triều
3670	11539	xa_ngu_lao	311	xã	Ngũ Lão
3671	11542	xa_phuc_le	311	xã	Phục Lễ
3672	11545	xa_tam_hung	311	xã	Tam Hưng
3673	11548	xa_pha_le	311	xã	Phả Lễ
3674	11551	xa_lap_le	311	xã	Lập Lễ
3675	11554	xa_kien_bai	311	xã	Kiền Bái
3676	11557	xa_thien_huong	311	xã	Thiên Hương
3677	11560	xa_thuy_son	311	xã	Thuỷ Sơn
3678	11563	xa_thuy_duong	311	xã	Thuỷ Đường
3679	11566	xa_hoang_dong	311	xã	Hoàng Động
3680	11569	xa_lam_dong	311	xã	Lâm Động
3681	11572	xa_hoa_dong	311	xã	Hoa Động
3682	11575	xa_tan_duong	311	xã	Tân Dương
3683	11578	xa_duong_quan	311	xã	Dương Quan
3684	11581	thi_tran_an_duong	312	thị trấn	An Dương
3685	11584	xa_le_thien	312	xã	Lê Thiện
3686	11587	xa_dai_ban	312	xã	Đại Bản
3687	11590	xa_an_hoa	312	xã	An Hoà
3688	11593	xa_hong_phong	312	xã	Hồng Phong
3689	11596	xa_tan_tien	312	xã	Tân Tiến
3690	11599	xa_an_hung	312	xã	An Hưng
3691	11602	xa_an_hong	312	xã	An Hồng
3692	11605	xa_bac_son	312	xã	Bắc Sơn
3693	11608	xa_nam_son	312	xã	Nam Sơn
3694	11611	xa_le_loi	312	xã	Lê Lợi
3695	11614	xa_dang_cuong	312	xã	Đặng Cương
3696	11617	xa_dong_thai	312	xã	Đồng Thái
3697	11620	xa_quoc_tuan	312	xã	Quốc Tuấn
3698	11623	xa_an_dong	312	xã	An Đồng
3699	11626	xa_hong_thai	312	xã	Hồng Thái
3700	11629	thi_tran_an_lao	313	thị trấn	An Lão
3701	11632	xa_bat_trang	313	xã	Bát Trang
3702	11635	xa_truong_tho	313	xã	Trường Thọ
3703	11638	xa_truong_thanh	313	xã	Trường Thành
3704	11641	xa_an_tien	313	xã	An Tiến
3705	11644	xa_quang_hung	313	xã	Quang Hưng
3706	11647	xa_quang_trung	313	xã	Quang Trung
3707	11650	xa_quoc_tuan	313	xã	Quốc Tuấn
3708	11653	xa_an_thang	313	xã	An Thắng
3709	11656	thi_tran_truong_son	313	thị trấn	Trường Sơn
3710	11659	xa_tan_dan	313	xã	Tân Dân
3711	11662	xa_thai_son	313	xã	Thái Sơn
3712	11665	xa_tan_vien	313	xã	Tân Viên
3713	11668	xa_my_duc	313	xã	Mỹ Đức
3714	11671	xa_chien_thang	313	xã	Chiến Thắng
3715	11674	xa_an_tho	313	xã	An Thọ
3716	11677	xa_an_thai	313	xã	An Thái
3717	11680	thi_tran_nui_doi	314	thị trấn	Núi Đối
3718	11695	xa_dong_phuong	314	xã	Đông Phương
3719	11698	xa_thuan_thien	314	xã	Thuận Thiên
3720	11701	xa_huu_bang	314	xã	Hữu Bằng
3721	11704	xa_dai_dong	314	xã	Đại Đồng
3722	11710	xa_ngu_phuc	314	xã	Ngũ Phúc
3723	11713	xa_kien_quoc	314	xã	Kiến Quốc
3724	11716	xa_du_le	314	xã	Du Lễ
3725	11719	xa_thuy_huong	314	xã	Thuỵ Hương
3726	11722	xa_thanh_son	314	xã	Thanh Sơn
3727	11725	xa_minh_tan	314	xã	Minh Tân
3728	11728	xa_dai_ha	314	xã	Đại Hà
3729	11731	xa_ngu_doan	314	xã	Ngũ Đoan
3730	11734	xa_tan_phong	314	xã	Tân Phong
3731	11743	xa_tan_trao	314	xã	Tân Trào
3732	11746	xa_doan_xa	314	xã	Đoàn Xá
3733	11749	xa_tu_son	314	xã	Tú Sơn
3734	11752	xa_dai_hop	314	xã	Đại Hợp
3735	11755	thi_tran_tien_lang	315	thị trấn	Tiên Lãng
3736	11758	xa_dai_thang	315	xã	Đại Thắng
3737	11761	xa_tien_cuong	315	xã	Tiên Cường
3738	11764	xa_tu_cuong	315	xã	Tự Cường
3739	11770	xa_quyet_tien	315	xã	Quyết Tiến
3740	11773	xa_khoi_nghia	315	xã	Khởi Nghĩa
3741	11776	xa_tien_thanh	315	xã	Tiên Thanh
3742	11779	xa_cap_tien	315	xã	Cấp Tiến
3743	11782	xa_kien_thiet	315	xã	Kiến Thiết
3744	11785	xa_doan_lap	315	xã	Đoàn Lập
3745	11788	xa_bach_dang	315	xã	Bạch Đằng
3746	11791	xa_quang_phuc	315	xã	Quang Phục
3747	11794	xa_toan_thang	315	xã	Toàn Thắng
3748	11797	xa_tien_thang	315	xã	Tiên Thắng
3749	11800	xa_tien_minh	315	xã	Tiên Minh
3750	11803	xa_bac_hung	315	xã	Bắc Hưng
3751	11806	xa_nam_hung	315	xã	Nam Hưng
3752	11809	xa_hung_thang	315	xã	Hùng Thắng
3753	11812	xa_tay_hung	315	xã	Tây Hưng
3754	11815	xa_dong_hung	315	xã	Đông Hưng
3755	11821	xa_vinh_quang	315	xã	Vinh Quang
3756	11824	thi_tran_vinh_bao	316	thị trấn	Vĩnh Bảo
3757	11827	xa_dung_tien	316	xã	Dũng Tiến
3758	11830	xa_giang_bien	316	xã	Giang Biên
3759	11833	xa_thang_thuy	316	xã	Thắng Thuỷ
3760	11836	xa_trung_lap	316	xã	Trung Lập
3761	11839	xa_viet_tien	316	xã	Việt Tiến
3762	11842	xa_vinh_an	316	xã	Vĩnh An
3763	11845	xa_vinh_long	316	xã	Vĩnh Long
3764	11848	xa_hiep_hoa	316	xã	Hiệp Hoà
3765	11851	xa_hung_tien	316	xã	Hùng Tiến
3766	11854	xa_an_hoa	316	xã	An Hoà
3767	11857	xa_tan_hung	316	xã	Tân Hưng
3768	11860	xa_tan_lien	316	xã	Tân Liên
3769	11863	xa_nhan_hoa	316	xã	Nhân Hoà
3770	11866	xa_tam_da	316	xã	Tam Đa
3771	11869	xa_hung_nhan	316	xã	Hưng Nhân
3772	11872	xa_vinh_quang	316	xã	Vinh Quang
3773	11875	xa_dong_minh	316	xã	Đồng Minh
3774	11878	xa_thanh_luong	316	xã	Thanh Lương
3775	11881	xa_lien_am	316	xã	Liên Am
3776	11884	xa_ly_hoc	316	xã	Lý Học
3777	11887	xa_tam_cuong	316	xã	Tam Cường
3778	11890	xa_hoa_binh	316	xã	Hoà Bình
3779	11893	xa_tien_phong	316	xã	Tiền Phong
3780	11896	xa_vinh_phong	316	xã	Vĩnh Phong
3781	11899	xa_cong_hien	316	xã	Cộng Hiền
3782	11902	xa_cao_minh	316	xã	Cao Minh
3783	11905	xa_co_am	316	xã	Cổ Am
3784	11908	xa_vinh_tien	316	xã	Vĩnh Tiến
3785	11911	xa_tran_duong	316	xã	Trấn Dương
3786	11914	thi_tran_cat_ba	317	thị trấn	Cát Bà
3787	11917	thi_tran_cat_hai	317	thị trấn	Cát Hải
3788	11920	xa_nghia_lo	317	xã	Nghĩa Lộ
3789	11923	xa_dong_bai	317	xã	Đồng Bài
3790	11926	xa_hoang_chau	317	xã	Hoàng Châu
3791	11929	xa_van_phong	317	xã	Văn Phong
3792	11932	xa_phu_long	317	xã	Phù Long
3793	11935	xa_gia_luan	317	xã	Gia Luận
3794	11938	xa_hien_hao	317	xã	Hiền Hào
3795	11941	xa_tran_chau	317	xã	Trân Châu
3796	11944	xa_viet_hai	317	xã	Việt Hải
3797	11947	xa_xuan_dam	317	xã	Xuân Đám
3798	11950	phuong_lam_son	323	phường	Lam Sơn
3799	11953	phuong_hien_nam	323	phường	Hiến Nam
3800	11956	phuong_an_tao	323	phường	An Tảo
3801	11959	phuong_le_loi	323	phường	Lê Lợi
3802	11962	phuong_minh_khai	323	phường	Minh Khai
3803	11965	phuong_quang_trung	323	phường	Quang Trung
3804	11968	phuong_hong_chau	323	phường	Hồng Châu
3805	11971	xa_trung_nghia	323	xã	Trung Nghĩa
3806	11974	xa_lien_phuong	323	xã	Liên Phương
3807	11977	xa_hong_nam	323	xã	Hồng Nam
3808	11980	xa_quang_chau	323	xã	Quảng Châu
3809	11983	xa_bao_khe	323	xã	Bảo Khê
3810	12331	xa_phu_cuong	323	xã	Phú Cường
3811	12334	xa_hung_cuong	323	xã	Hùng Cường
3812	12382	xa_phuong_chieu	323	xã	Phương Chiểu
3813	12385	xa_tan_hung	323	xã	Tân Hưng
3814	12388	xa_hoang_hanh	323	xã	Hoàng Hanh
3815	11986	thi_tran_nhu_quynh	325	thị trấn	Như Quỳnh
3816	11989	xa_lac_dao	325	xã	Lạc Đạo
3817	11992	xa_chi_dao	325	xã	Chỉ Đạo
3818	11995	xa_dai_dong	325	xã	Đại Đồng
3819	11998	xa_viet_hung	325	xã	Việt Hưng
3820	12001	xa_tan_quang	325	xã	Tân Quang
3821	12004	xa_dinh_du	325	xã	Đình Dù
3822	12007	xa_minh_hai	325	xã	Minh Hải
3823	12010	xa_luong_tai	325	xã	Lương Tài
3824	12013	xa_trung_trac	325	xã	Trưng Trắc
3825	12016	xa_lac_hong	325	xã	Lạc Hồng
3826	12019	thi_tran_van_giang	326	thị trấn	Văn Giang
3827	12022	xa_xuan_quan	326	xã	Xuân Quan
3828	12025	xa_cuu_cao	326	xã	Cửu Cao
3829	12028	xa_phung_cong	326	xã	Phụng Công
3830	12031	xa_nghia_tru	326	xã	Nghĩa Trụ
3831	12034	xa_long_hung	326	xã	Long Hưng
3832	12037	xa_vinh_khuc	326	xã	Vĩnh Khúc
3833	12040	xa_lien_nghia	326	xã	Liên Nghĩa
3834	12043	xa_tan_tien	326	xã	Tân Tiến
3835	12046	xa_thang_loi	326	xã	Thắng Lợi
3836	12049	xa_me_so	326	xã	Mễ Sở
3837	12052	thi_tran_yen_my	327	thị trấn	Yên Mỹ
3838	12055	xa_giai_pham	327	xã	Giai Phạm
3839	12058	xa_nghia_hiep	327	xã	Nghĩa Hiệp
3840	12061	xa_dong_than	327	xã	Đồng Than
3841	12064	xa_ngoc_long	327	xã	Ngọc Long
3842	12067	xa_lieu_xa	327	xã	Liêu Xá
3843	12070	xa_hoan_long	327	xã	Hoàn Long
3844	12073	xa_tan_lap	327	xã	Tân Lập
3845	12076	xa_thanh_long	327	xã	Thanh Long
3846	12079	xa_yen_phu	327	xã	Yên Phú
3847	12082	xa_viet_cuong	327	xã	Việt Cường
3848	12085	xa_trung_hoa	327	xã	Trung Hòa
3849	12088	xa_yen_hoa	327	xã	Yên Hòa
3850	12091	xa_minh_chau	327	xã	Minh Châu
3851	12094	xa_trung_hung	327	xã	Trung Hưng
3852	12097	xa_ly_thuong_kiet	327	xã	Thường Kiệt
3853	12100	xa_tan_viet	327	xã	Tân Việt
3854	12103	phuong_ban_yen_nhan	328	phường	Yên Nhân
3855	12106	phuong_phan_dinh_phung	328	phường	Đình Phùng
3856	12109	xa_cam_xa	328	xã	Cẩm Xá
3857	12112	xa_duong_quang	328	xã	Dương Quang
3858	12115	xa_hoa_phong	328	xã	Hòa Phong
3859	12118	phuong_nhan_hoa	328	phường	Nhân Hòa
3860	12121	phuong_di_su	328	phường	Dị Sử
3861	12124	phuong_bach_sam	328	phường	Bạch Sam
3862	12127	phuong_minh_duc	328	phường	Minh Đức
3863	12130	phuong_phung_chi_kien	328	phường	Chí Kiên
3864	12133	xa_xuan_duc	328	xã	Xuân Dục
3865	12136	xa_ngoc_lam	328	xã	Ngọc Lâm
3866	12139	xa_hung_long	328	xã	Hưng Long
3867	12142	thi_tran_an_thi	329	thị trấn	Ân Thi
3868	12145	xa_phu_ung	329	xã	Phù Ủng
3869	12148	xa_bac_son	329	xã	Bắc Sơn
3870	12151	xa_bai_say	329	xã	Bãi Sậy
3871	12154	xa_dao_duong	329	xã	Đào Dương
3872	12157	xa_tan_phuc	329	xã	Tân Phúc
3873	12160	xa_van_du	329	xã	Vân Du
3874	12163	xa_quang_vinh	329	xã	Quang Vinh
3875	12166	xa_xuan_truc	329	xã	Xuân Trúc
3876	12169	xa_hoang_hoa_tham	329	xã	Hoa Thám
3877	12172	xa_quang_lang	329	xã	Quảng Lãng
3878	12175	xa_van_nhue	329	xã	Văn Nhuệ
3879	12178	xa_dang_le	329	xã	Đặng Lễ
3880	12181	xa_cam_ninh	329	xã	Cẩm Ninh
3881	12184	xa_nguyen_trai	329	xã	Nguyễn Trãi
3882	12187	xa_da_loc	329	xã	Đa Lộc
3883	12190	xa_ho_tung_mau	329	xã	Tùng Mậu
3884	12193	xa_tien_phong	329	xã	Tiền Phong
3885	12196	xa_hong_van	329	xã	Hồng Vân
3886	12199	xa_hong_quang	329	xã	Hồng Quang
3887	12202	xa_ha_le	329	xã	Hạ Lễ
3888	12205	thi_tran_khoai_chau	330	thị trấn	Khoái Châu
3889	12208	xa_dong_tao	330	xã	Đông Tảo
3890	12211	xa_binh_minh	330	xã	Bình Minh
3891	12214	xa_da_trach	330	xã	Dạ Trạch
3892	12217	xa_ham_tu	330	xã	Hàm Tử
3893	12220	xa_ong_dinh	330	xã	Ông Đình
3894	12223	xa_tan_dan	330	xã	Tân Dân
3895	12226	xa_tu_dan	330	xã	Tứ Dân
3896	12229	xa_an_vi	330	xã	An Vĩ
3897	12232	xa_dong_ket	330	xã	Đông Kết
3898	12235	xa_binh_kieu	330	xã	Bình Kiều
3899	12238	xa_dan_tien	330	xã	Dân Tiến
3900	12241	xa_dong_tien	330	xã	Đồng Tiến
3901	12244	xa_hong_tien	330	xã	Hồng Tiến
3902	12247	xa_tan_chau	330	xã	Tân Châu
3903	12250	xa_lien_khe	330	xã	Liên Khê
3904	12253	xa_phung_hung	330	xã	Phùng Hưng
3905	12256	xa_viet_hoa	330	xã	Việt Hòa
3906	12259	xa_dong_ninh	330	xã	Đông Ninh
3907	12262	xa_dai_tap	330	xã	Đại Tập
3908	12265	xa_chi_tan	330	xã	Chí Tân
3909	12268	xa_dai_hung	330	xã	Đại Hưng
3910	12271	xa_thuan_hung	330	xã	Thuần Hưng
3911	12274	xa_thanh_cong	330	xã	Thành Công
3912	12277	xa_nhue_duong	330	xã	Nhuế Dương
3913	12280	thi_tran_luong_bang	331	thị trấn	Lương Bằng
3914	12283	xa_nghia_dan	331	xã	Nghĩa Dân
3915	12286	xa_toan_thang	331	xã	Toàn Thắng
3916	12289	xa_vinh_xa	331	xã	Vĩnh Xá
3917	12292	xa_pham_ngu_lao	331	xã	Ngũ Lão
3918	12295	xa_tho_vinh	331	xã	Thọ Vinh
3919	12298	xa_dong_thanh	331	xã	Đồng Thanh
3920	12301	xa_song_mai	331	xã	Song Mai
3921	12304	xa_chinh_nghia	331	xã	Chính Nghĩa
3922	12307	xa_nhan_la	331	xã	Nhân La
3923	12310	xa_phu_thinh	331	xã	Phú Thịnh
3924	12313	xa_mai_dong	331	xã	Mai Động
3925	12316	xa_duc_hop	331	xã	Đức Hợp
3926	12319	xa_hung_an	331	xã	Hùng An
3927	12322	xa_ngoc_thanh	331	xã	Ngọc Thanh
3928	12325	xa_vu_xa	331	xã	Vũ Xá
3929	12328	xa_hiep_cuong	331	xã	Hiệp Cường
3930	12337	thi_tran_vuong	332	thị trấn	Thị trấn Vương
3931	12340	xa_hung_dao	332	xã	Hưng Đạo
3932	12343	xa_ngo_quyen	332	xã	Ngô Quyền
3933	12346	xa_nhat_tan	332	xã	Nhật Tân
3934	12349	xa_di_che	332	xã	Dị Chế
3935	12352	xa_le_xa	332	xã	Lệ Xá
3936	12355	xa_an_vien	332	xã	An Viên
3937	12358	xa_duc_thang	332	xã	Đức Thắng
3938	12361	xa_trung_dung	332	xã	Trung Dũng
3939	12364	xa_hai_trieu	332	xã	Hải Triều
3940	12367	xa_thu_sy	332	xã	Thủ Sỹ
3941	12370	xa_thien_phien	332	xã	Thiện Phiến
3942	12373	xa_thuy_loi	332	xã	Thụy Lôi
3943	12376	xa_cuong_chinh	332	xã	Cương Chính
3944	12379	xa_minh_phuong	332	xã	Minh Phượng
3945	12391	thi_tran_tran_cao	333	thị trấn	Trần Cao
3946	12394	xa_minh_tan	333	xã	Minh Tân
3947	12397	xa_phan_sao_nam	333	xã	Sào Nam
3948	12400	xa_quang_hung	333	xã	Quang Hưng
3949	12403	xa_minh_hoang	333	xã	Minh Hoàng
3950	12406	xa_doan_dao	333	xã	Đoàn Đào
3951	12409	xa_tong_phan	333	xã	Tống Phan
3952	12412	xa_dinh_cao	333	xã	Đình Cao
3953	12415	xa_nhat_quang	333	xã	Nhật Quang
3954	12418	xa_tien_tien	333	xã	Tiền Tiến
3955	12421	xa_tam_da	333	xã	Tam Đa
3956	12424	xa_minh_tien	333	xã	Minh Tiến
3957	12427	xa_nguyen_hoa	333	xã	Nguyên Hòa
3958	12430	xa_tong_tran	333	xã	Tống Trân
3959	12433	phuong_le_hong_phong	336	phường	Hồng Phong
3960	12436	phuong_bo_xuyen	336	phường	Bồ Xuyên
3961	12439	phuong_de_tham	336	phường	Đề Thám
3962	12442	phuong_ky_ba	336	phường	Kỳ Bá
3963	12445	phuong_quang_trung	336	phường	Quang Trung
3964	12448	phuong_phu_khanh	336	phường	Phú Khánh
3965	12451	phuong_tien_phong	336	phường	Tiền Phong
3966	12452	phuong_tran_hung_dao	336	phường	Hưng Đạo
3967	12454	phuong_tran_lam	336	phường	Trần Lãm
3968	12457	xa_dong_hoa	336	xã	Đông Hòa
3969	12460	phuong_hoang_dieu	336	phường	Hoàng Diệu
3970	12463	xa_phu_xuan	336	xã	Phú Xuân
3971	12466	xa_vu_phuc	336	xã	Vũ Phúc
3972	12469	xa_vu_chinh	336	xã	Vũ Chính
3973	12817	xa_dong_my	336	xã	Đông Mỹ
3974	12820	xa_dong_tho	336	xã	Đông Thọ
3975	13084	xa_vu_dong	336	xã	Vũ Đông
3976	13108	xa_vu_lac	336	xã	Vũ Lạc
3977	13225	xa_tan_binh	336	xã	Tân Bình
3978	12472	thi_tran_quynh_coi	338	thị trấn	Quỳnh Côi
3979	12475	xa_an_khe	338	xã	An Khê
3980	12478	xa_an_dong	338	xã	An Đồng
3981	12481	xa_quynh_hoa	338	xã	Quỳnh Hoa
3982	12484	xa_quynh_lam	338	xã	Quỳnh Lâm
3983	12487	xa_quynh_tho	338	xã	Quỳnh Thọ
3984	12490	xa_an_hiep	338	xã	An Hiệp
3985	12493	xa_quynh_hoang	338	xã	Quỳnh Hoàng
3986	12496	xa_quynh_giao	338	xã	Quỳnh Giao
3987	12499	xa_an_thai	338	xã	An Thái
3988	12502	xa_an_cau	338	xã	An Cầu
3989	12505	xa_quynh_hong	338	xã	Quỳnh Hồng
3990	12508	xa_quynh_khe	338	xã	Quỳnh Khê
3991	12511	xa_quynh_minh	338	xã	Quỳnh Minh
3992	12514	xa_an_ninh	338	xã	An Ninh
3993	12517	xa_quynh_ngoc	338	xã	Quỳnh Ngọc
3994	12520	xa_quynh_hai	338	xã	Quỳnh Hải
3995	12523	thi_tran_an_bai	338	thị trấn	An Bài
3996	12526	xa_an_ap	338	xã	An Ấp
3997	12529	xa_quynh_hoi	338	xã	Quỳnh Hội
3998	12532	xa_chau_son	338	xã	Châu Sơn
3999	12535	xa_quynh_my	338	xã	Quỳnh Mỹ
4000	12538	xa_an_qui	338	xã	An Quí
4001	12541	xa_an_thanh	338	xã	An Thanh
4002	12547	xa_an_vu	338	xã	An Vũ
4003	12550	xa_an_le	338	xã	An Lễ
4004	12553	xa_quynh_hung	338	xã	Quỳnh Hưng
4005	12556	xa_quynh_bao	338	xã	Quỳnh Bảo
4006	12559	xa_an_my	338	xã	An Mỹ
4007	12562	xa_quynh_nguyen	338	xã	Quỳnh Nguyên
4008	12565	xa_an_vinh	338	xã	An Vinh
4009	12568	xa_quynh_xa	338	xã	Quỳnh Xá
4010	12571	xa_an_duc	338	xã	An Dục
4011	12574	xa_dong_hai	338	xã	Đông Hải
4012	12577	xa_quynh_trang	338	xã	Quỳnh Trang
4013	12580	xa_an_trang	338	xã	An Tràng
4014	12583	xa_dong_tien	338	xã	Đồng Tiến
4015	12586	thi_tran_hung_ha	339	thị trấn	Hưng Hà
4016	12589	xa_diep_nong	339	xã	Điệp Nông
4017	12592	xa_tan_le	339	xã	Tân Lễ
4018	12595	xa_cong_hoa	339	xã	Cộng Hòa
4019	12598	xa_dan_chu	339	xã	Dân Chủ
4020	12601	xa_canh_tan	339	xã	Canh Tân
4021	12604	xa_hoa_tien	339	xã	Hòa Tiến
4022	12607	xa_hung_dung	339	xã	Hùng Dũng
4023	12610	xa_tan_tien	339	xã	Tân Tiến
4024	12613	thi_tran_hung_nhan	339	thị trấn	Hưng Nhân
4025	12616	xa_doan_hung	339	xã	Đoan Hùng
4026	12619	xa_duyen_hai	339	xã	Duyên Hải
4027	12622	xa_tan_hoa	339	xã	Tân Hòa
4028	12625	xa_van_cam	339	xã	Văn Cẩm
4029	12628	xa_bac_son	339	xã	Bắc Sơn
4030	12631	xa_dong_do	339	xã	Đông Đô
4031	12634	xa_phuc_khanh	339	xã	Phúc Khánh
4032	12637	xa_lien_hiep	339	xã	Liên Hiệp
4033	12640	xa_tay_do	339	xã	Tây Đô
4034	12643	xa_thong_nhat	339	xã	Thống Nhất
4035	12646	xa_tien_duc	339	xã	Tiến Đức
4036	12649	xa_thai_hung	339	xã	Thái Hưng
4037	12652	xa_thai_phuong	339	xã	Thái Phương
4038	12655	xa_hoa_binh	339	xã	Hòa Bình
4039	12656	xa_chi_lang	339	xã	Chi Lăng
4040	12658	xa_minh_khai	339	xã	Minh Khai
4041	12661	xa_hong_an	339	xã	Hồng An
4042	12664	xa_kim_chung	339	xã	Kim Chung
4043	12667	xa_hong_linh	339	xã	Hồng Lĩnh
4044	12670	xa_minh_tan	339	xã	Minh Tân
4045	12673	xa_van_lang	339	xã	Văn Lang
4046	12676	xa_doc_lap	339	xã	Độc Lập
4047	12679	xa_chi_hoa	339	xã	Chí Hòa
4048	12682	xa_minh_hoa	339	xã	Minh Hòa
4049	12685	xa_hong_minh	339	xã	Hồng Minh
4050	12688	thi_tran_dong_hung	340	thị trấn	Đông Hưng
4051	12691	xa_do_luong	340	xã	Đô Lương
4052	12694	xa_dong_phuong	340	xã	Đông Phương
4053	12697	xa_lien_giang	340	xã	Liên Giang
4054	12700	xa_an_chau	340	xã	An Châu
4055	12703	xa_dong_son	340	xã	Đông Sơn
4056	12706	xa_dong_cuong	340	xã	Đông Cường
4057	12709	xa_phu_luong	340	xã	Phú Lương
4058	12712	xa_me_linh	340	xã	Mê Linh
4059	12715	xa_lo_giang	340	xã	Lô Giang
4060	12718	xa_dong_la	340	xã	Đông La
4061	12721	xa_minh_tan	340	xã	Minh Tân
4062	12724	xa_dong_xa	340	xã	Đông Xá
4063	12727	xa_chuong_duong	340	xã	Chương Dương
4064	12730	xa_nguyen_xa	340	xã	Nguyên Xá
4065	12733	xa_phong_chau	340	xã	Phong Châu
4066	12736	xa_hop_tien	340	xã	Hợp Tiến
4067	12739	xa_hong_viet	340	xã	Hồng Việt
4068	12745	xa_ha_giang	340	xã	Hà Giang
4069	12748	xa_dong_kinh	340	xã	Đông Kinh
4070	12751	xa_dong_hop	340	xã	Đông Hợp
4071	12754	xa_thang_long	340	xã	Thăng Long
4072	12757	xa_dong_cac	340	xã	Đông Các
4073	12760	xa_phu_chau	340	xã	Phú Châu
4074	12763	xa_lien_hoa	340	xã	Liên Hoa
4075	12769	xa_dong_tan	340	xã	Đông Tân
4076	12772	xa_dong_vinh	340	xã	Đông Vinh
4077	12775	xa_dong_dong	340	xã	Đông Động
4078	12778	xa_hong_bach	340	xã	Hồng Bạch
4079	12784	xa_trong_quan	340	xã	Trọng Quan
4080	12790	xa_hong_giang	340	xã	Hồng Giang
4081	12793	xa_dong_quan	340	xã	Đông Quan
4082	12796	xa_dong_quang	340	xã	Đông Quang
4083	12799	xa_dong_xuan	340	xã	Đông Xuân
4084	12802	xa_dong_a	340	xã	Đông Á
4085	12808	xa_dong_hoang	340	xã	Đông Hoàng
4086	12811	xa_dong_duong	340	xã	Đông Dương
4087	12823	xa_minh_phu	340	xã	Minh Phú
4088	12826	thi_tran_diem_dien	341	thị trấn	Diêm Điền
4089	12832	xa_thuy_truong	341	xã	Thụy Trường
4090	12841	xa_hong_dung	341	xã	Hồng Dũng
4091	12844	xa_thuy_quynh	341	xã	Thụy Quỳnh
4092	12847	xa_an_tan	341	xã	An Tân
4093	12850	xa_thuy_ninh	341	xã	Thụy Ninh
4094	12853	xa_thuy_hung	341	xã	Thụy Hưng
4095	12856	xa_thuy_viet	341	xã	Thụy Việt
4096	12859	xa_thuy_van	341	xã	Thụy Văn
4097	12862	xa_thuy_xuan	341	xã	Thụy Xuân
4098	12865	xa_duong_phuc	341	xã	Dương Phúc
4099	12868	xa_thuy_trinh	341	xã	Thụy Trình
4100	12871	xa_thuy_binh	341	xã	Thụy Bình
4101	12874	xa_thuy_chinh	341	xã	Thụy Chính
4102	12877	xa_thuy_dan	341	xã	Thụy Dân
4103	12880	xa_thuy_hai	341	xã	Thụy Hải
4104	12889	xa_thuy_lien	341	xã	Thụy Liên
4105	12892	xa_thuy_duyen	341	xã	Thụy Duyên
4106	12898	xa_thuy_thanh	341	xã	Thụy Thanh
4107	12901	xa_thuy_son	341	xã	Thụy Sơn
4108	12904	xa_thuy_phong	341	xã	Thụy Phong
4109	12907	xa_thai_thuong	341	xã	Thái Thượng
4110	12910	xa_thai_nguyen	341	xã	Thái Nguyên
4111	12916	xa_duong_hong_thuy	341	xã	Hồng Thủy
4112	12919	xa_thai_giang	341	xã	Thái Giang
4113	12922	xa_hoa_an	341	xã	Hòa An
4114	12925	xa_son_ha	341	xã	Sơn Hà
4115	12934	xa_thai_phuc	341	xã	Thái Phúc
4116	12937	xa_thai_hung	341	xã	Thái Hưng
4117	12940	xa_thai_do	341	xã	Thái Đô
4118	12943	xa_thai_xuyen	341	xã	Thái Xuyên
4119	12949	xa_my_loc	341	xã	Mỹ Lộc
4120	12958	xa_tan_hoc	341	xã	Tân Học
4121	12961	xa_thai_thinh	341	xã	Thái Thịnh
4122	12964	xa_thuan_thanh	341	xã	Thuần Thành
4123	12967	xa_thai_tho	341	xã	Thái Thọ
4124	12970	thi_tran_tien_hai	342	thị trấn	Tiền Hải
4125	12976	xa_dong_tra	342	xã	Đông Trà
4126	12979	xa_dong_long	342	xã	Đông Long
4127	12982	xa_dong_qui	342	xã	Đông Quí
4128	12985	xa_vu_lang	342	xã	Vũ Lăng
4129	12988	xa_dong_xuyen	342	xã	Đông Xuyên
4130	12991	xa_tay_luong	342	xã	Tây Lương
4131	12994	xa_tay_ninh	342	xã	Tây Ninh
4132	12997	xa_dong_trung	342	xã	Đông Trung
4133	13000	xa_dong_hoang	342	xã	Đông Hoàng
4134	13003	xa_dong_minh	342	xã	Đông Minh
4135	13009	xa_dong_phong	342	xã	Đông Phong
4136	13012	xa_an_ninh	342	xã	An Ninh
4137	13018	xa_dong_co	342	xã	Đông Cơ
4138	13021	xa_tay_giang	342	xã	Tây Giang
4139	13024	xa_dong_lam	342	xã	Đông Lâm
4140	13027	xa_phuong_cong	342	xã	Phương Công
4141	13030	xa_tay_phong	342	xã	Tây Phong
4142	13033	xa_tay_tien	342	xã	Tây Tiến
4143	13036	xa_nam_cuong	342	xã	Nam Cường
4144	13039	xa_van_truong	342	xã	Vân Trường
4145	13042	xa_nam_thang	342	xã	Nam Thắng
4146	13045	xa_nam_chinh	342	xã	Nam Chính
4147	13048	xa_bac_hai	342	xã	Bắc Hải
4148	13051	xa_nam_thinh	342	xã	Nam Thịnh
4149	13054	xa_nam_ha	342	xã	Nam Hà
4150	13057	xa_nam_thanh	342	xã	Nam Thanh
4151	13060	xa_nam_trung	342	xã	Nam Trung
4152	13063	xa_nam_hong	342	xã	Nam Hồng
4153	13066	xa_nam_hung	342	xã	Nam Hưng
4154	13069	xa_nam_hai	342	xã	Nam Hải
4155	13072	xa_nam_phu	342	xã	Nam Phú
4156	13075	thi_tran_kien_xuong	343	thị trấn	Kiến Xương
4157	13078	xa_tra_giang	343	xã	Trà Giang
4158	13081	xa_quoc_tuan	343	xã	Quốc Tuấn
4159	13087	xa_an_binh	343	xã	An Bình
4160	13090	xa_tay_son	343	xã	Tây Sơn
4161	13093	xa_hong_thai	343	xã	Hồng Thái
4162	13096	xa_binh_nguyen	343	xã	Bình Nguyên
4163	13102	xa_le_loi	343	xã	Lê Lợi
4164	13111	xa_vu_le	343	xã	Vũ Lễ
4165	13114	xa_thanh_tan	343	xã	Thanh Tân
4166	13117	xa_thuong_hien	343	xã	Thượng Hiền
4167	13120	xa_nam_cao	343	xã	Nam Cao
4168	13123	xa_dinh_phung	343	xã	Đình Phùng
4169	13126	xa_vu_ninh	343	xã	Vũ Ninh
4170	13129	xa_vu_an	343	xã	Vũ An
4171	13132	xa_quang_lich	343	xã	Quang Lịch
4172	13135	xa_hoa_binh	343	xã	Hòa Bình
4173	13138	xa_binh_minh	343	xã	Bình Minh
4174	13141	xa_vu_qui	343	xã	Vũ Quí
4175	13144	xa_quang_binh	343	xã	Quang Bình
4176	13150	xa_vu_trung	343	xã	Vũ Trung
4177	13153	xa_vu_thang	343	xã	Vũ Thắng
4178	13156	xa_vu_cong	343	xã	Vũ Công
4179	13159	xa_vu_hoa	343	xã	Vũ Hòa
4180	13162	xa_quang_minh	343	xã	Quang Minh
4181	13165	xa_quang_trung	343	xã	Quang Trung
4182	13171	xa_minh_quang	343	xã	Minh Quang
4183	13174	xa_vu_binh	343	xã	Vũ Bình
4184	13177	xa_minh_tan	343	xã	Minh Tân
4185	13180	xa_nam_binh	343	xã	Nam Bình
4186	13183	xa_binh_thanh	343	xã	Bình Thanh
4187	13186	xa_binh_dinh	343	xã	Bình Định
4188	13189	xa_hong_tien	343	xã	Hồng Tiến
4189	13192	thi_tran_vu_thu	344	thị trấn	Vũ Thư
4190	13195	xa_hong_ly	344	xã	Hồng Lý
4191	13198	xa_dong_thanh	344	xã	Đồng Thanh
4192	13201	xa_xuan_hoa	344	xã	Xuân Hòa
4193	13204	xa_hiep_hoa	344	xã	Hiệp Hòa
4194	13207	xa_phuc_thanh	344	xã	Phúc Thành
4195	13210	xa_tan_phong	344	xã	Tân Phong
4196	13213	xa_song_lang	344	xã	Song Lãng
4197	13216	xa_tan_hoa	344	xã	Tân Hòa
4198	13219	xa_viet_hung	344	xã	Việt Hùng
4199	13222	xa_minh_lang	344	xã	Minh Lãng
4200	13228	xa_minh_khai	344	xã	Minh Khai
4201	13231	xa_dung_nghia	344	xã	Dũng Nghĩa
4202	13234	xa_minh_quang	344	xã	Minh Quang
4203	13237	xa_tam_quang	344	xã	Tam Quang
4204	13240	xa_tan_lap	344	xã	Tân Lập
4205	13243	xa_bach_thuan	344	xã	Bách Thuận
4206	13246	xa_tu_tan	344	xã	Tự Tân
4207	13249	xa_song_an	344	xã	Song An
4208	13252	xa_trung_an	344	xã	Trung An
4209	13255	xa_vu_hoi	344	xã	Vũ Hội
4210	13258	xa_hoa_binh	344	xã	Hòa Bình
4211	13261	xa_nguyen_xa	344	xã	Nguyên Xá
4212	13264	xa_viet_thuan	344	xã	Việt Thuận
4213	13267	xa_vu_vinh	344	xã	Vũ Vinh
4214	13270	xa_vu_doai	344	xã	Vũ Đoài
4215	13273	xa_vu_tien	344	xã	Vũ Tiến
4216	13276	xa_vu_van	344	xã	Vũ Vân
4217	13279	xa_duy_nhat	344	xã	Duy Nhất
4218	13282	xa_hong_phong	344	xã	Hồng Phong
4219	13285	phuong_quang_trung	347	phường	Quang Trung
4220	13288	phuong_luong_khanh_thien	347	phường	Khánh Thiện
4221	13291	phuong_le_hong_phong	347	phường	Hồng Phong
4222	13294	phuong_minh_khai	347	phường	Minh Khai
4223	13297	phuong_hai_ba_trung	347	phường	Bà Trưng
4224	13300	phuong_tran_hung_dao	347	phường	Hưng Đạo
4225	13303	phuong_lam_ha	347	phường	Lam Hạ
4226	13306	xa_phu_van	347	xã	Phù Vân
4227	13309	phuong_liem_chinh	347	phường	Liêm Chính
4228	13312	xa_liem_chung	347	xã	Liêm Chung
4229	13315	phuong_thanh_chau	347	phường	Thanh Châu
4230	13318	phuong_chau_son	347	phường	Châu Sơn
4231	13366	xa_tien_tan	347	xã	Tiên Tân
4232	13372	xa_tien_hiep	347	xã	Tiên Hiệp
4233	13381	xa_tien_hai	347	xã	Tiên Hải
4234	13426	xa_kim_binh	347	xã	Kim Bình
4235	13444	xa_liem_tuyen	347	xã	Liêm Tuyền
4236	13447	xa_liem_tiet	347	xã	Liêm Tiết
4237	13459	phuong_thanh_tuyen	347	phường	Thanh Tuyền
4238	13507	xa_dinh_xa	347	xã	Đinh Xá
4239	13513	xa_trinh_xa	347	xã	Trịnh Xá
4240	13321	phuong_dong_van	349	phường	Đồng Văn
4241	13324	phuong_hoa_mac	349	phường	Hòa Mạc
4242	13327	xa_moc_bac	349	xã	Mộc Bắc
4243	13330	phuong_chau_giang	349	phường	Châu Giang
4244	13333	phuong_bach_thuong	349	phường	Bạch Thượng
4245	13336	phuong_duy_minh	349	phường	Duy Minh
4246	13339	xa_moc_nam	349	xã	Mộc Nam
4247	13342	phuong_duy_hai	349	phường	Duy Hải
4248	13345	xa_chuyen_ngoai	349	xã	Chuyên Ngoại
4249	13348	phuong_yen_bac	349	phường	Yên Bắc
4250	13351	xa_trac_van	349	xã	Trác Văn
4251	13354	phuong_tien_noi	349	phường	Tiên Nội
4252	13357	phuong_hoang_dong	349	phường	Hoàng Đông
4253	13360	xa_yen_nam	349	xã	Yên Nam
4254	13363	xa_tien_ngoai	349	xã	Tiên Ngoại
4255	13369	xa_tien_son	349	xã	Tiên Sơn
4256	13384	thi_tran_que	350	thị trấn	Thị trấn Quế
4257	13387	xa_nguyen_uy	350	xã	Nguyễn Úy
4258	13390	xa_dai_cuong	350	xã	Đại Cương
4259	13393	xa_le_ho	350	xã	Lê Hồ
4260	13396	xa_tuong_linh	350	xã	Tượng Lĩnh
4261	13399	xa_nhat_tuu	350	xã	Nhật Tựu
4262	13402	xa_nhat_tan	350	xã	Nhật Tân
4263	13405	xa_dong_hoa	350	xã	Đồng Hóa
4264	13408	xa_hoang_tay	350	xã	Hoàng Tây
4265	13411	xa_tan_son	350	xã	Tân Sơn
4266	13414	xa_thuy_loi	350	xã	Thụy Lôi
4267	13417	xa_van_xa	350	xã	Văn Xá
4268	13420	xa_kha_phong	350	xã	Khả Phong
4269	13423	xa_ngoc_son	350	xã	Ngọc Sơn
4270	13429	thi_tran_ba_sao	350	thị trấn	Ba Sao
4271	13432	xa_lien_son	350	xã	Liên Sơn
4272	13435	xa_thi_son	350	xã	Thi Sơn
4273	13438	xa_thanh_son	350	xã	Thanh Sơn
4274	13441	thi_tran_kien_khe	351	thị trấn	Kiện Khê
4275	13450	xa_liem_phong	351	xã	Liêm Phong
4276	13453	xa_thanh_ha	351	xã	Thanh Hà
4277	13456	xa_liem_can	351	xã	Liêm Cần
4278	13465	xa_liem_thuan	351	xã	Liêm Thuận
4279	13468	xa_thanh_thuy	351	xã	Thanh Thủy
4280	13471	xa_thanh_phong	351	xã	Thanh Phong
4281	13474	thi_tran_tan_thanh	351	thị trấn	Tân Thanh
4282	13477	xa_thanh_tan	351	xã	Thanh Tân
4283	13480	xa_liem_tuc	351	xã	Liêm Túc
4284	13483	xa_liem_son	351	xã	Liêm Sơn
4285	13486	xa_thanh_huong	351	xã	Thanh Hương
4286	13489	xa_thanh_nghi	351	xã	Thanh Nghị
4287	13492	xa_thanh_tam	351	xã	Thanh Tâm
4288	13495	xa_thanh_nguyen	351	xã	Thanh Nguyên
4289	13498	xa_thanh_hai	351	xã	Thanh Hải
4290	13501	thi_tran_binh_my	352	thị trấn	Bình Mỹ
4291	13504	xa_binh_nghia	352	xã	Bình Nghĩa
4292	13510	xa_trang_an	352	xã	Tràng An
4293	13516	xa_dong_du	352	xã	Đồng Du
4294	13519	xa_ngoc_lu	352	xã	Ngọc Lũ
4295	13522	xa_hung_cong	352	xã	Hưng Công
4296	13525	xa_don_xa	352	xã	Đồn Xá
4297	13528	xa_an_ninh	352	xã	An Ninh
4298	13531	xa_bo_de	352	xã	Bồ Đề
4299	13534	xa_boi_cau	352	xã	Bối Cầu
4300	13540	xa_an_noi	352	xã	An Nội
4301	13543	xa_vu_ban	352	xã	Vũ Bản
4302	13546	xa_trung_luong	352	xã	Trung Lương
4303	13552	xa_an_do	352	xã	An Đổ
4304	13555	xa_la_son	352	xã	La Sơn
4305	13558	xa_tieu_dong	352	xã	Tiêu Động
4306	13561	xa_an_lao	352	xã	An Lão
4307	13567	xa_hop_ly	353	xã	Hợp Lý
4308	13570	xa_nguyen_ly	353	xã	Nguyên Lý
4309	13573	xa_chinh_ly	353	xã	Chính Lý
4310	13576	xa_chan_ly	353	xã	Chân Lý
4311	13579	xa_dao_ly	353	xã	Đạo Lý
4312	13582	xa_cong_ly	353	xã	Công Lý
4313	13585	xa_van_ly	353	xã	Văn Lý
4314	13588	xa_bac_ly	353	xã	Bắc Lý
4315	13591	xa_duc_ly	353	xã	Đức Lý
4316	13594	xa_tran_hung_dao	353	xã	Hưng Đạo
4317	13597	thi_tran_vinh_tru	353	thị trấn	Vĩnh Trụ
4318	13600	xa_nhan_thinh	353	xã	Nhân Thịnh
4319	13606	xa_nhan_khang	353	xã	Nhân Khang
4320	13609	xa_nhan_my	353	xã	Nhân Mỹ
4321	13612	xa_nhan_nghia	353	xã	Nhân Nghĩa
4322	13615	xa_nhan_chinh	353	xã	Nhân Chính
4323	13618	xa_nhan_binh	353	xã	Nhân Bình
4324	13621	xa_phu_phuc	353	xã	Phú Phúc
4325	13624	xa_xuan_khe	353	xã	Xuân Khê
4326	13627	xa_tien_thang	353	xã	Tiến Thắng
4327	13630	xa_hoa_hau	353	xã	Hòa Hậu
4328	13633	phuong_ha_long	356	phường	Hạ Long
4329	13636	phuong_tran_te_xuong	356	phường	Tế Xương
4330	13639	phuong_vi_hoang	356	phường	Vị Hoàng
4331	13642	phuong_vi_xuyen	356	phường	Vị Xuyên
4332	13645	phuong_quang_trung	356	phường	Quang Trung
4333	13648	phuong_cua_bac	356	phường	Cửa Bắc
4334	13651	phuong_nguyen_du	356	phường	Nguyễn Du
4335	13654	phuong_ba_trieu	356	phường	Bà Triệu
4336	13657	phuong_truong_thi	356	phường	Trường Thi
4337	13660	phuong_phan_dinh_phung	356	phường	Đình Phùng
4338	13663	phuong_ngo_quyen	356	phường	Ngô Quyền
4339	13666	phuong_tran_hung_dao	356	phường	Hưng Đạo
4340	13669	phuong_tran_dang_ninh	356	phường	Đăng Ninh
4341	13672	phuong_nang_tinh	356	phường	Năng Tĩnh
4342	13675	phuong_van_mieu	356	phường	Văn Miếu
4343	13678	phuong_tran_quang_khai	356	phường	Quang Khải
4344	13681	phuong_thong_nhat	356	phường	Thống Nhất
4345	13684	phuong_loc_ha	356	phường	Lộc Hạ
4346	13687	phuong_loc_vuong	356	phường	Lộc Vượng
4347	13690	phuong_cua_nam	356	phường	Cửa Nam
4348	13693	phuong_loc_hoa	356	phường	Lộc Hòa
4349	13696	xa_nam_phong	356	xã	Nam Phong
4350	13699	phuong_my_xa	356	phường	Mỹ Xá
4351	13702	xa_loc_an	356	xã	Lộc An
4352	13705	xa_nam_van	356	xã	Nam Vân
4353	13708	thi_tran_my_loc	358	thị trấn	Mỹ Lộc
4354	13711	xa_my_ha	358	xã	Mỹ Hà
4355	13714	xa_my_tien	358	xã	Mỹ Tiến
4356	13717	xa_my_thang	358	xã	Mỹ Thắng
4357	13720	xa_my_trung	358	xã	Mỹ Trung
4358	13723	xa_my_tan	358	xã	Mỹ Tân
4359	13726	xa_my_phuc	358	xã	Mỹ Phúc
4360	13729	xa_my_hung	358	xã	Mỹ Hưng
4361	13732	xa_my_thuan	358	xã	Mỹ Thuận
4362	13735	xa_my_thinh	358	xã	Mỹ Thịnh
4363	13738	xa_my_thanh	358	xã	Mỹ Thành
4364	13741	thi_tran_goi	359	thị trấn	Thị trấn Gôi
4365	13744	xa_minh_thuan	359	xã	Minh Thuận
4366	13747	xa_hien_khanh	359	xã	Hiển Khánh
4367	13750	xa_tan_khanh	359	xã	Tân Khánh
4368	13753	xa_hop_hung	359	xã	Hợp Hưng
4369	13756	xa_dai_an	359	xã	Đại An
4370	13759	xa_tan_thanh	359	xã	Tân Thành
4371	13762	xa_cong_hoa	359	xã	Cộng Hòa
4372	13765	xa_trung_thanh	359	xã	Trung Thành
4373	13768	xa_quang_trung	359	xã	Quang Trung
4374	13771	xa_minh_tan	359	xã	Minh Tân
4375	13774	xa_lien_bao	359	xã	Liên Bảo
4376	13777	xa_thanh_loi	359	xã	Thành Lợi
4377	13780	xa_kim_thai	359	xã	Kim Thái
4378	13783	xa_lien_minh	359	xã	Liên Minh
4379	13786	xa_dai_thang	359	xã	Đại Thắng
4380	13789	xa_tam_thanh	359	xã	Tam Thanh
4381	13792	xa_vinh_hao	359	xã	Vĩnh Hào
4382	13795	thi_tran_lam	360	thị trấn	Thị trấn Lâm
4383	13798	xa_yen_trung	360	xã	Yên Trung
4384	13801	xa_yen_thanh	360	xã	Yên Thành
4385	13804	xa_yen_tan	360	xã	Yên Tân
4386	13807	xa_yen_loi	360	xã	Yên Lợi
4387	13810	xa_yen_tho	360	xã	Yên Thọ
4388	13813	xa_yen_nghia	360	xã	Yên Nghĩa
4389	13816	xa_yen_minh	360	xã	Yên Minh
4390	13819	xa_yen_phuong	360	xã	Yên Phương
4391	13822	xa_yen_chinh	360	xã	Yên Chính
4392	13825	xa_yen_binh	360	xã	Yên Bình
4393	13828	xa_yen_phu	360	xã	Yên Phú
4394	13831	xa_yen_my	360	xã	Yên Mỹ
4395	13834	xa_yen_duong	360	xã	Yên Dương
4396	13840	xa_yen_hung	360	xã	Yên Hưng
4397	13843	xa_yen_khanh	360	xã	Yên Khánh
4398	13846	xa_yen_phong	360	xã	Yên Phong
4399	13849	xa_yen_ninh	360	xã	Yên Ninh
4400	13852	xa_yen_luong	360	xã	Yên Lương
4401	13855	xa_yen_hong	360	xã	Yên Hồng
4402	13858	xa_yen_quang	360	xã	Yên Quang
4403	13861	xa_yen_tien	360	xã	Yên Tiến
4404	13864	xa_yen_thang	360	xã	Yên Thắng
4405	13867	xa_yen_phuc	360	xã	Yên Phúc
4406	13870	xa_yen_cuong	360	xã	Yên Cường
4407	13873	xa_yen_loc	360	xã	Yên Lộc
4408	13876	xa_yen_bang	360	xã	Yên Bằng
4409	13879	xa_yen_dong	360	xã	Yên Đồng
4410	13882	xa_yen_khang	360	xã	Yên Khang
4411	13885	xa_yen_nhan	360	xã	Yên Nhân
4412	13888	xa_yen_tri	360	xã	Yên Trị
4413	13891	thi_tran_lieu_de	361	thị trấn	Liễu Đề
4414	13894	thi_tran_rang_dong	361	thị trấn	Rạng Đông
4415	13897	xa_nghia_dong	361	xã	Nghĩa Đồng
4416	13900	xa_nghia_thinh	361	xã	Nghĩa Thịnh
4417	13903	xa_nghia_minh	361	xã	Nghĩa Minh
4418	13906	xa_nghia_thai	361	xã	Nghĩa Thái
4419	13909	xa_hoang_nam	361	xã	Hoàng Nam
4420	13912	xa_nghia_chau	361	xã	Nghĩa Châu
4421	13915	xa_nghia_trung	361	xã	Nghĩa Trung
4422	13918	xa_nghia_son	361	xã	Nghĩa Sơn
4423	13921	xa_nghia_lac	361	xã	Nghĩa Lạc
4424	13924	xa_nghia_hong	361	xã	Nghĩa Hồng
4425	13927	xa_nghia_phong	361	xã	Nghĩa Phong
4426	13930	xa_nghia_phu	361	xã	Nghĩa Phú
4427	13933	xa_nghia_binh	361	xã	Nghĩa Bình
4428	13936	thi_tran_quy_nhat	361	thị trấn	Quỹ Nhất
4429	13939	xa_nghia_tan	361	xã	Nghĩa Tân
4430	13942	xa_nghia_hung	361	xã	Nghĩa Hùng
4431	13945	xa_nghia_lam	361	xã	Nghĩa Lâm
4432	13948	xa_nghia_thanh	361	xã	Nghĩa Thành
4433	13951	xa_phuc_thang	361	xã	Phúc Thắng
4434	13954	xa_nghia_loi	361	xã	Nghĩa Lợi
4435	13957	xa_nghia_hai	361	xã	Nghĩa Hải
4436	13963	xa_nam_dien	361	xã	Nam Điền
4437	13966	thi_tran_nam_giang	362	thị trấn	Nam Giang
4438	13969	xa_nam_my	362	xã	Nam Mỹ
4439	13972	xa_dien_xa	362	xã	Điền Xá
4440	13975	xa_nghia_an	362	xã	Nghĩa An
4441	13978	xa_nam_thang	362	xã	Nam Thắng
4442	13981	xa_nam_toan	362	xã	Nam Toàn
4443	13984	xa_hong_quang	362	xã	Hồng Quang
4444	13987	xa_tan_thinh	362	xã	Tân Thịnh
4445	13990	xa_nam_cuong	362	xã	Nam Cường
4446	13993	xa_nam_hong	362	xã	Nam Hồng
4447	13996	xa_nam_hung	362	xã	Nam Hùng
4448	13999	xa_nam_hoa	362	xã	Nam Hoa
4449	14002	xa_nam_duong	362	xã	Nam Dương
4450	14005	xa_nam_thanh	362	xã	Nam Thanh
4451	14008	xa_nam_loi	362	xã	Nam Lợi
4452	14011	xa_binh_minh	362	xã	Bình Minh
4453	14014	xa_dong_son	362	xã	Đồng Sơn
4454	14017	xa_nam_tien	362	xã	Nam Tiến
4455	14020	xa_nam_hai	362	xã	Nam Hải
4456	14023	xa_nam_thai	362	xã	Nam Thái
4457	14026	thi_tran_co_le	363	thị trấn	Cổ Lễ
4458	14029	xa_phuong_dinh	363	xã	Phương Định
4459	14032	xa_truc_chinh	363	xã	Trực Chính
4460	14035	xa_trung_dong	363	xã	Trung Đông
4461	14038	xa_liem_hai	363	xã	Liêm Hải
4462	14041	xa_truc_tuan	363	xã	Trực Tuấn
4463	14044	xa_viet_hung	363	xã	Việt Hùng
4464	14047	xa_truc_dao	363	xã	Trực Đạo
4465	14050	xa_truc_hung	363	xã	Trực Hưng
4466	14053	xa_truc_noi	363	xã	Trực Nội
4467	14056	thi_tran_cat_thanh	363	thị trấn	Cát Thành
4468	14059	xa_truc_thanh	363	xã	Trực Thanh
4469	14062	xa_truc_khang	363	xã	Trực Khang
4470	14065	xa_truc_thuan	363	xã	Trực Thuận
4471	14068	xa_truc_my	363	xã	Trực Mỹ
4472	14071	xa_truc_dai	363	xã	Trực Đại
4473	14074	xa_truc_cuong	363	xã	Trực Cường
4474	14077	thi_tran_ninh_cuong	363	thị trấn	Ninh Cường
4475	14080	xa_truc_thai	363	xã	Trực Thái
4476	14083	xa_truc_hung	363	xã	Trực Hùng
4477	14086	xa_truc_thang	363	xã	Trực Thắng
4478	14089	thi_tran_xuan_truong	364	thị trấn	Xuân Trường
4479	14092	xa_xuan_chau	364	xã	Xuân Châu
4480	14095	xa_xuan_hong	364	xã	Xuân Hồng
4481	14098	xa_xuan_thanh	364	xã	Xuân Thành
4482	14101	xa_xuan_thuong	364	xã	Xuân Thượng
4483	14104	xa_xuan_phong	364	xã	Xuân Phong
4484	14107	xa_xuan_dai	364	xã	Xuân Đài
4485	14110	xa_xuan_tan	364	xã	Xuân Tân
4486	14113	xa_xuan_thuy	364	xã	Xuân Thủy
4487	14116	xa_xuan_ngoc	364	xã	Xuân Ngọc
4488	14119	xa_xuan_bac	364	xã	Xuân Bắc
4489	14122	xa_xuan_phuong	364	xã	Xuân Phương
4490	14125	xa_tho_nghiep	364	xã	Thọ Nghiệp
4491	14128	xa_xuan_phu	364	xã	Xuân Phú
4492	14131	xa_xuan_trung	364	xã	Xuân Trung
4493	14134	xa_xuan_vinh	364	xã	Xuân Vinh
4494	14137	xa_xuan_kien	364	xã	Xuân Kiên
4495	14140	xa_xuan_tien	364	xã	Xuân Tiến
4496	14143	xa_xuan_ninh	364	xã	Xuân Ninh
4497	14146	xa_xuan_hoa	364	xã	Xuân Hòa
4498	14149	thi_tran_ngo_dong	365	thị trấn	Ngô Đồng
4499	14152	thi_tran_quat_lam	365	thị trấn	Quất Lâm
4500	14155	xa_giao_huong	365	xã	Giao Hương
4501	14158	xa_hong_thuan	365	xã	Hồng Thuận
4502	14161	xa_giao_thien	365	xã	Giao Thiện
4503	14164	xa_giao_thanh	365	xã	Giao Thanh
4504	14167	xa_hoanh_son	365	xã	Hoành Sơn
4505	14170	xa_binh_hoa	365	xã	Bình Hòa
4506	14173	xa_giao_tien	365	xã	Giao Tiến
4507	14176	xa_giao_ha	365	xã	Giao Hà
4508	14179	xa_giao_nhan	365	xã	Giao Nhân
4509	14182	xa_giao_an	365	xã	Giao An
4510	14185	xa_giao_lac	365	xã	Giao Lạc
4511	14188	xa_giao_chau	365	xã	Giao Châu
4512	14191	xa_giao_tan	365	xã	Giao Tân
4513	14194	xa_giao_yen	365	xã	Giao Yến
4514	14197	xa_giao_xuan	365	xã	Giao Xuân
4515	14200	xa_giao_thinh	365	xã	Giao Thịnh
4516	14203	xa_giao_hai	365	xã	Giao Hải
4517	14206	xa_bach_long	365	xã	Bạch Long
4518	14209	xa_giao_long	365	xã	Giao Long
4519	14212	xa_giao_phong	365	xã	Giao Phong
4520	14215	thi_tran_yen_dinh	366	thị trấn	Yên Định
4521	14218	thi_tran_con	366	thị trấn	Thị trấn Cồn
4522	14221	thi_tran_thinh_long	366	thị trấn	Thịnh Long
4523	14224	xa_hai_nam	366	xã	Hải Nam
4524	14227	xa_hai_trung	366	xã	Hải Trung
4525	14230	xa_hai_van	366	xã	Hải Vân
4526	14233	xa_hai_minh	366	xã	Hải Minh
4527	14236	xa_hai_anh	366	xã	Hải Anh
4528	14239	xa_hai_hung	366	xã	Hải Hưng
4529	14242	xa_hai_bac	366	xã	Hải Bắc
4530	14245	xa_hai_phuc	366	xã	Hải Phúc
4531	14248	xa_hai_thanh	366	xã	Hải Thanh
4532	14251	xa_hai_ha	366	xã	Hải Hà
4533	14254	xa_hai_long	366	xã	Hải Long
4534	14257	xa_hai_phuong	366	xã	Hải Phương
4535	14260	xa_hai_duong	366	xã	Hải Đường
4536	14263	xa_hai_loc	366	xã	Hải Lộc
4537	14266	xa_hai_quang	366	xã	Hải Quang
4538	14269	xa_hai_dong	366	xã	Hải Đông
4539	14272	xa_hai_son	366	xã	Hải Sơn
4540	14275	xa_hai_tan	366	xã	Hải Tân
4541	14281	xa_hai_phong	366	xã	Hải Phong
4542	14284	xa_hai_an	366	xã	Hải An
4543	14287	xa_hai_tay	366	xã	Hải Tây
4544	14290	xa_hai_ly	366	xã	Hải Lý
4545	14293	xa_hai_phu	366	xã	Hải Phú
4546	14296	xa_hai_giang	366	xã	Hải Giang
4547	14299	xa_hai_cuong	366	xã	Hải Cường
4548	14302	xa_hai_ninh	366	xã	Hải Ninh
4549	14305	xa_hai_chinh	366	xã	Hải Chính
4550	14308	xa_hai_xuan	366	xã	Hải Xuân
4551	14311	xa_hai_chau	366	xã	Hải Châu
4552	14314	xa_hai_trieu	366	xã	Hải Triều
4553	14317	xa_hai_hoa	366	xã	Hải Hòa
4554	14320	phuong_dong_thanh	369	phường	Đông Thành
4555	14323	phuong_tan_thanh	369	phường	Tân Thành
4556	14326	phuong_thanh_binh	369	phường	Thanh Bình
4557	14329	phuong_van_giang	369	phường	Vân Giang
4558	14332	phuong_bich_dao	369	phường	Bích Đào
4559	14335	phuong_phuc_thanh	369	phường	Phúc Thành
4560	14338	phuong_nam_binh	369	phường	Nam Bình
4561	14341	phuong_nam_thanh	369	phường	Nam Thành
4562	14344	phuong_ninh_khanh	369	phường	Ninh Khánh
4563	14347	xa_ninh_nhat	369	xã	Ninh Nhất
4564	14350	xa_ninh_tien	369	xã	Ninh Tiến
4565	14353	xa_ninh_phuc	369	xã	Ninh Phúc
4566	14356	phuong_ninh_son	369	phường	Ninh Sơn
4567	14359	phuong_ninh_phong	369	phường	Ninh Phong
4568	14362	phuong_bac_son	370	phường	Bắc Sơn
4569	14365	phuong_trung_son	370	phường	Trung Sơn
4570	14368	phuong_nam_son	370	phường	Nam Sơn
4571	14369	phuong_tay_son	370	phường	Tây Sơn
4572	14371	xa_yen_son	370	xã	Yên Sơn
4573	14374	phuong_yen_binh	370	phường	Yên Bình
4574	14375	phuong_tan_binh	370	phường	Tân Bình
4575	14377	xa_quang_son	370	xã	Quang Sơn
4576	14380	xa_dong_son	370	xã	Đông Sơn
4577	14383	thi_tran_nho_quan	372	thị trấn	Nho Quan
4578	14386	xa_xich_tho	372	xã	Xích Thổ
4579	14389	xa_gia_lam	372	xã	Gia Lâm
4580	14392	xa_gia_son	372	xã	Gia Sơn
4581	14395	xa_thach_binh	372	xã	Thạch Bình
4582	14398	xa_gia_thuy	372	xã	Gia Thủy
4583	14401	xa_gia_tuong	372	xã	Gia Tường
4584	14404	xa_cuc_phuong	372	xã	Cúc Phương
4585	14407	xa_phu_son	372	xã	Phú Sơn
4586	14410	xa_duc_long	372	xã	Đức Long
4587	14413	xa_lac_van	372	xã	Lạc Vân
4588	14416	xa_dong_phong	372	xã	Đồng Phong
4589	14419	xa_yen_quang	372	xã	Yên Quang
4590	14422	xa_lang_phong	372	xã	Lạng Phong
4591	14425	xa_thuong_hoa	372	xã	Thượng Hòa
4592	14428	xa_van_phong	372	xã	Văn Phong
4593	14431	xa_van_phuong	372	xã	Văn Phương
4594	14434	xa_thanh_lac	372	xã	Thanh Lạc
4595	14437	xa_son_lai	372	xã	Sơn Lai
4596	14440	xa_son_thanh	372	xã	Sơn Thành
4597	14443	xa_van_phu	372	xã	Văn Phú
4598	14446	xa_phu_loc	372	xã	Phú Lộc
4599	14449	xa_ky_phu	372	xã	Kỳ Phú
4600	14452	xa_quynh_luu	372	xã	Quỳnh Lưu
4601	14455	xa_son_ha	372	xã	Sơn Hà
4602	14458	xa_phu_long	372	xã	Phú Long
4603	14461	xa_quang_lac	372	xã	Quảng Lạc
4604	14464	thi_tran_me	373	thị trấn	Thị trấn Me
4605	14467	xa_gia_hoa	373	xã	Gia Hòa
4606	14470	xa_gia_hung	373	xã	Gia Hưng
4607	14473	xa_lien_son	373	xã	Liên Sơn
4608	14476	xa_gia_thanh	373	xã	Gia Thanh
4609	14479	xa_gia_van	373	xã	Gia Vân
4610	14482	xa_gia_phu	373	xã	Gia Phú
4611	14485	xa_gia_xuan	373	xã	Gia Xuân
4612	14488	xa_gia_lap	373	xã	Gia Lập
4613	14491	xa_gia_vuong	373	xã	Gia Vượng
4614	14494	xa_gia_tran	373	xã	Gia Trấn
4615	14497	xa_gia_thinh	373	xã	Gia Thịnh
4616	14500	xa_gia_phuong	373	xã	Gia Phương
4617	14503	xa_gia_tan	373	xã	Gia Tân
4618	14506	xa_gia_thang	373	xã	Gia Thắng
4619	14509	xa_gia_trung	373	xã	Gia Trung
4620	14512	xa_gia_minh	373	xã	Gia Minh
4621	14515	xa_gia_lac	373	xã	Gia Lạc
4622	14518	xa_gia_tien	373	xã	Gia Tiến
4623	14521	xa_gia_sinh	373	xã	Gia Sinh
4624	14524	xa_gia_phong	373	xã	Gia Phong
4625	14527	thi_tran_thien_ton	374	thị trấn	Thiên Tôn
4626	14530	xa_ninh_giang	374	xã	Ninh Giang
4627	14533	xa_truong_yen	374	xã	Trường Yên
4628	14536	xa_ninh_khang	374	xã	Ninh Khang
4629	14539	xa_ninh_my	374	xã	Ninh Mỹ
4630	14542	xa_ninh_hoa	374	xã	Ninh Hòa
4631	14545	xa_ninh_xuan	374	xã	Ninh Xuân
4632	14548	xa_ninh_hai	374	xã	Ninh Hải
4633	14551	xa_ninh_thang	374	xã	Ninh Thắng
4634	14554	xa_ninh_van	374	xã	Ninh Vân
4635	14557	xa_ninh_an	374	xã	Ninh An
4636	14560	thi_tran_yen_ninh	375	thị trấn	Yên Ninh
4637	14563	xa_khanh_tien	375	xã	Khánh Tiên
4638	14566	xa_khanh_phu	375	xã	Khánh Phú
4639	14569	xa_khanh_hoa	375	xã	Khánh Hòa
4640	14572	xa_khanh_loi	375	xã	Khánh Lợi
4641	14575	xa_khanh_an	375	xã	Khánh An
4642	14578	xa_khanh_cuong	375	xã	Khánh Cường
4643	14581	xa_khanh_cu	375	xã	Khánh Cư
4644	14584	xa_khanh_thien	375	xã	Khánh Thiện
4645	14587	xa_khanh_hai	375	xã	Khánh Hải
4646	14590	xa_khanh_trung	375	xã	Khánh Trung
4647	14593	xa_khanh_mau	375	xã	Khánh Mậu
4648	14596	xa_khanh_van	375	xã	Khánh Vân
4649	14599	xa_khanh_hoi	375	xã	Khánh Hội
4650	14602	xa_khanh_cong	375	xã	Khánh Công
4651	14608	xa_khanh_thanh	375	xã	Khánh Thành
4652	14611	xa_khanh_nhac	375	xã	Khánh Nhạc
4653	14614	xa_khanh_thuy	375	xã	Khánh Thủy
4654	14617	xa_khanh_hong	375	xã	Khánh Hồng
4655	14620	thi_tran_phat_diem	376	thị trấn	Phát Diệm
4656	14623	thi_tran_binh_minh	376	thị trấn	Bình Minh
4657	14629	xa_hoi_ninh	376	xã	Hồi Ninh
4658	14632	xa_xuan_chinh	376	xã	Xuân Chính
4659	14635	xa_kim_dinh	376	xã	Kim Định
4660	14638	xa_an_hoa	376	xã	Ân Hòa
4661	14641	xa_hung_tien	376	xã	Hùng Tiến
4662	14647	xa_quang_thien	376	xã	Quang Thiện
4663	14650	xa_nhu_hoa	376	xã	Như Hòa
4664	14653	xa_chat_binh	376	xã	Chất Bình
4665	14656	xa_dong_huong	376	xã	Đồng Hướng
4666	14659	xa_kim_chinh	376	xã	Kim Chính
4667	14662	xa_thuong_kiem	376	xã	Thượng Kiệm
4668	14665	xa_luu_phuong	376	xã	Lưu Phương
4669	14668	xa_tan_thanh	376	xã	Tân Thành
4670	14671	xa_yen_loc	376	xã	Yên Lộc
4671	14674	xa_lai_thanh	376	xã	Lai Thành
4672	14677	xa_dinh_hoa	376	xã	Định Hóa
4673	14680	xa_van_hai	376	xã	Văn Hải
4674	14683	xa_kim_tan	376	xã	Kim Tân
4675	14686	xa_kim_my	376	xã	Kim Mỹ
4676	14689	xa_con_thoi	376	xã	Cồn Thoi
4677	14692	xa_kim_hai	376	xã	Kim Hải
4678	14695	xa_kim_trung	376	xã	Kim Trung
4679	14698	xa_kim_dong	376	xã	Kim Đông
4680	14701	thi_tran_yen_thinh	377	thị trấn	Yên Thịnh
4681	14704	xa_khanh_thuong	377	xã	Khánh Thượng
4682	14707	xa_khanh_duong	377	xã	Khánh Dương
4683	14710	xa_mai_son	377	xã	Mai Sơn
4684	14713	xa_khanh_thinh	377	xã	Khánh Thịnh
4685	14719	xa_yen_phong	377	xã	Yên Phong
4686	14722	xa_yen_hoa	377	xã	Yên Hòa
4687	14725	xa_yen_thang	377	xã	Yên Thắng
4688	14728	xa_yen_tu	377	xã	Yên Từ
4689	14731	xa_yen_hung	377	xã	Yên Hưng
4690	14734	xa_yen_thanh	377	xã	Yên Thành
4691	14737	xa_yen_nhan	377	xã	Yên Nhân
4692	14740	xa_yen_my	377	xã	Yên Mỹ
4693	14743	xa_yen_mac	377	xã	Yên Mạc
4694	14746	xa_yen_dong	377	xã	Yên Đồng
4695	14749	xa_yen_thai	377	xã	Yên Thái
4696	14752	xa_yen_lam	377	xã	Yên Lâm
4697	14755	phuong_ham_rong	380	phường	Hàm Rồng
4698	14758	phuong_dong_tho	380	phường	Đông Thọ
4699	14761	phuong_nam_ngan	380	phường	Nam Ngạn
4700	14764	phuong_truong_thi	380	phường	Trường Thi
4701	14767	phuong_dien_bien	380	phường	Điện Biên
4702	14770	phuong_phu_son	380	phường	Phú Sơn
4703	14773	phuong_lam_son	380	phường	Lam Sơn
4704	14776	phuong_ba_dinh	380	phường	Ba Đình
4705	14779	phuong_ngoc_trao	380	phường	Ngọc Trạo
4706	14782	phuong_dong_ve	380	phường	Đông Vệ
4707	14785	phuong_dong_son	380	phường	Đông Sơn
4708	14788	phuong_tan_son	380	phường	Tân Sơn
4709	14791	phuong_dong_cuong	380	phường	Đông Cương
4710	14794	phuong_dong_huong	380	phường	Đông Hương
4711	14797	phuong_dong_hai	380	phường	Đông Hải
4712	14800	phuong_quang_hung	380	phường	Quảng Hưng
4713	14803	phuong_quang_thang	380	phường	Quảng Thắng
4714	14806	phuong_quang_thanh	380	phường	Quảng Thành
4715	15850	xa_thieu_van	380	xã	Thiệu Vân
4716	15856	phuong_thieu_khanh	380	phường	Thiệu Khánh
4717	15859	phuong_thieu_duong	380	phường	Thiệu Dương
4718	15913	phuong_tao_xuyen	380	phường	Tào Xuyên
4719	15922	phuong_long_anh	380	phường	Long Anh
4720	15925	xa_hoang_quang	380	xã	Hoằng Quang
4721	15970	xa_hoang_dai	380	xã	Hoằng Đại
4722	16396	phuong_dong_linh	380	phường	Đông Lĩnh
4723	16429	xa_dong_vinh	380	xã	Đông Vinh
4724	16432	phuong_dong_tan	380	phường	Đông Tân
4725	16435	phuong_an_hung	380	phường	An Hưng
4726	16441	phuong_quang_thinh	380	phường	Quảng Thịnh
4727	16459	phuong_quang_dong	380	phường	Quảng Đông
4728	16507	phuong_quang_cat	380	phường	Quảng Cát
4729	16522	phuong_quang_phu	380	phường	Quảng Phú
4730	16525	phuong_quang_tam	380	phường	Quảng Tâm
4731	14809	phuong_bac_son	381	phường	Bắc Sơn
4732	14812	phuong_ba_dinh	381	phường	Ba Đình
4733	14815	phuong_lam_son	381	phường	Lam Sơn
4734	14818	phuong_ngoc_trao	381	phường	Ngọc Trạo
4735	14821	phuong_dong_son	381	phường	Đông Sơn
4736	14823	phuong_phu_son	381	phường	Phú Sơn
4737	14824	xa_quang_trung	381	xã	Quang Trung
4738	14830	phuong_trung_son	382	phường	Trung Sơn
4739	14833	phuong_bac_son	382	phường	Bắc Sơn
4740	14836	phuong_truong_son	382	phường	Trường Sơn
4741	14839	phuong_quang_cu	382	phường	Quảng Cư
4742	14842	phuong_quang_tien	382	phường	Quảng Tiến
4743	16513	xa_quang_minh	382	xã	Quảng Minh
4744	16516	xa_quang_hung	382	xã	Quảng Hùng
4745	16528	phuong_quang_tho	382	phường	Quảng Thọ
4746	16531	phuong_quang_chau	382	phường	Quảng Châu
4747	16534	phuong_quang_vinh	382	phường	Quảng Vinh
4748	16537	xa_quang_dai	382	xã	Quảng Đại
4749	14845	thi_tran_muong_lat	384	thị trấn	Mường Lát
4750	14848	xa_tam_chung	384	xã	Tam Chung
4751	14854	xa_muong_ly	384	xã	Mường Lý
4752	14857	xa_trung_ly	384	xã	Trung Lý
4753	14860	xa_quang_chieu	384	xã	Quang Chiểu
4754	14863	xa_pu_nhi	384	xã	Pù Nhi
4755	14864	xa_nhi_son	384	xã	Nhi Sơn
4756	14866	xa_muong_chanh	384	xã	Mường Chanh
4757	14869	thi_tran_hoi_xuan	385	thị trấn	Hồi Xuân
4758	14872	xa_thanh_son	385	xã	Thành Sơn
4759	14875	xa_trung_son	385	xã	Trung Sơn
4760	14878	xa_phu_thanh	385	xã	Phú Thanh
4761	14881	xa_trung_thanh	385	xã	Trung Thành
4762	14884	xa_phu_le	385	xã	Phú Lệ
4763	14887	xa_phu_son	385	xã	Phú Sơn
4764	14890	xa_phu_xuan	385	xã	Phú Xuân
4765	14896	xa_hien_chung	385	xã	Hiền Chung
4766	14899	xa_hien_kiet	385	xã	Hiền Kiệt
4767	14902	xa_nam_tien	385	xã	Nam Tiến
4768	14908	xa_thien_phu	385	xã	Thiên Phủ
4769	14911	xa_phu_nghiem	385	xã	Phú Nghiêm
4770	14914	xa_nam_xuan	385	xã	Nam Xuân
4771	14917	xa_nam_dong	385	xã	Nam Động
4772	14923	thi_tran_canh_nang	386	thị trấn	Cành Nàng
4773	14926	xa_dien_thuong	386	xã	Điền Thượng
4774	14929	xa_dien_ha	386	xã	Điền Hạ
4775	14932	xa_dien_quang	386	xã	Điền Quang
4776	14935	xa_dien_trung	386	xã	Điền Trung
4777	14938	xa_thanh_son	386	xã	Thành Sơn
4778	14941	xa_luong_ngoai	386	xã	Lương Ngoại
4779	14944	xa_ai_thuong	386	xã	Ái Thượng
4780	14947	xa_luong_noi	386	xã	Lương Nội
4781	14950	xa_dien_lu	386	xã	Điền Lư
4782	14953	xa_luong_trung	386	xã	Lương Trung
4783	14956	xa_lung_niem	386	xã	Lũng Niêm
4784	14959	xa_lung_cao	386	xã	Lũng Cao
4785	14962	xa_ha_trung	386	xã	Hạ Trung
4786	14965	xa_co_lung	386	xã	Cổ Lũng
4787	14968	xa_thanh_lam	386	xã	Thành Lâm
4788	14971	xa_ban_cong	386	xã	Ban Công
4789	14974	xa_ky_tan	386	xã	Kỳ Tân
4790	14977	xa_van_nho	386	xã	Văn Nho
4791	14980	xa_thiet_ong	386	xã	Thiết Ống
4792	14986	xa_thiet_ke	386	xã	Thiết Kế
4793	14995	xa_trung_xuan	387	xã	Trung Xuân
4794	14998	xa_trung_thuong	387	xã	Trung Thượng
4795	14999	xa_trung_tien	387	xã	Trung Tiến
4796	15001	xa_trung_ha	387	xã	Trung Hạ
4797	15004	xa_son_ha	387	xã	Sơn Hà
4798	15007	xa_tam_thanh	387	xã	Tam Thanh
4799	15010	xa_son_thuy	387	xã	Sơn Thủy
4800	15013	xa_na_meo	387	xã	Na Mèo
4801	15016	thi_tran_son_lu	387	thị trấn	Sơn Lư
4802	15019	xa_tam_lu	387	xã	Tam Lư
4803	15022	xa_son_dien	387	xã	Sơn Điện
4804	15025	xa_muong_min	387	xã	Mường Mìn
4805	15031	xa_yen_khuong	388	xã	Yên Khương
4806	15034	xa_yen_thang	388	xã	Yên Thắng
4807	15037	xa_tri_nang	388	xã	Trí Nang
4808	15040	xa_giao_an	388	xã	Giao An
4809	15043	xa_giao_thien	388	xã	Giao Thiện
4810	15046	xa_tan_phuc	388	xã	Tân Phúc
4811	15049	xa_tam_van	388	xã	Tam Văn
4812	15052	xa_lam_phu	388	xã	Lâm Phú
4813	15055	thi_tran_lang_chanh	388	thị trấn	Lang Chánh
4814	15058	xa_dong_luong	388	xã	Đồng Lương
4815	15061	thi_tran_ngoc_lac	389	thị trấn	Ngọc Lặc
4816	15064	xa_lam_son	389	xã	Lam Sơn
4817	15067	xa_my_tan	389	xã	Mỹ Tân
4818	15070	xa_thuy_son	389	xã	Thúy Sơn
4819	15073	xa_thach_lap	389	xã	Thạch Lập
4820	15076	xa_van_am	389	xã	Vân Âm
4821	15079	xa_cao_ngoc	389	xã	Cao Ngọc
4822	15085	xa_quang_trung	389	xã	Quang Trung
4823	15088	xa_dong_thinh	389	xã	Đồng Thịnh
4824	15091	xa_ngoc_lien	389	xã	Ngọc Liên
4825	15094	xa_ngoc_son	389	xã	Ngọc Sơn
4826	15097	xa_loc_thinh	389	xã	Lộc Thịnh
4827	15100	xa_cao_thinh	389	xã	Cao Thịnh
4828	15103	xa_ngoc_trung	389	xã	Ngọc Trung
4829	15106	xa_phung_giao	389	xã	Phùng Giáo
4830	15109	xa_phung_minh	389	xã	Phùng Minh
4831	15112	xa_phuc_thinh	389	xã	Phúc Thịnh
4832	15115	xa_nguyet_an	389	xã	Nguyệt Ấn
4833	15118	xa_kien_tho	389	xã	Kiên Thọ
4834	15121	xa_minh_tien	389	xã	Minh Tiến
4835	15124	xa_minh_son	389	xã	Minh Sơn
4836	15127	thi_tran_phong_son	390	thị trấn	Phong Sơn
4837	15133	xa_cam_thanh	390	xã	Cẩm Thành
4838	15136	xa_cam_quy	390	xã	Cẩm Quý
4839	15139	xa_cam_luong	390	xã	Cẩm Lương
4840	15142	xa_cam_thach	390	xã	Cẩm Thạch
4841	15145	xa_cam_lien	390	xã	Cẩm Liên
4842	15148	xa_cam_giang	390	xã	Cẩm Giang
4843	15151	xa_cam_binh	390	xã	Cẩm Bình
4844	15154	xa_cam_tu	390	xã	Cẩm Tú
4845	15160	xa_cam_chau	390	xã	Cẩm Châu
4846	15163	xa_cam_tam	390	xã	Cẩm Tâm
4847	15169	xa_cam_ngoc	390	xã	Cẩm Ngọc
4848	15172	xa_cam_long	390	xã	Cẩm Long
4849	15175	xa_cam_yen	390	xã	Cẩm Yên
4850	15178	xa_cam_tan	390	xã	Cẩm Tân
4851	15181	xa_cam_phu	390	xã	Cẩm Phú
4852	15184	xa_cam_van	390	xã	Cẩm Vân
4853	15187	thi_tran_kim_tan	391	thị trấn	Kim Tân
4854	15190	thi_tran_van_du	391	thị trấn	Vân Du
4855	15196	xa_thach_lam	391	xã	Thạch Lâm
4856	15199	xa_thach_quang	391	xã	Thạch Quảng
4857	15202	xa_thach_tuong	391	xã	Thạch Tượng
4858	15205	xa_thach_cam	391	xã	Thạch Cẩm
4859	15208	xa_thach_son	391	xã	Thạch Sơn
4860	15211	xa_thach_binh	391	xã	Thạch Bình
4861	15214	xa_thach_dinh	391	xã	Thạch Định
4862	15217	xa_thach_dong	391	xã	Thạch Đồng
4863	15220	xa_thach_long	391	xã	Thạch Long
4864	15223	xa_thanh_my	391	xã	Thành Mỹ
4865	15226	xa_thanh_yen	391	xã	Thành Yên
4866	15229	xa_thanh_vinh	391	xã	Thành Vinh
4867	15232	xa_thanh_minh	391	xã	Thành Minh
4868	15235	xa_thanh_cong	391	xã	Thành Công
4869	15238	xa_thanh_tan	391	xã	Thành Tân
4870	15241	xa_thanh_truc	391	xã	Thành Trực
4871	15247	xa_thanh_tam	391	xã	Thành Tâm
4872	15250	xa_thanh_an	391	xã	Thành An
4873	15253	xa_thanh_tho	391	xã	Thành Thọ
4874	15256	xa_thanh_tien	391	xã	Thành Tiến
4875	15259	xa_thanh_long	391	xã	Thành Long
4876	15265	xa_thanh_hung	391	xã	Thành Hưng
4877	15268	xa_ngoc_trao	391	xã	Ngọc Trạo
4878	15271	thi_tran_ha_trung	392	thị trấn	Hà Trung
4879	15274	xa_ha_long	392	xã	Hà Long
4880	15277	xa_ha_vinh	392	xã	Hà Vinh
4881	15280	xa_ha_bac	392	xã	Hà Bắc
4882	15283	xa_hoat_giang	392	xã	Hoạt Giang
4883	15286	xa_yen_duong	392	xã	Yên Dương
4884	15292	xa_ha_giang	392	xã	Hà Giang
4885	15298	xa_linh_toai	392	xã	Lĩnh Toại
4886	15304	xa_ha_ngoc	392	xã	Hà Ngọc
4887	15307	xa_yen_son	392	xã	Yến Sơn
4888	15313	xa_ha_son	392	xã	Hà Sơn
4889	15316	xa_ha_linh	392	xã	Hà Lĩnh
4890	15319	xa_ha_dong	392	xã	Hà Đông
4891	15322	xa_ha_tan	392	xã	Hà Tân
4892	15325	xa_ha_tien	392	xã	Hà Tiến
4893	15328	xa_ha_binh	392	xã	Hà Bình
4894	15331	xa_ha_lai	392	xã	Hà Lai
4895	15334	xa_ha_chau	392	xã	Hà Châu
4896	15340	xa_ha_thai	392	xã	Hà Thái
4897	15343	xa_ha_hai	392	xã	Hà Hải
4898	15349	thi_tran_vinh_loc	393	thị trấn	Vĩnh Lộc
4899	15352	xa_vinh_quang	393	xã	Vĩnh Quang
4900	15355	xa_vinh_yen	393	xã	Vĩnh Yên
4901	15358	xa_vinh_tien	393	xã	Vĩnh Tiến
4902	15361	xa_vinh_long	393	xã	Vĩnh Long
4903	15364	xa_vinh_phuc	393	xã	Vĩnh Phúc
4904	15367	xa_vinh_hung	393	xã	Vĩnh Hưng
4905	15376	xa_vinh_hoa	393	xã	Vĩnh Hòa
4906	15379	xa_vinh_hung	393	xã	Vĩnh Hùng
4907	15382	xa_minh_tan	393	xã	Minh Tân
4908	15385	xa_ninh_khang	393	xã	Ninh Khang
4909	15388	xa_vinh_thinh	393	xã	Vĩnh Thịnh
4910	15391	xa_vinh_an	393	xã	Vĩnh An
4911	15397	thi_tran_thong_nhat	394	thị trấn	Thống Nhất
4912	15403	xa_yen_lam	394	xã	Yên Lâm
4913	15406	xa_yen_tam	394	xã	Yên Tâm
4914	15409	xa_yen_phu	394	xã	Yên Phú
4915	15412	xa_qui_loc	394	xã	Quí Lộc
4916	15415	xa_yen_tho	394	xã	Yên Thọ
4917	15418	xa_yen_trung	394	xã	Yên Trung
4918	15421	xa_yen_truong	394	xã	Yên Trường
4919	15427	xa_yen_phong	394	xã	Yên Phong
4920	15430	xa_yen_thai	394	xã	Yên Thái
4921	15433	xa_yen_hung	394	xã	Yên Hùng
4922	15436	xa_yen_thinh	394	xã	Yên Thịnh
4923	15439	xa_yen_ninh	394	xã	Yên Ninh
4924	15442	xa_yen_lac	394	xã	Yên Lạc
4925	15445	xa_dinh_tang	394	xã	Định Tăng
4926	15448	xa_dinh_hoa	394	xã	Định Hòa
4927	15451	xa_dinh_thanh	394	xã	Định Thành
4928	15454	xa_dinh_cong	394	xã	Định Công
4929	15457	xa_dinh_tan	394	xã	Định Tân
4930	15460	xa_dinh_tien	394	xã	Định Tiến
4931	15463	xa_dinh_long	394	xã	Định Long
4932	15466	xa_dinh_lien	394	xã	Định Liên
4933	15469	thi_tran_quan_lao	394	thị trấn	Quán Lào
4934	15472	xa_dinh_hung	394	xã	Định Hưng
4935	15475	xa_dinh_hai	394	xã	Định Hải
4936	15478	xa_dinh_binh	394	xã	Định Bình
4937	15493	xa_xuan_hong	395	xã	Xuân Hồng
4938	15499	thi_tran_tho_xuan	395	thị trấn	Thọ Xuân
4939	15502	xa_bac_luong	395	xã	Bắc Lương
4940	15505	xa_nam_giang	395	xã	Nam Giang
4941	15508	xa_xuan_phong	395	xã	Xuân Phong
4942	15511	xa_tho_loc	395	xã	Thọ Lộc
4943	15514	xa_xuan_truong	395	xã	Xuân Trường
4944	15517	xa_xuan_hoa	395	xã	Xuân Hòa
4945	15520	xa_tho_hai	395	xã	Thọ Hải
4946	15523	xa_tay_ho	395	xã	Tây Hồ
4947	15526	xa_xuan_giang	395	xã	Xuân Giang
4948	15532	xa_xuan_sinh	395	xã	Xuân Sinh
4949	15535	xa_xuan_hung	395	xã	Xuân Hưng
4950	15538	xa_tho_dien	395	xã	Thọ Diên
4951	15541	xa_tho_lam	395	xã	Thọ Lâm
4952	15544	xa_tho_xuong	395	xã	Thọ Xương
4953	15547	xa_xuan_bai	395	xã	Xuân Bái
4954	15550	xa_xuan_phu	395	xã	Xuân Phú
4955	15553	thi_tran_sao_vang	395	thị trấn	Sao Vàng
4956	15556	thi_tran_lam_son	395	thị trấn	Lam Sơn
4957	15559	xa_xuan_thien	395	xã	Xuân Thiên
4958	15565	xa_thuan_minh	395	xã	Thuận Minh
4959	15568	xa_tho_lap	395	xã	Thọ Lập
4960	15571	xa_quang_phu	395	xã	Quảng Phú
4961	15574	xa_xuan_tin	395	xã	Xuân Tín
4962	15577	xa_phu_xuan	395	xã	Phú Xuân
4963	15583	xa_xuan_lai	395	xã	Xuân Lai
4964	15586	xa_xuan_lap	395	xã	Xuân Lập
4965	15592	xa_xuan_minh	395	xã	Xuân Minh
4966	15598	xa_truong_xuan	395	xã	Trường Xuân
4967	15607	xa_bat_mot	396	xã	Bát Mọt
4968	15610	xa_yen_nhan	396	xã	Yên Nhân
4969	15619	xa_xuan_le	396	xã	Xuân Lẹ
4970	15622	xa_van_xuan	396	xã	Vạn Xuân
4971	15628	xa_luong_son	396	xã	Lương Sơn
4972	15631	xa_xuan_cao	396	xã	Xuân Cao
4973	15634	xa_luan_thanh	396	xã	Luận Thành
4974	15637	xa_luan_khe	396	xã	Luận Khê
4975	15640	xa_xuan_thang	396	xã	Xuân Thắng
4976	15643	xa_xuan_loc	396	xã	Xuân Lộc
4977	15646	thi_tran_thuong_xuan	396	thị trấn	Thường Xuân
4978	15649	xa_xuan_duong	396	xã	Xuân Dương
4979	15652	xa_tho_thanh	396	xã	Thọ Thanh
4980	15655	xa_ngoc_phung	396	xã	Ngọc Phụng
4981	15658	xa_xuan_chinh	396	xã	Xuân Chinh
4982	15661	xa_tan_thanh	396	xã	Tân Thành
4983	15664	thi_tran_trieu_son	397	thị trấn	Triệu Sơn
4984	15667	xa_tho_son	397	xã	Thọ Sơn
4985	15670	xa_tho_binh	397	xã	Thọ Bình
4986	15673	xa_tho_tien	397	xã	Thọ Tiến
4987	15676	xa_hop_ly	397	xã	Hợp Lý
4988	15679	xa_hop_tien	397	xã	Hợp Tiến
4989	15682	xa_hop_thanh	397	xã	Hợp Thành
4990	15685	xa_trieu_thanh	397	xã	Triệu Thành
4991	15688	xa_hop_thang	397	xã	Hợp Thắng
4992	15691	xa_minh_son	397	xã	Minh Sơn
4993	15700	xa_dan_luc	397	xã	Dân Lực
4994	15703	xa_dan_ly	397	xã	Dân Lý
4995	15706	xa_dan_quyen	397	xã	Dân Quyền
4996	15709	xa_an_nong	397	xã	An Nông
4997	15712	xa_van_son	397	xã	Văn Sơn
4998	15715	xa_thai_hoa	397	xã	Thái Hòa
4999	15718	thi_tran_nua	397	thị trấn	Thị trấn Nưa
5000	15721	xa_dong_loi	397	xã	Đồng Lợi
5001	15724	xa_dong_tien	397	xã	Đồng Tiến
5002	15727	xa_dong_thang	397	xã	Đồng Thắng
5003	15730	xa_tien_nong	397	xã	Tiến Nông
5004	15733	xa_khuyen_nong	397	xã	Khuyến Nông
5005	15736	xa_xuan_thinh	397	xã	Xuân Thịnh
5006	15739	xa_xuan_loc	397	xã	Xuân Lộc
5007	15742	xa_tho_dan	397	xã	Thọ Dân
5008	15745	xa_xuan_tho	397	xã	Xuân Thọ
5009	15748	xa_tho_tan	397	xã	Thọ Tân
5010	15751	xa_tho_ngoc	397	xã	Thọ Ngọc
5011	15754	xa_tho_cuong	397	xã	Thọ Cường
5012	15757	xa_tho_phu	397	xã	Thọ Phú
5013	15760	xa_tho_vuc	397	xã	Thọ Vực
5014	15763	xa_tho_the	397	xã	Thọ Thế
5015	15766	xa_nong_truong	397	xã	Nông Trường
5016	15769	xa_binh_son	397	xã	Bình Sơn
5017	15772	thi_tran_thieu_hoa	398	thị trấn	Thiệu Hóa
5018	15775	xa_thieu_ngoc	398	xã	Thiệu Ngọc
5019	15778	xa_thieu_vu	398	xã	Thiệu Vũ
5020	15781	xa_thieu_phuc	398	xã	Thiệu Phúc
5021	15784	xa_thieu_tien	398	xã	Thiệu Tiến
5022	15787	xa_thieu_cong	398	xã	Thiệu Công
5023	15790	xa_thieu_phu	398	xã	Thiệu Phú
5024	15793	xa_thieu_long	398	xã	Thiệu Long
5025	15796	xa_thieu_giang	398	xã	Thiệu Giang
5026	15799	xa_thieu_duy	398	xã	Thiệu Duy
5027	15802	xa_thieu_nguyen	398	xã	Thiệu Nguyên
5028	15805	xa_thieu_hop	398	xã	Thiệu Hợp
5029	15808	xa_thieu_thinh	398	xã	Thiệu Thịnh
5030	15811	xa_thieu_quang	398	xã	Thiệu Quang
5031	15814	xa_thieu_thanh	398	xã	Thiệu Thành
5032	15817	xa_thieu_toan	398	xã	Thiệu Toán
5033	15820	xa_thieu_chinh	398	xã	Thiệu Chính
5034	15823	xa_thieu_hoa	398	xã	Thiệu Hòa
5035	15829	xa_minh_tam	398	xã	Minh Tâm
5036	15832	xa_thieu_vien	398	xã	Thiệu Viên
5037	15835	xa_thieu_ly	398	xã	Thiệu Lý
5038	15838	xa_thieu_van	398	xã	Thiệu Vận
5039	15841	xa_thieu_trung	398	xã	Thiệu Trung
5040	15847	xa_tan_chau	398	xã	Tân Châu
5041	15853	xa_thieu_giao	398	xã	Thiệu Giao
5042	15865	thi_tran_but_son	399	thị trấn	Bút Sơn
5043	15871	xa_hoang_giang	399	xã	Hoằng Giang
5044	15877	xa_hoang_xuan	399	xã	Hoằng Xuân
5045	15880	xa_hoang_phuong	399	xã	Hoằng Phượng
5046	15883	xa_hoang_phu	399	xã	Hoằng Phú
5047	15886	xa_hoang_quy	399	xã	Hoằng Quỳ
5048	15889	xa_hoang_kim	399	xã	Hoằng Kim
5049	15892	xa_hoang_trung	399	xã	Hoằng Trung
5050	15895	xa_hoang_trinh	399	xã	Hoằng Trinh
5051	15901	xa_hoang_son	399	xã	Hoằng Sơn
5052	15907	xa_hoang_cat	399	xã	Hoằng Cát
5053	15910	xa_hoang_xuyen	399	xã	Hoằng Xuyên
5054	15916	xa_hoang_quy	399	xã	Hoằng Quý
5055	15919	xa_hoang_hop	399	xã	Hoằng Hợp
5056	15928	xa_hoang_duc	399	xã	Hoằng Đức
5057	15937	xa_hoang_ha	399	xã	Hoằng Hà
5058	15940	xa_hoang_dat	399	xã	Hoằng Đạt
5059	15946	xa_hoang_dao	399	xã	Hoằng Đạo
5060	15949	xa_hoang_thang	399	xã	Hoằng Thắng
5061	15952	xa_hoang_dong	399	xã	Hoằng Đồng
5062	15955	xa_hoang_thai	399	xã	Hoằng Thái
5063	15958	xa_hoang_thinh	399	xã	Hoằng Thịnh
5064	15961	xa_hoang_thanh	399	xã	Hoằng Thành
5065	15964	xa_hoang_loc	399	xã	Hoằng Lộc
5066	15967	xa_hoang_trach	399	xã	Hoằng Trạch
5067	15973	xa_hoang_phong	399	xã	Hoằng Phong
5068	15976	xa_hoang_luu	399	xã	Hoằng Lưu
5069	15979	xa_hoang_chau	399	xã	Hoằng Châu
5070	15982	xa_hoang_tan	399	xã	Hoằng Tân
5071	15985	xa_hoang_yen	399	xã	Hoằng Yến
5072	15988	xa_hoang_tien	399	xã	Hoằng Tiến
5073	15991	xa_hoang_hai	399	xã	Hoằng Hải
5074	15994	xa_hoang_ngoc	399	xã	Hoằng Ngọc
5075	15997	xa_hoang_dong	399	xã	Hoằng Đông
5076	16000	xa_hoang_thanh	399	xã	Hoằng Thanh
5077	16003	xa_hoang_phu	399	xã	Hoằng Phụ
5078	16006	xa_hoang_truong	399	xã	Hoằng Trường
5079	16012	thi_tran_hau_loc	400	thị trấn	Hậu Lộc
5080	16015	xa_dong_loc	400	xã	Đồng Lộc
5081	16018	xa_dai_loc	400	xã	Đại Lộc
5082	16021	xa_trieu_loc	400	xã	Triệu Lộc
5083	16027	xa_tien_loc	400	xã	Tiến Lộc
5084	16030	xa_loc_son	400	xã	Lộc Sơn
5085	16033	xa_cau_loc	400	xã	Cầu Lộc
5086	16036	xa_thanh_loc	400	xã	Thành Lộc
5087	16039	xa_tuy_loc	400	xã	Tuy Lộc
5088	16042	xa_phong_loc	400	xã	Phong Lộc
5089	16045	xa_my_loc	400	xã	Mỹ Lộc
5090	16048	xa_thuan_loc	400	xã	Thuần Lộc
5091	16057	xa_xuan_loc	400	xã	Xuân Lộc
5092	16063	xa_hoa_loc	400	xã	Hoa Lộc
5093	16066	xa_lien_loc	400	xã	Liên Lộc
5094	16069	xa_quang_loc	400	xã	Quang Lộc
5095	16072	xa_phu_loc	400	xã	Phú Lộc
5096	16075	xa_hoa_loc	400	xã	Hòa Lộc
5097	16078	xa_minh_loc	400	xã	Minh Lộc
5098	16081	xa_hung_loc	400	xã	Hưng Lộc
5099	16084	xa_hai_loc	400	xã	Hải Lộc
5100	16087	xa_da_loc	400	xã	Đa Lộc
5101	16090	xa_ngu_loc	400	xã	Ngư Lộc
5102	16093	thi_tran_nga_son	401	thị trấn	Nga Sơn
5103	16096	xa_ba_dinh	401	xã	Ba Đình
5104	16099	xa_nga_vinh	401	xã	Nga Vịnh
5105	16102	xa_nga_van	401	xã	Nga Văn
5106	16105	xa_nga_thien	401	xã	Nga Thiện
5107	16108	xa_nga_tien	401	xã	Nga Tiến
5108	16114	xa_nga_phuong	401	xã	Nga Phượng
5109	16117	xa_nga_trung	401	xã	Nga Trung
5110	16120	xa_nga_bach	401	xã	Nga Bạch
5111	16123	xa_nga_thanh	401	xã	Nga Thanh
5112	16132	xa_nga_yen	401	xã	Nga Yên
5113	16135	xa_nga_giap	401	xã	Nga Giáp
5114	16138	xa_nga_hai	401	xã	Nga Hải
5115	16141	xa_nga_thanh	401	xã	Nga Thành
5116	16144	xa_nga_an	401	xã	Nga An
5117	16147	xa_nga_phu	401	xã	Nga Phú
5118	16150	xa_nga_dien	401	xã	Nga Điền
5119	16153	xa_nga_tan	401	xã	Nga Tân
5120	16156	xa_nga_thuy	401	xã	Nga Thủy
5121	16159	xa_nga_lien	401	xã	Nga Liên
5122	16162	xa_nga_thai	401	xã	Nga Thái
5123	16165	xa_nga_thach	401	xã	Nga Thạch
5124	16168	xa_nga_thang	401	xã	Nga Thắng
5125	16171	xa_nga_truong	401	xã	Nga Trường
5126	16174	thi_tran_yen_cat	402	thị trấn	Yên Cát
5127	16177	xa_bai_tranh	402	xã	Bãi Trành
5128	16180	xa_xuan_hoa	402	xã	Xuân Hòa
5129	16183	xa_xuan_binh	402	xã	Xuân Bình
5130	16186	xa_hoa_quy	402	xã	Hóa Quỳ
5131	16195	xa_cat_van	402	xã	Cát Vân
5132	16198	xa_cat_tan	402	xã	Cát Tân
5133	16201	xa_tan_binh	402	xã	Tân Bình
5134	16204	xa_binh_luong	402	xã	Bình Lương
5135	16207	xa_thanh_quan	402	xã	Thanh Quân
5136	16210	xa_thanh_xuan	402	xã	Thanh Xuân
5137	16213	xa_thanh_hoa	402	xã	Thanh Hòa
5138	16216	xa_thanh_phong	402	xã	Thanh Phong
5139	16219	xa_thanh_lam	402	xã	Thanh Lâm
5140	16222	xa_thanh_son	402	xã	Thanh Sơn
5141	16225	xa_thuong_ninh	402	xã	Thượng Ninh
5142	16228	thi_tran_ben_sung	403	thị trấn	Bến Sung
5143	16231	xa_can_khe	403	xã	Cán Khê
5144	16234	xa_xuan_du	403	xã	Xuân Du
5145	16240	xa_phuong_nghi	403	xã	Phượng Nghi
5146	16243	xa_mau_lam	403	xã	Mậu Lâm
5147	16246	xa_xuan_khang	403	xã	Xuân Khang
5148	16249	xa_phu_nhuan	403	xã	Phú Nhuận
5149	16252	xa_hai_long	403	xã	Hải Long
5150	16258	xa_xuan_thai	403	xã	Xuân Thái
5151	16261	xa_xuan_phuc	403	xã	Xuân Phúc
5152	16264	xa_yen_tho	403	xã	Yên Thọ
5153	16267	xa_yen_lac	403	xã	Yên Lạc
5154	16273	xa_thanh_tan	403	xã	Thanh Tân
5155	16276	xa_thanh_ky	403	xã	Thanh Kỳ
5156	16279	thi_tran_nong_cong	404	thị trấn	Nông Cống
5157	16282	xa_tan_phuc	404	xã	Tân Phúc
5158	16285	xa_tan_tho	404	xã	Tân Thọ
5159	16288	xa_hoang_son	404	xã	Hoàng Sơn
5160	16291	xa_tan_khang	404	xã	Tân Khang
5161	16294	xa_hoang_giang	404	xã	Hoàng Giang
5162	16297	xa_trung_chinh	404	xã	Trung Chính
5163	16303	xa_trung_thanh	404	xã	Trung Thành
5164	16309	xa_te_thang	404	xã	Tế Thắng
5165	16315	xa_te_loi	404	xã	Tế Lợi
5166	16318	xa_te_nong	404	xã	Tế Nông
5167	16321	xa_minh_nghia	404	xã	Minh Nghĩa
5168	16324	xa_minh_khoi	404	xã	Minh Khôi
5169	16327	xa_van_hoa	404	xã	Vạn Hòa
5170	16330	xa_truong_trung	404	xã	Trường Trung
5171	16333	xa_van_thang	404	xã	Vạn Thắng
5172	16336	xa_truong_giang	404	xã	Trường Giang
5173	16339	xa_van_thien	404	xã	Vạn Thiện
5174	16342	xa_thang_long	404	xã	Thăng Long
5175	16345	xa_truong_minh	404	xã	Trường Minh
5176	16348	xa_truong_son	404	xã	Trường Sơn
5177	16351	xa_thang_binh	404	xã	Thăng Bình
5178	16354	xa_cong_liem	404	xã	Công Liêm
5179	16357	xa_tuong_van	404	xã	Tượng Văn
5180	16360	xa_thang_tho	404	xã	Thăng Thọ
5181	16363	xa_tuong_linh	404	xã	Tượng Lĩnh
5182	16366	xa_tuong_son	404	xã	Tượng Sơn
5183	16369	xa_cong_chinh	404	xã	Công Chính
5184	16375	xa_yen_my	404	xã	Yên Mỹ
5185	16378	thi_tran_rung_thong	405	thị trấn	Rừng Thông
5186	16381	xa_dong_hoang	405	xã	Đông Hoàng
5187	16384	xa_dong_ninh	405	xã	Đông Ninh
5188	16390	xa_dong_hoa	405	xã	Đông Hòa
5189	16393	xa_dong_yen	405	xã	Đông Yên
5190	16399	xa_dong_minh	405	xã	Đông Minh
5191	16402	xa_dong_thanh	405	xã	Đông Thanh
5192	16405	xa_dong_tien	405	xã	Đông Tiến
5193	16408	xa_dong_khe	405	xã	Đông Khê
5194	16414	xa_dong_thinh	405	xã	Đông Thịnh
5195	16417	xa_dong_van	405	xã	Đông Văn
5196	16420	xa_dong_phu	405	xã	Đông Phú
5197	16423	xa_dong_nam	405	xã	Đông Nam
5198	16426	xa_dong_quang	405	xã	Đông Quang
5199	16438	thi_tran_tan_phong	406	thị trấn	Tân Phong
5200	16447	xa_quang_trach	406	xã	Quảng Trạch
5201	16453	xa_quang_duc	406	xã	Quảng Đức
5202	16456	xa_quang_dinh	406	xã	Quảng Định
5203	16462	xa_quang_nhan	406	xã	Quảng Nhân
5204	16465	xa_quang_ninh	406	xã	Quảng Ninh
5205	16468	xa_quang_binh	406	xã	Quảng Bình
5206	16471	xa_quang_hop	406	xã	Quảng Hợp
5207	16474	xa_quang_van	406	xã	Quảng Văn
5208	16477	xa_quang_long	406	xã	Quảng Long
5209	16480	xa_quang_yen	406	xã	Quảng Yên
5210	16483	xa_quang_hoa	406	xã	Quảng Hòa
5211	16489	xa_quang_khe	406	xã	Quảng Khê
5212	16492	xa_quang_trung	406	xã	Quảng Trung
5213	16495	xa_quang_chinh	406	xã	Quảng Chính
5214	16498	xa_quang_ngoc	406	xã	Quảng Ngọc
5215	16501	xa_quang_truong	406	xã	Quảng Trường
5216	16510	xa_quang_phuc	406	xã	Quảng Phúc
5217	16519	xa_quang_giao	406	xã	Quảng Giao
5218	16540	xa_quang_hai	406	xã	Quảng Hải
5219	16543	xa_quang_luu	406	xã	Quảng Lưu
5220	16546	xa_quang_loc	406	xã	Quảng Lộc
5221	16549	xa_tien_trang	406	xã	Tiên Trang
5222	16552	xa_quang_nham	406	xã	Quảng Nham
5223	16555	xa_quang_thach	406	xã	Quảng Thạch
5224	16558	xa_quang_thai	406	xã	Quảng Thái
5225	16561	phuong_hai_hoa	407	phường	Hải Hòa
5226	16564	phuong_hai_chau	407	phường	Hải Châu
5227	16567	xa_thanh_thuy	407	xã	Thanh Thủy
5228	16570	xa_thanh_son	407	xã	Thanh Sơn
5229	16576	phuong_hai_ninh	407	phường	Hải Ninh
5230	16579	xa_anh_son	407	xã	Anh Sơn
5231	16582	xa_ngoc_linh	407	xã	Ngọc Lĩnh
5232	16585	phuong_hai_an	407	phường	Hải An
5233	16591	xa_cac_son	407	xã	Các Sơn
5234	16594	phuong_tan_dan	407	phường	Tân Dân
5235	16597	phuong_hai_linh	407	phường	Hải Lĩnh
5236	16600	xa_dinh_hai	407	xã	Định Hải
5237	16603	xa_phu_son	407	xã	Phú Sơn
5238	16606	phuong_ninh_hai	407	phường	Ninh Hải
5239	16609	phuong_nguyen_binh	407	phường	Nguyên Bình
5240	16612	xa_hai_nhan	407	xã	Hải Nhân
5241	16618	phuong_binh_minh	407	phường	Bình Minh
5242	16621	phuong_hai_thanh	407	phường	Hải Thanh
5243	16624	xa_phu_lam	407	xã	Phú Lâm
5244	16627	phuong_xuan_lam	407	phường	Xuân Lâm
5245	16630	phuong_truc_lam	407	phường	Trúc Lâm
5246	16633	phuong_hai_binh	407	phường	Hải Bình
5247	16636	xa_tan_truong	407	xã	Tân Trường
5248	16639	xa_tung_lam	407	xã	Tùng Lâm
5249	16642	phuong_tinh_hai	407	phường	Tĩnh Hải
5250	16645	phuong_mai_lam	407	phường	Mai Lâm
5251	16648	xa_truong_lam	407	xã	Trường Lâm
5252	16651	xa_hai_yen	407	xã	Hải Yến
5253	16654	phuong_hai_thuong	407	phường	Hải Thượng
5254	16657	xa_nghi_son	407	xã	Nghi Sơn
5255	16660	xa_hai_ha	407	xã	Hải Hà
5256	16663	phuong_dong_vinh	412	phường	Đông Vĩnh
5257	16666	phuong_ha_huy_tap	412	phường	Huy Tập
5258	16669	phuong_le_loi	412	phường	Lê Lợi
5259	16670	phuong_quan_bau	412	phường	Quán Bàu
5260	16672	phuong_hung_binh	412	phường	Hưng Bình
5261	16673	phuong_hung_phuc	412	phường	Hưng Phúc
5262	16675	phuong_hung_dung	412	phường	Hưng Dũng
5263	16678	phuong_cua_nam	412	phường	Cửa Nam
5264	16681	phuong_quang_trung	412	phường	Quang Trung
5265	16684	phuong_doi_cung	412	phường	Đội Cung
5266	16687	phuong_le_mao	412	phường	Lê Mao
5267	16690	phuong_truong_thi	412	phường	Trường Thi
5268	16693	phuong_ben_thuy	412	phường	Bến Thủy
5269	16696	phuong_hong_son	412	phường	Hồng Sơn
5270	16699	phuong_trung_do	412	phường	Trung Đô
5271	16702	xa_nghi_phu	412	xã	Nghi Phú
5272	16705	xa_hung_dong	412	xã	Hưng Đông
5273	16708	xa_hung_loc	412	xã	Hưng Lộc
5274	16711	xa_hung_hoa	412	xã	Hưng Hòa
5275	16714	phuong_vinh_tan	412	phường	Vinh Tân
5276	17908	xa_nghi_lien	412	xã	Nghi Liên
5277	17914	xa_nghi_an	412	xã	Nghi Ân
5278	17920	xa_nghi_kim	412	xã	Nghi Kim
5279	17923	xa_nghi_duc	412	xã	Nghi Đức
5280	18013	xa_hung_chinh	412	xã	Hưng Chính
5281	16717	phuong_nghi_thuy	413	phường	Nghi Thuỷ
5282	16720	phuong_nghi_tan	413	phường	Nghi Tân
5283	16723	phuong_thu_thuy	413	phường	Thu Thuỷ
5284	16726	phuong_nghi_hoa	413	phường	Nghi Hòa
5285	16729	phuong_nghi_hai	413	phường	Nghi Hải
5286	16732	phuong_nghi_huong	413	phường	Nghi Hương
5287	16735	phuong_nghi_thu	413	phường	Nghi Thu
5288	16939	phuong_hoa_hieu	414	phường	Hoà Hiếu
5289	16993	phuong_quang_phong	414	phường	Quang Phong
5290	16994	phuong_quang_tien	414	phường	Quang Tiến
5291	17003	phuong_long_son	414	phường	Long Sơn
5292	17005	xa_nghia_tien	414	xã	Nghĩa Tiến
5293	17008	xa_nghia_my	414	xã	Nghĩa Mỹ
5294	17011	xa_tay_hieu	414	xã	Tây Hiếu
5295	17014	xa_nghia_thuan	414	xã	Nghĩa Thuận
5296	17017	xa_dong_hieu	414	xã	Đông Hiếu
5297	16738	thi_tran_kim_son	415	thị trấn	Kim Sơn
5298	16741	xa_thong_thu	415	xã	Thông Thụ
5299	16744	xa_dong_van	415	xã	Đồng Văn
5300	16747	xa_hanh_dich	415	xã	Hạnh Dịch
5301	16750	xa_tien_phong	415	xã	Tiền Phong
5302	16753	xa_nam_giai	415	xã	Nậm Giải
5303	16756	xa_tri_le	415	xã	Tri Lễ
5304	16759	xa_chau_kim	415	xã	Châu Kim
5305	16763	xa_muong_noc	415	xã	Mường Nọc
5306	16765	xa_chau_thon	415	xã	Châu Thôn
5307	16768	xa_nam_nhoong	415	xã	Nậm Nhoóng
5308	16771	xa_quang_phong	415	xã	Quang Phong
5309	16774	xa_cam_muon	415	xã	Căm Muộn
5310	16777	thi_tran_tan_lac	416	thị trấn	Tân Lạc
5311	16780	xa_chau_binh	416	xã	Châu Bính
5312	16783	xa_chau_thuan	416	xã	Châu Thuận
5313	16786	xa_chau_hoi	416	xã	Châu Hội
5314	16789	xa_chau_nga	416	xã	Châu Nga
5315	16792	xa_chau_tien	416	xã	Châu Tiến
5316	16795	xa_chau_hanh	416	xã	Châu Hạnh
5317	16798	xa_chau_thang	416	xã	Châu Thắng
5318	16801	xa_chau_phong	416	xã	Châu Phong
5319	16804	xa_chau_binh	416	xã	Châu Bình
5320	16807	xa_chau_hoan	416	xã	Châu Hoàn
5321	16810	xa_dien_lam	416	xã	Diên Lãm
5322	16813	thi_tran_muong_xen	417	thị trấn	Mường Xén
5323	16816	xa_my_ly	417	xã	Mỹ Lý
5324	16819	xa_bac_ly	417	xã	Bắc Lý
5325	16822	xa_keng_du	417	xã	Keng Đu
5326	16825	xa_dooc_may	417	xã	Đoọc Mạy
5327	16828	xa_huoi_tu	417	xã	Huồi Tụ
5328	16831	xa_muong_long	417	xã	Mường Lống
5329	16834	xa_na_loi	417	xã	Na Loi
5330	16837	xa_nam_can	417	xã	Nậm Cắn
5331	16840	xa_bao_nam	417	xã	Bảo Nam
5332	16843	xa_pha_danh	417	xã	Phà Đánh
5333	16846	xa_bao_thang	417	xã	Bảo Thắng
5334	16849	xa_huu_lap	417	xã	Hữu Lập
5335	16852	xa_ta_ca	417	xã	Tà Cạ
5336	16855	xa_chieu_luu	417	xã	Chiêu Lưu
5337	16858	xa_muong_tip	417	xã	Mường Típ
5338	16861	xa_huu_kiem	417	xã	Hữu Kiệm
5339	16864	xa_tay_son	417	xã	Tây Sơn
5340	16867	xa_muong_ai	417	xã	Mường Ải
5341	16870	xa_na_ngoi	417	xã	Na Ngoi
5342	16873	xa_nam_can	417	xã	Nậm Càn
5343	16876	thi_tran_thach_giam	418	thị trấn	Thạch Giám
5344	16879	xa_mai_son	418	xã	Mai Sơn
5345	16882	xa_nhon_mai	418	xã	Nhôn Mai
5346	16885	xa_huu_khuong	418	xã	Hữu Khuông
5347	16900	xa_yen_tinh	418	xã	Yên Tĩnh
5348	16903	xa_nga_my	418	xã	Nga My
5349	16904	xa_xieng_my	418	xã	Xiêng My
5350	16906	xa_luong_minh	418	xã	Lưỡng Minh
5351	16909	xa_yen_hoa	418	xã	Yên Hòa
5352	16912	xa_yen_na	418	xã	Yên Na
5353	16915	xa_luu_kien	418	xã	Lưu Kiền
5354	16921	xa_xa_luong	418	xã	Xá Lượng
5355	16924	xa_tam_thai	418	xã	Tam Thái
5356	16927	xa_tam_dinh	418	xã	Tam Đình
5357	16930	xa_yen_thang	418	xã	Yên Thắng
5358	16933	xa_tam_quang	418	xã	Tam Quang
5359	16936	xa_tam_hop	418	xã	Tam Hợp
5360	16941	thi_tran_nghia_dan	419	thị trấn	Nghĩa Đàn
5361	16942	xa_nghia_mai	419	xã	Nghĩa Mai
5362	16945	xa_nghia_yen	419	xã	Nghĩa Yên
5363	16948	xa_nghia_lac	419	xã	Nghĩa Lạc
5364	16951	xa_nghia_lam	419	xã	Nghĩa Lâm
5365	16954	xa_nghia_son	419	xã	Nghĩa Sơn
5366	16957	xa_nghia_loi	419	xã	Nghĩa Lợi
5367	16960	xa_nghia_binh	419	xã	Nghĩa Bình
5368	16963	xa_nghia_tho	419	xã	Nghĩa Thọ
5369	16966	xa_nghia_minh	419	xã	Nghĩa Minh
5370	16969	xa_nghia_phu	419	xã	Nghĩa Phú
5371	16972	xa_nghia_hung	419	xã	Nghĩa Hưng
5372	16975	xa_nghia_hong	419	xã	Nghĩa Hồng
5373	16978	xa_nghia_thinh	419	xã	Nghĩa Thịnh
5374	16981	xa_nghia_trung	419	xã	Nghĩa Trung
5375	16984	xa_nghia_hoi	419	xã	Nghĩa Hội
5376	16987	xa_nghia_thanh	419	xã	Nghĩa Thành
5377	16996	xa_nghia_hieu	419	xã	Nghĩa Hiếu
5378	17020	xa_nghia_duc	419	xã	Nghĩa Đức
5379	17023	xa_nghia_an	419	xã	Nghĩa An
5380	17026	xa_nghia_long	419	xã	Nghĩa Long
5381	17029	xa_nghia_loc	419	xã	Nghĩa Lộc
5382	17032	xa_nghia_khanh	419	xã	Nghĩa Khánh
5383	17035	thi_tran_quy_hop	420	thị trấn	Quỳ Hợp
5384	17038	xa_yen_hop	420	xã	Yên Hợp
5385	17041	xa_chau_tien	420	xã	Châu Tiến
5386	17044	xa_chau_hong	420	xã	Châu Hồng
5387	17047	xa_dong_hop	420	xã	Đồng Hợp
5388	17050	xa_chau_thanh	420	xã	Châu Thành
5389	17053	xa_lien_hop	420	xã	Liên Hợp
5390	17056	xa_chau_loc	420	xã	Châu Lộc
5391	17059	xa_tam_hop	420	xã	Tam Hợp
5392	17062	xa_chau_cuong	420	xã	Châu Cường
5393	17065	xa_chau_quang	420	xã	Châu Quang
5394	17068	xa_tho_hop	420	xã	Thọ Hợp
5395	17071	xa_minh_hop	420	xã	Minh Hợp
5396	17074	xa_nghia_xuan	420	xã	Nghĩa Xuân
5397	17077	xa_chau_thai	420	xã	Châu Thái
5398	17080	xa_chau_dinh	420	xã	Châu Đình
5399	17083	xa_van_loi	420	xã	Văn Lợi
5400	17086	xa_nam_son	420	xã	Nam Sơn
5401	17089	xa_chau_ly	420	xã	Châu Lý
5402	17092	xa_ha_son	420	xã	Hạ Sơn
5403	17095	xa_bac_son	420	xã	Bắc Sơn
5404	17098	thi_tran_cau_giat	421	thị trấn	Cầu Giát
5405	17101	xa_quynh_thang	421	xã	Quỳnh Thắng
5406	17119	xa_quynh_tan	421	xã	Quỳnh Tân
5407	17122	xa_quynh_chau	421	xã	Quỳnh Châu
5408	17140	xa_tan_son	421	xã	Tân Sơn
5409	17143	xa_quynh_van	421	xã	Quỳnh Văn
5410	17146	xa_ngoc_son	421	xã	Ngọc Sơn
5411	17149	xa_quynh_tam	421	xã	Quỳnh Tam
5412	17152	xa_quynh_hoa	421	xã	Quỳnh Hoa
5413	17155	xa_quynh_thach	421	xã	Quỳnh Thạch
5414	17158	xa_quynh_bang	421	xã	Quỳnh Bảng
5415	17161	xa_quynh_my	421	xã	Quỳnh Mỹ
5416	17164	xa_quynh_thanh	421	xã	Quỳnh Thanh
5417	17167	xa_quynh_hau	421	xã	Quỳnh Hậu
5418	17170	xa_quynh_lam	421	xã	Quỳnh Lâm
5419	17173	xa_quynh_doi	421	xã	Quỳnh Đôi
5420	17176	xa_quynh_luong	421	xã	Quỳnh Lương
5421	17179	xa_quynh_hong	421	xã	Quỳnh Hồng
5422	17182	xa_quynh_yen	421	xã	Quỳnh Yên
5423	17185	xa_quynh_ba	421	xã	Quỳnh Bá
5424	17188	xa_quynh_minh	421	xã	Quỳnh Minh
5425	17191	xa_quynh_dien	421	xã	Quỳnh Diễn
5426	17194	xa_quynh_hung	421	xã	Quỳnh Hưng
5427	17197	xa_quynh_giang	421	xã	Quỳnh Giang
5428	17200	xa_quynh_ngoc	421	xã	Quỳnh Ngọc
5429	17203	xa_quynh_nghia	421	xã	Quỳnh Nghĩa
5430	17206	xa_an_hoa	421	xã	An Hòa
5431	17209	xa_tien_thuy	421	xã	Tiến Thủy
5432	17212	xa_son_hai	421	xã	Sơn Hải
5433	17215	xa_quynh_tho	421	xã	Quỳnh Thọ
5434	17218	xa_quynh_thuan	421	xã	Quỳnh Thuận
5435	17221	xa_quynh_long	421	xã	Quỳnh Long
5436	17224	xa_tan_thang	421	xã	Tân Thắng
5437	17227	thi_tran_con_cuong	422	thị trấn	Con Cuông
5438	17230	xa_binh_chuan	422	xã	Bình Chuẩn
5439	17233	xa_lang_khe	422	xã	Lạng Khê
5440	17236	xa_cam_lam	422	xã	Cam Lâm
5441	17239	xa_thach_ngan	422	xã	Thạch Ngàn
5442	17242	xa_don_phuc	422	xã	Đôn Phục
5443	17245	xa_mau_duc	422	xã	Mậu Đức
5444	17248	xa_chau_khe	422	xã	Châu Khê
5445	17251	xa_chi_khe	422	xã	Chi Khê
5446	17254	xa_bong_khe	422	xã	Bồng Khê
5447	17257	xa_yen_khe	422	xã	Yên Khê
5448	17260	xa_luc_da	422	xã	Lục Dạ
5449	17263	xa_mon_son	422	xã	Môn Sơn
5450	17266	thi_tran_tan_ky	423	thị trấn	Tân Kỳ
5451	17269	xa_tan_hop	423	xã	Tân Hợp
5452	17272	xa_tan_phu	423	xã	Tân Phú
5453	17275	xa_tan_xuan	423	xã	Tân Xuân
5454	17278	xa_giai_xuan	423	xã	Giai Xuân
5455	17281	xa_nghia_binh	423	xã	Nghĩa Bình
5456	17284	xa_nghia_dong	423	xã	Nghĩa Đồng
5457	17287	xa_dong_van	423	xã	Đồng Văn
5458	17290	xa_nghia_thai	423	xã	Nghĩa Thái
5459	17293	xa_nghia_hop	423	xã	Nghĩa Hợp
5460	17296	xa_nghia_hoan	423	xã	Nghĩa Hoàn
5461	17299	xa_nghia_phuc	423	xã	Nghĩa Phúc
5462	17302	xa_tien_ky	423	xã	Tiên Kỳ
5463	17305	xa_tan_an	423	xã	Tân An
5464	17308	xa_nghia_dung	423	xã	Nghĩa Dũng
5465	17311	xa_tan_long	423	xã	Tân Long
5466	17314	xa_ky_son	423	xã	Kỳ Sơn
5467	17317	xa_huong_son	423	xã	Hương Sơn
5468	17320	xa_ky_tan	423	xã	Kỳ Tân
5469	17323	xa_phu_son	423	xã	Phú Sơn
5470	17325	xa_tan_huong	423	xã	Tân Hương
5471	17326	xa_nghia_hanh	423	xã	Nghĩa Hành
5472	17329	thi_tran_anh_son	424	thị trấn	Anh Sơn
5473	17332	xa_tho_son	424	xã	Thọ Sơn
5474	17335	xa_thanh_son	424	xã	Thành Sơn
5475	17338	xa_binh_son	424	xã	Bình Sơn
5476	17341	xa_tam_son	424	xã	Tam Sơn
5477	17344	xa_dinh_son	424	xã	Đỉnh Sơn
5478	17347	xa_hung_son	424	xã	Hùng Sơn
5479	17350	xa_cam_son	424	xã	Cẩm Sơn
5480	17353	xa_duc_son	424	xã	Đức Sơn
5481	17356	xa_tuong_son	424	xã	Tường Sơn
5482	17357	xa_hoa_son	424	xã	Hoa Sơn
5483	17359	xa_tao_son	424	xã	Tào Sơn
5484	17362	xa_vinh_son	424	xã	Vĩnh Sơn
5485	17365	xa_lang_son	424	xã	Lạng Sơn
5486	17368	xa_hoi_son	424	xã	Hội Sơn
5487	17371	xa_thach_son	424	xã	Thạch Sơn
5488	17374	xa_phuc_son	424	xã	Phúc Sơn
5489	17377	xa_long_son	424	xã	Long Sơn
5490	17380	xa_khai_son	424	xã	Khai Sơn
5491	17383	xa_linh_son	424	xã	Lĩnh Sơn
5492	17386	xa_cao_son	424	xã	Cao Sơn
5493	17389	thi_tran_dien_chau	425	thị trấn	Diễn Châu
5494	17392	xa_dien_lam	425	xã	Diễn Lâm
5495	17395	xa_dien_doai	425	xã	Diễn Đoài
5496	17398	xa_dien_truong	425	xã	Diễn Trường
5497	17401	xa_dien_yen	425	xã	Diễn Yên
5498	17404	xa_dien_hoang	425	xã	Diễn Hoàng
5499	17407	xa_dien_hung	425	xã	Diễn Hùng
5500	17410	xa_dien_my	425	xã	Diễn Mỹ
5501	17413	xa_dien_hong	425	xã	Diễn Hồng
5502	17416	xa_dien_phong	425	xã	Diễn Phong
5503	17419	xa_dien_hai	425	xã	Diễn Hải
5504	17422	xa_dien_thap	425	xã	Diễn Tháp
5505	17425	xa_dien_lien	425	xã	Diễn Liên
5506	17428	xa_dien_van	425	xã	Diễn Vạn
5507	17431	xa_dien_kim	425	xã	Diễn Kim
5508	17434	xa_dien_ky	425	xã	Diễn Kỷ
5509	17437	xa_dien_xuan	425	xã	Diễn Xuân
5510	17440	xa_dien_thai	425	xã	Diễn Thái
5511	17443	xa_dien_dong	425	xã	Diễn Đồng
5512	17446	xa_dien_bich	425	xã	Diễn Bích
5513	17449	xa_dien_hanh	425	xã	Diễn Hạnh
5514	17452	xa_dien_ngoc	425	xã	Diễn Ngọc
5515	17455	xa_dien_quang	425	xã	Diễn Quảng
5516	17458	xa_dien_nguyen	425	xã	Diễn Nguyên
5517	17461	xa_dien_hoa	425	xã	Diễn Hoa
5518	17464	xa_dien_thanh	425	xã	Diễn Thành
5519	17467	xa_dien_phuc	425	xã	Diễn Phúc
5520	17476	xa_dien_cat	425	xã	Diễn Cát
5521	17479	xa_dien_thinh	425	xã	Diễn Thịnh
5522	17482	xa_dien_tan	425	xã	Diễn Tân
5523	17485	xa_minh_chau	425	xã	Minh Châu
5524	17488	xa_dien_tho	425	xã	Diễn Thọ
5525	17491	xa_dien_loi	425	xã	Diễn Lợi
5526	17494	xa_dien_loc	425	xã	Diễn Lộc
5527	17497	xa_dien_trung	425	xã	Diễn Trung
5528	17500	xa_dien_an	425	xã	Diễn An
5529	17503	xa_dien_phu	425	xã	Diễn Phú
5530	17506	thi_tran_yen_thanh	426	thị trấn	Yên Thành
5531	17509	xa_ma_thanh	426	xã	Mã Thành
5532	17510	xa_tien_thanh	426	xã	Tiến Thành
5533	17512	xa_lang_thanh	426	xã	Lăng Thành
5534	17515	xa_tan_thanh	426	xã	Tân Thành
5535	17518	xa_duc_thanh	426	xã	Đức Thành
5536	17521	xa_kim_thanh	426	xã	Kim Thành
5537	17524	xa_hau_thanh	426	xã	Hậu Thành
5538	17525	xa_hung_thanh	426	xã	Hùng Thành
5539	17527	xa_do_thanh	426	xã	Đô Thành
5540	17530	xa_tho_thanh	426	xã	Thọ Thành
5541	17533	xa_quang_thanh	426	xã	Quang Thành
5542	17536	xa_tay_thanh	426	xã	Tây Thành
5543	17539	xa_phuc_thanh	426	xã	Phúc Thành
5544	17542	xa_hong_thanh	426	xã	Hồng Thành
5545	17545	xa_dong_thanh	426	xã	Đồng Thành
5546	17548	xa_phu_thanh	426	xã	Phú Thành
5547	17551	xa_hoa_thanh	426	xã	Hoa Thành
5548	17554	xa_tang_thanh	426	xã	Tăng Thành
5549	17557	xa_van_thanh	426	xã	Văn Thành
5550	17560	xa_thinh_thanh	426	xã	Thịnh Thành
5551	17563	xa_hop_thanh	426	xã	Hợp Thành
5552	17566	xa_xuan_thanh	426	xã	Xuân Thành
5553	17569	xa_bac_thanh	426	xã	Bắc Thành
5554	17572	xa_nhan_thanh	426	xã	Nhân Thành
5555	17575	xa_trung_thanh	426	xã	Trung Thành
5556	17578	xa_long_thanh	426	xã	Long Thành
5557	17581	xa_minh_thanh	426	xã	Minh Thành
5558	17584	xa_nam_thanh	426	xã	Nam Thành
5559	17587	xa_vinh_thanh	426	xã	Vĩnh Thành
5560	17590	xa_ly_thanh	426	xã	Lý Thành
5561	17593	xa_khanh_thanh	426	xã	Khánh Thành
5562	17596	xa_vien_thanh	426	xã	Viên Thành
5563	17599	xa_dai_thanh	426	xã	Đại Thành
5564	17602	xa_lien_thanh	426	xã	Liên Thành
5565	17605	xa_bao_thanh	426	xã	Bảo Thành
5566	17608	xa_my_thanh	426	xã	Mỹ Thành
5567	17611	xa_cong_thanh	426	xã	Công Thành
5568	17614	xa_son_thanh	426	xã	Sơn Thành
5569	17617	thi_tran_do_luong	427	thị trấn	Đô Lương
5570	17619	xa_giang_son_dong	427	xã	Sơn Đông
5571	17620	xa_giang_son_tay	427	xã	Sơn Tây
5572	17623	xa_lam_son	427	xã	Lam Sơn
5573	17626	xa_boi_son	427	xã	Bồi Sơn
5574	17629	xa_hong_son	427	xã	Hồng Sơn
5575	17632	xa_bai_son	427	xã	Bài Sơn
5576	17635	xa_ngoc_son	427	xã	Ngọc Sơn
5577	17638	xa_bac_son	427	xã	Bắc Sơn
5578	17641	xa_trang_son	427	xã	Tràng Sơn
5579	17644	xa_thuong_son	427	xã	Thượng Sơn
5580	17647	xa_hoa_son	427	xã	Hòa Sơn
5581	17650	xa_dang_son	427	xã	Đặng Sơn
5582	17653	xa_dong_son	427	xã	Đông Sơn
5583	17656	xa_nam_son	427	xã	Nam Sơn
5584	17659	xa_luu_son	427	xã	Lưu Sơn
5585	17662	xa_yen_son	427	xã	Yên Sơn
5586	17665	xa_van_son	427	xã	Văn Sơn
5587	17668	xa_da_son	427	xã	Đà Sơn
5588	17671	xa_lac_son	427	xã	Lạc Sơn
5589	17674	xa_tan_son	427	xã	Tân Sơn
5590	17677	xa_thai_son	427	xã	Thái Sơn
5591	17680	xa_quang_son	427	xã	Quang Sơn
5592	17683	xa_thinh_son	427	xã	Thịnh Sơn
5593	17686	xa_trung_son	427	xã	Trung Sơn
5594	17689	xa_xuan_son	427	xã	Xuân Sơn
5595	17692	xa_minh_son	427	xã	Minh Sơn
5596	17695	xa_thuan_son	427	xã	Thuận Sơn
5597	17698	xa_nhan_son	427	xã	Nhân Sơn
5598	17701	xa_hien_son	427	xã	Hiến Sơn
5599	17704	xa_my_son	427	xã	Mỹ Sơn
5600	17707	xa_tru_son	427	xã	Trù Sơn
5601	17710	xa_dai_son	427	xã	Đại Sơn
5602	17713	thi_tran_thanh_chuong	428	thị trấn	Thanh Chương
5603	17716	xa_cat_van	428	xã	Cát Văn
5604	17719	xa_thanh_nho	428	xã	Thanh Nho
5605	17722	xa_hanh_lam	428	xã	Hạnh Lâm
5606	17723	xa_thanh_son	428	xã	Thanh Sơn
5607	17725	xa_thanh_hoa	428	xã	Thanh Hòa
5608	17728	xa_phong_thinh	428	xã	Phong Thịnh
5609	17731	xa_thanh_phong	428	xã	Thanh Phong
5610	17734	xa_thanh_my	428	xã	Thanh Mỹ
5611	17737	xa_thanh_tien	428	xã	Thanh Tiên
5612	17743	xa_thanh_lien	428	xã	Thanh Liên
5613	17749	xa_dai_dong	428	xã	Đại Đồng
5614	17752	xa_thanh_dong	428	xã	Thanh Đồng
5615	17755	xa_thanh_ngoc	428	xã	Thanh Ngọc
5616	17758	xa_thanh_huong	428	xã	Thanh Hương
5617	17759	xa_ngoc_lam	428	xã	Ngọc Lâm
5618	17761	xa_thanh_linh	428	xã	Thanh Lĩnh
5619	17764	xa_dong_van	428	xã	Đồng Văn
5620	17767	xa_ngoc_son	428	xã	Ngọc Sơn
5621	17770	xa_thanh_thinh	428	xã	Thanh Thịnh
5622	17773	xa_thanh_an	428	xã	Thanh An
5623	17776	xa_thanh_chi	428	xã	Thanh Chi
5624	17779	xa_xuan_tuong	428	xã	Xuân Tường
5625	17782	xa_thanh_duong	428	xã	Thanh Dương
5626	17785	xa_thanh_luong	428	xã	Thanh Lương
5627	17788	xa_thanh_khe	428	xã	Thanh Khê
5628	17791	xa_vo_liet	428	xã	Võ Liệt
5629	17794	xa_thanh_long	428	xã	Thanh Long
5630	17797	xa_thanh_thuy	428	xã	Thanh Thủy
5631	17800	xa_thanh_khai	428	xã	Thanh Khai
5632	17803	xa_thanh_yen	428	xã	Thanh Yên
5633	17806	xa_thanh_ha	428	xã	Thanh Hà
5634	17809	xa_thanh_giang	428	xã	Thanh Giang
5635	17812	xa_thanh_tung	428	xã	Thanh Tùng
5636	17815	xa_thanh_lam	428	xã	Thanh Lâm
5637	17818	xa_thanh_mai	428	xã	Thanh Mai
5638	17821	xa_thanh_xuan	428	xã	Thanh Xuân
5639	17824	xa_thanh_duc	428	xã	Thanh Đức
5640	17827	thi_tran_quan_hanh	429	thị trấn	Quán Hành
5641	17830	xa_nghi_van	429	xã	Nghi Văn
5642	17833	xa_nghi_yen	429	xã	Nghi Yên
5643	17836	xa_nghi_tien	429	xã	Nghi Tiến
5644	17839	xa_nghi_hung	429	xã	Nghi Hưng
5645	17842	xa_nghi_dong	429	xã	Nghi Đồng
5646	17845	xa_nghi_thiet	429	xã	Nghi Thiết
5647	17848	xa_nghi_lam	429	xã	Nghi Lâm
5648	17851	xa_nghi_quang	429	xã	Nghi Quang
5649	17854	xa_nghi_kieu	429	xã	Nghi Kiều
5650	17857	xa_nghi_my	429	xã	Nghi Mỹ
5651	17860	xa_nghi_phuong	429	xã	Nghi Phương
5652	17863	xa_nghi_thuan	429	xã	Nghi Thuận
5653	17866	xa_nghi_long	429	xã	Nghi Long
5654	17869	xa_nghi_xa	429	xã	Nghi Xá
5655	17875	xa_nghi_hoa	429	xã	Nghi Hoa
5656	17878	xa_khanh_hop	429	xã	Khánh Hợp
5657	17881	xa_nghi_thinh	429	xã	Nghi Thịnh
5658	17884	xa_nghi_cong_bac	429	xã	Công Bắc
5659	17887	xa_nghi_cong_nam	429	xã	Công Nam
5660	17890	xa_nghi_thach	429	xã	Nghi Thạch
5661	17893	xa_nghi_trung	429	xã	Nghi Trung
5662	17896	xa_nghi_truong	429	xã	Nghi Trường
5663	17899	xa_nghi_dien	429	xã	Nghi Diên
5664	17902	xa_nghi_phong	429	xã	Nghi Phong
5665	17905	xa_nghi_xuan	429	xã	Nghi Xuân
5666	17911	xa_nghi_van	429	xã	Nghi Vạn
5667	17917	xa_phuc_tho	429	xã	Phúc Thọ
5668	17926	xa_nghi_thai	429	xã	Nghi Thái
5669	17932	xa_nam_hung	430	xã	Nam Hưng
5670	17935	xa_nam_nghia	430	xã	Nam Nghĩa
5671	17938	xa_nam_thanh	430	xã	Nam Thanh
5672	17941	xa_nam_anh	430	xã	Nam Anh
5673	17944	xa_nam_xuan	430	xã	Nam Xuân
5674	17947	xa_nam_thai	430	xã	Nam Thái
5675	17950	thi_tran_nam_dan	430	thị trấn	Nam Đàn
5676	17953	xa_nam_linh	430	xã	Nam Lĩnh
5677	17956	xa_nam_giang	430	xã	Nam Giang
5678	17959	xa_xuan_hoa	430	xã	Xuân Hòa
5679	17962	xa_hung_tien	430	xã	Hùng Tiến
5680	17968	xa_thuong_tan_loc	430	xã	Tân Lộc
5681	17971	xa_kim_lien	430	xã	Kim Liên
5682	17977	xa_hong_long	430	xã	Hồng Long
5683	17980	xa_xuan_lam	430	xã	Xuân Lâm
5684	17983	xa_nam_cat	430	xã	Nam Cát
5685	17986	xa_khanh_son	430	xã	Khánh Sơn
5686	17989	xa_trung_phuc_cuong	430	xã	Phúc Cường
5687	17998	xa_nam_kim	430	xã	Nam Kim
5688	18001	thi_tran_hung_nguyen	431	thị trấn	Hưng Nguyên
5689	18004	xa_hung_trung	431	xã	Hưng Trung
5690	18007	xa_hung_yen	431	xã	Hưng Yên
5691	18008	xa_hung_yen_bac	431	xã	Yên Bắc
5692	18010	xa_hung_tay	431	xã	Hưng Tây
5693	18016	xa_hung_dao	431	xã	Hưng Đạo
5694	18019	xa_hung_my	431	xã	Hưng Mỹ
5695	18022	xa_hung_thinh	431	xã	Hưng Thịnh
5696	18025	xa_hung_linh	431	xã	Hưng Lĩnh
5697	18028	xa_hung_thong	431	xã	Hưng Thông
5698	18031	xa_hung_tan	431	xã	Hưng Tân
5699	18034	xa_hung_loi	431	xã	Hưng Lợi
5700	18037	xa_hung_nghia	431	xã	Hưng Nghĩa
5701	18040	xa_hung_phuc	431	xã	Hưng Phúc
5702	18043	xa_long_xa	431	xã	Long Xá
5703	18052	xa_chau_nhan	431	xã	Châu Nhân
5704	18055	xa_xuan_lam	431	xã	Xuân Lam
5705	18064	xa_hung_thanh	431	xã	Hưng Thành
5706	17104	xa_quynh_vinh	432	xã	Quỳnh Vinh
5707	17107	xa_quynh_loc	432	xã	Quỳnh Lộc
5708	17110	phuong_quynh_thien	432	phường	Quỳnh Thiện
5709	17113	xa_quynh_lap	432	xã	Quỳnh Lập
5710	17116	xa_quynh_trang	432	xã	Quỳnh Trang
5711	17125	phuong_mai_hung	432	phường	Mai Hùng
5712	17128	phuong_quynh_di	432	phường	Quỳnh Dị
5713	17131	phuong_quynh_xuan	432	phường	Quỳnh Xuân
5714	17134	phuong_quynh_phuong	432	phường	Quỳnh Phương
5715	17137	xa_quynh_lien	432	xã	Quỳnh Liên
5716	18070	phuong_tran_phu	436	phường	Trần Phú
5717	18073	phuong_nam_ha	436	phường	Nam Hà
5718	18076	phuong_bac_ha	436	phường	Bắc Hà
5719	18077	phuong_nguyen_du	436	phường	Nguyễn Du
5720	18079	phuong_tan_giang	436	phường	Tân Giang
5721	18082	phuong_dai_nai	436	phường	Đại Nài
5722	18085	phuong_ha_huy_tap	436	phường	Huy Tập
5723	18088	xa_thach_trung	436	xã	Thạch Trung
5724	18091	phuong_thach_quy	436	phường	Thạch Quý
5725	18094	phuong_thach_linh	436	phường	Thạch Linh
5726	18097	phuong_van_yen	436	phường	Văn Yên
5727	18100	xa_thach_ha	436	xã	Thạch Hạ
5728	18103	xa_dong_mon	436	xã	Đồng Môn
5729	18109	xa_thach_hung	436	xã	Thạch Hưng
5730	18112	xa_thach_binh	436	xã	Thạch Bình
5731	18115	phuong_bac_hong	437	phường	Bắc Hồng
5732	18118	phuong_nam_hong	437	phường	Nam Hồng
5733	18121	phuong_trung_luong	437	phường	Trung Lương
5734	18124	phuong_duc_thuan	437	phường	Đức Thuận
5735	18127	phuong_dau_lieu	437	phường	Đậu Liêu
5736	18130	xa_thuan_loc	437	xã	Thuận Lộc
5737	18133	thi_tran_pho_chau	439	thị trấn	Phố Châu
5738	18136	thi_tran_tay_son	439	thị trấn	Tây Sơn
5739	18139	xa_son_hong	439	xã	Sơn Hồng
5740	18142	xa_son_tien	439	xã	Sơn Tiến
5741	18145	xa_son_lam	439	xã	Sơn Lâm
5742	18148	xa_son_le	439	xã	Sơn Lễ
5743	18157	xa_son_giang	439	xã	Sơn Giang
5744	18160	xa_son_linh	439	xã	Sơn Lĩnh
5745	18163	xa_an_hoa_thinh	439	xã	Hòa Thịnh
5746	18172	xa_son_tay	439	xã	Sơn Tây
5747	18175	xa_son_ninh	439	xã	Sơn Ninh
5748	18178	xa_son_chau	439	xã	Sơn Châu
5749	18181	xa_tan_my_ha	439	xã	Mỹ Hà
5750	18184	xa_quang_diem	439	xã	Quang Diệm
5751	18187	xa_son_trung	439	xã	Sơn Trung
5752	18190	xa_son_bang	439	xã	Sơn Bằng
5753	18193	xa_son_binh	439	xã	Sơn Bình
5754	18196	xa_son_kim_1	439	xã	Sơn Kim 1
5755	18199	xa_son_kim_2	439	xã	Sơn Kim 2
5756	18202	xa_son_tra	439	xã	Sơn Trà
5757	18205	xa_son_long	439	xã	Sơn Long
5758	18211	xa_kim_hoa	439	xã	Kim Hoa
5759	18214	xa_son_ham	439	xã	Sơn Hàm
5760	18217	xa_son_phu	439	xã	Sơn Phú
5761	18223	xa_son_truong	439	xã	Sơn Trường
5762	18229	thi_tran_duc_tho	440	thị trấn	Đức Thọ
5763	18235	xa_quang_vinh	440	xã	Quang Vĩnh
5764	18241	xa_tung_chau	440	xã	Tùng Châu
5765	18244	xa_truong_son	440	xã	Trường Sơn
5766	18247	xa_lien_minh	440	xã	Liên Minh
5767	18253	xa_yen_ho	440	xã	Yên Hồ
5768	18259	xa_tung_anh	440	xã	Tùng Ảnh
5769	18262	xa_bui_la_nhan	440	xã	La Nhân
5770	18274	xa_thanh_binh_thinh	440	xã	Bình Thịnh
5771	18277	xa_lam_trung_thuy	440	xã	Trung Thủy
5772	18280	xa_hoa_lac	440	xã	Hòa Lạc
5773	18283	xa_tan_dan	440	xã	Tân Dân
5774	18298	xa_an_dung	440	xã	An Dũng
5775	18304	xa_duc_dong	440	xã	Đức Đồng
5776	18307	xa_duc_lang	440	xã	Đức Lạng
5777	18310	xa_tan_huong	440	xã	Tân Hương
5778	18313	thi_tran_vu_quang	441	thị trấn	Vũ Quang
5779	18316	xa_an_phu	441	xã	Ân Phú
5780	18319	xa_duc_giang	441	xã	Đức Giang
5781	18322	xa_duc_linh	441	xã	Đức Lĩnh
5782	18325	xa_tho_dien	441	xã	Thọ Điền
5783	18328	xa_duc_huong	441	xã	Đức Hương
5784	18331	xa_duc_bong	441	xã	Đức Bồng
5785	18334	xa_duc_lien	441	xã	Đức Liên
5786	18340	xa_huong_minh	441	xã	Hương Minh
5787	18343	xa_quang_tho	441	xã	Quang Thọ
5788	18352	thi_tran_xuan_an	442	thị trấn	Xuân An
5789	18355	xa_xuan_hoi	442	xã	Xuân Hội
5790	18358	xa_dan_truong	442	xã	Đan Trường
5791	18364	xa_xuan_pho	442	xã	Xuân Phổ
5792	18367	xa_xuan_hai	442	xã	Xuân Hải
5793	18370	xa_xuan_giang	442	xã	Xuân Giang
5794	18373	thi_tran_tien_dien	442	thị trấn	Tiên Điền
5795	18376	xa_xuan_yen	442	xã	Xuân Yên
5796	18379	xa_xuan_my	442	xã	Xuân Mỹ
5797	18382	xa_xuan_thanh	442	xã	Xuân Thành
5798	18385	xa_xuan_vien	442	xã	Xuân Viên
5799	18388	xa_xuan_hong	442	xã	Xuân Hồng
5800	18391	xa_co_dam	442	xã	Cỗ Đạm
5801	18394	xa_xuan_lien	442	xã	Xuân Liên
5802	18397	xa_xuan_linh	442	xã	Xuân Lĩnh
5803	18400	xa_xuan_lam	442	xã	Xuân Lam
5804	18403	xa_cuong_gian	442	xã	Cương Gián
5805	18406	thi_tran_nghen	443	thị trấn	Thị trấn Nghèn
5806	18415	xa_thien_loc	443	xã	Thiên Lộc
5807	18418	xa_thuan_thien	443	xã	Thuần Thiện
5808	18427	xa_vuong_loc	443	xã	Vượng Lộc
5809	18433	xa_thanh_loc	443	xã	Thanh Lộc
5810	18436	xa_kim_song_truong	443	xã	Song Trường
5811	18439	xa_thuong_nga	443	xã	Thường Nga
5812	18445	xa_tung_loc	443	xã	Tùng Lộc
5813	18454	xa_phu_loc	443	xã	Phú Lộc
5814	18463	xa_gia_hanh	443	xã	Gia Hanh
5815	18466	xa_khanh_vinh_yen	443	xã	Vĩnh Yên
5816	18472	xa_trung_loc	443	xã	Trung Lộc
5817	18475	xa_xuan_loc	443	xã	Xuân Lộc
5818	18478	xa_thuong_loc	443	xã	Thượng Lộc
5819	18481	xa_quang_loc	443	xã	Quang Lộc
5820	18484	thi_tran_dong_loc	443	thị trấn	Đồng Lộc
5821	18487	xa_my_loc	443	xã	Mỹ Lộc
5822	18490	xa_son_loc	443	xã	Sơn Lộc
5823	18496	thi_tran_huong_khe	444	thị trấn	Hương Khê
5824	18499	xa_dien_my	444	xã	Điền Mỹ
5825	18502	xa_ha_linh	444	xã	Hà Linh
5826	18505	xa_huong_thuy	444	xã	Hương Thủy
5827	18508	xa_hoa_hai	444	xã	Hòa Hải
5828	18514	xa_phuc_dong	444	xã	Phúc Đồng
5829	18517	xa_huong_giang	444	xã	Hương Giang
5830	18520	xa_loc_yen	444	xã	Lộc Yên
5831	18523	xa_huong_binh	444	xã	Hương Bình
5832	18526	xa_huong_long	444	xã	Hương Long
5833	18529	xa_phu_gia	444	xã	Phú Gia
5834	18532	xa_gia_pho	444	xã	Gia Phố
5835	18535	xa_phu_phong	444	xã	Phú Phong
5836	18538	xa_huong_do	444	xã	Hương Đô
5837	18541	xa_huong_vinh	444	xã	Hương Vĩnh
5838	18544	xa_huong_xuan	444	xã	Hương Xuân
5839	18547	xa_phuc_trach	444	xã	Phúc Trạch
5840	18550	xa_huong_tra	444	xã	Hương Trà
5841	18553	xa_huong_trach	444	xã	Hương Trạch
5842	18556	xa_huong_lam	444	xã	Hương Lâm
5843	18559	xa_huong_lien	444	xã	Hương Liên
5844	18562	thi_tran_thach_ha	445	thị trấn	Thạch Hà
5845	18565	xa_ngoc_son	445	xã	Ngọc Sơn
5846	18571	xa_thach_hai	445	xã	Thạch Hải
5847	18586	xa_thach_kenh	445	xã	Thạch Kênh
5848	18589	xa_thach_son	445	xã	Thạch Sơn
5849	18592	xa_thach_lien	445	xã	Thạch Liên
5850	18595	xa_dinh_ban	445	xã	Đỉnh Bàn
5851	18601	xa_viet_tien	445	xã	Việt Tiến
5852	18604	xa_thach_khe	445	xã	Thạch Khê
5853	18607	xa_thach_long	445	xã	Thạch Long
5854	18619	xa_thach_tri	445	xã	Thạch Trị
5855	18622	xa_thach_lac	445	xã	Thạch Lạc
5856	18625	xa_thach_ngoc	445	xã	Thạch Ngọc
5857	18628	xa_tuong_son	445	xã	Tượng Sơn
5858	18631	xa_thach_van	445	xã	Thạch Văn
5859	18634	xa_luu_vinh_son	445	xã	Vĩnh Sơn
5860	18637	xa_thach_thang	445	xã	Thạch Thắng
5861	18643	xa_thach_dai	445	xã	Thạch Đài
5862	18649	xa_thach_hoi	445	xã	Thạch Hội
5863	18652	xa_tan_lam_huong	445	xã	Lâm Hương
5864	18658	xa_thach_xuan	445	xã	Thạch Xuân
5865	18667	xa_nam_dien	445	xã	Nam Điền
5866	18673	thi_tran_cam_xuyen	446	thị trấn	Cẩm Xuyên
5867	18676	thi_tran_thien_cam	446	thị trấn	Thiên Cầm
5868	18679	xa_yen_hoa	446	xã	Yên Hòa
5869	18682	xa_cam_duong	446	xã	Cẩm Dương
5870	18685	xa_cam_binh	446	xã	Cẩm Bình
5871	18691	xa_cam_vinh	446	xã	Cẩm Vĩnh
5872	18694	xa_cam_thanh	446	xã	Cẩm Thành
5873	18697	xa_cam_quang	446	xã	Cẩm Quang
5874	18706	xa_cam_thach	446	xã	Cẩm Thạch
5875	18709	xa_cam_nhuong	446	xã	Cẩm Nhượng
5876	18712	xa_nam_phuc_thang	446	xã	Phúc Thăng
5877	18715	xa_cam_due	446	xã	Cẩm Duệ
5878	18721	xa_cam_linh	446	xã	Cẩm Lĩnh
5879	18724	xa_cam_quan	446	xã	Cẩm Quan
5880	18727	xa_cam_ha	446	xã	Cẩm Hà
5881	18730	xa_cam_loc	446	xã	Cẩm Lộc
5882	18733	xa_cam_hung	446	xã	Cẩm Hưng
5883	18736	xa_cam_thinh	446	xã	Cẩm Thịnh
5884	18739	xa_cam_my	446	xã	Cẩm Mỹ
5885	18742	xa_cam_trung	446	xã	Cẩm Trung
5886	18745	xa_cam_son	446	xã	Cẩm Sơn
5887	18748	xa_cam_lac	446	xã	Cẩm Lạc
5888	18751	xa_cam_minh	446	xã	Cẩm Minh
5889	18757	xa_ky_xuan	447	xã	Kỳ Xuân
5890	18760	xa_ky_bac	447	xã	Kỳ Bắc
5891	18763	xa_ky_phu	447	xã	Kỳ Phú
5892	18766	xa_ky_phong	447	xã	Kỳ Phong
5893	18769	xa_ky_tien	447	xã	Kỳ Tiến
5894	18772	xa_ky_giang	447	xã	Kỳ Giang
5895	18775	xa_ky_dong	447	xã	Kỳ Đồng
5896	18778	xa_ky_khang	447	xã	Kỳ Khang
5897	18784	xa_ky_van	447	xã	Kỳ Văn
5898	18787	xa_ky_trung	447	xã	Kỳ Trung
5899	18790	xa_ky_tho	447	xã	Kỳ Thọ
5900	18793	xa_ky_tay	447	xã	Kỳ Tây
5901	18799	xa_ky_thuong	447	xã	Kỳ Thượng
5902	18802	xa_ky_hai	447	xã	Kỳ Hải
5903	18805	xa_ky_thu	447	xã	Kỳ Thư
5904	18811	xa_ky_chau	447	xã	Kỳ Châu
5905	18814	xa_ky_tan	447	xã	Kỳ Tân
5906	18838	xa_lam_hop	447	xã	Lâm Hợp
5907	18844	xa_ky_son	447	xã	Kỳ Sơn
5908	18850	xa_ky_lac	447	xã	Kỳ Lạc
5909	18409	xa_tan_loc	448	xã	Tân Lộc
5910	18412	xa_hong_loc	448	xã	Hồng Lộc
5911	18421	xa_thinh_loc	448	xã	Thịnh Lộc
5912	18430	xa_binh_an	448	xã	Bình An
5913	18457	xa_ich_hau	448	xã	Ích Hậu
5914	18493	xa_phu_luu	448	xã	Phù Lưu
5915	18568	thi_tran_loc_ha	448	thị trấn	Lộc Hà
5916	18577	xa_thach_my	448	xã	Thạch Mỹ
5917	18580	xa_thach_kim	448	xã	Thạch Kim
5918	18583	xa_thach_chau	448	xã	Thạch Châu
5919	18598	xa_ho_do	448	xã	Hộ Độ
5920	18670	xa_mai_phu	448	xã	Mai Phụ
5921	18754	phuong_hung_tri	449	phường	Hưng Trí
5922	18781	xa_ky_ninh	449	xã	Kỳ Ninh
5923	18796	xa_ky_loi	449	xã	Kỳ Lợi
5924	18808	xa_ky_ha	449	xã	Kỳ Hà
5925	18820	phuong_ky_trinh	449	phường	Kỳ Trinh
5926	18823	phuong_ky_thinh	449	phường	Kỳ Thịnh
5927	18829	xa_ky_hoa	449	xã	Kỳ Hoa
5928	18832	phuong_ky_phuong	449	phường	Kỳ Phương
5929	18835	phuong_ky_long	449	phường	Kỳ Long
5930	18841	phuong_ky_lien	449	phường	Kỳ Liên
5931	18847	xa_ky_nam	449	xã	Kỳ Nam
5932	18853	phuong_hai_thanh	450	phường	Hải Thành
5933	18856	phuong_dong_phu	450	phường	Đồng Phú
5934	18859	phuong_bac_ly	450	phường	Bắc Lý
5935	18865	phuong_nam_ly	450	phường	Nam Lý
5936	18868	phuong_dong_hai	450	phường	Đồng Hải
5937	18871	phuong_dong_son	450	phường	Đồng Sơn
5938	18874	phuong_phu_hai	450	phường	Phú Hải
5939	18877	phuong_bac_nghia	450	phường	Bắc Nghĩa
5940	18880	phuong_duc_ninh_dong	450	phường	Ninh Đông
5941	18883	xa_quang_phu	450	xã	Quang Phú
5942	18886	xa_loc_ninh	450	xã	Lộc Ninh
5943	18889	xa_bao_ninh	450	xã	Bảo Ninh
5944	18892	xa_nghia_ninh	450	xã	Nghĩa Ninh
5945	18895	xa_thuan_duc	450	xã	Thuận Đức
5946	18898	xa_duc_ninh	450	xã	Đức Ninh
5947	18901	thi_tran_quy_dat	452	thị trấn	Quy Đạt
5948	18904	xa_dan_hoa	452	xã	Dân Hóa
5949	18907	xa_trong_hoa	452	xã	Trọng Hóa
5950	18910	xa_hoa_phuc	452	xã	Hóa Phúc
5951	18913	xa_hong_hoa	452	xã	Hồng Hóa
5952	18916	xa_hoa_thanh	452	xã	Hóa Thanh
5953	18919	xa_hoa_tien	452	xã	Hóa Tiến
5954	18922	xa_hoa_hop	452	xã	Hóa Hợp
5955	18925	xa_xuan_hoa	452	xã	Xuân Hóa
5956	18928	xa_yen_hoa	452	xã	Yên Hóa
5957	18931	xa_minh_hoa	452	xã	Minh Hóa
5958	18934	xa_tan_hoa	452	xã	Tân Hóa
5959	18937	xa_hoa_son	452	xã	Hóa Sơn
5960	18943	xa_trung_hoa	452	xã	Trung Hóa
5961	18946	xa_thuong_hoa	452	xã	Thượng Hóa
5962	18949	thi_tran_dong_le	453	thị trấn	Đồng Lê
5963	18952	xa_huong_hoa	453	xã	Hương Hóa
5964	18955	xa_kim_hoa	453	xã	Kim Hóa
5965	18958	xa_thanh_hoa	453	xã	Thanh Hóa
5966	18961	xa_thanh_thach	453	xã	Thanh Thạch
5967	18964	xa_thuan_hoa	453	xã	Thuận Hóa
5968	18967	xa_lam_hoa	453	xã	Lâm Hóa
5969	18970	xa_le_hoa	453	xã	Lê Hóa
5970	18973	xa_son_hoa	453	xã	Sơn Hóa
5971	18976	xa_dong_hoa	453	xã	Đồng Hóa
5972	18979	xa_ngu_hoa	453	xã	Ngư Hóa
5973	18985	xa_thach_hoa	453	xã	Thạch Hóa
5974	18988	xa_duc_hoa	453	xã	Đức Hóa
5975	18991	xa_phong_hoa	453	xã	Phong Hóa
5976	18994	xa_mai_hoa	453	xã	Mai Hóa
5977	18997	xa_tien_hoa	453	xã	Tiến Hóa
5978	19000	xa_chau_hoa	453	xã	Châu Hóa
5979	19003	xa_cao_quang	453	xã	Cao Quảng
5980	19006	xa_van_hoa	453	xã	Văn Hóa
5981	19012	xa_quang_hop	454	xã	Quảng Hợp
5982	19015	xa_quang_kim	454	xã	Quảng Kim
5983	19018	xa_quang_dong	454	xã	Quảng Đông
5984	19021	xa_quang_phu	454	xã	Quảng Phú
5985	19024	xa_quang_chau	454	xã	Quảng Châu
5986	19027	xa_quang_thach	454	xã	Quảng Thạch
5987	19030	xa_quang_luu	454	xã	Quảng Lưu
5988	19033	xa_quang_tung	454	xã	Quảng Tùng
5989	19036	xa_canh_duong	454	xã	Cảnh Dương
5990	19039	xa_quang_tien	454	xã	Quảng Tiến
5991	19042	xa_quang_hung	454	xã	Quảng Hưng
5992	19045	xa_quang_xuan	454	xã	Quảng Xuân
5993	19048	xa_canh_hoa	454	xã	Cảnh Hóa
5994	19051	xa_lien_truong	454	xã	Liên Trường
5995	19057	xa_quang_phuong	454	xã	Quảng Phương
5996	19063	xa_phu_hoa	454	xã	Phù Hóa
5997	19072	xa_quang_thanh	454	xã	Quảng Thanh
5998	19111	thi_tran_hoan_lao	455	thị trấn	Hoàn Lão
5999	19114	thi_tran_nt_viet_trung	455	thị trấn	Việt Trung
6000	19117	xa_xuan_trach	455	xã	Xuân Trạch
6001	19120	xa_my_trach	455	xã	Mỹ Trạch
6002	19123	xa_ha_trach	455	xã	Hạ Trạch
6003	19126	xa_bac_trach	455	xã	Bắc Trạch
6004	19129	xa_lam_trach	455	xã	Lâm Trạch
6005	19132	xa_thanh_trach	455	xã	Thanh Trạch
6006	19135	xa_lien_trach	455	xã	Liên Trạch
6007	19138	xa_phuc_trach	455	xã	Phúc Trạch
6008	19141	xa_cu_nam	455	xã	Cự Nẫm
6009	19144	xa_hai_phu	455	xã	Hải Phú
6010	19147	xa_thuong_trach	455	xã	Thượng Trạch
6011	19150	xa_son_loc	455	xã	Sơn Lộc
6012	19156	xa_hung_trach	455	xã	Hưng Trạch
6013	19159	xa_dong_trach	455	xã	Đồng Trạch
6014	19162	xa_duc_trach	455	xã	Đức Trạch
6015	19165	thi_tran_phong_nha	455	thị trấn	Phong Nha
6016	19168	xa_van_trach	455	xã	Vạn Trạch
6017	19174	xa_phu_dinh	455	xã	Phú Định
6018	19177	xa_trung_trach	455	xã	Trung Trạch
6019	19180	xa_tay_trach	455	xã	Tây Trạch
6020	19183	xa_hoa_trach	455	xã	Hòa Trạch
6021	19186	xa_dai_trach	455	xã	Đại Trạch
6022	19189	xa_nhan_trach	455	xã	Nhân Trạch
6023	19192	xa_tan_trach	455	xã	Tân Trạch
6024	19195	xa_nam_trach	455	xã	Nam Trạch
6025	19198	xa_ly_trach	455	xã	Lý Trạch
6026	19201	thi_tran_quan_hau	456	thị trấn	Quán Hàu
6027	19204	xa_truong_son	456	xã	Trường Sơn
6028	19207	xa_luong_ninh	456	xã	Lương Ninh
6029	19210	xa_vinh_ninh	456	xã	Vĩnh Ninh
6030	19213	xa_vo_ninh	456	xã	Võ Ninh
6031	19216	xa_hai_ninh	456	xã	Hải Ninh
6032	19219	xa_ham_ninh	456	xã	Hàm Ninh
6033	19222	xa_duy_ninh	456	xã	Duy Ninh
6034	19225	xa_gia_ninh	456	xã	Gia Ninh
6035	19228	xa_truong_xuan	456	xã	Trường Xuân
6036	19231	xa_hien_ninh	456	xã	Hiền Ninh
6037	19234	xa_tan_ninh	456	xã	Tân Ninh
6038	19237	xa_xuan_ninh	456	xã	Xuân Ninh
6039	19240	xa_an_ninh	456	xã	An Ninh
6040	19243	xa_van_ninh	456	xã	Vạn Ninh
6041	19246	thi_tran_nt_le_ninh	457	thị trấn	Lệ Ninh
6042	19249	thi_tran_kien_giang	457	thị trấn	Kiến Giang
6043	19252	xa_hong_thuy	457	xã	Hồng Thủy
6044	19255	xa_ngu_thuy_bac	457	xã	Thủy Bắc
6045	19258	xa_hoa_thuy	457	xã	Hoa Thủy
6046	19261	xa_thanh_thuy	457	xã	Thanh Thủy
6047	19264	xa_an_thuy	457	xã	An Thủy
6048	19267	xa_phong_thuy	457	xã	Phong Thủy
6049	19270	xa_cam_thuy	457	xã	Cam Thủy
6050	19273	xa_ngan_thuy	457	xã	Ngân Thủy
6051	19276	xa_son_thuy	457	xã	Sơn Thủy
6052	19279	xa_loc_thuy	457	xã	Lộc Thủy
6053	19285	xa_lien_thuy	457	xã	Liên Thủy
6054	19288	xa_hung_thuy	457	xã	Hưng Thủy
6055	19291	xa_duong_thuy	457	xã	Dương Thủy
6056	19294	xa_tan_thuy	457	xã	Tân Thủy
6057	19297	xa_phu_thuy	457	xã	Phú Thủy
6058	19300	xa_xuan_thuy	457	xã	Xuân Thủy
6059	19303	xa_my_thuy	457	xã	Mỹ Thủy
6060	19306	xa_ngu_thuy	457	xã	Ngư Thủy
6061	19309	xa_mai_thuy	457	xã	Mai Thủy
6062	19312	xa_sen_thuy	457	xã	Sen Thủy
6063	19315	xa_thai_thuy	457	xã	Thái Thủy
6064	19318	xa_kim_thuy	457	xã	Kim Thủy
6065	19321	xa_truong_thuy	457	xã	Trường Thủy
6066	19327	xa_lam_thuy	457	xã	Lâm Thủy
6067	19009	phuong_ba_don	458	phường	Ba Đồn
6068	19060	phuong_quang_long	458	phường	Quảng Long
6069	19066	phuong_quang_tho	458	phường	Quảng Thọ
6070	19069	xa_quang_tien	458	xã	Quảng Tiên
6071	19075	xa_quang_trung	458	xã	Quảng Trung
6072	19078	phuong_quang_phong	458	phường	Quảng Phong
6073	19081	phuong_quang_thuan	458	phường	Quảng Thuận
6074	19084	xa_quang_tan	458	xã	Quảng Tân
6075	19087	xa_quang_hai	458	xã	Quảng Hải
6076	19090	xa_quang_son	458	xã	Quảng Sơn
6077	19093	xa_quang_loc	458	xã	Quảng Lộc
6078	19096	xa_quang_thuy	458	xã	Quảng Thủy
6079	19099	xa_quang_van	458	xã	Quảng Văn
6080	19102	phuong_quang_phuc	458	phường	Quảng Phúc
6081	19105	xa_quang_hoa	458	xã	Quảng Hòa
6082	19108	xa_quang_minh	458	xã	Quảng Minh
6083	19330	phuong_dong_giang	461	phường	Đông Giang
6084	19333	phuong_1	461	phường	Phường 1
6085	19336	phuong_dong_le	461	phường	Đông Lễ
6086	19339	phuong_dong_thanh	461	phường	Đông Thanh
6087	19342	phuong_2	461	phường	Phường 2
6088	19345	phuong_4	461	phường	Phường 4
6089	19348	phuong_5	461	phường	Phường 5
6090	19351	phuong_dong_luong	461	phường	Đông Lương
6091	19354	phuong_3	461	phường	Phường 3
6092	19357	phuong_1	462	phường	Phường 1
6093	19358	phuong_an_don	462	phường	An Đôn
6094	19360	phuong_2	462	phường	Phường 2
6095	19361	phuong_3	462	phường	Phường 3
6096	19705	xa_hai_le	462	xã	Hải Lệ
6097	19363	thi_tran_ho_xa	464	thị trấn	Hồ Xá
6098	19366	thi_tran_ben_quan	464	thị trấn	Bến Quan
6099	19369	xa_vinh_thai	464	xã	Vĩnh Thái
6100	19372	xa_vinh_tu	464	xã	Vĩnh Tú
6101	19375	xa_vinh_chap	464	xã	Vĩnh Chấp
6102	19378	xa_trung_nam	464	xã	Trung Nam
6103	19384	xa_kim_thach	464	xã	Kim Thạch
6104	19387	xa_vinh_long	464	xã	Vĩnh Long
6105	19393	xa_vinh_khe	464	xã	Vĩnh Khê
6106	19396	xa_vinh_hoa	464	xã	Vĩnh Hòa
6107	19402	xa_vinh_thuy	464	xã	Vĩnh Thủy
6108	19405	xa_vinh_lam	464	xã	Vĩnh Lâm
6109	19408	xa_hien_thanh	464	xã	Hiền Thành
6110	19414	thi_tran_cua_tung	464	thị trấn	Cửa Tùng
6111	19417	xa_vinh_ha	464	xã	Vĩnh Hà
6112	19420	xa_vinh_son	464	xã	Vĩnh Sơn
6113	19423	xa_vinh_giang	464	xã	Vĩnh Giang
6114	19426	xa_vinh_o	464	xã	Vĩnh Ô
6115	19429	thi_tran_khe_sanh	465	thị trấn	Khe Sanh
6116	19432	thi_tran_lao_bao	465	thị trấn	Lao Bảo
6117	19435	xa_huong_lap	465	xã	Hướng Lập
6118	19438	xa_huong_viet	465	xã	Hướng Việt
6119	19441	xa_huong_phung	465	xã	Hướng Phùng
6120	19444	xa_huong_son	465	xã	Hướng Sơn
6121	19447	xa_huong_linh	465	xã	Hướng Linh
6122	19450	xa_tan_hop	465	xã	Tân Hợp
6123	19453	xa_huong_tan	465	xã	Hướng Tân
6124	19456	xa_tan_thanh	465	xã	Tân Thành
6125	19459	xa_tan_long	465	xã	Tân Long
6126	19462	xa_tan_lap	465	xã	Tân Lập
6127	19465	xa_tan_lien	465	xã	Tân Liên
6128	19468	xa_huc	465	xã	Xã Húc
6129	19471	xa_thuan	465	xã	Xã Thuận
6130	19474	xa_huong_loc	465	xã	Hướng Lộc
6131	19477	xa_ba_tang	465	xã	Ba Tầng
6132	19480	xa_thanh	465	xã	Xã Thanh
6133	19483	xa_a_doi	465	xã	A Dơi
6134	19489	xa_lia	465	xã	Xã Lìa
6135	19492	xa_xy	465	xã	Xã Xy
6136	19495	thi_tran_gio_linh	466	thị trấn	Gio Linh
6137	19496	thi_tran_cua_viet	466	thị trấn	Cửa Việt
6138	19498	xa_trung_giang	466	xã	Trung Giang
6139	19501	xa_trung_hai	466	xã	Trung Hải
6140	19504	xa_trung_son	466	xã	Trung Sơn
6141	19507	xa_phong_binh	466	xã	Phong Bình
6142	19510	xa_gio_my	466	xã	Gio Mỹ
6143	19519	xa_gio_hai	466	xã	Gio Hải
6144	19522	xa_gio_an	466	xã	Gio An
6145	19525	xa_gio_chau	466	xã	Gio Châu
6146	19531	xa_gio_viet	466	xã	Gio Việt
6147	19534	xa_linh_truong	466	xã	Linh Trường
6148	19537	xa_gio_son	466	xã	Gio Sơn
6149	19543	xa_gio_mai	466	xã	Gio Mai
6150	19546	xa_hai_thai	466	xã	Hải Thái
6151	19549	xa_linh_hai	466	xã	Linh Hải
6152	19552	xa_gio_quang	466	xã	Gio Quang
6153	19555	thi_tran_krong_klang	467	thị trấn	Krông Klang
6154	19558	xa_mo_o	467	xã	Mò Ó
6155	19561	xa_huong_hiep	467	xã	Hướng Hiệp
6156	19564	xa_da_krong	467	xã	Đa Krông
6157	19567	xa_trieu_nguyen	467	xã	Triệu Nguyên
6158	19570	xa_ba_long	467	xã	Ba Lòng
6159	19576	xa_ba_nang	467	xã	Ba Nang
6160	19579	xa_ta_long	467	xã	Tà Long
6161	19582	xa_huc_nghi	467	xã	Húc Nghì
6162	19585	xa_a_vao	467	xã	A Vao
6163	19588	xa_ta_rut	467	xã	Tà Rụt
6164	19591	xa_a_bung	467	xã	A Bung
6165	19594	xa_a_ngo	467	xã	A Ngo
6166	19597	thi_tran_cam_lo	468	thị trấn	Cam Lộ
6167	19600	xa_cam_tuyen	468	xã	Cam Tuyền
6168	19603	xa_thanh_an	468	xã	Thanh An
6169	19606	xa_cam_thuy	468	xã	Cam Thủy
6170	19612	xa_cam_thanh	468	xã	Cam Thành
6171	19615	xa_cam_hieu	468	xã	Cam Hiếu
6172	19618	xa_cam_chinh	468	xã	Cam Chính
6173	19621	xa_cam_nghia	468	xã	Cam Nghĩa
6174	19624	thi_tran_ai_tu	469	thị trấn	Ái Tử
6175	19627	xa_trieu_an	469	xã	Triệu An
6176	19630	xa_trieu_van	469	xã	Triệu Vân
6177	19633	xa_trieu_phuoc	469	xã	Triệu Phước
6178	19636	xa_trieu_do	469	xã	Triệu Độ
6179	19639	xa_trieu_trach	469	xã	Triệu Trạch
6180	19642	xa_trieu_thuan	469	xã	Triệu Thuận
6181	19645	xa_trieu_dai	469	xã	Triệu Đại
6182	19648	xa_trieu_hoa	469	xã	Triệu Hòa
6183	19651	xa_trieu_lang	469	xã	Triệu Lăng
6184	19654	xa_trieu_son	469	xã	Triệu Sơn
6185	19657	xa_trieu_long	469	xã	Triệu Long
6186	19660	xa_trieu_tai	469	xã	Triệu Tài
6187	19666	xa_trieu_trung	469	xã	Triệu Trung
6188	19669	xa_trieu_ai	469	xã	Triệu Ái
6189	19672	xa_trieu_thuong	469	xã	Triệu Thượng
6190	19675	xa_trieu_giang	469	xã	Triệu Giang
6191	19678	xa_trieu_thanh	469	xã	Triệu Thành
6192	19681	thi_tran_dien_sanh	470	thị trấn	Diên Sanh
6193	19684	xa_hai_an	470	xã	Hải An
6194	19687	xa_hai_ba	470	xã	Hải Ba
6195	19693	xa_hai_quy	470	xã	Hải Quy
6196	19696	xa_hai_que	470	xã	Hải Quế
6197	19699	xa_hai_hung	470	xã	Hải Hưng
6198	19702	xa_hai_phu	470	xã	Hải Phú
6199	19708	xa_hai_thuong	470	xã	Hải Thượng
6200	19711	xa_hai_duong	470	xã	Hải Dương
6201	19714	xa_hai_dinh	470	xã	Hải Định
6202	19717	xa_hai_lam	470	xã	Hải Lâm
6203	19726	xa_hai_phong	470	xã	Hải Phong
6204	19729	xa_hai_truong	470	xã	Hải Trường
6205	19735	xa_hai_son	470	xã	Hải Sơn
6206	19738	xa_hai_chanh	470	xã	Hải Chánh
6207	19741	xa_hai_khe	470	xã	Hải Khê
6208	19744	phuong_phu_thuan	474	phường	Phú Thuận
6209	19747	phuong_phu_binh	474	phường	Phú Bình
6210	19750	phuong_tay_loc	474	phường	Tây Lộc
6211	19753	phuong_thuan_loc	474	phường	Thuận Lộc
6212	19756	phuong_phu_hiep	474	phường	Phú Hiệp
6213	19759	phuong_phu_hau	474	phường	Phú Hậu
6214	19762	phuong_thuan_hoa	474	phường	Thuận Hòa
6215	19765	phuong_thuan_thanh	474	phường	Thuận Thành
6216	19768	phuong_phu_hoa	474	phường	Phú Hòa
6217	19771	phuong_phu_cat	474	phường	Phú Cát
6218	19774	phuong_kim_long	474	phường	Kim Long
6219	19777	phuong_vy_da	474	phường	Vỹ Dạ
6220	19780	phuong_phuong_duc	474	phường	Phường Đúc
6221	19783	phuong_vinh_ninh	474	phường	Vĩnh Ninh
6222	19786	phuong_phu_hoi	474	phường	Phú Hội
6223	19789	phuong_phu_nhuan	474	phường	Phú Nhuận
6224	19792	phuong_xuan_phu	474	phường	Xuân Phú
6225	19795	phuong_truong_an	474	phường	Trường An
6226	19798	phuong_phuoc_vinh	474	phường	Phước Vĩnh
6227	19801	phuong_an_cuu	474	phường	An Cựu
6228	19803	phuong_an_hoa	474	phường	An Hòa
6229	19804	phuong_huong_so	474	phường	Hương Sơ
6230	19807	phuong_thuy_bieu	474	phường	Thuỷ Biều
6231	19810	phuong_huong_long	474	phường	Hương Long
6232	19813	phuong_thuy_xuan	474	phường	Thuỷ Xuân
6233	19815	phuong_an_dong	474	phường	An Đông
6234	19816	phuong_an_tay	474	phường	An Tây
6235	19819	thi_tran_phong_dien	476	thị trấn	Phong Điền
6236	19822	xa_dien_huong	476	xã	Điền Hương
6237	19825	xa_dien_mon	476	xã	Điền Môn
6238	19828	xa_dien_loc	476	xã	Điền Lộc
6239	19831	xa_phong_binh	476	xã	Phong Bình
6240	19834	xa_dien_hoa	476	xã	Điền Hòa
6241	19837	xa_phong_chuong	476	xã	Phong Chương
6242	19840	xa_phong_hai	476	xã	Phong Hải
6243	19843	xa_dien_hai	476	xã	Điền Hải
6244	19846	xa_phong_hoa	476	xã	Phong Hòa
6245	19849	xa_phong_thu	476	xã	Phong Thu
6246	19852	xa_phong_hien	476	xã	Phong Hiền
6247	19855	xa_phong_my	476	xã	Phong Mỹ
6248	19858	xa_phong_an	476	xã	Phong An
6249	19861	xa_phong_xuan	476	xã	Phong Xuân
6250	19864	xa_phong_son	476	xã	Phong Sơn
6251	19867	thi_tran_sia	477	thị trấn	Thị trấn Sịa
6252	19870	xa_quang_thai	477	xã	Quảng Thái
6253	19873	xa_quang_ngan	477	xã	Quảng Ngạn
6254	19876	xa_quang_loi	477	xã	Quảng Lợi
6255	19879	xa_quang_cong	477	xã	Quảng Công
6256	19882	xa_quang_phuoc	477	xã	Quảng Phước
6257	19885	xa_quang_vinh	477	xã	Quảng Vinh
6258	19888	xa_quang_an	477	xã	Quảng An
6259	19891	xa_quang_thanh	477	xã	Quảng Thành
6260	19894	xa_quang_tho	477	xã	Quảng Thọ
6261	19897	xa_quang_phu	477	xã	Quảng Phú
6262	19900	thi_tran_thuan_an	478	thị trấn	Thuận An
6263	19903	xa_phu_thuan	478	xã	Phú Thuận
6264	19906	xa_phu_duong	478	xã	Phú Dương
6265	19909	xa_phu_mau	478	xã	Phú Mậu
6266	19912	xa_phu_an	478	xã	Phú An
6267	19915	xa_phu_hai	478	xã	Phú Hải
6268	19918	xa_phu_xuan	478	xã	Phú Xuân
6269	19921	xa_phu_dien	478	xã	Phú Diên
6270	19924	xa_phu_thanh	478	xã	Phú Thanh
6271	19927	xa_phu_my	478	xã	Phú Mỹ
6272	19930	xa_phu_thuong	478	xã	Phú Thượng
6273	19933	xa_phu_ho	478	xã	Phú Hồ
6274	19936	xa_vinh_xuan	478	xã	Vinh Xuân
6275	19939	xa_phu_luong	478	xã	Phú Lương
6276	19942	thi_tran_phu_da	478	thị trấn	Phú Đa
6277	19945	xa_vinh_thanh	478	xã	Vinh Thanh
6278	19948	xa_vinh_an	478	xã	Vinh An
6279	19954	xa_phu_gia	478	xã	Phú Gia
6280	19957	xa_vinh_ha	478	xã	Vinh Hà
6281	19960	phuong_phu_bai	479	phường	Phú Bài
6282	19963	xa_thuy_van	479	xã	Thủy Vân
6283	19966	xa_thuy_thanh	479	xã	Thủy Thanh
6284	19969	phuong_thuy_duong	479	phường	Thủy Dương
6285	19972	phuong_thuy_phuong	479	phường	Thủy Phương
6286	19975	phuong_thuy_chau	479	phường	Thủy Châu
6287	19978	phuong_thuy_luong	479	phường	Thủy Lương
6288	19981	xa_thuy_bang	479	xã	Thủy Bằng
6289	19984	xa_thuy_tan	479	xã	Thủy Tân
6290	19987	xa_thuy_phu	479	xã	Thủy Phù
6291	19990	xa_phu_son	479	xã	Phú Sơn
6292	19993	xa_duong_hoa	479	xã	Dương Hòa
6293	19996	phuong_tu_ha	480	phường	Tứ Hạ
6294	19999	xa_hai_duong	480	xã	Hải Dương
6295	20002	xa_huong_phong	480	xã	Hương Phong
6296	20005	xa_huong_toan	480	xã	Hương Toàn
6297	20008	phuong_huong_van	480	phường	Hương Vân
6298	20011	phuong_huong_van	480	phường	Hương Văn
6299	20014	xa_huong_vinh	480	xã	Hương Vinh
6300	20017	phuong_huong_xuan	480	phường	Hương Xuân
6301	20020	phuong_huong_chu	480	phường	Hương Chữ
6302	20023	phuong_huong_an	480	phường	Hương An
6303	20026	xa_huong_binh	480	xã	Hương Bình
6304	20029	phuong_huong_ho	480	phường	Hương Hồ
6305	20032	xa_huong_tho	480	xã	Hương Thọ
6306	20035	xa_binh_tien	480	xã	Bình Tiến
6307	20041	xa_binh_thanh	480	xã	Bình Thành
6308	20044	thi_tran_a_luoi	481	thị trấn	A Lưới
6309	20047	xa_hong_van	481	xã	Hồng Vân
6310	20050	xa_hong_ha	481	xã	Hồng Hạ
6311	20053	xa_hong_kim	481	xã	Hồng Kim
6312	20056	xa_trung_son	481	xã	Trung Sơn
6313	20059	xa_huong_nguyen	481	xã	Hương Nguyên
6314	20065	xa_hong_bac	481	xã	Hồng Bắc
6315	20068	xa_a_ngo	481	xã	A Ngo
6316	20071	xa_son_thuy	481	xã	Sơn Thủy
6317	20074	xa_phu_vinh	481	xã	Phú Vinh
6318	20080	xa_huong_phong	481	xã	Hương Phong
6319	20083	xa_quang_nham	481	xã	Quảng Nhâm
6320	20086	xa_hong_thuong	481	xã	Hồng Thượng
6321	20089	xa_hong_thai	481	xã	Hồng Thái
6322	20095	xa_a_roang	481	xã	A Roàng
6323	20098	xa_dong_son	481	xã	Đông Sơn
6324	20101	xa_lam_dot	481	xã	Lâm Đớt
6325	20104	xa_hong_thuy	481	xã	Hồng Thủy
6326	20107	thi_tran_phu_loc	482	thị trấn	Phú Lộc
6327	20110	thi_tran_lang_co	482	thị trấn	Lăng Cô
6328	20113	xa_vinh_my	482	xã	Vinh Mỹ
6329	20116	xa_vinh_hung	482	xã	Vinh Hưng
6330	20122	xa_giang_hai	482	xã	Giang Hải
6331	20125	xa_vinh_hien	482	xã	Vinh Hiền
6332	20128	xa_loc_bon	482	xã	Lộc Bổn
6333	20131	xa_loc_son	482	xã	Lộc Sơn
6334	20134	xa_loc_binh	482	xã	Lộc Bình
6335	20137	xa_loc_vinh	482	xã	Lộc Vĩnh
6336	20140	xa_loc_an	482	xã	Lộc An
6337	20143	xa_loc_dien	482	xã	Lộc Điền
6338	20146	xa_loc_thuy	482	xã	Lộc Thủy
6339	20149	xa_loc_tri	482	xã	Lộc Trì
6340	20152	xa_loc_tien	482	xã	Lộc Tiến
6341	20155	xa_loc_hoa	482	xã	Lộc Hòa
6342	20158	xa_xuan_loc	482	xã	Xuân Lộc
6343	20161	thi_tran_khe_tre	483	thị trấn	Khe Tre
6344	20164	xa_huong_phu	483	xã	Hương Phú
6345	20167	xa_huong_son	483	xã	Hương Sơn
6346	20170	xa_huong_loc	483	xã	Hương Lộc
6347	20173	xa_thuong_quang	483	xã	Thượng Quảng
6348	20179	xa_huong_xuan	483	xã	Hương Xuân
6349	20182	xa_huong_huu	483	xã	Hương Hữu
6350	20185	xa_thuong_lo	483	xã	Thượng Lộ
6351	20188	xa_thuong_long	483	xã	Thượng Long
6352	20191	xa_thuong_nhat	483	xã	Thượng Nhật
6353	20194	phuong_hoa_hiep_bac	490	phường	Hiệp Bắc
6354	20195	phuong_hoa_hiep_nam	490	phường	Hiệp Nam
6355	20197	phuong_hoa_khanh_bac	490	phường	Khánh Bắc
6356	20198	phuong_hoa_khanh_nam	490	phường	Khánh Nam
6357	20200	phuong_hoa_minh	490	phường	Hòa Minh
6358	20203	phuong_tam_thuan	491	phường	Tam Thuận
6359	20206	phuong_thanh_khe_tay	491	phường	Khê Tây
6360	20207	phuong_thanh_khe_dong	491	phường	Khê Đông
6361	20209	phuong_xuan_ha	491	phường	Xuân Hà
6362	20212	phuong_tan_chinh	491	phường	Tân Chính
6363	20215	phuong_chinh_gian	491	phường	Chính Gián
6364	20218	phuong_vinh_trung	491	phường	Vĩnh Trung
6365	20221	phuong_thac_gian	491	phường	Thạc Gián
6366	20224	phuong_an_khe	491	phường	An Khê
6367	20225	phuong_hoa_khe	491	phường	Hòa Khê
6368	20227	phuong_thanh_binh	492	phường	Thanh Bình
6369	20230	phuong_thuan_phuoc	492	phường	Thuận Phước
6370	20233	phuong_thach_thang	492	phường	Thạch Thang
6371	20236	phuong_hai_chau_i	492	phường	P. Hải Châu I
6372	20239	phuong_hai_chau_ii	492	phường	P. Hải Châu II
6373	20242	phuong_phuoc_ninh	492	phường	Phước Ninh
6374	20245	phuong_hoa_thuan_tay	492	phường	Hòa Thuận Tây
6375	20246	phuong_hoa_thuan_dong	492	phường	Hòa Thuận Đông
6376	20248	phuong_nam_duong	492	phường	Nam Dương
6377	20251	phuong_binh_hien	492	phường	Bình Hiên
6378	20254	phuong_binh_thuan	492	phường	Bình Thuận
6379	20257	phuong_hoa_cuong_bac	492	phường	Hòa Cường Bắc
6380	20258	phuong_hoa_cuong_nam	492	phường	Hòa Cường Nam
6381	20263	phuong_tho_quang	493	phường	Thọ Quang
6382	20266	phuong_nai_hien_dong	493	phường	Hiên Đông
6383	20269	phuong_man_thai	493	phường	Mân Thái
6384	20272	phuong_an_hai_bac	493	phường	Hải Bắc
6385	20275	phuong_phuoc_my	493	phường	Phước Mỹ
6386	20278	phuong_an_hai_tay	493	phường	Hải Tây
6387	20281	phuong_an_hai_dong	493	phường	Hải Đông
6388	20284	phuong_my_an	494	phường	Mỹ An
6389	20285	phuong_khue_my	494	phường	Khuê Mỹ
6390	20287	phuong_hoa_quy	494	phường	Hoà Quý
6391	20290	phuong_hoa_hai	494	phường	Hoà Hải
6392	20260	phuong_khue_trung	495	phường	Khuê Trung
6393	20305	phuong_hoa_phat	495	phường	Hòa Phát
6394	20306	phuong_hoa_an	495	phường	Hòa An
6395	20311	phuong_hoa_tho_tay	495	phường	Thọ Tây
6396	20312	phuong_hoa_tho_dong	495	phường	Thọ Đông
6397	20314	phuong_hoa_xuan	495	phường	Hòa Xuân
6398	20293	xa_hoa_bac	497	xã	Hòa Bắc
6399	20296	xa_hoa_lien	497	xã	Hòa Liên
6400	20299	xa_hoa_ninh	497	xã	Hòa Ninh
6401	20302	xa_hoa_son	497	xã	Hòa Sơn
6402	20308	xa_hoa_nhon	497	xã	Hòa Nhơn
6403	20317	xa_hoa_phu	497	xã	Hòa Phú
6404	20320	xa_hoa_phong	497	xã	Hòa Phong
6405	20323	xa_hoa_chau	497	xã	Hòa Châu
6406	20326	xa_hoa_tien	497	xã	Hòa Tiến
6407	20329	xa_hoa_phuoc	497	xã	Hòa Phước
6408	20332	xa_hoa_khuong	497	xã	Hòa Khương
6409	20335	phuong_tan_thanh	502	phường	Tân Thạnh
6410	20338	phuong_phuoc_hoa	502	phường	Phước Hòa
6411	20341	phuong_an_my	502	phường	An Mỹ
6412	20344	phuong_hoa_huong	502	phường	Hòa Hương
6413	20347	phuong_an_xuan	502	phường	An Xuân
6414	20350	phuong_an_son	502	phường	An Sơn
6415	20353	phuong_truong_xuan	502	phường	Trường Xuân
6416	20356	phuong_an_phu	502	phường	An Phú
6417	20359	xa_tam_thanh	502	xã	Tam Thanh
6418	20362	xa_tam_thang	502	xã	Tam Thăng
6419	20371	xa_tam_phu	502	xã	Tam Phú
6420	20375	phuong_hoa_thuan	502	phường	Hoà Thuận
6421	20389	xa_tam_ngoc	502	xã	Tam Ngọc
6422	20398	phuong_minh_an	503	phường	Minh An
6423	20401	phuong_tan_an	503	phường	Tân An
6424	20404	phuong_cam_pho	503	phường	Cẩm Phô
6425	20407	phuong_thanh_ha	503	phường	Thanh Hà
6426	20410	phuong_son_phong	503	phường	Sơn Phong
6427	20413	phuong_cam_chau	503	phường	Cẩm Châu
6428	20416	phuong_cua_dai	503	phường	Cửa Đại
6429	20419	phuong_cam_an	503	phường	Cẩm An
6430	20422	xa_cam_ha	503	xã	Cẩm Hà
6431	20425	xa_cam_kim	503	xã	Cẩm Kim
6432	20428	phuong_cam_nam	503	phường	Cẩm Nam
6433	20431	xa_cam_thanh	503	xã	Cẩm Thanh
6434	20434	xa_tan_hiep	503	xã	Tân Hiệp
6435	20437	xa_chom	504	xã	Xã Ch'ơm
6436	20440	xa_ga_ri	504	xã	Ga Ri
6437	20443	xa_a_xan	504	xã	A Xan
6438	20446	xa_trhy	504	xã	Tr'Hy
6439	20449	xa_lang	504	xã	Xã Lăng
6440	20452	xa_a_nong	504	xã	A Nông
6441	20455	xa_a_tieng	504	xã	A Tiêng
6442	20458	xa_bha_le	504	xã	Bha Lê
6443	20461	xa_a_vuong	504	xã	A Vương
6444	20464	xa_dang	504	xã	Xã Dang
6445	20467	thi_tran_p_rao	505	thị trấn	P Rao
6446	20470	xa_ta_lu	505	xã	Tà Lu
6447	20473	xa_song_kon	505	xã	Sông Kôn
6448	20476	xa_jo_ngay	505	xã	Jơ Ngây
6449	20479	xa_a_ting	505	xã	A Ting
6450	20482	xa_tu	505	xã	Xã Tư
6451	20485	xa_ba	505	xã	Xã Ba
6452	20488	xa_a_rooi	505	xã	A Rooi
6453	20491	xa_za_hung	505	xã	Za Hung
6454	20494	xa_ma_cooi	505	xã	Mà Cooi
6455	20497	xa_ka_dang	505	xã	Ka Dăng
6456	20500	thi_tran_ai_nghia	506	thị trấn	Ái Nghĩa
6457	20503	xa_dai_son	506	xã	Đại Sơn
6458	20506	xa_dai_lanh	506	xã	Đại Lãnh
6459	20509	xa_dai_hung	506	xã	Đại Hưng
6460	20512	xa_dai_hong	506	xã	Đại Hồng
6461	20515	xa_dai_dong	506	xã	Đại Đồng
6462	20518	xa_dai_quang	506	xã	Đại Quang
6463	20521	xa_dai_nghia	506	xã	Đại Nghĩa
6464	20524	xa_dai_hiep	506	xã	Đại Hiệp
6465	20527	xa_dai_thanh	506	xã	Đại Thạnh
6466	20530	xa_dai_chanh	506	xã	Đại Chánh
6467	20533	xa_dai_tan	506	xã	Đại Tân
6468	20536	xa_dai_phong	506	xã	Đại Phong
6469	20539	xa_dai_minh	506	xã	Đại Minh
6470	20542	xa_dai_thang	506	xã	Đại Thắng
6471	20545	xa_dai_cuong	506	xã	Đại Cường
6472	20547	xa_dai_an	506	xã	Đại An
6473	20548	xa_dai_hoa	506	xã	Đại Hòa
6474	20551	phuong_vinh_dien	507	phường	Vĩnh Điện
6475	20554	xa_dien_tien	507	xã	Điện Tiến
6476	20557	xa_dien_hoa	507	xã	Điện Hòa
6477	20560	xa_dien_thang_bac	507	xã	Thắng Bắc
6478	20561	xa_dien_thang_trung	507	xã	Thắng Trung
6479	20562	xa_dien_thang_nam	507	xã	Thắng Nam
6480	20563	phuong_dien_ngoc	507	phường	Điện Ngọc
6481	20566	xa_dien_hong	507	xã	Điện Hồng
6482	20569	xa_dien_tho	507	xã	Điện Thọ
6483	20572	xa_dien_phuoc	507	xã	Điện Phước
6484	20575	phuong_dien_an	507	phường	Điện An
6485	20578	phuong_dien_nam_bac	507	phường	Nam Bắc
6486	20579	phuong_dien_nam_trung	507	phường	Nam Trung
6487	20580	phuong_dien_nam_dong	507	phường	Nam Đông
6488	20581	phuong_dien_duong	507	phường	Điện Dương
6489	20584	xa_dien_quang	507	xã	Điện Quang
6490	20587	xa_dien_trung	507	xã	Điện Trung
6491	20590	xa_dien_phong	507	xã	Điện Phong
6492	20593	xa_dien_minh	507	xã	Điện Minh
6493	20596	xa_dien_phuong	507	xã	Điện Phương
6494	20599	thi_tran_nam_phuoc	508	thị trấn	Nam Phước
6495	20602	xa_duy_thu	508	xã	Duy Thu
6496	20605	xa_duy_phu	508	xã	Duy Phú
6497	20608	xa_duy_tan	508	xã	Duy Tân
6498	20611	xa_duy_hoa	508	xã	Duy Hòa
6499	20614	xa_duy_chau	508	xã	Duy Châu
6500	20617	xa_duy_trinh	508	xã	Duy Trinh
6501	20620	xa_duy_son	508	xã	Duy Sơn
6502	20623	xa_duy_trung	508	xã	Duy Trung
6503	20626	xa_duy_phuoc	508	xã	Duy Phước
6504	20629	xa_duy_thanh	508	xã	Duy Thành
6505	20632	xa_duy_vinh	508	xã	Duy Vinh
6506	20635	xa_duy_nghia	508	xã	Duy Nghĩa
6507	20638	xa_duy_hai	508	xã	Duy Hải
6508	20641	thi_tran_dong_phu	509	thị trấn	Đông Phú
6509	20644	xa_que_xuan_1	509	xã	Quế Xuân 1
6510	20647	xa_que_xuan_2	509	xã	Quế Xuân 2
6511	20650	xa_que_phu	509	xã	Quế Phú
6512	20651	thi_tran_huong_an	509	thị trấn	Hương An
6513	20659	xa_que_hiep	509	xã	Quế Hiệp
6514	20662	xa_que_thuan	509	xã	Quế Thuận
6515	20665	xa_que_my	509	xã	Quế Mỹ
6516	20677	xa_que_long	509	xã	Quế Long
6517	20680	xa_que_chau	509	xã	Quế Châu
6518	20683	xa_que_phong	509	xã	Quế Phong
6519	20686	xa_que_an	509	xã	Quế An
6520	20689	xa_que_minh	509	xã	Quế Minh
6521	20695	thi_tran_thanh_my	510	thị trấn	Thạnh Mỹ
6522	20698	xa_laee	510	xã	Xã Laêê
6523	20699	xa_cho_chun	510	xã	Chơ Chun
6524	20701	xa_zuoich	510	xã	Xã Zuôich
6525	20702	xa_ta_poo	510	xã	Tà Pơơ
6526	20704	xa_la_dee	510	xã	La Dêê
6527	20705	xa_dac_toi	510	xã	Đắc Tôi
6528	20707	xa_cha_val	510	xã	Chà Vàl
6529	20710	xa_ta_bhinh	510	xã	Tà Bhinh
6530	20713	xa_ca_dy	510	xã	Cà Dy
6531	20716	xa_dac_pre	510	xã	Đắc Pre
6532	20719	xa_dac_pring	510	xã	Đắc Pring
6533	20722	thi_tran_kham_duc	511	thị trấn	Khâm Đức
6534	20725	xa_phuoc_xuan	511	xã	Phước Xuân
6535	20728	xa_phuoc_hiep	511	xã	Phước Hiệp
6536	20729	xa_phuoc_hoa	511	xã	Phước Hoà
6537	20731	xa_phuoc_duc	511	xã	Phước Đức
6538	20734	xa_phuoc_nang	511	xã	Phước Năng
6539	20737	xa_phuoc_my	511	xã	Phước Mỹ
6540	20740	xa_phuoc_chanh	511	xã	Phước Chánh
6541	20743	xa_phuoc_cong	511	xã	Phước Công
6542	20746	xa_phuoc_kim	511	xã	Phước Kim
6543	20749	xa_phuoc_loc	511	xã	Phước Lộc
6544	20752	xa_phuoc_thanh	511	xã	Phước Thành
6545	20758	xa_hiep_hoa	512	xã	Hiệp Hòa
6546	20761	xa_hiep_thuan	512	xã	Hiệp Thuận
6547	20764	xa_que_tho	512	xã	Quế Thọ
6548	20767	xa_binh_lam	512	xã	Bình Lâm
6549	20770	xa_song_tra	512	xã	Sông Trà
6550	20773	xa_phuoc_tra	512	xã	Phước Trà
6551	20776	xa_phuoc_gia	512	xã	Phước Gia
6552	20779	thi_tran_tan_binh	512	thị trấn	Tân Bình
6553	20782	xa_que_luu	512	xã	Quế Lưu
6554	20785	xa_thang_phuoc	512	xã	Thăng Phước
6555	20788	xa_binh_son	512	xã	Bình Sơn
6556	20791	thi_tran_ha_lam	513	thị trấn	Hà Lam
6557	20794	xa_binh_duong	513	xã	Bình Dương
6558	20797	xa_binh_giang	513	xã	Bình Giang
6559	20800	xa_binh_nguyen	513	xã	Bình Nguyên
6560	20803	xa_binh_phuc	513	xã	Bình Phục
6561	20806	xa_binh_trieu	513	xã	Bình Triều
6562	20809	xa_binh_dao	513	xã	Bình Đào
6563	20812	xa_binh_minh	513	xã	Bình Minh
6564	20815	xa_binh_lanh	513	xã	Bình Lãnh
6565	20818	xa_binh_tri	513	xã	Bình Trị
6566	20821	xa_binh_dinh_bac	513	xã	Định Bắc
6567	20822	xa_binh_dinh_nam	513	xã	Định Nam
6568	20824	xa_binh_quy	513	xã	Bình Quý
6569	20827	xa_binh_phu	513	xã	Bình Phú
6570	20830	xa_binh_chanh	513	xã	Bình Chánh
6571	20833	xa_binh_tu	513	xã	Bình Tú
6572	20836	xa_binh_sa	513	xã	Bình Sa
6573	20839	xa_binh_hai	513	xã	Bình Hải
6574	20842	xa_binh_que	513	xã	Bình Quế
6575	20845	xa_binh_an	513	xã	Bình An
6576	20848	xa_binh_trung	513	xã	Bình Trung
6577	20851	xa_binh_nam	513	xã	Bình Nam
6578	20854	thi_tran_tien_ky	514	thị trấn	Tiên Kỳ
6579	20857	xa_tien_son	514	xã	Tiên Sơn
6580	20860	xa_tien_ha	514	xã	Tiên Hà
6581	20863	xa_tien_cam	514	xã	Tiên Cẩm
6582	20866	xa_tien_chau	514	xã	Tiên Châu
6583	20869	xa_tien_lanh	514	xã	Tiên Lãnh
6584	20872	xa_tien_ngoc	514	xã	Tiên Ngọc
6585	20875	xa_tien_hiep	514	xã	Tiên Hiệp
6586	20878	xa_tien_canh	514	xã	Tiên Cảnh
6587	20881	xa_tien_my	514	xã	Tiên Mỹ
6588	20884	xa_tien_phong	514	xã	Tiên Phong
6589	20887	xa_tien_tho	514	xã	Tiên Thọ
6590	20890	xa_tien_an	514	xã	Tiên An
6591	20893	xa_tien_loc	514	xã	Tiên Lộc
6592	20896	xa_tien_lap	514	xã	Tiên Lập
6593	20899	thi_tran_tra_my	515	thị trấn	Trà My
6594	20900	xa_tra_son	515	xã	Trà Sơn
6595	20902	xa_tra_kot	515	xã	Trà Kót
6596	20905	xa_tra_nu	515	xã	Trà Nú
6597	20908	xa_tra_dong	515	xã	Trà Đông
6598	20911	xa_tra_duong	515	xã	Trà Dương
6599	20914	xa_tra_giang	515	xã	Trà Giang
6600	20917	xa_tra_bui	515	xã	Trà Bui
6601	20920	xa_tra_doc	515	xã	Trà Đốc
6602	20923	xa_tra_tan	515	xã	Trà Tân
6603	20926	xa_tra_giac	515	xã	Trà Giác
6604	20929	xa_tra_giap	515	xã	Trà Giáp
6605	20932	xa_tra_ka	515	xã	Trà Ka
6606	20935	xa_tra_leng	516	xã	Trà Leng
6607	20938	xa_tra_don	516	xã	Trà Dơn
6608	20941	xa_tra_tap	516	xã	Trà Tập
6609	20944	xa_tra_mai	516	xã	Trà Mai
6610	20947	xa_tra_cang	516	xã	Trà Cang
6611	20950	xa_tra_linh	516	xã	Trà Linh
6612	20953	xa_tra_nam	516	xã	Trà Nam
6613	20956	xa_tra_don	516	xã	Trà Don
6614	20959	xa_tra_van	516	xã	Trà Vân
6615	20962	xa_tra_vinh	516	xã	Trà Vinh
6616	20965	thi_tran_nui_thanh	517	thị trấn	Núi Thành
6617	20968	xa_tam_xuan_i	517	xã	Xuân I
6618	20971	xa_tam_xuan_ii	517	xã	Xuân II
6619	20974	xa_tam_tien	517	xã	Tam Tiến
6620	20977	xa_tam_son	517	xã	Tam Sơn
6621	20980	xa_tam_thanh	517	xã	Tam Thạnh
6622	20983	xa_tam_anh_bac	517	xã	Anh Bắc
6623	20984	xa_tam_anh_nam	517	xã	Anh Nam
6624	20986	xa_tam_hoa	517	xã	Tam Hòa
6625	20989	xa_tam_hiep	517	xã	Tam Hiệp
6626	20992	xa_tam_hai	517	xã	Tam Hải
6627	20995	xa_tam_giang	517	xã	Tam Giang
6628	20998	xa_tam_quang	517	xã	Tam Quang
6629	21001	xa_tam_nghia	517	xã	Tam Nghĩa
6630	21004	xa_tam_my_tay	517	xã	Mỹ Tây
6631	21005	xa_tam_my_dong	517	xã	Mỹ Đông
6632	21007	xa_tam_tra	517	xã	Tam Trà
6633	20364	thi_tran_phu_thinh	518	thị trấn	Phú Thịnh
6634	20365	xa_tam_thanh	518	xã	Tam Thành
6635	20368	xa_tam_an	518	xã	Tam An
6636	20374	xa_tam_dan	518	xã	Tam Đàn
6637	20377	xa_tam_loc	518	xã	Tam Lộc
6638	20380	xa_tam_phuoc	518	xã	Tam Phước
6639	20383	xa_tam_vinh	518	xã	Tam Vinh
6640	20386	xa_tam_thai	518	xã	Tam Thái
6641	20387	xa_tam_dai	518	xã	Tam Đại
6642	20392	xa_tam_dan	518	xã	Tam Dân
6643	20395	xa_tam_lanh	518	xã	Tam Lãnh
6644	20656	xa_que_trung	519	xã	Quế Trung
6645	20668	xa_ninh_phuoc	519	xã	Ninh Phước
6646	20669	xa_phuoc_ninh	519	xã	Phước Ninh
6647	20671	xa_que_loc	519	xã	Quế Lộc
6648	20672	xa_son_vien	519	xã	Sơn Viên
6649	20692	xa_que_lam	519	xã	Quế Lâm
6650	21010	phuong_le_hong_phong	522	phường	Hồng Phong
6651	21013	phuong_tran_phu	522	phường	Trần Phú
6652	21016	phuong_quang_phu	522	phường	Quảng Phú
6653	21019	phuong_nghia_chanh	522	phường	Nghĩa Chánh
6654	21022	phuong_tran_hung_dao	522	phường	Hưng Đạo
6655	21025	phuong_nguyen_nghiem	522	phường	Nguyễn Nghiêm
6656	21028	phuong_nghia_lo	522	phường	Nghĩa Lộ
6657	21031	phuong_chanh_lo	522	phường	Chánh Lộ
6658	21034	xa_nghia_dung	522	xã	Nghĩa Dũng
6659	21037	xa_nghia_dong	522	xã	Nghĩa Dõng
6660	21172	phuong_truong_quang_trong	522	phường	Quang Trọng
6661	21187	xa_tinh_hoa	522	xã	Tịnh Hòa
6662	21190	xa_tinh_ky	522	xã	Tịnh Kỳ
6663	21199	xa_tinh_thien	522	xã	Tịnh Thiện
6664	21202	xa_tinh_an_dong	522	xã	Ấn Đông
6665	21208	xa_tinh_chau	522	xã	Tịnh Châu
6666	21211	xa_tinh_khe	522	xã	Tịnh Khê
6667	21214	xa_tinh_long	522	xã	Tịnh Long
6668	21223	xa_tinh_an_tay	522	xã	Ấn Tây
6669	21232	xa_tinh_an	522	xã	Tịnh An
6670	21253	xa_nghia_phu	522	xã	Nghĩa Phú
6671	21256	xa_nghia_ha	522	xã	Nghĩa Hà
6672	21262	xa_nghia_an	522	xã	Nghĩa An
6673	21040	thi_tran_chau_o	524	thị trấn	Châu Ổ
6674	21043	xa_binh_thuan	524	xã	Bình Thuận
6675	21046	xa_binh_thanh	524	xã	Bình Thạnh
6676	21049	xa_binh_dong	524	xã	Bình Đông
6677	21052	xa_binh_chanh	524	xã	Bình Chánh
6678	21055	xa_binh_nguyen	524	xã	Bình Nguyên
6679	21058	xa_binh_khuong	524	xã	Bình Khương
6680	21061	xa_binh_tri	524	xã	Bình Trị
6681	21064	xa_binh_an	524	xã	Bình An
6682	21067	xa_binh_hai	524	xã	Bình Hải
6683	21070	xa_binh_duong	524	xã	Bình Dương
6684	21073	xa_binh_phuoc	524	xã	Bình Phước
6685	21079	xa_binh_hoa	524	xã	Bình Hòa
6686	21082	xa_binh_trung	524	xã	Bình Trung
6687	21085	xa_binh_minh	524	xã	Bình Minh
6688	21088	xa_binh_long	524	xã	Bình Long
6689	21091	xa_binh_thanh	524	xã	Bình Thanh
6690	21100	xa_binh_chuong	524	xã	Bình Chương
6691	21103	xa_binh_hiep	524	xã	Bình Hiệp
6692	21106	xa_binh_my	524	xã	Bình Mỹ
6693	21109	xa_binh_tan_phu	524	xã	Tân Phú
6694	21112	xa_binh_chau	524	xã	Bình Châu
6695	21115	thi_tran_tra_xuan	525	thị trấn	Trà Xuân
6696	21118	xa_tra_giang	525	xã	Trà Giang
6697	21121	xa_tra_thuy	525	xã	Trà Thủy
6698	21124	xa_tra_hiep	525	xã	Trà Hiệp
6699	21127	xa_tra_binh	525	xã	Trà Bình
6700	21130	xa_tra_phu	525	xã	Trà Phú
6701	21133	xa_tra_lam	525	xã	Trà Lâm
6702	21136	xa_tra_tan	525	xã	Trà Tân
6703	21139	xa_tra_son	525	xã	Trà Sơn
6704	21142	xa_tra_bui	525	xã	Trà Bùi
6705	21145	xa_tra_thanh	525	xã	Trà Thanh
6706	21148	xa_son_tra	525	xã	Sơn Trà
6707	21154	xa_tra_phong	525	xã	Trà Phong
6708	21157	xa_huong_tra	525	xã	Hương Trà
6709	21163	xa_tra_xinh	525	xã	Trà Xinh
6710	21166	xa_tra_tay	525	xã	Trà Tây
6711	21175	xa_tinh_tho	527	xã	Tịnh Thọ
6712	21178	xa_tinh_tra	527	xã	Tịnh Trà
6713	21181	xa_tinh_phong	527	xã	Tịnh Phong
6714	21184	xa_tinh_hiep	527	xã	Tịnh Hiệp
6715	21193	xa_tinh_binh	527	xã	Tịnh Bình
6716	21196	xa_tinh_dong	527	xã	Tịnh Đông
6717	21205	xa_tinh_bac	527	xã	Tịnh Bắc
6718	21217	xa_tinh_son	527	xã	Tịnh Sơn
6719	21220	xa_tinh_ha	527	xã	Tịnh Hà
6720	21226	xa_tinh_giang	527	xã	Tịnh Giang
6721	21229	xa_tinh_minh	527	xã	Tịnh Minh
6722	21235	thi_tran_la_ha	528	thị trấn	La Hà
6723	21238	thi_tran_song_ve	528	thị trấn	Sông Vệ
6724	21241	xa_nghia_lam	528	xã	Nghĩa Lâm
6725	21244	xa_nghia_thang	528	xã	Nghĩa Thắng
6726	21247	xa_nghia_thuan	528	xã	Nghĩa Thuận
6727	21250	xa_nghia_ky	528	xã	Nghĩa Kỳ
6728	21259	xa_nghia_son	528	xã	Nghĩa Sơn
6729	21268	xa_nghia_hoa	528	xã	Nghĩa Hòa
6730	21271	xa_nghia_dien	528	xã	Nghĩa Điền
6731	21274	xa_nghia_thuong	528	xã	Nghĩa Thương
6732	21277	xa_nghia_trung	528	xã	Nghĩa Trung
6733	21280	xa_nghia_hiep	528	xã	Nghĩa Hiệp
6734	21283	xa_nghia_phuong	528	xã	Nghĩa Phương
6735	21286	xa_nghia_my	528	xã	Nghĩa Mỹ
6736	21289	thi_tran_di_lang	529	thị trấn	Di Lăng
6737	21292	xa_son_ha	529	xã	Sơn Hạ
6738	21295	xa_son_thanh	529	xã	Sơn Thành
6739	21298	xa_son_nham	529	xã	Sơn Nham
6740	21301	xa_son_bao	529	xã	Sơn Bao
6741	21304	xa_son_linh	529	xã	Sơn Linh
6742	21307	xa_son_giang	529	xã	Sơn Giang
6743	21310	xa_son_trung	529	xã	Sơn Trung
6744	21313	xa_son_thuong	529	xã	Sơn Thượng
6745	21316	xa_son_cao	529	xã	Sơn Cao
6746	21319	xa_son_hai	529	xã	Sơn Hải
6747	21322	xa_son_thuy	529	xã	Sơn Thủy
6748	21325	xa_son_ky	529	xã	Sơn Kỳ
6749	21328	xa_son_ba	529	xã	Sơn Ba
6750	21331	xa_son_bua	530	xã	Sơn Bua
6751	21334	xa_son_mua	530	xã	Sơn Mùa
6752	21335	xa_son_lien	530	xã	Sơn Liên
6753	21337	xa_son_tan	530	xã	Sơn Tân
6754	21338	xa_son_mau	530	xã	Sơn Màu
6755	21340	xa_son_dung	530	xã	Sơn Dung
6756	21341	xa_son_long	530	xã	Sơn Long
6757	21343	xa_son_tinh	530	xã	Sơn Tinh
6758	21346	xa_son_lap	530	xã	Sơn Lập
6759	21349	xa_long_son	531	xã	Long Sơn
6760	21352	xa_long_mai	531	xã	Long Mai
6761	21355	xa_thanh_an	531	xã	Thanh An
6762	21358	xa_long_mon	531	xã	Long Môn
6763	21361	xa_long_hiep	531	xã	Long Hiệp
6764	21364	thi_tran_cho_chua	532	thị trấn	Chợ Chùa
6765	21367	xa_hanh_thuan	532	xã	Hành Thuận
6766	21370	xa_hanh_dung	532	xã	Hành Dũng
6767	21373	xa_hanh_trung	532	xã	Hành Trung
6768	21376	xa_hanh_nhan	532	xã	Hành Nhân
6769	21379	xa_hanh_duc	532	xã	Hành Đức
6770	21382	xa_hanh_minh	532	xã	Hành Minh
6771	21385	xa_hanh_phuoc	532	xã	Hành Phước
6772	21388	xa_hanh_thien	532	xã	Hành Thiện
6773	21391	xa_hanh_thinh	532	xã	Hành Thịnh
6774	21394	xa_hanh_tin_tay	532	xã	Tín Tây
6775	21397	xa_hanh_tin_dong	532	xã	Tín Đông
6776	21400	thi_tran_mo_duc	533	thị trấn	Mộ Đức
6777	21403	xa_duc_loi	533	xã	Đức Lợi
6778	21406	xa_duc_thang	533	xã	Đức Thắng
6779	21409	xa_duc_nhuan	533	xã	Đức Nhuận
6780	21412	xa_duc_chanh	533	xã	Đức Chánh
6781	21415	xa_duc_hiep	533	xã	Đức Hiệp
6782	21418	xa_duc_minh	533	xã	Đức Minh
6783	21421	xa_duc_thanh	533	xã	Đức Thạnh
6784	21424	xa_duc_hoa	533	xã	Đức Hòa
6785	21427	xa_duc_tan	533	xã	Đức Tân
6786	21430	xa_duc_phu	533	xã	Đức Phú
6787	21433	xa_duc_phong	533	xã	Đức Phong
6788	21436	xa_duc_lan	533	xã	Đức Lân
6789	21439	phuong_nguyen_nghiem	534	phường	Nguyễn Nghiêm
6790	21442	xa_pho_an	534	xã	Phổ An
6791	21445	xa_pho_phong	534	xã	Phổ Phong
6792	21448	xa_pho_thuan	534	xã	Phổ Thuận
6793	21451	phuong_pho_van	534	phường	Phổ Văn
6794	21454	phuong_pho_quang	534	phường	Phổ Quang
6795	21457	xa_pho_nhon	534	xã	Phổ Nhơn
6796	21460	phuong_pho_ninh	534	phường	Phổ Ninh
6797	21463	phuong_pho_minh	534	phường	Phổ Minh
6798	21466	phuong_pho_vinh	534	phường	Phổ Vinh
6799	21469	phuong_pho_hoa	534	phường	Phổ Hòa
6800	21472	xa_pho_cuong	534	xã	Phổ Cường
6801	21475	xa_pho_khanh	534	xã	Phổ Khánh
6802	21478	phuong_pho_thanh	534	phường	Phổ Thạnh
6803	21481	xa_pho_chau	534	xã	Phổ Châu
6804	21484	thi_tran_ba_to	535	thị trấn	Ba Tơ
6805	21487	xa_ba_dien	535	xã	Ba Điền
6806	21490	xa_ba_vinh	535	xã	Ba Vinh
6807	21493	xa_ba_thanh	535	xã	Ba Thành
6808	21496	xa_ba_dong	535	xã	Ba Động
6809	21499	xa_ba_dinh	535	xã	Ba Dinh
6810	21500	xa_ba_giang	535	xã	Ba Giang
6811	21502	xa_ba_lien	535	xã	Ba Liên
6812	21505	xa_ba_ngac	535	xã	Ba Ngạc
6813	21508	xa_ba_kham	535	xã	Ba Khâm
6814	21511	xa_ba_cung	535	xã	Ba Cung
6815	21517	xa_ba_tieu	535	xã	Ba Tiêu
6816	21520	xa_ba_trang	535	xã	Ba Trang
6817	21523	xa_ba_to	535	xã	Ba Tô
6818	21526	xa_ba_bich	535	xã	Ba Bích
6819	21529	xa_ba_vi	535	xã	Ba Vì
6820	21532	xa_ba_le	535	xã	Ba Lế
6821	21535	xa_ba_nam	535	xã	Ba Nam
6822	21538	xa_ba_xa	535	xã	Ba Xa
6823	21550	phuong_nhon_binh	540	phường	Nhơn Bình
6824	21553	phuong_nhon_phu	540	phường	Nhơn Phú
6825	21556	phuong_dong_da	540	phường	Đống Đa
6826	21559	phuong_tran_quang_dieu	540	phường	Quang Diệu
6827	21562	phuong_hai_cang	540	phường	Hải Cảng
6828	21565	phuong_quang_trung	540	phường	Quang Trung
6829	21568	phuong_thi_nai	540	phường	Thị Nại
6830	21571	phuong_le_hong_phong	540	phường	Hồng Phong
6831	21574	phuong_tran_hung_dao	540	phường	Hưng Đạo
6832	21577	phuong_ngo_may	540	phường	Ngô Mây
6833	21580	phuong_ly_thuong_kiet	540	phường	Thường Kiệt
6834	21583	phuong_le_loi	540	phường	Lê Lợi
6835	21586	phuong_tran_phu	540	phường	Trần Phú
6836	21589	phuong_bui_thi_xuan	540	phường	Thị Xuân
6837	21592	phuong_nguyen_van_cu	540	phường	Văn Cừ
6838	21595	phuong_ghenh_rang	540	phường	Ghềnh Ráng
6839	21598	xa_nhon_ly	540	xã	Nhơn Lý
6840	21601	xa_nhon_hoi	540	xã	Nhơn Hội
6841	21604	xa_nhon_hai	540	xã	Nhơn Hải
6842	21607	xa_nhon_chau	540	xã	Nhơn Châu
6843	21991	xa_phuoc_my	540	xã	Phước Mỹ
6844	21609	thi_tran_an_lao	542	thị trấn	An Lão
6845	21610	xa_an_hung	542	xã	An Hưng
6846	21613	xa_an_trung	542	xã	An Trung
6847	21616	xa_an_dung	542	xã	An Dũng
6848	21619	xa_an_vinh	542	xã	An Vinh
6849	21622	xa_an_toan	542	xã	An Toàn
6850	21625	xa_an_tan	542	xã	An Tân
6851	21628	xa_an_hoa	542	xã	An Hòa
6852	21631	xa_an_quang	542	xã	An Quang
6853	21634	xa_an_nghia	542	xã	An Nghĩa
6854	21637	phuong_tam_quan	543	phường	Tam Quan
6855	21640	phuong_bong_son	543	phường	Bồng Sơn
6856	21643	xa_hoai_son	543	xã	Hoài Sơn
6857	21646	xa_hoai_chau_bac	543	xã	Châu Bắc
6858	21649	xa_hoai_chau	543	xã	Hoài Châu
6859	21652	xa_hoai_phu	543	xã	Hoài Phú
6860	21655	phuong_tam_quan_bac	543	phường	Quan Bắc
6861	21658	phuong_tam_quan_nam	543	phường	Quan Nam
6862	21661	phuong_hoai_hao	543	phường	Hoài Hảo
6863	21664	phuong_hoai_thanh_tay	543	phường	Thanh Tây
6864	21667	phuong_hoai_thanh	543	phường	Hoài Thanh
6865	21670	phuong_hoai_huong	543	phường	Hoài Hương
6866	21673	phuong_hoai_tan	543	phường	Hoài Tân
6867	21676	xa_hoai_hai	543	xã	Hoài Hải
6868	21679	phuong_hoai_xuan	543	phường	Hoài Xuân
6869	21682	xa_hoai_my	543	xã	Hoài Mỹ
6870	21685	phuong_hoai_duc	543	phường	Hoài Đức
6871	21688	thi_tran_tang_bat_ho	544	thị trấn	Bạt Hổ
6872	21690	xa_an_hao_tay	544	xã	Hảo Tây
6873	21691	xa_an_hao_dong	544	xã	Hảo Đông
6874	21694	xa_an_son	544	xã	Ân Sơn
6875	21697	xa_an_my	544	xã	Ân Mỹ
6876	21700	xa_dak_mang	544	xã	Đak Mang
6877	21703	xa_an_tin	544	xã	Ân Tín
6878	21706	xa_an_thanh	544	xã	Ân Thạnh
6879	21709	xa_an_phong	544	xã	Ân Phong
6880	21712	xa_an_duc	544	xã	Ân Đức
6881	21715	xa_an_huu	544	xã	Ân Hữu
6882	21718	xa_bok_toi	544	xã	Bok Tới
6883	21721	xa_an_tuong_tay	544	xã	Tường Tây
6884	21724	xa_an_tuong_dong	544	xã	Tường Đông
6885	21727	xa_an_nghia	544	xã	Ân Nghĩa
6886	21730	thi_tran_phu_my	545	thị trấn	Phù Mỹ
6887	21733	thi_tran_binh_duong	545	thị trấn	Bình Dương
6888	21736	xa_my_duc	545	xã	Mỹ Đức
6889	21739	xa_my_chau	545	xã	Mỹ Châu
6890	21742	xa_my_thang	545	xã	Mỹ Thắng
6891	21745	xa_my_loc	545	xã	Mỹ Lộc
6892	21748	xa_my_loi	545	xã	Mỹ Lợi
6893	21751	xa_my_an	545	xã	Mỹ An
6894	21754	xa_my_phong	545	xã	Mỹ Phong
6895	21757	xa_my_trinh	545	xã	Mỹ Trinh
6896	21760	xa_my_tho	545	xã	Mỹ Thọ
6897	21763	xa_my_hoa	545	xã	Mỹ Hòa
6898	21766	xa_my_thanh	545	xã	Mỹ Thành
6899	21769	xa_my_chanh	545	xã	Mỹ Chánh
6900	21772	xa_my_quang	545	xã	Mỹ Quang
6901	21775	xa_my_hiep	545	xã	Mỹ Hiệp
6902	21778	xa_my_tai	545	xã	Mỹ Tài
6903	21781	xa_my_cat	545	xã	Mỹ Cát
6904	21784	xa_my_chanh_tay	545	xã	Chánh Tây
6905	21786	thi_tran_vinh_thanh	546	thị trấn	Vĩnh Thạnh
6906	21787	xa_vinh_son	546	xã	Vĩnh Sơn
6907	21790	xa_vinh_kim	546	xã	Vĩnh Kim
6908	21796	xa_vinh_hiep	546	xã	Vĩnh Hiệp
6909	21799	xa_vinh_hao	546	xã	Vĩnh Hảo
6910	21801	xa_vinh_hoa	546	xã	Vĩnh Hòa
6911	21802	xa_vinh_thinh	546	xã	Vĩnh Thịnh
6912	21804	xa_vinh_thuan	546	xã	Vĩnh Thuận
6913	21805	xa_vinh_quang	546	xã	Vĩnh Quang
6914	21808	thi_tran_phu_phong	547	thị trấn	Phú Phong
6915	21811	xa_binh_tan	547	xã	Bình Tân
6916	21814	xa_tay_thuan	547	xã	Tây Thuận
6917	21817	xa_binh_thuan	547	xã	Bình Thuận
6918	21820	xa_tay_giang	547	xã	Tây Giang
6919	21823	xa_binh_thanh	547	xã	Bình Thành
6920	21826	xa_tay_an	547	xã	Tây An
6921	21829	xa_binh_hoa	547	xã	Bình Hòa
6922	21832	xa_tay_binh	547	xã	Tây Bình
6923	21835	xa_binh_tuong	547	xã	Bình Tường
6924	21838	xa_tay_vinh	547	xã	Tây Vinh
6925	21841	xa_vinh_an	547	xã	Vĩnh An
6926	21844	xa_tay_xuan	547	xã	Tây Xuân
6927	21847	xa_binh_nghi	547	xã	Bình Nghi
6928	21850	xa_tay_phu	547	xã	Tây Phú
6929	21853	thi_tran_ngo_may	548	thị trấn	Ngô Mây
6930	21856	xa_cat_son	548	xã	Cát Sơn
6931	21859	xa_cat_minh	548	xã	Cát Minh
6932	21862	xa_cat_khanh	548	xã	Cát Khánh
6933	21865	xa_cat_tai	548	xã	Cát Tài
6934	21868	xa_cat_lam	548	xã	Cát Lâm
6935	21871	xa_cat_hanh	548	xã	Cát Hanh
6936	21874	xa_cat_thanh	548	xã	Cát Thành
6937	21877	xa_cat_trinh	548	xã	Cát Trinh
6938	21880	xa_cat_hai	548	xã	Cát Hải
6939	21883	xa_cat_hiep	548	xã	Cát Hiệp
6940	21886	xa_cat_nhon	548	xã	Cát Nhơn
6941	21889	xa_cat_hung	548	xã	Cát Hưng
6942	21892	xa_cat_tuong	548	xã	Cát Tường
6943	21895	xa_cat_tan	548	xã	Cát Tân
6944	21898	thi_tran_cat_tien	548	thị trấn	Cát Tiến
6945	21901	xa_cat_thang	548	xã	Cát Thắng
6946	21904	xa_cat_chanh	548	xã	Cát Chánh
6947	21907	phuong_binh_dinh	549	phường	Bình Định
6948	21910	phuong_dap_da	549	phường	Đập Đá
6949	21913	xa_nhon_my	549	xã	Nhơn Mỹ
6950	21916	phuong_nhon_thanh	549	phường	Nhơn Thành
6951	21919	xa_nhon_hanh	549	xã	Nhơn Hạnh
6952	21922	xa_nhon_hau	549	xã	Nhơn Hậu
6953	21925	xa_nhon_phong	549	xã	Nhơn Phong
6954	21928	xa_nhon_an	549	xã	Nhơn An
6955	21931	xa_nhon_phuc	549	xã	Nhơn Phúc
6956	21934	phuong_nhon_hung	549	phường	Nhơn Hưng
6957	21937	xa_nhon_khanh	549	xã	Nhơn Khánh
6958	21940	xa_nhon_loc	549	xã	Nhơn Lộc
6959	21943	phuong_nhon_hoa	549	phường	Nhơn Hoà
6960	21946	xa_nhon_tan	549	xã	Nhơn Tân
6961	21949	xa_nhon_tho	549	xã	Nhơn Thọ
6962	21952	thi_tran_tuy_phuoc	550	thị trấn	Tuy Phước
6963	21955	thi_tran_dieu_tri	550	thị trấn	Diêu Trì
6964	21958	xa_phuoc_thang	550	xã	Phước Thắng
6965	21961	xa_phuoc_hung	550	xã	Phước Hưng
6966	21964	xa_phuoc_quang	550	xã	Phước Quang
6967	21967	xa_phuoc_hoa	550	xã	Phước Hòa
6968	21970	xa_phuoc_son	550	xã	Phước Sơn
6969	21973	xa_phuoc_hiep	550	xã	Phước Hiệp
6970	21976	xa_phuoc_loc	550	xã	Phước Lộc
6971	21979	xa_phuoc_nghia	550	xã	Phước Nghĩa
6972	21982	xa_phuoc_thuan	550	xã	Phước Thuận
6973	21985	xa_phuoc_an	550	xã	Phước An
6974	21988	xa_phuoc_thanh	550	xã	Phước Thành
6975	21994	thi_tran_van_canh	551	thị trấn	Vân Canh
6976	21997	xa_canh_lien	551	xã	Canh Liên
6977	22000	xa_canh_hiep	551	xã	Canh Hiệp
6978	22003	xa_canh_vinh	551	xã	Canh Vinh
6979	22006	xa_canh_hien	551	xã	Canh Hiển
6980	22009	xa_canh_thuan	551	xã	Canh Thuận
6981	22012	xa_canh_hoa	551	xã	Canh Hòa
6982	22015	phuong_1	555	phường	Phường 1
6983	22018	phuong_8	555	phường	Phường 8
6984	22021	phuong_2	555	phường	Phường 2
6985	22024	phuong_9	555	phường	Phường 9
6986	22027	phuong_3	555	phường	Phường 3
6987	22030	phuong_4	555	phường	Phường 4
6988	22033	phuong_5	555	phường	Phường 5
6989	22036	phuong_7	555	phường	Phường 7
6990	22039	phuong_6	555	phường	Phường 6
6991	22040	phuong_phu_thanh	555	phường	Phú Thạnh
6992	22041	phuong_phu_dong	555	phường	Phú Đông
6993	22042	xa_hoa_kien	555	xã	Hòa Kiến
6994	22045	xa_binh_kien	555	xã	Bình Kiến
6995	22048	xa_binh_ngoc	555	xã	Bình Ngọc
6996	22162	xa_an_phu	555	xã	An Phú
6997	22240	phuong_phu_lam	555	phường	Phú Lâm
6998	22051	phuong_xuan_phu	557	phường	Xuân Phú
6999	22052	xa_xuan_lam	557	xã	Xuân Lâm
7000	22053	phuong_xuan_thanh	557	phường	Xuân Thành
7001	22054	xa_xuan_hai	557	xã	Xuân Hải
7002	22057	xa_xuan_loc	557	xã	Xuân Lộc
7003	22060	xa_xuan_binh	557	xã	Xuân Bình
7004	22066	xa_xuan_canh	557	xã	Xuân Cảnh
7005	22069	xa_xuan_thinh	557	xã	Xuân Thịnh
7006	22072	xa_xuan_phuong	557	xã	Xuân Phương
7007	22073	phuong_xuan_yen	557	phường	Xuân Yên
7008	22075	xa_xuan_tho_1	557	xã	Xuân Thọ 1
7009	22076	phuong_xuan_dai	557	phường	Xuân Đài
7010	22078	xa_xuan_tho_2	557	xã	Xuân Thọ 2
7011	22081	thi_tran_la_hai	558	thị trấn	La Hai
7012	22084	xa_da_loc	558	xã	Đa Lộc
7013	22087	xa_phu_mo	558	xã	Phú Mỡ
7014	22090	xa_xuan_lanh	558	xã	Xuân Lãnh
7015	22093	xa_xuan_long	558	xã	Xuân Long
7016	22096	xa_xuan_quang_1	558	xã	Xuân Quang 1
7017	22099	xa_xuan_son_bac	558	xã	Sơn Bắc
7018	22102	xa_xuan_quang_2	558	xã	Xuân Quang 2
7019	22105	xa_xuan_son_nam	558	xã	Sơn Nam
7020	22108	xa_xuan_quang_3	558	xã	Xuân Quang 3
7021	22111	xa_xuan_phuoc	558	xã	Xuân Phước
7022	22114	thi_tran_chi_thanh	559	thị trấn	Chí Thạnh
7023	22117	xa_an_dan	559	xã	An Dân
7024	22120	xa_an_ninh_tay	559	xã	Ninh Tây
7025	22123	xa_an_ninh_dong	559	xã	Ninh Đông
7026	22126	xa_an_thach	559	xã	An Thạch
7027	22129	xa_an_dinh	559	xã	An Định
7028	22132	xa_an_nghiep	559	xã	An Nghiệp
7029	22138	xa_an_cu	559	xã	An Cư
7030	22141	xa_an_xuan	559	xã	An Xuân
7031	22144	xa_an_linh	559	xã	An Lĩnh
7032	22147	xa_an_hoa_hai	559	xã	Hòa Hải
7033	22150	xa_an_hiep	559	xã	An Hiệp
7034	22153	xa_an_my	559	xã	An Mỹ
7035	22156	xa_an_chan	559	xã	An Chấn
7036	22159	xa_an_tho	559	xã	An Thọ
7037	22165	thi_tran_cung_son	560	thị trấn	Củng Sơn
7038	22168	xa_phuoc_tan	560	xã	Phước Tân
7039	22171	xa_son_hoi	560	xã	Sơn Hội
7040	22174	xa_son_dinh	560	xã	Sơn Định
7041	22177	xa_son_long	560	xã	Sơn Long
7042	22180	xa_ca_lui	560	xã	Cà Lúi
7043	22183	xa_son_phuoc	560	xã	Sơn Phước
7044	22186	xa_son_xuan	560	xã	Sơn Xuân
7045	22189	xa_son_nguyen	560	xã	Sơn Nguyên
7046	22192	xa_eacha_rang	560	xã	Eachà Rang
7047	22195	xa_krong_pa	560	xã	Krông Pa
7048	22198	xa_suoi_bac	560	xã	Suối Bạc
7049	22201	xa_son_ha	560	xã	Sơn Hà
7050	22204	xa_suoi_trai	560	xã	Suối Trai
7051	22207	thi_tran_hai_rieng	561	thị trấn	Hai Riêng
7052	22210	xa_ea_lam	561	xã	Ea Lâm
7053	22213	xa_duc_binh_tay	561	xã	Bình Tây
7054	22216	xa_ea_ba	561	xã	Ea Bá
7055	22219	xa_son_giang	561	xã	Sơn Giang
7056	22222	xa_duc_binh_dong	561	xã	Bình Đông
7057	22225	xa_eabar	561	xã	EaBar
7058	22228	xa_eabia	561	xã	EaBia
7059	22231	xa_eatrol	561	xã	EaTrol
7060	22234	xa_song_hinh	561	xã	Sông Hinh
7061	22237	xa_ealy	561	xã	Xã Ealy
7062	22249	xa_son_thanh_tay	562	xã	Thành Tây
7063	22250	xa_son_thanh_dong	562	xã	Thành Đông
7064	22252	xa_hoa_binh_1	562	xã	Hòa Bình 1
7065	22255	thi_tran_phu_thu	562	thị trấn	Phú Thứ
7066	22264	xa_hoa_phong	562	xã	Hòa Phong
7067	22270	xa_hoa_phu	562	xã	Hòa Phú
7068	22273	xa_hoa_tan_tay	562	xã	Tân Tây
7069	22276	xa_hoa_dong	562	xã	Hòa Đồng
7070	22285	xa_hoa_my_dong	562	xã	Mỹ Đông
7071	22288	xa_hoa_my_tay	562	xã	Mỹ Tây
7072	22294	xa_hoa_thinh	562	xã	Hòa Thịnh
7073	22303	xa_hoa_quang_bac	563	xã	Quang Bắc
7074	22306	xa_hoa_quang_nam	563	xã	Quang Nam
7075	22309	xa_hoa_hoi	563	xã	Hòa Hội
7076	22312	xa_hoa_tri	563	xã	Hòa Trị
7077	22315	xa_hoa_an	563	xã	Hòa An
7078	22318	xa_hoa_dinh_dong	563	xã	Định Đông
7079	22319	thi_tran_phu_hoa	563	thị trấn	Phú Hoà
7080	22321	xa_hoa_dinh_tay	563	xã	Định Tây
7081	22324	xa_hoa_thang	563	xã	Hòa Thắng
7082	22243	xa_hoa_thanh	564	xã	Hòa Thành
7083	22246	phuong_hoa_hiep_bac	564	phường	Hiệp Bắc
7084	22258	phuong_hoa_vinh	564	phường	Hoà Vinh
7085	22261	phuong_hoa_hiep_trung	564	phường	Hiệp Trung
7086	22267	xa_hoa_tan_dong	564	xã	Tân Đông
7087	22279	phuong_hoa_xuan_tay	564	phường	Xuân Tây
7088	22282	phuong_hoa_hiep_nam	564	phường	Hiệp Nam
7089	22291	xa_hoa_xuan_dong	564	xã	Xuân Đông
7090	22297	xa_hoa_tam	564	xã	Hòa Tâm
7091	22300	xa_hoa_xuan_nam	564	xã	Xuân Nam
7092	22327	phuong_vinh_hoa	568	phường	Vĩnh Hòa
7093	22330	phuong_vinh_hai	568	phường	Vĩnh Hải
7094	22333	phuong_vinh_phuoc	568	phường	Vĩnh Phước
7095	22336	phuong_ngoc_hiep	568	phường	Ngọc Hiệp
7096	22339	phuong_vinh_tho	568	phường	Vĩnh Thọ
7097	22342	phuong_xuong_huan	568	phường	Xương Huân
7098	22345	phuong_van_thang	568	phường	Vạn Thắng
7099	22348	phuong_van_thanh	568	phường	Vạn Thạnh
7100	22351	phuong_phuong_sai	568	phường	Phương Sài
7101	22354	phuong_phuong_son	568	phường	Phương Sơn
7102	22357	phuong_phuoc_hai	568	phường	Phước Hải
7103	22360	phuong_phuoc_tan	568	phường	Phước Tân
7104	22363	phuong_loc_tho	568	phường	Lộc Thọ
7105	22366	phuong_phuoc_tien	568	phường	Phước Tiến
7106	22369	phuong_tan_lap	568	phường	Tân Lập
7107	22372	phuong_phuoc_hoa	568	phường	Phước Hòa
7108	22375	phuong_vinh_nguyen	568	phường	Vĩnh Nguyên
7109	22378	phuong_phuoc_long	568	phường	Phước Long
7110	22381	phuong_vinh_truong	568	phường	Vĩnh Trường
7111	22384	xa_vinh_luong	568	xã	Vĩnh Lương
7112	22387	xa_vinh_phuong	568	xã	Vĩnh Phương
7113	22390	xa_vinh_ngoc	568	xã	Vĩnh Ngọc
7114	22393	xa_vinh_thanh	568	xã	Vĩnh Thạnh
7115	22396	xa_vinh_trung	568	xã	Vĩnh Trung
7116	22399	xa_vinh_hiep	568	xã	Vĩnh Hiệp
7117	22402	xa_vinh_thai	568	xã	Vĩnh Thái
7118	22405	xa_phuoc_dong	568	xã	Phước Đồng
7119	22408	phuong_cam_nghia	569	phường	Cam Nghĩa
7120	22411	phuong_cam_phuc_bac	569	phường	Phúc Bắc
7121	22414	phuong_cam_phuc_nam	569	phường	Phúc Nam
7122	22417	phuong_cam_loc	569	phường	Cam Lộc
7123	22420	phuong_cam_phu	569	phường	Cam Phú
7124	22423	phuong_ba_ngoi	569	phường	Ba Ngòi
7125	22426	phuong_cam_thuan	569	phường	Cam Thuận
7126	22429	phuong_cam_loi	569	phường	Cam Lợi
7127	22432	phuong_cam_linh	569	phường	Cam Linh
7128	22468	xa_cam_thanh_nam	569	xã	Thành Nam
7129	22474	xa_cam_phuoc_dong	569	xã	Phước Đông
7130	22477	xa_cam_thinh_tay	569	xã	Thịnh Tây
7131	22480	xa_cam_thinh_dong	569	xã	Thịnh Đông
7132	22483	xa_cam_lap	569	xã	Cam Lập
7133	22486	xa_cam_binh	569	xã	Cam Bình
7134	22435	xa_cam_tan	570	xã	Cam Tân
7135	22438	xa_cam_hoa	570	xã	Cam Hòa
7136	22441	xa_cam_hai_dong	570	xã	Hải Đông
7137	22444	xa_cam_hai_tay	570	xã	Hải Tây
7138	22447	xa_son_tan	570	xã	Sơn Tân
7139	22450	xa_cam_hiep_bac	570	xã	Hiệp Bắc
7140	22453	thi_tran_cam_duc	570	thị trấn	Cam Đức
7141	22456	xa_cam_hiep_nam	570	xã	Hiệp Nam
7142	22459	xa_cam_phuoc_tay	570	xã	Phước Tây
7143	22462	xa_cam_thanh_bac	570	xã	Thành Bắc
7144	22465	xa_cam_an_bac	570	xã	An Bắc
7145	22471	xa_cam_an_nam	570	xã	An Nam
7146	22708	xa_suoi_cat	570	xã	Suối Cát
7147	22711	xa_suoi_tan	570	xã	Suối Tân
7148	22489	thi_tran_van_gia	571	thị trấn	Vạn Giã
7149	22492	xa_dai_lanh	571	xã	Đại Lãnh
7150	22495	xa_van_phuoc	571	xã	Vạn Phước
7151	22498	xa_van_long	571	xã	Vạn Long
7152	22501	xa_van_binh	571	xã	Vạn Bình
7153	22504	xa_van_tho	571	xã	Vạn Thọ
7154	22507	xa_van_khanh	571	xã	Vạn Khánh
7155	22510	xa_van_phu	571	xã	Vạn Phú
7156	22513	xa_van_luong	571	xã	Vạn Lương
7157	22516	xa_van_thang	571	xã	Vạn Thắng
7158	22519	xa_van_thanh	571	xã	Vạn Thạnh
7159	22522	xa_xuan_son	571	xã	Xuân Sơn
7160	22525	xa_van_hung	571	xã	Vạn Hưng
7161	22528	phuong_ninh_hiep	572	phường	Ninh Hiệp
7162	22531	xa_ninh_son	572	xã	Ninh Sơn
7163	22534	xa_ninh_tay	572	xã	Ninh Tây
7164	22537	xa_ninh_thuong	572	xã	Ninh Thượng
7165	22540	xa_ninh_an	572	xã	Ninh An
7166	22543	phuong_ninh_hai	572	phường	Ninh Hải
7167	22546	xa_ninh_tho	572	xã	Ninh Thọ
7168	22549	xa_ninh_trung	572	xã	Ninh Trung
7169	22552	xa_ninh_sim	572	xã	Ninh Sim
7170	22555	xa_ninh_xuan	572	xã	Ninh Xuân
7171	22558	xa_ninh_than	572	xã	Ninh Thân
7172	22561	phuong_ninh_diem	572	phường	Ninh Diêm
7173	22564	xa_ninh_dong	572	xã	Ninh Đông
7174	22567	phuong_ninh_thuy	572	phường	Ninh Thủy
7175	22570	phuong_ninh_da	572	phường	Ninh Đa
7176	22573	xa_ninh_phung	572	xã	Ninh Phụng
7177	22576	xa_ninh_binh	572	xã	Ninh Bình
7178	22579	xa_ninh_phuoc	572	xã	Ninh Phước
7179	22582	xa_ninh_phu	572	xã	Ninh Phú
7180	22585	xa_ninh_tan	572	xã	Ninh Tân
7181	22588	xa_ninh_quang	572	xã	Ninh Quang
7182	22591	phuong_ninh_giang	572	phường	Ninh Giang
7183	22594	phuong_ninh_ha	572	phường	Ninh Hà
7184	22597	xa_ninh_hung	572	xã	Ninh Hưng
7185	22600	xa_ninh_loc	572	xã	Ninh Lộc
7186	22603	xa_ninh_ich	572	xã	Ninh Ích
7187	22606	xa_ninh_van	572	xã	Ninh Vân
7188	22609	thi_tran_khanh_vinh	573	thị trấn	Khánh Vĩnh
7189	22612	xa_khanh_hiep	573	xã	Khánh Hiệp
7190	22615	xa_khanh_binh	573	xã	Khánh Bình
7191	22618	xa_khanh_trung	573	xã	Khánh Trung
7192	22621	xa_khanh_dong	573	xã	Khánh Đông
7193	22624	xa_khanh_thuong	573	xã	Khánh Thượng
7194	22627	xa_khanh_nam	573	xã	Khánh Nam
7195	22630	xa_song_cau	573	xã	Sông Cầu
7196	22633	xa_giang_ly	573	xã	Giang Ly
7197	22636	xa_cau_ba	573	xã	Cầu Bà
7198	22639	xa_lien_sang	573	xã	Liên Sang
7199	22642	xa_khanh_thanh	573	xã	Khánh Thành
7200	22645	xa_khanh_phu	573	xã	Khánh Phú
7201	22648	xa_son_thai	573	xã	Sơn Thái
7202	22651	thi_tran_dien_khanh	574	thị trấn	Diên Khánh
7203	22654	xa_dien_lam	574	xã	Diên Lâm
7204	22657	xa_dien_dien	574	xã	Diên Điền
7205	22660	xa_dien_xuan	574	xã	Diên Xuân
7206	22663	xa_dien_son	574	xã	Diên Sơn
7207	22666	xa_dien_dong	574	xã	Diên Đồng
7208	22669	xa_dien_phu	574	xã	Diên Phú
7209	22672	xa_dien_tho	574	xã	Diên Thọ
7210	22675	xa_dien_phuoc	574	xã	Diên Phước
7211	22678	xa_dien_lac	574	xã	Diên Lạc
7212	22681	xa_dien_tan	574	xã	Diên Tân
7213	22684	xa_dien_hoa	574	xã	Diên Hòa
7214	22687	xa_dien_thanh	574	xã	Diên Thạnh
7215	22690	xa_dien_toan	574	xã	Diên Toàn
7216	22693	xa_dien_an	574	xã	Diên An
7217	22696	xa_binh_loc	574	xã	Bình Lộc
7218	22702	xa_suoi_hiep	574	xã	Suối Hiệp
7219	22705	xa_suoi_tien	574	xã	Suối Tiên
7220	22714	thi_tran_to_hap	575	thị trấn	Tô Hạp
7221	22717	xa_thanh_son	575	xã	Thành Sơn
7222	22720	xa_son_lam	575	xã	Sơn Lâm
7223	22723	xa_son_hiep	575	xã	Sơn Hiệp
7224	22726	xa_son_binh	575	xã	Sơn Bình
7225	22729	xa_son_trung	575	xã	Sơn Trung
7226	22732	xa_ba_cum_bac	575	xã	Cụm Bắc
7227	22735	xa_ba_cum_nam	575	xã	Cụm Nam
7228	22736	thi_tran_truong_sa	576	thị trấn	Trường Sa
7229	22737	xa_song_tu_tay	576	xã	Tử Tây
7230	22739	xa_sinh_ton	576	xã	Sinh Tồn
7231	22738	phuong_do_vinh	582	phường	Đô Vinh
7232	22741	phuong_phuoc_my	582	phường	Phước Mỹ
7233	22744	phuong_bao_an	582	phường	Bảo An
7234	22747	phuong_phu_ha	582	phường	Phủ Hà
7235	22750	phuong_thanh_son	582	phường	Thanh Sơn
7236	22753	phuong_my_huong	582	phường	Mỹ Hương
7237	22756	phuong_tan_tai	582	phường	Tấn Tài
7238	22759	phuong_kinh_dinh	582	phường	Kinh Dinh
7239	22762	phuong_dao_long	582	phường	Đạo Long
7240	22765	phuong_dai_son	582	phường	Đài Sơn
7241	22768	phuong_dong_hai	582	phường	Đông Hải
7242	22771	phuong_my_dong	582	phường	Mỹ Đông
7243	22774	xa_thanh_hai	582	xã	Thành Hải
7244	22777	phuong_van_hai	582	phường	Văn Hải
7245	22779	phuong_my_binh	582	phường	Mỹ Bình
7246	22780	phuong_my_hai	582	phường	Mỹ Hải
7247	22783	xa_phuoc_binh	584	xã	Phước Bình
7248	22786	xa_phuoc_hoa	584	xã	Phước Hòa
7249	22789	xa_phuoc_tan	584	xã	Phước Tân
7250	22792	xa_phuoc_tien	584	xã	Phước Tiến
7251	22795	xa_phuoc_thang	584	xã	Phước Thắng
7252	22798	xa_phuoc_thanh	584	xã	Phước Thành
7253	22801	xa_phuoc_dai	584	xã	Phước Đại
7254	22804	xa_phuoc_chinh	584	xã	Phước Chính
7255	22807	xa_phuoc_trung	584	xã	Phước Trung
7256	22810	thi_tran_tan_son	585	thị trấn	Tân Sơn
7257	22813	xa_lam_son	585	xã	Lâm Sơn
7258	22816	xa_luong_son	585	xã	Lương Sơn
7259	22819	xa_quang_son	585	xã	Quảng Sơn
7260	22822	xa_my_son	585	xã	Mỹ Sơn
7261	22825	xa_hoa_son	585	xã	Hòa Sơn
7262	22828	xa_ma_noi	585	xã	Ma Nới
7263	22831	xa_nhon_son	585	xã	Nhơn Sơn
7264	22834	thi_tran_khanh_hai	586	thị trấn	Khánh Hải
7265	22846	xa_vinh_hai	586	xã	Vĩnh Hải
7266	22852	xa_phuong_hai	586	xã	Phương Hải
7267	22855	xa_tan_hai	586	xã	Tân Hải
7268	22858	xa_xuan_hai	586	xã	Xuân Hải
7269	22861	xa_ho_hai	586	xã	Hộ Hải
7270	22864	xa_tri_hai	586	xã	Tri Hải
7271	22867	xa_nhon_hai	586	xã	Nhơn Hải
7272	22868	xa_thanh_hai	586	xã	Thanh Hải
7273	22870	thi_tran_phuoc_dan	587	thị trấn	Phước Dân
7274	22873	xa_phuoc_son	587	xã	Phước Sơn
7275	22876	xa_phuoc_thai	587	xã	Phước Thái
7276	22879	xa_phuoc_hau	587	xã	Phước Hậu
7277	22882	xa_phuoc_thuan	587	xã	Phước Thuận
7278	22888	xa_an_hai	587	xã	An Hải
7279	22891	xa_phuoc_huu	587	xã	Phước Hữu
7280	22894	xa_phuoc_hai	587	xã	Phước Hải
7281	22912	xa_phuoc_vinh	587	xã	Phước Vinh
7282	22837	xa_phuoc_chien	588	xã	Phước Chiến
7283	22840	xa_cong_hai	588	xã	Công Hải
7284	22843	xa_phuoc_khang	588	xã	Phước Kháng
7285	22849	xa_loi_hai	588	xã	Lợi Hải
7286	22853	xa_bac_son	588	xã	Bắc Sơn
7287	22856	xa_bac_phong	588	xã	Bắc Phong
7288	22885	xa_phuoc_ha	589	xã	Phước Hà
7289	22897	xa_phuoc_nam	589	xã	Phước Nam
7290	22898	xa_phuoc_ninh	589	xã	Phước Ninh
7291	22900	xa_nhi_ha	589	xã	Nhị Hà
7292	22903	xa_phuoc_dinh	589	xã	Phước Dinh
7293	22906	xa_phuoc_minh	589	xã	Phước Minh
7294	22909	xa_phuoc_diem	589	xã	Phước Diêm
7295	22910	xa_ca_na	589	xã	Cà Ná
7296	22915	phuong_mui_ne	593	phường	Mũi Né
7297	22918	phuong_ham_tien	593	phường	Hàm Tiến
7298	22921	phuong_phu_hai	593	phường	Phú Hài
7299	22924	phuong_phu_thuy	593	phường	Phú Thủy
7300	22927	phuong_phu_tai	593	phường	Phú Tài
7301	22930	phuong_phu_trinh	593	phường	Phú Trinh
7302	22933	phuong_xuan_an	593	phường	Xuân An
7303	22936	phuong_thanh_hai	593	phường	Thanh Hải
7304	22939	phuong_binh_hung	593	phường	Bình Hưng
7305	22942	phuong_duc_nghia	593	phường	Đức Nghĩa
7306	22945	phuong_lac_dao	593	phường	Lạc Đạo
7307	22948	phuong_duc_thang	593	phường	Đức Thắng
7308	22951	phuong_hung_long	593	phường	Hưng Long
7309	22954	phuong_duc_long	593	phường	Đức Long
7310	22957	xa_thien_nghiep	593	xã	Thiện Nghiệp
7311	22960	xa_phong_nam	593	xã	Phong Nẫm
7312	22963	xa_tien_loi	593	xã	Tiến Lợi
7313	22966	xa_tien_thanh	593	xã	Tiến Thành
7314	23231	phuong_phuoc_hoi	594	phường	Phước Hội
7315	23232	phuong_phuoc_loc	594	phường	Phước Lộc
7316	23234	phuong_tan_thien	594	phường	Tân Thiện
7317	23235	phuong_tan_an	594	phường	Tân An
7318	23237	phuong_binh_tan	594	phường	Bình Tân
7319	23245	xa_tan_hai	594	xã	Tân Hải
7320	23246	xa_tan_tien	594	xã	Tân Tiến
7321	23248	xa_tan_binh	594	xã	Tân Bình
7322	23268	xa_tan_phuoc	594	xã	Tân Phước
7323	22969	thi_tran_lien_huong	595	thị trấn	Liên Hương
7324	22972	thi_tran_phan_ri_cua	595	thị trấn	Rí Cửa
7325	22975	xa_phan_dung	595	xã	Phan Dũng
7326	22978	xa_phong_phu	595	xã	Phong Phú
7327	22981	xa_vinh_hao	595	xã	Vĩnh Hảo
7328	22984	xa_vinh_tan	595	xã	Vĩnh Tân
7329	22987	xa_phu_lac	595	xã	Phú Lạc
7330	22990	xa_phuoc_the	595	xã	Phước Thể
7331	22993	xa_hoa_minh	595	xã	Hòa Minh
7332	22996	xa_chi_cong	595	xã	Chí Công
7333	22999	xa_binh_thanh	595	xã	Bình Thạnh
7334	23005	thi_tran_cho_lau	596	thị trấn	Chợ Lầu
7335	23008	xa_phan_son	596	xã	Phan Sơn
7336	23011	xa_phan_lam	596	xã	Phan Lâm
7337	23014	xa_binh_an	596	xã	Bình An
7338	23017	xa_phan_dien	596	xã	Phan Điền
7339	23020	xa_hai_ninh	596	xã	Hải Ninh
7340	23023	xa_song_luy	596	xã	Sông Lũy
7341	23026	xa_phan_tien	596	xã	Phan Tiến
7342	23029	xa_song_binh	596	xã	Sông Bình
7343	23032	thi_tran_luong_son	596	thị trấn	Lương Sơn
7344	23035	xa_phan_hoa	596	xã	Phan Hòa
7345	23038	xa_phan_thanh	596	xã	Phan Thanh
7346	23041	xa_hong_thai	596	xã	Hồng Thái
7347	23044	xa_phan_hiep	596	xã	Phan Hiệp
7348	23047	xa_binh_tan	596	xã	Bình Tân
7349	23050	xa_phan_ri_thanh	596	xã	Rí Thành
7350	23053	xa_hoa_thang	596	xã	Hòa Thắng
7351	23056	xa_hong_phong	596	xã	Hồng Phong
7352	23059	thi_tran_ma_lam	597	thị trấn	Ma Lâm
7353	23062	thi_tran_phu_long	597	thị trấn	Phú Long
7354	23065	xa_la_da	597	xã	La Dạ
7355	23068	xa_dong_tien	597	xã	Đông Tiến
7356	23071	xa_thuan_hoa	597	xã	Thuận Hòa
7357	23074	xa_dong_giang	597	xã	Đông Giang
7358	23077	xa_ham_phu	597	xã	Hàm Phú
7359	23080	xa_hong_liem	597	xã	Hồng Liêm
7360	23083	xa_thuan_minh	597	xã	Thuận Minh
7361	23086	xa_hong_son	597	xã	Hồng Sơn
7362	23089	xa_ham_tri	597	xã	Hàm Trí
7363	23092	xa_ham_duc	597	xã	Hàm Đức
7364	23095	xa_ham_liem	597	xã	Hàm Liêm
7365	23098	xa_ham_chinh	597	xã	Hàm Chính
7366	23101	xa_ham_hiep	597	xã	Hàm Hiệp
7367	23104	xa_ham_thang	597	xã	Hàm Thắng
7368	23107	xa_da_mi	597	xã	Đa Mi
7369	23110	thi_tran_thuan_nam	598	thị trấn	Thuận Nam
7370	23113	xa_my_thanh	598	xã	Mỹ Thạnh
7371	23116	xa_ham_can	598	xã	Hàm Cần
7372	23119	xa_muong_man	598	xã	Mương Mán
7373	23122	xa_ham_thanh	598	xã	Hàm Thạnh
7374	23125	xa_ham_kiem	598	xã	Hàm Kiệm
7375	23128	xa_ham_cuong	598	xã	Hàm Cường
7376	23131	xa_ham_my	598	xã	Hàm Mỹ
7377	23134	xa_tan_lap	598	xã	Tân Lập
7378	23137	xa_ham_minh	598	xã	Hàm Minh
7379	23140	xa_thuan_qui	598	xã	Thuận Quí
7380	23143	xa_tan_thuan	598	xã	Tân Thuận
7381	23146	xa_tan_thanh	598	xã	Tân Thành
7382	23149	thi_tran_lac_tanh	599	thị trấn	Lạc Tánh
7383	23152	xa_bac_ruong	599	xã	Bắc Ruộng
7384	23158	xa_nghi_duc	599	xã	Nghị Đức
7385	23161	xa_la_ngau	599	xã	La Ngâu
7386	23164	xa_huy_khiem	599	xã	Huy Khiêm
7387	23167	xa_mang_to	599	xã	Măng Tố
7388	23170	xa_duc_phu	599	xã	Đức Phú
7389	23173	xa_dong_kho	599	xã	Đồng Kho
7390	23176	xa_gia_an	599	xã	Gia An
7391	23179	xa_duc_binh	599	xã	Đức Bình
7392	23182	xa_gia_huynh	599	xã	Gia Huynh
7393	23185	xa_duc_thuan	599	xã	Đức Thuận
7394	23188	xa_suoi_kiet	599	xã	Suối Kiết
7395	23191	thi_tran_vo_xu	600	thị trấn	Võ Xu
7396	23194	thi_tran_duc_tai	600	thị trấn	Đức Tài
7397	23197	xa_da_kai	600	xã	Đa Kai
7398	23200	xa_sung_nhon	600	xã	Sùng Nhơn
7399	23203	xa_me_pu	600	xã	Mê Pu
7400	23206	xa_nam_chinh	600	xã	Nam Chính
7401	23212	xa_duc_hanh	600	xã	Đức Hạnh
7402	23215	xa_duc_tin	600	xã	Đức Tín
7403	23218	xa_vu_hoa	600	xã	Vũ Hoà
7404	23221	xa_tan_ha	600	xã	Tân Hà
7405	23224	xa_dong_ha	600	xã	Đông Hà
7406	23227	xa_tra_tan	600	xã	Trà Tân
7407	23230	thi_tran_tan_minh	601	thị trấn	Tân Minh
7408	23236	thi_tran_tan_nghia	601	thị trấn	Tân Nghĩa
7409	23239	xa_song_phan	601	xã	Sông Phan
7410	23242	xa_tan_phuc	601	xã	Tân Phúc
7411	23251	xa_tan_duc	601	xã	Tân Đức
7412	23254	xa_tan_thang	601	xã	Tân Thắng
7413	23255	xa_thang_hai	601	xã	Thắng Hải
7414	23257	xa_tan_ha	601	xã	Tân Hà
7415	23260	xa_tan_xuan	601	xã	Tân Xuân
7416	23266	xa_son_my	601	xã	Sơn Mỹ
7417	23272	xa_ngu_phung	602	xã	Ngũ Phụng
7418	23275	xa_long_hai	602	xã	Long Hải
7419	23278	xa_tam_thanh	602	xã	Tam Thanh
7420	23281	phuong_quang_trung	608	phường	Quang Trung
7421	23284	phuong_duy_tan	608	phường	Duy Tân
7422	23287	phuong_quyet_thang	608	phường	Quyết Thắng
7423	23290	phuong_truong_chinh	608	phường	Trường Chinh
7424	23293	phuong_thang_loi	608	phường	Thắng Lợi
7425	23296	phuong_ngo_may	608	phường	Ngô Mây
7426	23299	phuong_thong_nhat	608	phường	Thống Nhất
7427	23302	phuong_le_loi	608	phường	Lê Lợi
7428	23305	phuong_nguyen_trai	608	phường	Nguyễn Trãi
7429	23308	phuong_tran_hung_dao	608	phường	Hưng Đạo
7430	23311	xa_dak_cam	608	xã	Đắk Cấm
7431	23314	xa_kroong	608	xã	Xã Kroong
7432	23317	xa_ngok_bay	608	xã	Ngọk Bay
7433	23320	xa_vinh_quang	608	xã	Vinh Quang
7434	23323	xa_dak_bla	608	xã	Đắk Blà
7435	23326	xa_ia_chim	608	xã	Ia Chim
7436	23327	xa_dak_nang	608	xã	Đăk Năng
7437	23329	xa_doan_ket	608	xã	Đoàn Kết
7438	23332	xa_chu_hreng	608	xã	Chư Hreng
7439	23335	xa_dak_ro_wa	608	xã	Rơ Wa
7440	23338	xa_hoa_binh	608	xã	Hòa Bình
7441	23341	thi_tran_dak_glei	610	thị trấn	Đắk Glei
7442	23344	xa_dak_blo	610	xã	Đắk Blô
7443	23347	xa_dak_man	610	xã	Đắk Man
7444	23350	xa_dak_nhoong	610	xã	Đắk Nhoong
7445	23353	xa_dak_pek	610	xã	Đắk Pék
7446	23356	xa_dak_choong	610	xã	Đắk Choong
7447	23359	xa_xop	610	xã	Xã Xốp
7448	23362	xa_muong_hoong	610	xã	Mường Hoong
7449	23365	xa_ngoc_linh	610	xã	Ngọc Linh
7450	23368	xa_dak_long	610	xã	Đắk Long
7451	23371	xa_dak_kroong	610	xã	Đắk KRoong
7452	23374	xa_dak_mon	610	xã	Đắk Môn
7453	23377	thi_tran_plei_kan	611	thị trấn	Plei Kần
7454	23380	xa_dak_ang	611	xã	Đắk Ang
7455	23383	xa_dak_duc	611	xã	Đắk Dục
7456	23386	xa_dak_nong	611	xã	Đắk Nông
7457	23389	xa_dak_xu	611	xã	Đắk Xú
7458	23392	xa_dak_kan	611	xã	Đắk Kan
7459	23395	xa_bo_y	611	xã	Bờ Y
7460	23398	xa_sa_loong	611	xã	Sa Loong
7461	23401	thi_tran_dak_to	612	thị trấn	Đắk Tô
7462	23427	xa_dak_ro_nga	612	xã	Rơ Nga
7463	23428	xa_ngok_tu	612	xã	Ngọk Tụ
7464	23430	xa_dak_tram	612	xã	Đắk Trăm
7465	23431	xa_van_lem	612	xã	Văn Lem
7466	23434	xa_kon_dao	612	xã	Kon Đào
7467	23437	xa_tan_canh	612	xã	Tân Cảnh
7468	23440	xa_dien_binh	612	xã	Diên Bình
7469	23443	xa_po_ko	612	xã	Pô Kô
7470	23452	xa_dak_nen	613	xã	Đắk Nên
7471	23455	xa_dak_ring	613	xã	Đắk Ring
7472	23458	xa_mang_buk	613	xã	Măng Buk
7473	23461	xa_dak_tang	613	xã	Đắk Tăng
7474	23464	xa_ngok_tem	613	xã	Ngok Tem
7475	23467	xa_po_e	613	xã	Pờ Ê
7476	23470	xa_mang_canh	613	xã	Măng Cành
7477	23473	thi_tran_mang_den	613	thị trấn	Măng Đen
7478	23476	xa_hieu	613	xã	Xã Hiếu
7479	23479	thi_tran_dak_rve	614	thị trấn	Đắk Rve
7480	23482	xa_dak_koi	614	xã	Đắk Kôi
7481	23485	xa_dak_to_lung	614	xã	Tơ Lung
7482	23488	xa_dak_ruong	614	xã	Đắk Ruồng
7483	23491	xa_dak_pne	614	xã	Đắk Pne
7484	23494	xa_dak_to_re	614	xã	Tờ Re
7485	23497	xa_tan_lap	614	xã	Tân Lập
7486	23500	thi_tran_dak_ha	615	thị trấn	Đắk Hà
7487	23503	xa_dak_pxi	615	xã	Đắk PXi
7488	23504	xa_dak_long	615	xã	Đăk Long
7489	23506	xa_dak_hring	615	xã	Đắk HRing
7490	23509	xa_dak_ui	615	xã	Đắk Ui
7491	23510	xa_dak_ngok	615	xã	Đăk Ngọk
7492	23512	xa_dak_mar	615	xã	Đắk Mar
7493	23515	xa_ngok_wang	615	xã	Ngok Wang
7494	23518	xa_ngok_reo	615	xã	Ngok Réo
7495	23521	xa_ha_mon	615	xã	Hà Mòn
7496	23524	xa_dak_la	615	xã	Đắk La
7497	23527	thi_tran_sa_thay	616	thị trấn	Sa Thầy
7498	23530	xa_ro_koi	616	xã	Rơ Kơi
7499	23533	xa_sa_nhon	616	xã	Sa Nhơn
7500	23534	xa_ho_moong	616	xã	Hơ Moong
7501	23536	xa_mo_rai	616	xã	Mô Rai
7502	23539	xa_sa_son	616	xã	Sa Sơn
7503	23542	xa_sa_nghia	616	xã	Sa Nghĩa
7504	23545	xa_sa_binh	616	xã	Sa Bình
7505	23548	xa_ya_xier	616	xã	Ya Xiêr
7506	23551	xa_ya_tang	616	xã	Ya Tăng
7507	23554	xa_ya_ly	616	xã	Xã Ya ly
7508	23404	xa_ngoc_lay	617	xã	Ngọc Lây
7509	23407	xa_dak_na	617	xã	Đắk Na
7510	23410	xa_mang_ri	617	xã	Măng Ri
7511	23413	xa_ngoc_yeu	617	xã	Ngọc Yêu
7512	23416	xa_dak_sao	617	xã	Đắk Sao
7513	23417	xa_dak_ro_ong	617	xã	Rơ Ông
7514	23419	xa_dak_to_kan	617	xã	Tờ Kan
7515	23422	xa_tu_mo_rong	617	xã	Mơ Rông
7516	23425	xa_dak_ha	617	xã	Đắk Hà
7517	23446	xa_te_xang	617	xã	Tê Xăng
7518	23449	xa_van_xuoi	617	xã	Văn Xuôi
7519	23535	xa_ia_dal	618	xã	Ia Đal
7520	23537	xa_ia_dom	618	xã	Ia Dom
7521	23538	xa_ia_toi	618	xã	Ia Tơi
7522	23557	phuong_yen_do	622	phường	Yên Đỗ
7523	23560	phuong_dien_hong	622	phường	Diên Hồng
7524	23563	phuong_ia_kring	622	phường	Ia Kring
7525	23566	phuong_hoi_thuong	622	phường	Hội Thương
7526	23569	phuong_hoi_phu	622	phường	Hội Phú
7527	23570	phuong_phu_dong	622	phường	Phù Đổng
7528	23572	phuong_hoa_lu	622	phường	Hoa Lư
7529	23575	phuong_tay_son	622	phường	Tây Sơn
7530	23578	phuong_thong_nhat	622	phường	Thống Nhất
7531	23579	phuong_dong_da	622	phường	Đống Đa
7532	23581	phuong_tra_ba	622	phường	Trà Bá
7533	23582	phuong_thang_loi	622	phường	Thắng Lợi
7534	23584	phuong_yen_the	622	phường	Yên Thế
7535	23586	phuong_chi_lang	622	phường	Chi Lăng
7536	23590	xa_bien_ho	622	xã	Biển Hồ
7537	23593	xa_tan_son	622	xã	Tân Sơn
7538	23596	xa_tra_da	622	xã	Trà Đa
7539	23599	xa_chu_a	622	xã	Chư Á
7540	23602	xa_an_phu	622	xã	An Phú
7541	23605	xa_dien_phu	622	xã	Diên Phú
7542	23608	xa_ia_kenh	622	xã	Ia Kênh
7543	23611	xa_gao	622	xã	Xã Gào
7544	23614	phuong_an_binh	623	phường	An Bình
7545	23617	phuong_tay_son	623	phường	Tây Sơn
7546	23620	phuong_an_phu	623	phường	An Phú
7547	23623	phuong_an_tan	623	phường	An Tân
7548	23626	xa_tu_an	623	xã	Tú An
7549	23627	xa_xuan_an	623	xã	Xuân An
7550	23629	xa_cuu_an	623	xã	Cửu An
7551	23630	phuong_an_phuoc	623	phường	An Phước
7552	23632	xa_song_an	623	xã	Song An
7553	23633	phuong_ngo_may	623	phường	Ngô Mây
7554	23635	xa_thanh_an	623	xã	Thành An
7555	24041	phuong_cheo_reo	624	phường	Cheo Reo
7556	24042	phuong_hoa_binh	624	phường	Hòa Bình
7557	24044	phuong_doan_ket	624	phường	Đoàn Kết
7558	24045	phuong_song_bo	624	phường	Sông Bờ
7559	24064	xa_ia_rbol	624	xã	Ia RBol
7560	24065	xa_chu_bah	624	xã	Chư Băh
7561	24070	xa_ia_rto	624	xã	Ia RTô
7562	24073	xa_ia_sao	624	xã	Ia Sao
7563	23638	thi_tran_kbang	625	thị trấn	Thị trấn KBang
7564	23641	xa_kon_pne	625	xã	Kon Pne
7565	23644	xa_dak_roong	625	xã	Đăk Roong
7566	23647	xa_son_lang	625	xã	Sơn Lang
7567	23650	xa_krong	625	xã	Xã KRong
7568	23653	xa_so_pai	625	xã	Sơ Pai
7569	23656	xa_lo_ku	625	xã	Lơ Ku
7570	23659	xa_dong	625	xã	Xã Đông
7571	23660	xa_dak_smar	625	xã	Đak SMar
7572	23662	xa_nghia_an	625	xã	Nghĩa An
7573	23665	xa_to_tung	625	xã	Tơ Tung
7574	23668	xa_kong_long_khong	625	xã	Lơng Khơng
7575	23671	xa_kong_pla	625	xã	Kông Pla
7576	23674	xa_dak_hlo	625	xã	Đăk HLơ
7577	23677	thi_tran_dak_doa	626	thị trấn	Đăk Đoa
7578	23680	xa_ha_dong	626	xã	Hà Đông
7579	23683	xa_dak_somei	626	xã	Đăk Sơmei
7580	23684	xa_dak_krong	626	xã	Đăk Krong
7581	23686	xa_hai_yang	626	xã	Hải Yang
7582	23689	xa_kon_gang	626	xã	Kon Gang
7583	23692	xa_ha_bau	626	xã	Hà Bầu
7584	23695	xa_nam_yang	626	xã	Nam Yang
7585	23698	xa_k_dang	626	xã	K' Dang
7586	23701	xa_h_neng	626	xã	H' Neng
7587	23704	xa_tan_binh	626	xã	Tân Bình
7588	23707	xa_glar	626	xã	Xã Glar
7589	23710	xa_a_dok	626	xã	A Dơk
7590	23713	xa_trang	626	xã	Xã Trang
7591	23714	xa_hnol	626	xã	Xã HNol
7592	23716	xa_ia_pet	626	xã	Ia Pết
7593	23719	xa_ia_bang	626	xã	Ia Băng
7594	23722	thi_tran_phu_hoa	627	thị trấn	Phú Hòa
7595	23725	xa_ha_tay	627	xã	Hà Tây
7596	23728	xa_ia_khuol	627	xã	Ia Khươl
7597	23731	xa_ia_phi	627	xã	Ia Phí
7598	23734	thi_tran_ia_ly	627	thị trấn	Ia Ly
7599	23737	xa_ia_mo_nong	627	xã	Mơ Nông
7600	23738	xa_ia_kreng	627	xã	Ia Kreng
7601	23740	xa_dak_to_ver	627	xã	Tơ Ver
7602	23743	xa_hoa_phu	627	xã	Hòa Phú
7603	23746	xa_chu_dang_ya	627	xã	Đăng Ya
7604	23749	xa_ia_ka	627	xã	Ia Ka
7605	23752	xa_ia_nhin	627	xã	Ia Nhin
7606	23755	xa_nghia_hoa	627	xã	Nghĩa Hòa
7607	23761	xa_nghia_hung	627	xã	Nghĩa Hưng
7608	23764	thi_tran_ia_kha	628	thị trấn	Ia Kha
7609	23767	xa_ia_sao	628	xã	Ia Sao
7610	23768	xa_ia_yok	628	xã	Ia Yok
7611	23770	xa_ia_hrung	628	xã	Ia Hrung
7612	23771	xa_ia_ba	628	xã	Ia Bă
7613	23773	xa_ia_khai	628	xã	Ia Khai
7614	23776	xa_ia_krai	628	xã	Ia KRai
7615	23778	xa_ia_grang	628	xã	Ia Grăng
7616	23779	xa_ia_to	628	xã	Ia Tô
7617	23782	xa_ia_o	628	xã	Ia O
7618	23785	xa_ia_der	628	xã	Ia Dêr
7619	23788	xa_ia_chia	628	xã	Ia Chia
7620	23791	xa_ia_pech	628	xã	Ia Pếch
7621	23794	thi_tran_kon_dong	629	thị trấn	Kon Dơng
7622	23797	xa_ayun	629	xã	Xã Ayun
7623	23798	xa_dak_jo_ta	629	xã	Jơ Ta
7624	23799	xa_dak_ta_ley	629	xã	Ta Ley
7625	23800	xa_hra	629	xã	Xã Hra
7626	23803	xa_dak_ya	629	xã	Đăk Yă
7627	23806	xa_dak_djrang	629	xã	Đăk Djrăng
7628	23809	xa_lo_pang	629	xã	Lơ Pang
7629	23812	xa_kon_thup	629	xã	Kon Thụp
7630	23815	xa_de_ar	629	xã	Đê Ar
7631	23818	xa_kon_chieng	629	xã	Kon Chiêng
7632	23821	xa_dak_troi	629	xã	Đăk Trôi
7633	23824	thi_tran_kong_chro	630	thị trấn	Kông Chro
7634	23827	xa_chu_krey	630	xã	Chư Krêy
7635	23830	xa_an_trung	630	xã	An Trung
7636	23833	xa_kong_yang	630	xã	Kông Yang
7637	23836	xa_dak_to_pang	630	xã	Tơ Pang
7638	23839	xa_sro	630	xã	Xã SRó
7639	23840	xa_dak_ko_ning	630	xã	Kơ Ning
7640	23842	xa_dak_song	630	xã	Đăk Song
7641	23843	xa_dak_pling	630	xã	Đăk Pling
7642	23845	xa_yang_trung	630	xã	Yang Trung
7643	23846	xa_dak_po_pho	630	xã	Pơ Pho
7644	23848	xa_ya_ma	630	xã	Ya Ma
7645	23851	xa_cho_long	630	xã	Chơ Long
7646	23854	xa_yang_nam	630	xã	Yang Nam
7647	23857	thi_tran_chu_ty	631	thị trấn	Chư Ty
7648	23860	xa_ia_dok	631	xã	Ia Dơk
7649	23863	xa_ia_krel	631	xã	Ia Krêl
7650	23866	xa_ia_din	631	xã	Ia Din
7651	23869	xa_ia_kla	631	xã	Ia Kla
7652	23872	xa_ia_dom	631	xã	Ia Dom
7653	23875	xa_ia_lang	631	xã	Ia Lang
7654	23878	xa_ia_krieng	631	xã	Ia Kriêng
7655	23881	xa_ia_pnon	631	xã	Ia Pnôn
7656	23884	xa_ia_nan	631	xã	Ia Nan
7657	23887	thi_tran_chu_prong	632	thị trấn	Chư Prông
7658	23888	xa_ia_kly	632	xã	Ia Kly
7659	23890	xa_binh_giao	632	xã	Bình Giáo
7660	23893	xa_ia_drang	632	xã	Ia Drăng
7661	23896	xa_thang_hung	632	xã	Thăng Hưng
7662	23899	xa_bau_can	632	xã	Bàu Cạn
7663	23902	xa_ia_phin	632	xã	Ia Phìn
7664	23905	xa_ia_bang	632	xã	Ia Băng
7665	23908	xa_ia_tor	632	xã	Ia Tôr
7666	23911	xa_ia_boong	632	xã	Ia Boòng
7667	23914	xa_ia_o	632	xã	Ia O
7668	23917	xa_ia_puch	632	xã	Ia Púch
7669	23920	xa_ia_me	632	xã	Ia Me
7670	23923	xa_ia_ve	632	xã	Ia Vê
7671	23924	xa_ia_bang	632	xã	Ia Bang
7672	23926	xa_ia_pia	632	xã	Ia Pia
7673	23929	xa_ia_ga	632	xã	Ia Ga
7674	23932	xa_ia_lau	632	xã	Ia Lâu
7675	23935	xa_ia_pior	632	xã	Ia Piơr
7676	23938	xa_ia_mo	632	xã	Ia Mơ
7677	23941	thi_tran_chu_se	633	thị trấn	Chư Sê
7678	23944	xa_ia_tiem	633	xã	Ia Tiêm
7679	23945	xa_chu_pong	633	xã	Chư Pơng
7680	23946	xa_bar_maih	633	xã	Bar Măih
7681	23947	xa_bo_ngoong	633	xã	Bờ Ngoong
7682	23950	xa_ia_glai	633	xã	Ia Glai
7683	23953	xa_al_ba	633	xã	AL Bá
7684	23954	xa_kong_htok	633	xã	Kông HTok
7685	23956	xa_ayun	633	xã	Xã AYun
7686	23959	xa_ia_hlop	633	xã	Ia HLốp
7687	23962	xa_ia_blang	633	xã	Ia Blang
7688	23965	xa_dun	633	xã	Xã Dun
7689	23966	xa_ia_pal	633	xã	Ia Pal
7690	23968	xa_h_bong	633	xã	H Bông
7691	23977	xa_ia_ko	633	xã	Ia Ko
7692	23989	xa_ha_tam	634	xã	Hà Tam
7693	23992	xa_an_thanh	634	xã	An Thành
7694	23995	thi_tran_dak_po	634	thị trấn	Đak Pơ
7695	23998	xa_yang_bac	634	xã	Yang Bắc
7696	24001	xa_cu_an	634	xã	Cư An
7697	24004	xa_tan_an	634	xã	Tân An
7698	24007	xa_phu_an	634	xã	Phú An
7699	24010	xa_ya_hoi	634	xã	Ya Hội
7700	24013	xa_po_to	635	xã	Pờ Tó
7701	24016	xa_chu_rang	635	xã	Chư Răng
7702	24019	xa_ia_kdam	635	xã	Ia KDăm
7703	24022	xa_kim_tan	635	xã	Kim Tân
7704	24025	xa_chu_mo	635	xã	Chư Mố
7705	24028	xa_ia_tul	635	xã	Ia Tul
7706	24031	xa_ia_ma_ron	635	xã	Ma Rơn
7707	24034	xa_ia_broai	635	xã	Ia Broăi
7708	24037	xa_ia_trok	635	xã	Ia Trok
7709	24076	thi_tran_phu_tuc	637	thị trấn	Phú Túc
7710	24079	xa_ia_rsai	637	xã	Ia RSai
7711	24082	xa_ia_rsuom	637	xã	Ia RSươm
7712	24085	xa_chu_gu	637	xã	Chư Gu
7713	24088	xa_dat_bang	637	xã	Đất Bằng
7714	24091	xa_ia_mlah	637	xã	Ia Mláh
7715	24094	xa_chu_drang	637	xã	Chư Drăng
7716	24097	xa_phu_can	637	xã	Phú Cần
7717	24100	xa_ia_hdreh	637	xã	Ia HDreh
7718	24103	xa_ia_rmok	637	xã	Ia RMok
7719	24106	xa_chu_ngoc	637	xã	Chư Ngọc
7720	24109	xa_uar	637	xã	Xã Uar
7721	24112	xa_chu_rcam	637	xã	Chư Rcăm
7722	24115	xa_krong_nang	637	xã	Krông Năng
7723	24043	thi_tran_phu_thien	638	thị trấn	Phú Thiện
7724	24046	xa_chu_a_thai	638	xã	A Thai
7725	24048	xa_ayun_ha	638	xã	Ayun Hạ
7726	24049	xa_ia_ake	638	xã	Ia Ake
7727	24052	xa_ia_sol	638	xã	Ia Sol
7728	24055	xa_ia_piar	638	xã	Ia Piar
7729	24058	xa_ia_peng	638	xã	Ia Peng
7730	24060	xa_chroh_ponan	638	xã	Chrôh Pơnan
7731	24061	xa_ia_hiao	638	xã	Ia Hiao
7732	24067	xa_ia_yeng	638	xã	Ia Yeng
7733	23942	thi_tran_nhon_hoa	639	thị trấn	Nhơn Hoà
7734	23971	xa_ia_hru	639	xã	Ia Hrú
7735	23972	xa_ia_rong	639	xã	Ia Rong
7736	23974	xa_ia_dreng	639	xã	Ia Dreng
7737	23978	xa_ia_hla	639	xã	Ia Hla
7738	23980	xa_chu_don	639	xã	Chư Don
7739	23983	xa_ia_phang	639	xã	Ia Phang
7740	23986	xa_ia_le	639	xã	Ia Le
7741	23987	xa_ia_blu	639	xã	Ia BLứ
7742	24118	phuong_tan_lap	643	phường	Tân Lập
7743	24121	phuong_tan_hoa	643	phường	Tân Hòa
7744	24124	phuong_tan_an	643	phường	Tân An
7745	24127	phuong_thong_nhat	643	phường	Thống Nhất
7746	24130	phuong_thanh_nhat	643	phường	Thành Nhất
7747	24133	phuong_thang_loi	643	phường	Thắng Lợi
7748	24136	phuong_tan_loi	643	phường	Tân Lợi
7749	24139	phuong_thanh_cong	643	phường	Thành Công
7750	24142	phuong_tan_thanh	643	phường	Tân Thành
7751	24145	phuong_tan_tien	643	phường	Tân Tiến
7752	24148	phuong_tu_an	643	phường	Tự An
7753	24151	phuong_ea_tam	643	phường	Ea Tam
7754	24154	phuong_khanh_xuan	643	phường	Khánh Xuân
7755	24157	xa_hoa_thuan	643	xã	Hòa Thuận
7756	24160	xa_cu_ebur	643	xã	Cư ÊBur
7757	24163	xa_ea_tu	643	xã	Ea Tu
7758	24166	xa_hoa_thang	643	xã	Hòa Thắng
7759	24169	xa_ea_kao	643	xã	Ea Kao
7760	24172	xa_hoa_phu	643	xã	Hòa Phú
7761	24175	xa_hoa_khanh	643	xã	Hòa Khánh
7762	24178	xa_hoa_xuan	643	xã	Hòa Xuân
7763	24305	phuong_an_lac	644	phường	An Lạc
7764	24308	phuong_an_binh	644	phường	An Bình
7765	24311	phuong_thien_an	644	phường	Thiện An
7766	24318	phuong_dat_hieu	644	phường	Đạt Hiếu
7767	24322	phuong_doan_ket	644	phường	Đoàn Kết
7768	24325	xa_ea_blang	644	xã	Ea Blang
7769	24328	xa_ea_drong	644	xã	Ea Drông
7770	24331	phuong_thong_nhat	644	phường	Thống Nhất
7771	24332	phuong_binh_tan	644	phường	Bình Tân
7772	24334	xa_ea_sien	644	xã	Ea Siên
7773	24337	xa_binh_thuan	644	xã	Bình Thuận
7774	24340	xa_cu_bao	644	xã	Cư Bao
7775	24181	thi_tran_ea_drang	645	thị trấn	Ea Drăng
7776	24184	xa_ea_hleo	645	xã	Ea H'leo
7777	24187	xa_ea_sol	645	xã	Ea Sol
7778	24190	xa_ea_ral	645	xã	Ea Ral
7779	24193	xa_ea_wy	645	xã	Ea Wy
7780	24194	xa_cu_a_mung	645	xã	A Mung
7781	24196	xa_cu_mot	645	xã	Cư Mốt
7782	24199	xa_ea_hiao	645	xã	Ea Hiao
7783	24202	xa_ea_khal	645	xã	Ea Khal
7784	24205	xa_dlie_yang	645	xã	Dliê Yang
7785	24207	xa_ea_tir	645	xã	Ea Tir
7786	24208	xa_ea_nam	645	xã	Ea Nam
7787	24211	thi_tran_ea_sup	646	thị trấn	Ea Súp
7788	24214	xa_ia_lop	646	xã	Ia Lốp
7789	24215	xa_ia_jloi	646	xã	Ia JLơi
7790	24217	xa_ea_rok	646	xã	Ea Rốk
7791	24220	xa_ya_to_mot	646	xã	Tờ Mốt
7792	24221	xa_ia_rve	646	xã	Ia RVê
7793	24223	xa_ea_le	646	xã	Ea Lê
7794	24226	xa_cu_kbang	646	xã	Cư KBang
7795	24229	xa_ea_bung	646	xã	Ea Bung
7796	24232	xa_cu_mlan	646	xã	M'Lan
7797	24235	xa_krong_na	647	xã	Krông Na
7798	24238	xa_ea_huar	647	xã	Ea Huar
7799	24241	xa_ea_wer	647	xã	Ea Wer
7800	24244	xa_tan_hoa	647	xã	Tân Hoà
7801	24247	xa_cuor_knia	647	xã	Cuôr KNia
7802	24250	xa_ea_bar	647	xã	Ea Bar
7803	24253	xa_ea_nuol	647	xã	Ea Nuôl
7804	24256	thi_tran_ea_pok	648	thị trấn	Ea Pốk
7805	24259	thi_tran_quang_phu	648	thị trấn	Quảng Phú
7806	24262	xa_quang_tien	648	xã	Quảng Tiến
7807	24264	xa_ea_kueh	648	xã	Ea Kuêh
7808	24265	xa_ea_kiet	648	xã	Ea Kiết
7809	24268	xa_ea_tar	648	xã	Ea Tar
7810	24271	xa_cu_dlie_mnong	648	xã	Dliê M'nông
7811	24274	xa_ea_hdinh	648	xã	Ea H'đinh
7812	24277	xa_ea_tul	648	xã	Ea Tul
7813	24280	xa_ea_kpam	648	xã	Ea KPam
7814	24283	xa_ea_mdroh	648	xã	M'DRóh
7815	24286	xa_quang_hiep	648	xã	Quảng Hiệp
7816	24289	xa_cu_mgar	648	xã	Cư M'gar
7817	24292	xa_ea_drong	648	xã	D'Rơng
7818	24295	xa_ea_mnang	648	xã	Ea M'nang
7819	24298	xa_cu_sue	648	xã	Cư Suê
7820	24301	xa_cuor_dang	648	xã	Cuor Đăng
7821	24307	xa_cu_ne	649	xã	Cư Né
7822	24310	xa_chu_kbo	649	xã	Chư KBô
7823	24313	xa_cu_pong	649	xã	Cư Pơng
7824	24314	xa_ea_sin	649	xã	Ea Sin
7825	24316	xa_pong_drang	649	xã	Pơng Drang
7826	24317	xa_tan_lap	649	xã	Tân Lập
7827	24319	xa_ea_ngai	649	xã	Ea Ngai
7828	24343	thi_tran_krong_nang	650	thị trấn	Krông Năng
7829	24346	xa_dlie_ya	650	xã	ĐLiê Ya
7830	24349	xa_ea_toh	650	xã	Ea Tóh
7831	24352	xa_ea_tam	650	xã	Ea Tam
7832	24355	xa_phu_loc	650	xã	Phú Lộc
7833	24358	xa_tam_giang	650	xã	Tam Giang
7834	24359	xa_ea_puk	650	xã	Ea Puk
7835	24360	xa_ea_dah	650	xã	Ea Dăh
7836	24361	xa_ea_ho	650	xã	Ea Hồ
7837	24364	xa_phu_xuan	650	xã	Phú Xuân
7838	24367	xa_cu_klong	650	xã	Cư Klông
7839	24370	xa_ea_tan	650	xã	Ea Tân
7840	24373	thi_tran_ea_kar	651	thị trấn	Ea Kar
7841	24376	thi_tran_ea_knop	651	thị trấn	Ea Knốp
7842	24379	xa_ea_so	651	xã	Ea Sô
7843	24380	xa_ea_sar	651	xã	Ea Sar
7844	24382	xa_xuan_phu	651	xã	Xuân Phú
7845	24385	xa_cu_hue	651	xã	Cư Huê
7846	24388	xa_ea_tih	651	xã	Ea Tih
7847	24391	xa_ea_dar	651	xã	Ea Đar
7848	24394	xa_ea_kmut	651	xã	Ea Kmút
7849	24397	xa_cu_ni	651	xã	Cư Ni
7850	24400	xa_ea_pal	651	xã	Ea Păl
7851	24401	xa_cu_prong	651	xã	Cư Prông
7852	24403	xa_ea_o	651	xã	Ea Ô
7853	24404	xa_cu_elang	651	xã	Cư ELang
7854	24406	xa_cu_bong	651	xã	Cư Bông
7855	24409	xa_cu_jang	651	xã	Cư Jang
7856	24412	thi_tran_mdrak	652	thị trấn	M'Đrắk
7857	24415	xa_cu_prao	652	xã	Cư Prao
7858	24418	xa_ea_pil	652	xã	Ea Pil
7859	24421	xa_ea_lai	652	xã	Ea Lai
7860	24424	xa_ea_hmlay	652	xã	H'MLay
7861	24427	xa_krong_jing	652	xã	Krông Jing
7862	24430	xa_ea_m_doal	652	xã	M' Doal
7863	24433	xa_ea_rieng	652	xã	Ea Riêng
7864	24436	xa_cu_mta	652	xã	Cư M'ta
7865	24439	xa_cu_k_roa	652	xã	K Róa
7866	24442	xa_krong_a	652	xã	Krông Á
7867	24444	xa_cu_san	652	xã	Cư San
7868	24445	xa_ea_trang	652	xã	Ea Trang
7869	24448	thi_tran_krong_kmar	653	thị trấn	Krông Kmar
7870	24451	xa_dang_kang	653	xã	Dang Kang
7871	24454	xa_cu_kty	653	xã	Cư KTy
7872	24457	xa_hoa_thanh	653	xã	Hòa Thành
7873	24460	xa_hoa_tan	653	xã	Hòa Tân
7874	24463	xa_hoa_phong	653	xã	Hòa Phong
7875	24466	xa_hoa_le	653	xã	Hòa Lễ
7876	24469	xa_yang_reh	653	xã	Yang Reh
7877	24472	xa_ea_trul	653	xã	Ea Trul
7878	24475	xa_khue_ngoc_dien	653	xã	Ngọc Điền
7879	24478	xa_cu_pui	653	xã	Cư Pui
7880	24481	xa_hoa_son	653	xã	Hòa Sơn
7881	24484	xa_cu_dram	653	xã	Cư Drăm
7882	24487	xa_yang_mao	653	xã	Yang Mao
7883	24490	thi_tran_phuoc_an	654	thị trấn	Phước An
7884	24493	xa_krong_buk	654	xã	KRông Búk
7885	24496	xa_ea_kly	654	xã	Ea Kly
7886	24499	xa_ea_kenh	654	xã	Ea Kênh
7887	24502	xa_ea_phe	654	xã	Ea Phê
7888	24505	xa_ea_knuec	654	xã	Ea KNuec
7889	24508	xa_ea_yong	654	xã	Ea Yông
7890	24511	xa_hoa_an	654	xã	Hòa An
7891	24514	xa_ea_kuang	654	xã	Ea Kuăng
7892	24517	xa_hoa_dong	654	xã	Hòa Đông
7893	24520	xa_ea_hiu	654	xã	Ea Hiu
7894	24523	xa_hoa_tien	654	xã	Hòa Tiến
7895	24526	xa_tan_tien	654	xã	Tân Tiến
7896	24529	xa_vu_bon	654	xã	Vụ Bổn
7897	24532	xa_ea_uy	654	xã	Ea Uy
7898	24535	xa_ea_yieng	654	xã	Ea Yiêng
7899	24538	thi_tran_buon_trap	655	thị trấn	Buôn Trấp
7900	24556	xa_dray_sap	655	xã	Dray Sáp
7901	24559	xa_ea_na	655	xã	Ea Na
7902	24565	xa_ea_bong	655	xã	Ea Bông
7903	24568	xa_bang_a_drenh	655	xã	A Drênh
7904	24571	xa_dur_kmal	655	xã	Dur KMăl
7905	24574	xa_binh_hoa	655	xã	Bình Hòa
7906	24577	xa_quang_dien	655	xã	Quảng Điền
7907	24580	thi_tran_lien_son	656	thị trấn	Liên Sơn
7908	24583	xa_yang_tao	656	xã	Yang Tao
7909	24586	xa_bong_krang	656	xã	Bông Krang
7910	24589	xa_dak_lieng	656	xã	Đắk Liêng
7911	24592	xa_buon_triet	656	xã	Buôn Triết
7912	24595	xa_buon_tria	656	xã	Buôn Tría
7913	24598	xa_dak_phoi	656	xã	Đắk Phơi
7914	24601	xa_dak_nue	656	xã	Đắk Nuê
7915	24604	xa_krong_no	656	xã	Krông Nô
7916	24607	xa_nam_ka	656	xã	Nam Ka
7917	24610	xa_ea_rbin	656	xã	R'Bin
7918	24540	xa_ea_ning	657	xã	Ea Ning
7919	24541	xa_cu_e_wi	657	xã	Ê Wi
7920	24544	xa_ea_ktur	657	xã	Ea Ktur
7921	24547	xa_ea_tieu	657	xã	Ea Tiêu
7922	24550	xa_ea_bhok	657	xã	Ea BHốk
7923	24553	xa_ea_hu	657	xã	Ea Hu
7924	24561	xa_dray_bhang	657	xã	Dray Bhăng
7925	24562	xa_hoa_hiep	657	xã	Hòa Hiệp
7926	24611	phuong_nghia_duc	660	phường	Nghĩa Đức
7927	24612	phuong_nghia_thanh	660	phường	Nghĩa Thành
7928	24614	phuong_nghia_phu	660	phường	Nghĩa Phú
7929	24615	phuong_nghia_tan	660	phường	Nghĩa Tân
7930	24617	phuong_nghia_trung	660	phường	Nghĩa Trung
7931	24618	xa_dak_rmoan	660	xã	R'Moan
7932	24619	phuong_quang_thanh	660	phường	Quảng Thành
7933	24628	xa_dak_nia	660	xã	Đắk Nia
7934	24616	xa_quang_son	661	xã	Quảng Sơn
7935	24620	xa_quang_hoa	661	xã	Quảng Hoà
7936	24622	xa_dak_ha	661	xã	Đắk Ha
7937	24625	xa_dak_rmang	661	xã	R'Măng
7938	24631	xa_quang_khe	661	xã	Quảng Khê
7939	24634	xa_dak_plao	661	xã	Đắk Plao
7940	24637	xa_dak_som	661	xã	Đắk Som
7941	24640	thi_tran_ea_tling	662	thị trấn	T'Ling
7942	24643	xa_dak_wil	662	xã	Đắk Wil
7943	24646	xa_ea_po	662	xã	Ea Pô
7944	24649	xa_nam_dong	662	xã	Nam Dong
7945	24652	xa_dak_drong	662	xã	Đắk DRông
7946	24655	xa_tam_thang	662	xã	Tâm Thắng
7947	24658	xa_cu_knia	662	xã	Cư Knia
7948	24661	xa_truc_son	662	xã	Trúc Sơn
7949	24664	thi_tran_dak_mil	663	thị trấn	Đắk Mil
7950	24667	xa_dak_lao	663	xã	Đắk Lao
7951	24670	xa_dak_rla	663	xã	R'La
7952	24673	xa_dak_gan	663	xã	Đắk Gằn
7953	24676	xa_duc_manh	663	xã	Đức Mạnh
7954	24677	xa_dak_ndrot	663	xã	N'Drót
7955	24678	xa_long_son	663	xã	Long Sơn
7956	24679	xa_dak_sak	663	xã	Đắk Sắk
7957	24682	xa_thuan_an	663	xã	Thuận An
7958	24685	xa_duc_minh	663	xã	Đức Minh
7959	24688	thi_tran_dak_mam	664	thị trấn	Đắk Mâm
7960	24691	xa_dak_sor	664	xã	Đắk Sôr
7961	24692	xa_nam_xuan	664	xã	Nam Xuân
7962	24694	xa_buon_choah	664	xã	Buôn Choah
7963	24697	xa_nam_da	664	xã	Nam Đà
7964	24699	xa_tan_thanh	664	xã	Tân Thành
7965	24700	xa_dak_dro	664	xã	Đắk Drô
7966	24703	xa_nam_nung	664	xã	Nâm Nung
7967	24706	xa_duc_xuyen	664	xã	Đức Xuyên
7968	24709	xa_dak_nang	664	xã	Đắk Nang
7969	24712	xa_quang_phu	664	xã	Quảng Phú
7970	24715	xa_nam_ndir	664	xã	N'Đir
7971	24717	thi_tran_duc_an	665	thị trấn	Đức An
7972	24718	xa_dak_mol	665	xã	Đắk Môl
7973	24719	xa_dak_hoa	665	xã	Đắk Hòa
7974	24721	xa_nam_binh	665	xã	Nam Bình
7975	24722	xa_thuan_ha	665	xã	Thuận Hà
7976	24724	xa_thuan_hanh	665	xã	Thuận Hạnh
7977	24727	xa_dak_ndung	665	xã	N'Dung
7978	24728	xa_nam_njang	665	xã	N'Jang
7979	24730	xa_truong_xuan	665	xã	Trường Xuân
7980	24733	thi_tran_kien_duc	666	thị trấn	Kiến Đức
7981	24745	xa_quang_tin	666	xã	Quảng Tín
7982	24750	xa_dak_wer	666	xã	Đắk Wer
7983	24751	xa_nhan_co	666	xã	Nhân Cơ
7984	24754	xa_kien_thanh	666	xã	Kiến Thành
7985	24756	xa_nghia_thang	666	xã	Nghĩa Thắng
7986	24757	xa_dao_nghia	666	xã	Đạo Nghĩa
7987	24760	xa_dak_sin	666	xã	Đắk Sin
7988	24761	xa_hung_binh	666	xã	Hưng Bình
7989	24763	xa_dak_ru	666	xã	Đắk Ru
7990	24766	xa_nhan_dao	666	xã	Nhân Đạo
7991	24736	xa_quang_truc	667	xã	Quảng Trực
7992	24739	xa_dak_buk_so	667	xã	Búk So
7993	24740	xa_quang_tam	667	xã	Quảng Tâm
7994	24742	xa_dak_rtih	667	xã	R'Tíh
7995	24746	xa_dak_ngo	667	xã	Đắk Ngo
7996	24748	xa_quang_tan	667	xã	Quảng Tân
7997	24769	phuong_7	672	phường	Phường 7
7998	24772	phuong_8	672	phường	Phường 8
7999	24775	phuong_12	672	phường	Phường 12
8000	24778	phuong_9	672	phường	Phường 9
8001	24781	phuong_2	672	phường	Phường 2
8002	24784	phuong_1	672	phường	Phường 1
8003	24787	phuong_6	672	phường	Phường 6
8004	24790	phuong_5	672	phường	Phường 5
8005	24793	phuong_4	672	phường	Phường 4
8006	24796	phuong_10	672	phường	Phường 10
8007	24799	phuong_11	672	phường	Phường 11
8008	24802	phuong_3	672	phường	Phường 3
8009	24805	xa_xuan_tho	672	xã	Xuân Thọ
8010	24808	xa_ta_nung	672	xã	Tà Nung
8011	24810	xa_tram_hanh	672	xã	Trạm Hành
8012	24811	xa_xuan_truong	672	xã	Xuân Trường
8013	24814	phuong_loc_phat	673	phường	Lộc Phát
8014	24817	phuong_loc_tien	673	phường	Lộc Tiến
8015	24820	phuong_2	673	phường	Phường 2
8016	24823	phuong_1	673	phường	Phường 1
8017	24826	phuong_blao	673	phường	Phường B'lao
8018	24829	phuong_loc_son	673	phường	Lộc Sơn
8019	24832	xa_dam_bri	673	xã	Đạm Bri
8020	24835	xa_loc_thanh	673	xã	Lộc Thanh
8021	24838	xa_loc_nga	673	xã	Lộc Nga
8022	24841	xa_loc_chau	673	xã	Lộc Châu
8023	24844	xa_dai_lao	673	xã	Đại Lào
8024	24853	xa_da_tong	674	xã	Đạ Tông
8025	24856	xa_da_long	674	xã	Đạ Long
8026	24859	xa_da_m_rong	674	xã	M' Rong
8027	24874	xa_lieng_sronh	674	xã	Liêng Srônh
8028	24875	xa_da_rsal	674	xã	Đạ Rsal
8029	24877	xa_ro_men	674	xã	Rô Men
8030	24886	xa_phi_lieng	674	xã	Phi Liêng
8031	24889	xa_da_k_nang	674	xã	K' Nàng
8032	24846	thi_tran_lac_duong	675	thị trấn	Lạc Dương
8033	24847	xa_da_chais	675	xã	Đạ Chais
8034	24848	xa_da_nhim	675	xã	Đạ Nhim
8035	24850	xa_dung_kno	675	xã	Đưng KNớ
8036	24862	xa_lat	675	xã	Xã Lát
8037	24865	xa_da_sar	675	xã	Đạ Sar
8038	24868	thi_tran_nam_ban	676	thị trấn	Nam Ban
8039	24871	thi_tran_dinh_van	676	thị trấn	Đinh Văn
8040	24880	xa_phu_son	676	xã	Phú Sơn
8041	24883	xa_phi_to	676	xã	Phi Tô
8042	24892	xa_me_linh	676	xã	Mê Linh
8043	24895	xa_da_don	676	xã	Đạ Đờn
8044	24898	xa_phuc_tho	676	xã	Phúc Thọ
8045	24901	xa_dong_thanh	676	xã	Đông Thanh
8046	24904	xa_gia_lam	676	xã	Gia Lâm
8047	24907	xa_tan_thanh	676	xã	Tân Thanh
8048	24910	xa_tan_van	676	xã	Tân Văn
8049	24913	xa_hoai_duc	676	xã	Hoài Đức
8050	24916	xa_tan_ha	676	xã	Tân Hà
8051	24919	xa_lien_ha	676	xã	Liên Hà
8052	24922	xa_dan_phuong	676	xã	Đan Phượng
8053	24925	xa_nam_ha	676	xã	Nam Hà
8054	24928	thi_tran_dran	677	thị trấn	D'Ran
8055	24931	thi_tran_thanh_my	677	thị trấn	Thạnh Mỹ
8056	24934	xa_lac_xuan	677	xã	Lạc Xuân
8057	24937	xa_da_ron	677	xã	Đạ Ròn
8058	24940	xa_lac_lam	677	xã	Lạc Lâm
8059	24943	xa_ka_do	677	xã	Ka Đô
8060	24946	xa_quang_lap	677	xã	Quảng Lập
8061	24949	xa_ka_don	677	xã	Ka Đơn
8062	24952	xa_tu_tra	677	xã	Tu Tra
8063	24955	xa_pro	677	xã	Xã Pró
8064	24958	thi_tran_lien_nghia	678	thị trấn	Liên Nghĩa
8065	24961	xa_hiep_an	678	xã	Hiệp An
8066	24964	xa_lien_hiep	678	xã	Liên Hiệp
8067	24967	xa_hiep_thanh	678	xã	Hiệp Thạnh
8068	24970	xa_binh_thanh	678	xã	Bình Thạnh
8069	24973	xa_nthol_ha	678	xã	Thol Hạ
8070	24976	xa_tan_hoi	678	xã	Tân Hội
8071	24979	xa_tan_thanh	678	xã	Tân Thành
8072	24982	xa_phu_hoi	678	xã	Phú Hội
8073	24985	xa_ninh_gia	678	xã	Ninh Gia
8074	24988	xa_ta_nang	678	xã	Tà Năng
8075	24989	xa_da_quyn	678	xã	Đa Quyn
8076	24991	xa_ta_hine	678	xã	Tà Hine
8077	24994	xa_da_loan	678	xã	Đà Loan
8078	24997	xa_ninh_loan	678	xã	Ninh Loan
8079	25000	thi_tran_di_linh	679	thị trấn	Di Linh
8080	25003	xa_dinh_trang_thuong	679	xã	Trang Thượng
8081	25006	xa_tan_thuong	679	xã	Tân Thượng
8082	25007	xa_tan_lam	679	xã	Tân Lâm
8083	25009	xa_tan_chau	679	xã	Tân Châu
8084	25012	xa_tan_nghia	679	xã	Tân Nghĩa
8085	25015	xa_gia_hiep	679	xã	Gia Hiệp
8086	25018	xa_dinh_lac	679	xã	Đinh Lạc
8087	25021	xa_tam_bo	679	xã	Tam Bố
8088	25024	xa_dinh_trang_hoa	679	xã	Trang Hòa
8089	25027	xa_lien_dam	679	xã	Liên Đầm
8090	25030	xa_gung_re	679	xã	Gung Ré
8091	25033	xa_bao_thuan	679	xã	Bảo Thuận
8092	25036	xa_hoa_ninh	679	xã	Hòa Ninh
8093	25039	xa_hoa_trung	679	xã	Hòa Trung
8094	25042	xa_hoa_nam	679	xã	Hòa Nam
8095	25045	xa_hoa_bac	679	xã	Hòa Bắc
8096	25048	xa_son_dien	679	xã	Sơn Điền
8097	25051	xa_gia_bac	679	xã	Gia Bắc
8098	25054	thi_tran_loc_thang	680	thị trấn	Lộc Thắng
8099	25057	xa_loc_bao	680	xã	Lộc Bảo
8100	25060	xa_loc_lam	680	xã	Lộc Lâm
8101	25063	xa_loc_phu	680	xã	Lộc Phú
8102	25066	xa_loc_bac	680	xã	Lộc Bắc
8103	25069	xa_b_la	680	xã	B' Lá
8104	25072	xa_loc_ngai	680	xã	Lộc Ngãi
8105	25075	xa_loc_quang	680	xã	Lộc Quảng
8106	25078	xa_loc_tan	680	xã	Lộc Tân
8107	25081	xa_loc_duc	680	xã	Lộc Đức
8108	25084	xa_loc_an	680	xã	Lộc An
8109	25087	xa_tan_lac	680	xã	Tân Lạc
8110	25090	xa_loc_thanh	680	xã	Lộc Thành
8111	25093	xa_loc_nam	680	xã	Lộc Nam
8112	25096	thi_tran_da_mri	681	thị trấn	Đạ M'ri
8113	25099	thi_tran_ma_da_guoi	681	thị trấn	Đa Guôi
8114	25105	xa_ha_lam	681	xã	Hà Lâm
8115	25108	xa_da_ton	681	xã	Đạ Tồn
8116	25111	xa_da_oai	681	xã	Đạ Oai
8117	25114	xa_da_ploa	681	xã	Đạ Ploa
8118	25117	xa_ma_da_guoi	681	xã	Đa Guôi
8119	25120	xa_doan_ket	681	xã	Đoàn Kết
8120	25123	xa_phuoc_loc	681	xã	Phước Lộc
8121	25126	thi_tran_da_teh	682	thị trấn	Đạ Tẻh
8122	25129	xa_an_nhon	682	xã	An Nhơn
8123	25132	xa_quoc_oai	682	xã	Quốc Oai
8124	25135	xa_my_duc	682	xã	Mỹ Đức
8125	25138	xa_quang_tri	682	xã	Quảng Trị
8126	25141	xa_da_lay	682	xã	Đạ Lây
8127	25147	xa_trieu_hai	682	xã	Triệu Hải
8128	25153	xa_da_kho	682	xã	Đạ Kho
8129	25156	xa_da_pal	682	xã	Đạ Pal
8130	25159	thi_tran_cat_tien	683	thị trấn	Cát Tiên
8131	25162	xa_tien_hoang	683	xã	Tiên Hoàng
8132	25165	xa_phuoc_cat_2	683	xã	Phước Cát 2
8133	25168	xa_gia_vien	683	xã	Gia Viễn
8134	25171	xa_nam_ninh	683	xã	Nam Ninh
8135	25180	thi_tran_phuoc_cat	683	thị trấn	Phước Cát
8136	25183	xa_duc_pho	683	xã	Đức Phổ
8137	25189	xa_quang_ngai	683	xã	Quảng Ngãi
8138	25192	xa_dong_nai_thuong	683	xã	Nai Thượng
8139	25216	phuong_thac_mo	688	phường	Thác Mơ
8140	25217	phuong_long_thuy	688	phường	Long Thủy
8141	25219	phuong_phuoc_binh	688	phường	Phước Bình
8142	25220	phuong_long_phuoc	688	phường	Long Phước
8143	25237	phuong_son_giang	688	phường	Sơn Giang
8144	25245	xa_long_giang	688	xã	Long Giang
8145	25249	xa_phuoc_tin	688	xã	Phước Tín
8146	25195	phuong_tan_phu	689	phường	Tân Phú
8147	25198	phuong_tan_dong	689	phường	Tân Đồng
8148	25201	phuong_tan_binh	689	phường	Tân Bình
8149	25204	phuong_tan_xuan	689	phường	Tân Xuân
8150	25205	phuong_tan_thien	689	phường	Tân Thiện
8151	25207	xa_tan_thanh	689	xã	Tân Thành
8152	25210	phuong_tien_thanh	689	phường	Tiến Thành
8153	25213	xa_tien_hung	689	xã	Tiến Hưng
8154	25320	phuong_hung_chien	690	phường	Hưng Chiến
8155	25324	phuong_an_loc	690	phường	An Lộc
8156	25325	phuong_phu_thinh	690	phường	Phú Thịnh
8157	25326	phuong_phu_duc	690	phường	Phú Đức
8158	25333	xa_thanh_luong	690	xã	Thanh Lương
8159	25336	xa_thanh_phu	690	xã	Thanh Phú
8160	25222	xa_bu_gia_map	691	xã	Gia Mập
8161	25225	xa_dak_o	691	xã	Đak Ơ
8162	25228	xa_duc_hanh	691	xã	Đức Hạnh
8163	25229	xa_phu_van	691	xã	Phú Văn
8164	25231	xa_da_kia	691	xã	Đa Kia
8165	25232	xa_phuoc_minh	691	xã	Phước Minh
8166	25234	xa_binh_thang	691	xã	Bình Thắng
8167	25267	xa_phu_nghia	691	xã	Phú Nghĩa
8168	25270	thi_tran_loc_ninh	692	thị trấn	Lộc Ninh
8169	25273	xa_loc_hoa	692	xã	Lộc Hòa
8170	25276	xa_loc_an	692	xã	Lộc An
8171	25279	xa_loc_tan	692	xã	Lộc Tấn
8172	25280	xa_loc_thanh	692	xã	Lộc Thạnh
8173	25282	xa_loc_hiep	692	xã	Lộc Hiệp
8174	25285	xa_loc_thien	692	xã	Lộc Thiện
8175	25288	xa_loc_thuan	692	xã	Lộc Thuận
8176	25291	xa_loc_quang	692	xã	Lộc Quang
8177	25292	xa_loc_phu	692	xã	Lộc Phú
8178	25294	xa_loc_thanh	692	xã	Lộc Thành
8179	25297	xa_loc_thai	692	xã	Lộc Thái
8180	25300	xa_loc_dien	692	xã	Lộc Điền
8181	25303	xa_loc_hung	692	xã	Lộc Hưng
8182	25305	xa_loc_thinh	692	xã	Lộc Thịnh
8183	25306	xa_loc_khanh	692	xã	Lộc Khánh
8184	25308	thi_tran_thanh_binh	693	thị trấn	Thanh Bình
8185	25309	xa_hung_phuoc	693	xã	Hưng Phước
8186	25310	xa_phuoc_thien	693	xã	Phước Thiện
8187	25312	xa_thien_hung	693	xã	Thiện Hưng
8188	25315	xa_thanh_hoa	693	xã	Thanh Hòa
8189	25318	xa_tan_thanh	693	xã	Tân Thành
8190	25321	xa_tan_tien	693	xã	Tân Tiến
8191	25327	xa_thanh_an	694	xã	Thanh An
8192	25330	xa_an_khuong	694	xã	An Khương
8193	25339	xa_an_phu	694	xã	An Phú
8194	25342	xa_tan_loi	694	xã	Tân Lợi
8195	25345	xa_tan_hung	694	xã	Tân Hưng
8196	25348	xa_minh_duc	694	xã	Minh Đức
8197	25349	xa_minh_tam	694	xã	Minh Tâm
8198	25351	xa_phuoc_an	694	xã	Phước An
8199	25354	xa_thanh_binh	694	xã	Thanh Bình
8200	25357	thi_tran_tan_khai	694	thị trấn	Tân Khai
8201	25360	xa_dong_no	694	xã	Đồng Nơ
8202	25361	xa_tan_hiep	694	xã	Tân Hiệp
8203	25438	xa_tan_quan	694	xã	Tân Quan
8204	25363	thi_tran_tan_phu	695	thị trấn	Tân Phú
8205	25366	xa_thuan_loi	695	xã	Thuận Lợi
8206	25369	xa_dong_tam	695	xã	Đồng Tâm
8207	25372	xa_tan_phuoc	695	xã	Tân Phước
8208	25375	xa_tan_hung	695	xã	Tân Hưng
8209	25378	xa_tan_loi	695	xã	Tân Lợi
8210	25381	xa_tan_lap	695	xã	Tân Lập
8211	25384	xa_tan_hoa	695	xã	Tân Hòa
8212	25387	xa_thuan_phu	695	xã	Thuận Phú
8213	25390	xa_dong_tien	695	xã	Đồng Tiến
8214	25393	xa_tan_tien	695	xã	Tân Tiến
8215	25396	thi_tran_duc_phong	696	thị trấn	Đức Phong
8216	25398	xa_duong_10	696	xã	Xã Đường 10
8217	25399	xa_dak_nhau	696	xã	Đak Nhau
8218	25400	xa_phu_son	696	xã	Phú Sơn
8219	25402	xa_tho_son	696	xã	Thọ Sơn
8220	25404	xa_binh_minh	696	xã	Bình Minh
8221	25405	xa_bom_bo	696	xã	Bom Bo
8222	25408	xa_minh_hung	696	xã	Minh Hưng
8223	25411	xa_doan_ket	696	xã	Đoàn Kết
8224	25414	xa_dong_nai	696	xã	Đồng Nai
8225	25417	xa_duc_lieu	696	xã	Đức Liễu
8226	25420	xa_thong_nhat	696	xã	Thống Nhất
8227	25423	xa_nghia_trung	696	xã	Nghĩa Trung
8228	25424	xa_nghia_binh	696	xã	Nghĩa Bình
8229	25426	xa_dang_ha	696	xã	Đăng Hà
8230	25429	xa_phuoc_son	696	xã	Phước Sơn
8231	25432	thi_tran_chon_thanh	697	thị trấn	Chơn Thành
8232	25433	xa_thanh_tam	697	xã	Thành Tâm
8233	25435	xa_minh_lap	697	xã	Minh Lập
8234	25439	xa_quang_minh	697	xã	Quang Minh
8235	25441	xa_minh_hung	697	xã	Minh Hưng
8236	25444	xa_minh_long	697	xã	Minh Long
8237	25447	xa_minh_thanh	697	xã	Minh Thành
8238	25450	xa_nha_bich	697	xã	Nha Bích
8239	25453	xa_minh_thang	697	xã	Minh Thắng
8240	25240	xa_long_binh	698	xã	Long Bình
8241	25243	xa_binh_tan	698	xã	Bình Tân
8242	25244	xa_binh_son	698	xã	Bình Sơn
8243	25246	xa_long_hung	698	xã	Long Hưng
8244	25250	xa_phuoc_tan	698	xã	Phước Tân
8245	25252	xa_bu_nho	698	xã	Bù Nho
8246	25255	xa_long_ha	698	xã	Long Hà
8247	25258	xa_long_tan	698	xã	Long Tân
8248	25261	xa_phu_trung	698	xã	Phú Trung
8249	25264	xa_phu_rieng	698	xã	Phú Riềng
8250	25456	phuong_1	703	phường	Phường 1
8251	25459	phuong_3	703	phường	Phường 3
8252	25462	phuong_4	703	phường	Phường 4
8253	25465	phuong_hiep_ninh	703	phường	Hiệp Ninh
8254	25468	phuong_2	703	phường	Phường 2
8255	25471	xa_thanh_tan	703	xã	Thạnh Tân
8256	25474	xa_tan_binh	703	xã	Tân Bình
8257	25477	xa_binh_minh	703	xã	Bình Minh
8258	25480	phuong_ninh_son	703	phường	Ninh Sơn
8259	25483	phuong_ninh_thanh	703	phường	Ninh Thạnh
8260	25486	thi_tran_tan_bien	705	thị trấn	Tân Biên
8261	25489	xa_tan_lap	705	xã	Tân Lập
8262	25492	xa_thanh_bac	705	xã	Thạnh Bắc
8263	25495	xa_tan_binh	705	xã	Tân Bình
8264	25498	xa_thanh_binh	705	xã	Thạnh Bình
8265	25501	xa_thanh_tay	705	xã	Thạnh Tây
8266	25504	xa_hoa_hiep	705	xã	Hòa Hiệp
8267	25507	xa_tan_phong	705	xã	Tân Phong
8268	25510	xa_mo_cong	705	xã	Mỏ Công
8269	25513	xa_tra_vong	705	xã	Trà Vong
8270	25516	thi_tran_tan_chau	706	thị trấn	Tân Châu
8271	25519	xa_tan_ha	706	xã	Tân Hà
8272	25522	xa_tan_dong	706	xã	Tân Đông
8273	25525	xa_tan_hoi	706	xã	Tân Hội
8274	25528	xa_tan_hoa	706	xã	Tân Hòa
8275	25531	xa_suoi_ngo	706	xã	Suối Ngô
8276	25534	xa_suoi_day	706	xã	Suối Dây
8277	25537	xa_tan_hiep	706	xã	Tân Hiệp
8278	25540	xa_thanh_dong	706	xã	Thạnh Đông
8279	25543	xa_tan_thanh	706	xã	Tân Thành
8280	25546	xa_tan_phu	706	xã	Tân Phú
8281	25549	xa_tan_hung	706	xã	Tân Hưng
8282	25552	thi_tran_duong_minh_chau	707	thị trấn	Minh Châu
8283	25555	xa_suoi_da	707	xã	Suối Đá
8284	25558	xa_phan	707	xã	Xã Phan
8285	25561	xa_phuoc_ninh	707	xã	Phước Ninh
8286	25564	xa_phuoc_minh	707	xã	Phước Minh
8287	25567	xa_bau_nang	707	xã	Bàu Năng
8288	25570	xa_cha_la	707	xã	Chà Là
8289	25573	xa_cau_khoi	707	xã	Cầu Khởi
8290	25576	xa_ben_cui	707	xã	Bến Củi
8291	25579	xa_loc_ninh	707	xã	Lộc Ninh
8292	25582	xa_truong_mit	707	xã	Truông Mít
8293	25585	thi_tran_chau_thanh	708	thị trấn	Châu Thành
8294	25588	xa_hao_duoc	708	xã	Hảo Đước
8295	25591	xa_phuoc_vinh	708	xã	Phước Vinh
8296	25594	xa_dong_khoi	708	xã	Đồng Khởi
8297	25597	xa_thai_binh	708	xã	Thái Bình
8298	25600	xa_an_co	708	xã	An Cơ
8299	25603	xa_bien_gioi	708	xã	Biên Giới
8300	25606	xa_hoa_thanh	708	xã	Hòa Thạnh
8301	25609	xa_tri_binh	708	xã	Trí Bình
8302	25612	xa_hoa_hoi	708	xã	Hòa Hội
8303	25615	xa_an_binh	708	xã	An Bình
8304	25618	xa_thanh_dien	708	xã	Thanh Điền
8305	25621	xa_thanh_long	708	xã	Thành Long
8306	25624	xa_ninh_dien	708	xã	Ninh Điền
8307	25627	xa_long_vinh	708	xã	Long Vĩnh
8308	25630	phuong_long_hoa	709	phường	Long Hoa
8309	25633	phuong_hiep_tan	709	phường	Hiệp Tân
8310	25636	phuong_long_thanh_bac	709	phường	Thành Bắc
8311	25639	xa_truong_hoa	709	xã	Trường Hòa
8312	25642	xa_truong_dong	709	xã	Trường Đông
8313	25645	phuong_long_thanh_trung	709	phường	Thành Trung
8314	25648	xa_truong_tay	709	xã	Trường Tây
8315	25651	xa_long_thanh_nam	709	xã	Thành Nam
8316	25654	thi_tran_go_dau	710	thị trấn	Gò Dầu
8317	25657	xa_thanh_duc	710	xã	Thạnh Đức
8318	25660	xa_cam_giang	710	xã	Cẩm Giang
8319	25663	xa_hiep_thanh	710	xã	Hiệp Thạnh
8320	25666	xa_bau_don	710	xã	Bàu Đồn
8321	25669	xa_phuoc_thanh	710	xã	Phước Thạnh
8322	25672	xa_phuoc_dong	710	xã	Phước Đông
8323	25675	xa_phuoc_trach	710	xã	Phước Trạch
8324	25678	xa_thanh_phuoc	710	xã	Thanh Phước
8325	25681	thi_tran_ben_cau	711	thị trấn	Bến Cầu
8326	25684	xa_long_chu	711	xã	Long Chữ
8327	25687	xa_long_phuoc	711	xã	Long Phước
8328	25690	xa_long_giang	711	xã	Long Giang
8329	25693	xa_tien_thuan	711	xã	Tiên Thuận
8330	25696	xa_long_khanh	711	xã	Long Khánh
8331	25699	xa_loi_thuan	711	xã	Lợi Thuận
8332	25702	xa_long_thuan	711	xã	Long Thuận
8333	25705	xa_an_thanh	711	xã	An Thạnh
8334	25708	phuong_trang_bang	712	phường	Trảng Bàng
8335	25711	xa_don_thuan	712	xã	Đôn Thuận
8336	25714	xa_hung_thuan	712	xã	Hưng Thuận
8337	25717	phuong_loc_hung	712	phường	Lộc Hưng
8338	25720	phuong_gia_loc	712	phường	Gia Lộc
8339	25723	phuong_gia_binh	712	phường	Gia Bình
8340	25729	xa_phuoc_binh	712	xã	Phước Bình
8341	25732	phuong_an_tinh	712	phường	An Tịnh
8342	25735	phuong_an_hoa	712	phường	An Hòa
8343	25738	xa_phuoc_chi	712	xã	Phước Chỉ
8344	25741	phuong_hiep_thanh	718	phường	Hiệp Thành
8345	25744	phuong_phu_loi	718	phường	Phú Lợi
8346	25747	phuong_phu_cuong	718	phường	Phú Cường
8347	25750	phuong_phu_hoa	718	phường	Phú Hòa
8348	25753	phuong_phu_tho	718	phường	Phú Thọ
8349	25756	phuong_chanh_nghia	718	phường	Chánh Nghĩa
8350	25759	phuong_dinh_hoa	718	phường	Định Hoà
8351	25760	phuong_hoa_phu	718	phường	Hoà Phú
8352	25762	phuong_phu_my	718	phường	Phú Mỹ
8353	25763	phuong_phu_tan	718	phường	Phú Tân
8354	25765	phuong_tan_an	718	phường	Tân An
8355	25768	phuong_hiep_an	718	phường	Hiệp An
8356	25771	phuong_tuong_binh_hiep	718	phường	Bình Hiệp
8357	25774	phuong_chanh_my	718	phường	Chánh Mỹ
8358	25816	xa_tru_van_tho	719	xã	Văn Thố
8359	25819	xa_cay_truong_ii	719	xã	Trường II
8360	25822	thi_tran_lai_uyen	719	thị trấn	Lai Uyên
8361	25825	xa_tan_hung	719	xã	Tân Hưng
8362	25828	xa_long_nguyen	719	xã	Long Nguyên
8363	25831	xa_hung_hoa	719	xã	Hưng Hòa
8364	25834	xa_lai_hung	719	xã	Lai Hưng
8365	25777	thi_tran_dau_tieng	720	thị trấn	Dầu Tiếng
8366	25780	xa_minh_hoa	720	xã	Minh Hoà
8367	25783	xa_minh_thanh	720	xã	Minh Thạnh
8368	25786	xa_minh_tan	720	xã	Minh Tân
8369	25789	xa_dinh_an	720	xã	Định An
8370	25792	xa_long_hoa	720	xã	Long Hoà
8371	25795	xa_dinh_thanh	720	xã	Định Thành
8372	25798	xa_dinh_hiep	720	xã	Định Hiệp
8373	25801	xa_an_lap	720	xã	An Lập
8374	25804	xa_long_tan	720	xã	Long Tân
8375	25807	xa_thanh_an	720	xã	Thanh An
8376	25810	xa_thanh_tuyen	720	xã	Thanh Tuyền
8377	25813	phuong_my_phuoc	721	phường	Mỹ Phước
8378	25837	phuong_chanh_phu_hoa	721	phường	Phú Hòa
8379	25840	xa_an_dien	721	xã	An Điền
8380	25843	xa_an_tay	721	xã	An Tây
8381	25846	phuong_thoi_hoa	721	phường	Thới Hòa
8382	25849	phuong_hoa_loi	721	phường	Hòa Lợi
8383	25852	phuong_tan_dinh	721	phường	Tân Định
8384	25855	xa_phu_an	721	xã	Phú An
8385	25858	thi_tran_phuoc_vinh	722	thị trấn	Phước Vĩnh
8386	25861	xa_an_linh	722	xã	An Linh
8387	25864	xa_phuoc_sang	722	xã	Phước Sang
8388	25865	xa_an_thai	722	xã	An Thái
8389	25867	xa_an_long	722	xã	An Long
8390	25870	xa_an_binh	722	xã	An Bình
8391	25873	xa_tan_hiep	722	xã	Tân Hiệp
8392	25876	xa_tam_lap	722	xã	Tam Lập
8393	25879	xa_tan_long	722	xã	Tân Long
8394	25882	xa_vinh_hoa	722	xã	Vĩnh Hoà
8395	25885	xa_phuoc_hoa	722	xã	Phước Hoà
8396	25888	phuong_uyen_hung	723	phường	Uyên Hưng
8397	25891	phuong_tan_phuoc_khanh	723	phường	Phước Khánh
8398	25912	phuong_vinh_tan	723	phường	Vĩnh Tân
8399	25915	phuong_hoi_nghia	723	phường	Hội Nghĩa
8400	25920	phuong_tan_hiep	723	phường	Tân Hiệp
8401	25921	phuong_khanh_binh	723	phường	Khánh Bình
8402	25924	phuong_phu_chanh	723	phường	Phú Chánh
8403	25930	xa_bach_dang	723	xã	Bạch Đằng
8404	25933	phuong_tan_vinh_hiep	723	phường	Vĩnh Hiệp
8405	25936	phuong_thanh_phuoc	723	phường	Thạnh Phước
8406	25937	xa_thanh_hoi	723	xã	Thạnh Hội
8407	25939	phuong_thai_hoa	723	phường	Thái Hòa
8408	25942	phuong_di_an	724	phường	Dĩ An
8409	25945	phuong_tan_binh	724	phường	Tân Bình
8410	25948	phuong_tan_dong_hiep	724	phường	Đông Hiệp
8411	25951	phuong_binh_an	724	phường	Bình An
8412	25954	phuong_binh_thang	724	phường	Bình Thắng
8413	25957	phuong_dong_hoa	724	phường	Đông Hòa
8414	25960	phuong_an_binh	724	phường	An Bình
8415	25963	phuong_an_thanh	725	phường	An Thạnh
8416	25966	phuong_lai_thieu	725	phường	Lái Thiêu
8417	25969	phuong_binh_chuan	725	phường	Bình Chuẩn
8418	25972	phuong_thuan_giao	725	phường	Thuận Giao
8419	25975	phuong_an_phu	725	phường	An Phú
8420	25978	phuong_hung_dinh	725	phường	Hưng Định
8421	25981	xa_an_son	725	xã	An Sơn
8422	25984	phuong_binh_nham	725	phường	Bình Nhâm
8423	25987	phuong_binh_hoa	725	phường	Bình Hòa
8424	25990	phuong_vinh_phu	725	phường	Vĩnh Phú
8425	25894	xa_tan_dinh	726	xã	Tân Định
8426	25897	xa_binh_my	726	xã	Bình Mỹ
8427	25900	thi_tran_tan_binh	726	thị trấn	Tân Bình
8428	25903	xa_tan_lap	726	xã	Tân Lập
8429	25906	thi_tran_tan_thanh	726	thị trấn	Tân Thành
8430	25907	xa_dat_cuoc	726	xã	Đất Cuốc
8431	25908	xa_hieu_liem	726	xã	Hiếu Liêm
8432	25909	xa_lac_an	726	xã	Lạc An
8433	25918	xa_tan_my	726	xã	Tân Mỹ
8434	25927	xa_thuong_tan	726	xã	Thường Tân
8435	25993	phuong_trang_dai	731	phường	Trảng Dài
8436	25996	phuong_tan_phong	731	phường	Tân Phong
8437	25999	phuong_tan_bien	731	phường	Tân Biên
8438	26002	phuong_ho_nai	731	phường	Hố Nai
8439	26005	phuong_tan_hoa	731	phường	Tân Hòa
8440	26008	phuong_tan_hiep	731	phường	Tân Hiệp
8441	26011	phuong_buu_long	731	phường	Bửu Long
8442	26014	phuong_tan_tien	731	phường	Tân Tiến
8443	26017	phuong_tam_hiep	731	phường	Tam Hiệp
8444	26020	phuong_long_binh	731	phường	Long Bình
8445	26023	phuong_quang_vinh	731	phường	Quang Vinh
8446	26026	phuong_tan_mai	731	phường	Tân Mai
8447	26029	phuong_thong_nhat	731	phường	Thống Nhất
8448	26032	phuong_trung_dung	731	phường	Trung Dũng
8449	26035	phuong_tam_hoa	731	phường	Tam Hòa
8450	26038	phuong_hoa_binh	731	phường	Hòa Bình
8451	26041	phuong_quyet_thang	731	phường	Quyết Thắng
8452	26044	phuong_thanh_binh	731	phường	Thanh Bình
8453	26047	phuong_binh_da	731	phường	Bình Đa
8454	26050	phuong_an_binh	731	phường	An Bình
8455	26053	phuong_buu_hoa	731	phường	Bửu Hòa
8456	26056	phuong_long_binh_tan	731	phường	Bình Tân
8457	26059	phuong_tan_van	731	phường	Tân Vạn
8458	26062	phuong_tan_hanh	731	phường	Tân Hạnh
8459	26065	phuong_hiep_hoa	731	phường	Hiệp Hòa
8460	26068	phuong_hoa_an	731	phường	Hóa An
8461	26371	phuong_an_hoa	731	phường	An Hòa
8462	26374	phuong_tam_phuoc	731	phường	Tam Phước
8463	26377	phuong_phuoc_tan	731	phường	Phước Tân
8464	26380	xa_long_hung	731	xã	Long Hưng
8465	26071	phuong_xuan_trung	732	phường	Xuân Trung
8466	26074	phuong_xuan_thanh	732	phường	Xuân Thanh
8467	26077	phuong_xuan_binh	732	phường	Xuân Bình
8468	26080	phuong_xuan_an	732	phường	Xuân An
8469	26083	phuong_xuan_hoa	732	phường	Xuân Hoà
8470	26086	phuong_phu_binh	732	phường	Phú Bình
8471	26089	xa_binh_loc	732	xã	Bình Lộc
8472	26092	xa_bao_quang	732	xã	Bảo Quang
8473	26095	phuong_suoi_tre	732	phường	Suối Tre
8474	26098	phuong_bao_vinh	732	phường	Bảo Vinh
8475	26101	phuong_xuan_lap	732	phường	Xuân Lập
8476	26104	phuong_bau_sen	732	phường	Bàu Sen
8477	26107	xa_bau_tram	732	xã	Bàu Trâm
8478	26110	phuong_xuan_tan	732	phường	Xuân Tân
8479	26113	xa_hang_gon	732	xã	Hàng Gòn
8480	26116	thi_tran_tan_phu	734	thị trấn	Tân Phú
8481	26119	xa_dak_lua	734	xã	Dak Lua
8482	26122	xa_nam_cat_tien	734	xã	Cát Tiên
8483	26125	xa_phu_an	734	xã	Phú An
8484	26128	xa_nui_tuong	734	xã	Núi Tượng
8485	26131	xa_ta_lai	734	xã	Tà Lài
8486	26134	xa_phu_lap	734	xã	Phú Lập
8487	26137	xa_phu_son	734	xã	Phú Sơn
8488	26140	xa_phu_thinh	734	xã	Phú Thịnh
8489	26143	xa_thanh_son	734	xã	Thanh Sơn
8490	26146	xa_phu_trung	734	xã	Phú Trung
8491	26149	xa_phu_xuan	734	xã	Phú Xuân
8492	26152	xa_phu_loc	734	xã	Phú Lộc
8493	26155	xa_phu_lam	734	xã	Phú Lâm
8494	26158	xa_phu_binh	734	xã	Phú Bình
8495	26161	xa_phu_thanh	734	xã	Phú Thanh
8496	26164	xa_tra_co	734	xã	Trà Cổ
8497	26167	xa_phu_dien	734	xã	Phú Điền
8498	26170	thi_tran_vinh_an	735	thị trấn	Vĩnh An
8499	26173	xa_phu_ly	735	xã	Phú Lý
8500	26176	xa_tri_an	735	xã	Trị An
8501	26179	xa_tan_an	735	xã	Tân An
8502	26182	xa_vinh_tan	735	xã	Vĩnh Tân
8503	26185	xa_binh_loi	735	xã	Bình Lợi
8504	26188	xa_thanh_phu	735	xã	Thạnh Phú
8505	26191	xa_thien_tan	735	xã	Thiện Tân
8506	26194	xa_tan_binh	735	xã	Tân Bình
8507	26197	xa_binh_hoa	735	xã	Bình Hòa
8508	26200	xa_ma_da	735	xã	Mã Đà
8509	26203	xa_hieu_liem	735	xã	Hiếu Liêm
8510	26206	thi_tran_dinh_quan	736	thị trấn	Định Quán
8511	26209	xa_thanh_son	736	xã	Thanh Sơn
8512	26212	xa_phu_tan	736	xã	Phú Tân
8513	26215	xa_phu_vinh	736	xã	Phú Vinh
8514	26218	xa_phu_loi	736	xã	Phú Lợi
8515	26221	xa_phu_hoa	736	xã	Phú Hòa
8516	26224	xa_ngoc_dinh	736	xã	Ngọc Định
8517	26227	xa_la_nga	736	xã	La Ngà
8518	26230	xa_gia_canh	736	xã	Gia Canh
8519	26233	xa_phu_ngoc	736	xã	Phú Ngọc
8520	26236	xa_phu_cuong	736	xã	Phú Cường
8521	26239	xa_tuc_trung	736	xã	Túc Trưng
8522	26242	xa_phu_tuc	736	xã	Phú Túc
8523	26245	xa_suoi_nho	736	xã	Suối Nho
8524	26248	thi_tran_trang_bom	737	thị trấn	Trảng Bom
8525	26251	xa_thanh_binh	737	xã	Thanh Bình
8526	26254	xa_cay_gao	737	xã	Cây Gáo
8527	26257	xa_bau_ham	737	xã	Bàu Hàm
8528	26260	xa_song_thao	737	xã	Sông Thao
8529	26263	xa_song_trau	737	xã	Sông Trầu
8530	26266	xa_dong_hoa	737	xã	Đông Hoà
8531	26269	xa_bac_son	737	xã	Bắc Sơn
8532	26272	xa_ho_nai_3	737	xã	Hố Nai 3
8533	26275	xa_tay_hoa	737	xã	Tây Hoà
8534	26278	xa_binh_minh	737	xã	Bình Minh
8535	26281	xa_trung_hoa	737	xã	Trung Hoà
8536	26284	xa_doi_61	737	xã	Xã Đồi 61
8537	26287	xa_hung_thinh	737	xã	Hưng Thịnh
8538	26290	xa_quang_tien	737	xã	Quảng Tiến
8539	26293	xa_giang_dien	737	xã	Giang Điền
8540	26296	xa_an_vien	737	xã	An Viễn
8541	26299	xa_gia_tan_1	738	xã	Gia Tân 1
8542	26302	xa_gia_tan_2	738	xã	Gia Tân 2
8543	26305	xa_gia_tan_3	738	xã	Gia Tân 3
8544	26308	xa_gia_kiem	738	xã	Gia Kiệm
8545	26311	xa_quang_trung	738	xã	Quang Trung
8546	26314	xa_bau_ham_2	738	xã	Bàu Hàm 2
8547	26317	xa_hung_loc	738	xã	Hưng Lộc
8548	26320	xa_lo_25	738	xã	Xã Lộ 25
8549	26323	xa_xuan_thien	738	xã	Xuân Thiện
8550	26326	thi_tran_dau_giay	738	thị trấn	Dầu Giây
8551	26329	xa_song_nhan	739	xã	Sông Nhạn
8552	26332	xa_xuan_que	739	xã	Xuân Quế
8553	26335	xa_nhan_nghia	739	xã	Nhân Nghĩa
8554	26338	xa_xuan_duong	739	xã	Xuân Đường
8555	26341	xa_long_giao	739	xã	Long Giao
8556	26344	xa_xuan_my	739	xã	Xuân Mỹ
8557	26347	xa_thua_duc	739	xã	Thừa Đức
8558	26350	xa_bao_binh	739	xã	Bảo Bình
8559	26353	xa_xuan_bao	739	xã	Xuân Bảo
8560	26356	xa_xuan_tay	739	xã	Xuân Tây
8561	26359	xa_xuan_dong	739	xã	Xuân Đông
8562	26362	xa_song_ray	739	xã	Sông Ray
8563	26365	xa_lam_san	739	xã	Lâm San
8564	26368	thi_tran_long_thanh	740	thị trấn	Long Thành
8565	26383	xa_an_phuoc	740	xã	An Phước
8566	26386	xa_binh_an	740	xã	Bình An
8567	26389	xa_long_duc	740	xã	Long Đức
8568	26392	xa_loc_an	740	xã	Lộc An
8569	26395	xa_binh_son	740	xã	Bình Sơn
8570	26398	xa_tam_an	740	xã	Tam An
8571	26401	xa_cam_duong	740	xã	Cẩm Đường
8572	26404	xa_long_an	740	xã	Long An
8573	26410	xa_bau_can	740	xã	Bàu Cạn
8574	26413	xa_long_phuoc	740	xã	Long Phước
8575	26416	xa_phuoc_binh	740	xã	Phước Bình
8576	26419	xa_tan_hiep	740	xã	Tân Hiệp
8577	26422	xa_phuoc_thai	740	xã	Phước Thái
8578	26425	thi_tran_gia_ray	741	thị trấn	Gia Ray
8579	26428	xa_xuan_bac	741	xã	Xuân Bắc
8580	26431	xa_suoi_cao	741	xã	Suối Cao
8581	26434	xa_xuan_thanh	741	xã	Xuân Thành
8582	26437	xa_xuan_tho	741	xã	Xuân Thọ
8583	26440	xa_xuan_truong	741	xã	Xuân Trường
8584	26443	xa_xuan_hoa	741	xã	Xuân Hòa
8585	26446	xa_xuan_hung	741	xã	Xuân Hưng
8586	26449	xa_xuan_tam	741	xã	Xuân Tâm
8587	26452	xa_suoi_cat	741	xã	Suối Cát
8588	26455	xa_xuan_hiep	741	xã	Xuân Hiệp
8589	26458	xa_xuan_phu	741	xã	Xuân Phú
8590	26461	xa_xuan_dinh	741	xã	Xuân Định
8591	26464	xa_bao_hoa	741	xã	Bảo Hoà
8592	26467	xa_lang_minh	741	xã	Lang Minh
8593	26470	xa_phuoc_thien	742	xã	Phước Thiền
8594	26473	xa_long_tan	742	xã	Long Tân
8595	26476	xa_dai_phuoc	742	xã	Đại Phước
8596	26479	thi_tran_hiep_phuoc	742	thị trấn	Hiệp Phước
8597	26482	xa_phu_huu	742	xã	Phú Hữu
8598	26485	xa_phu_hoi	742	xã	Phú Hội
8599	26488	xa_phu_thanh	742	xã	Phú Thạnh
8600	26491	xa_phu_dong	742	xã	Phú Đông
8601	26494	xa_long_tho	742	xã	Long Thọ
8602	26497	xa_vinh_thanh	742	xã	Vĩnh Thanh
8603	26500	xa_phuoc_khanh	742	xã	Phước Khánh
8604	26503	xa_phuoc_an	742	xã	Phước An
8605	26506	phuong_1	747	phường	Phường 1
8606	26508	phuong_thang_tam	747	phường	Thắng Tam
8607	26509	phuong_2	747	phường	Phường 2
8608	26512	phuong_3	747	phường	Phường 3
8609	26515	phuong_4	747	phường	Phường 4
8610	26518	phuong_5	747	phường	Phường 5
8611	26521	phuong_thang_nhi	747	phường	Thắng Nhì
8612	26524	phuong_7	747	phường	Phường 7
8613	26526	phuong_nguyen_an_ninh	747	phường	An Ninh
8614	26527	phuong_8	747	phường	Phường 8
8615	26530	phuong_9	747	phường	Phường 9
8616	26533	phuong_thang_nhat	747	phường	Thắng Nhất
8617	26535	phuong_rach_dua	747	phường	Rạch Dừa
8618	26536	phuong_10	747	phường	Phường 10
8619	26539	phuong_11	747	phường	Phường 11
8620	26542	phuong_12	747	phường	Phường 12
8621	26545	xa_long_son	747	xã	Long Sơn
8622	26548	phuong_phuoc_hung	748	phường	Phước Hưng
8623	26551	phuong_phuoc_hiep	748	phường	Phước Hiệp
8624	26554	phuong_phuoc_nguyen	748	phường	Phước Nguyên
8625	26557	phuong_long_toan	748	phường	Long Toàn
8626	26558	phuong_long_tam	748	phường	Long Tâm
8627	26560	phuong_phuoc_trung	748	phường	Phước Trung
8628	26563	phuong_long_huong	748	phường	Long Hương
8629	26566	phuong_kim_dinh	748	phường	Kim Dinh
8630	26567	xa_tan_hung	748	xã	Tân Hưng
8631	26569	xa_long_phuoc	748	xã	Long Phước
8632	26572	xa_hoa_long	748	xã	Hoà Long
8633	26574	xa_bau_chinh	750	xã	Bàu Chinh
8634	26575	thi_tran_ngai_giao	750	thị trấn	Ngãi Giao
8635	26578	xa_binh_ba	750	xã	Bình Ba
8636	26581	xa_suoi_nghe	750	xã	Suối Nghệ
8637	26584	xa_xuan_son	750	xã	Xuân Sơn
8638	26587	xa_son_binh	750	xã	Sơn Bình
8639	26590	xa_binh_gia	750	xã	Bình Giã
8640	26593	xa_binh_trung	750	xã	Bình Trung
8641	26596	xa_xa_bang	750	xã	Xà Bang
8642	26599	xa_cu_bi	750	xã	Cù Bị
8643	26602	xa_lang_lon	750	xã	Láng Lớn
8644	26605	xa_quang_thanh	750	xã	Quảng Thành
8645	26608	xa_kim_long	750	xã	Kim Long
8646	26611	xa_suoi_rao	750	xã	Suối Rao
8647	26614	xa_da_bac	750	xã	Đá Bạc
8648	26617	xa_nghia_thanh	750	xã	Nghĩa Thành
8649	26620	thi_tran_phuoc_buu	751	thị trấn	Phước Bửu
8650	26623	xa_phuoc_thuan	751	xã	Phước Thuận
8651	26626	xa_phuoc_tan	751	xã	Phước Tân
8652	26629	xa_xuyen_moc	751	xã	Xuyên Mộc
8653	26632	xa_bong_trang	751	xã	Bông Trang
8654	26635	xa_tan_lam	751	xã	Tân Lâm
8655	26638	xa_bau_lam	751	xã	Bàu Lâm
8656	26641	xa_hoa_binh	751	xã	Hòa Bình
8657	26644	xa_hoa_hung	751	xã	Hòa Hưng
8658	26647	xa_hoa_hiep	751	xã	Hòa Hiệp
8659	26650	xa_hoa_hoi	751	xã	Hòa Hội
8660	26653	xa_bung_rieng	751	xã	Bưng Riềng
8661	26656	xa_binh_chau	751	xã	Bình Châu
8662	26659	thi_tran_long_dien	752	thị trấn	Long Điền
8663	26662	thi_tran_long_hai	752	thị trấn	Long Hải
8664	26665	xa_an_ngai	752	xã	An Ngãi
8665	26668	xa_tam_phuoc	752	xã	Tam Phước
8666	26671	xa_an_nhut	752	xã	An Nhứt
8667	26674	xa_phuoc_tinh	752	xã	Phước Tỉnh
8668	26677	xa_phuoc_hung	752	xã	Phước Hưng
8669	26680	thi_tran_dat_do	753	thị trấn	Đất Đỏ
8670	26683	xa_phuoc_long_tho	753	xã	Long Thọ
8671	26686	xa_phuoc_hoi	753	xã	Phước Hội
8672	26689	xa_long_my	753	xã	Long Mỹ
8673	26692	thi_tran_phuoc_hai	753	thị trấn	Phước Hải
8674	26695	xa_long_tan	753	xã	Long Tân
8675	26698	xa_lang_dai	753	xã	Láng Dài
8676	26701	xa_loc_an	753	xã	Lộc An
8677	26704	phuong_phu_my	754	phường	Phú Mỹ
8678	26707	xa_tan_hoa	754	xã	Tân Hoà
8679	26710	xa_tan_hai	754	xã	Tân Hải
8680	26713	phuong_phuoc_hoa	754	phường	Phước Hoà
8681	26716	phuong_tan_phuoc	754	phường	Tân Phước
8682	26719	phuong_my_xuan	754	phường	Mỹ Xuân
8683	26722	xa_song_xoai	754	xã	Sông Xoài
8684	26725	phuong_hac_dich	754	phường	Hắc Dịch
8685	26728	xa_chau_pha	754	xã	Châu Pha
8686	26731	xa_toc_tien	754	xã	Tóc Tiên
8687	26734	phuong_tan_dinh	760	phường	Tân Định
8688	26737	phuong_da_kao	760	phường	Đa Kao
8689	26740	phuong_ben_nghe	760	phường	Bến Nghé
8690	26743	phuong_ben_thanh	760	phường	Bến Thành
8691	26746	phuong_nguyen_thai_binh	760	phường	Thái Bình
8692	26749	phuong_pham_ngu_lao	760	phường	Ngũ Lão
8693	26752	phuong_cau_ong_lanh	760	phường	Ông Lãnh
8694	26755	phuong_co_giang	760	phường	Cô Giang
8695	26758	phuong_nguyen_cu_trinh	760	phường	Cư Trinh
8696	26761	phuong_cau_kho	760	phường	Cầu Kho
8697	26764	phuong_thanh_xuan	761	phường	Thạnh Xuân
8698	26767	phuong_thanh_loc	761	phường	Thạnh Lộc
8699	26770	phuong_hiep_thanh	761	phường	Hiệp Thành
8700	26773	phuong_thoi_an	761	phường	Thới An
8701	26776	phuong_tan_chanh_hiep	761	phường	Chánh Hiệp
8702	26779	phuong_an_phu_dong	761	phường	Phú Đông
8703	26782	phuong_tan_thoi_hiep	761	phường	Thới Hiệp
8704	26785	phuong_trung_my_tay	761	phường	Mỹ Tây
8705	26787	phuong_tan_hung_thuan	761	phường	Hưng Thuận
8706	26788	phuong_dong_hung_thuan	761	phường	Hưng Thuận
8707	26791	phuong_tan_thoi_nhat	761	phường	Thới Nhất
8708	26869	phuong_15	764	phường	Phường 15
8709	26872	phuong_13	764	phường	Phường 13
8710	26875	phuong_17	764	phường	Phường 17
8711	26876	phuong_6	764	phường	Phường 6
8712	26878	phuong_16	764	phường	Phường 16
8713	26881	phuong_12	764	phường	Phường 12
8714	26882	phuong_14	764	phường	Phường 14
8715	26884	phuong_10	764	phường	Phường 10
8716	26887	phuong_05	764	phường	Phường 05
8717	26890	phuong_07	764	phường	Phường 07
8718	26893	phuong_04	764	phường	Phường 04
8719	26896	phuong_01	764	phường	Phường 01
8720	26897	phuong_9	764	phường	Phường 9
8721	26898	phuong_8	764	phường	Phường 8
8722	26899	phuong_11	764	phường	Phường 11
8723	26902	phuong_03	764	phường	Phường 03
8724	26905	phuong_13	765	phường	Phường 13
8725	26908	phuong_11	765	phường	Phường 11
8726	26911	phuong_27	765	phường	Phường 27
8727	26914	phuong_26	765	phường	Phường 26
8728	26917	phuong_12	765	phường	Phường 12
8729	26920	phuong_25	765	phường	Phường 25
8730	26923	phuong_05	765	phường	Phường 05
8731	26926	phuong_07	765	phường	Phường 07
8732	26929	phuong_24	765	phường	Phường 24
8733	26932	phuong_06	765	phường	Phường 06
8734	26935	phuong_14	765	phường	Phường 14
8735	26938	phuong_15	765	phường	Phường 15
8736	26941	phuong_02	765	phường	Phường 02
8737	26944	phuong_01	765	phường	Phường 01
8738	26947	phuong_03	765	phường	Phường 03
8739	26950	phuong_17	765	phường	Phường 17
8740	26953	phuong_21	765	phường	Phường 21
8741	26956	phuong_22	765	phường	Phường 22
8742	26959	phuong_19	765	phường	Phường 19
8743	26962	phuong_28	765	phường	Phường 28
8744	26965	phuong_02	766	phường	Phường 02
8745	26968	phuong_04	766	phường	Phường 04
8746	26971	phuong_12	766	phường	Phường 12
8747	26974	phuong_13	766	phường	Phường 13
8748	26977	phuong_01	766	phường	Phường 01
8749	26980	phuong_03	766	phường	Phường 03
8750	26983	phuong_11	766	phường	Phường 11
8751	26986	phuong_07	766	phường	Phường 07
8752	26989	phuong_05	766	phường	Phường 05
8753	26992	phuong_10	766	phường	Phường 10
8754	26995	phuong_06	766	phường	Phường 06
8755	26998	phuong_08	766	phường	Phường 08
8756	27001	phuong_09	766	phường	Phường 09
8757	27004	phuong_14	766	phường	Phường 14
8758	27007	phuong_15	766	phường	Phường 15
8759	27010	phuong_tan_son_nhi	767	phường	Sơn Nhì
8760	27013	phuong_tay_thanh	767	phường	Tây Thạnh
8761	27016	phuong_son_ky	767	phường	Sơn Kỳ
8762	27019	phuong_tan_quy	767	phường	Tân Quý
8763	27022	phuong_tan_thanh	767	phường	Tân Thành
8764	27025	phuong_phu_tho_hoa	767	phường	Thọ Hòa
8765	27028	phuong_phu_thanh	767	phường	Phú Thạnh
8766	27031	phuong_phu_trung	767	phường	Phú Trung
8767	27034	phuong_hoa_thanh	767	phường	Hòa Thạnh
8768	27037	phuong_hiep_tan	767	phường	Hiệp Tân
8769	27040	phuong_tan_thoi_hoa	767	phường	Thới Hòa
8770	27043	phuong_04	768	phường	Phường 04
8771	27046	phuong_05	768	phường	Phường 05
8772	27049	phuong_09	768	phường	Phường 09
8773	27052	phuong_07	768	phường	Phường 07
8774	27055	phuong_03	768	phường	Phường 03
8775	27058	phuong_01	768	phường	Phường 01
8776	27061	phuong_02	768	phường	Phường 02
8777	27064	phuong_08	768	phường	Phường 08
8778	27067	phuong_15	768	phường	Phường 15
8779	27070	phuong_10	768	phường	Phường 10
8780	27073	phuong_11	768	phường	Phường 11
8781	27076	phuong_17	768	phường	Phường 17
8782	27085	phuong_13	768	phường	Phường 13
8783	26794	phuong_linh_xuan	769	phường	Linh Xuân
8784	26797	phuong_binh_chieu	769	phường	Bình Chiểu
8785	26800	phuong_linh_trung	769	phường	Linh Trung
8786	26803	phuong_tam_binh	769	phường	Tam Bình
8787	26806	phuong_tam_phu	769	phường	Tam Phú
8788	26809	phuong_hiep_binh_phuoc	769	phường	Bình Phước
8789	26812	phuong_hiep_binh_chanh	769	phường	Bình Chánh
8790	26815	phuong_linh_chieu	769	phường	Linh Chiểu
8791	26818	phuong_linh_tay	769	phường	Linh Tây
8792	26821	phuong_linh_dong	769	phường	Linh Đông
8793	26824	phuong_binh_tho	769	phường	Bình Thọ
8794	26827	phuong_truong_tho	769	phường	Trường Thọ
8795	26830	phuong_long_binh	769	phường	Long Bình
8796	26833	phuong_long_thanh_my	769	phường	Thạnh Mỹ
8797	26836	phuong_tan_phu	769	phường	Tân Phú
8798	26839	phuong_hiep_phu	769	phường	Hiệp Phú
8799	26842	phuong_tang_nhon_phu_a	769	phường	Phú A
8800	26845	phuong_tang_nhon_phu_b	769	phường	Phú B
8801	26848	phuong_phuoc_long_b	769	phường	Long B
8802	26851	phuong_phuoc_long_a	769	phường	Long A
8803	26854	phuong_truong_thanh	769	phường	Trường Thạnh
8804	26857	phuong_long_phuoc	769	phường	Long Phước
8805	26860	phuong_long_truong	769	phường	Long Trường
8806	26863	phuong_phuoc_binh	769	phường	Phước Bình
8807	26866	phuong_phu_huu	769	phường	Phú Hữu
8808	27088	phuong_thao_dien	769	phường	Thảo Điền
8809	27091	phuong_an_phu	769	phường	An Phú
8810	27094	phuong_an_khanh	769	phường	An Khánh
8811	27097	phuong_binh_trung_dong	769	phường	Trưng Đông
8812	27100	phuong_binh_trung_tay	769	phường	Trưng Tây
8813	27109	phuong_cat_lai	769	phường	Cát Lái
8814	27112	phuong_thanh_my_loi	769	phường	Mỹ Lợi
8815	27115	phuong_an_loi_dong	769	phường	Lợi Đông
8816	27118	phuong_thu_thiem	769	phường	Thủ Thiêm
8817	27127	phuong_14	770	phường	Phường 14
8818	27130	phuong_12	770	phường	Phường 12
8819	27133	phuong_11	770	phường	Phường 11
8820	27136	phuong_13	770	phường	Phường 13
8821	27139	phuong_vo_thi_sau	770	phường	Thị Sáu
8822	27142	phuong_09	770	phường	Phường 09
8823	27145	phuong_10	770	phường	Phường 10
8824	27148	phuong_04	770	phường	Phường 04
8825	27151	phuong_05	770	phường	Phường 05
8826	27154	phuong_03	770	phường	Phường 03
8827	27157	phuong_02	770	phường	Phường 02
8828	27160	phuong_01	770	phường	Phường 01
8829	27163	phuong_15	771	phường	Phường 15
8830	27166	phuong_13	771	phường	Phường 13
8831	27169	phuong_14	771	phường	Phường 14
8832	27172	phuong_12	771	phường	Phường 12
8833	27175	phuong_11	771	phường	Phường 11
8834	27178	phuong_10	771	phường	Phường 10
8835	27181	phuong_09	771	phường	Phường 09
8836	27184	phuong_01	771	phường	Phường 01
8837	27187	phuong_08	771	phường	Phường 08
8838	27190	phuong_02	771	phường	Phường 02
8839	27193	phuong_04	771	phường	Phường 04
8840	27196	phuong_07	771	phường	Phường 07
8841	27199	phuong_05	771	phường	Phường 05
8842	27202	phuong_06	771	phường	Phường 06
8843	27208	phuong_15	772	phường	Phường 15
8844	27211	phuong_05	772	phường	Phường 05
8845	27214	phuong_14	772	phường	Phường 14
8846	27217	phuong_11	772	phường	Phường 11
8847	27220	phuong_03	772	phường	Phường 03
8848	27223	phuong_10	772	phường	Phường 10
8849	27226	phuong_13	772	phường	Phường 13
8850	27229	phuong_08	772	phường	Phường 08
8851	27232	phuong_09	772	phường	Phường 09
8852	27235	phuong_12	772	phường	Phường 12
8853	27238	phuong_07	772	phường	Phường 07
8854	27241	phuong_06	772	phường	Phường 06
8855	27244	phuong_04	772	phường	Phường 04
8856	27247	phuong_01	772	phường	Phường 01
8857	27250	phuong_02	772	phường	Phường 02
8858	27253	phuong_16	772	phường	Phường 16
8859	27259	phuong_13	773	phường	Phường 13
8860	27262	phuong_09	773	phường	Phường 09
8861	27265	phuong_06	773	phường	Phường 06
8862	27268	phuong_08	773	phường	Phường 08
8863	27271	phuong_10	773	phường	Phường 10
8864	27277	phuong_18	773	phường	Phường 18
8865	27280	phuong_14	773	phường	Phường 14
8866	27283	phuong_04	773	phường	Phường 04
8867	27286	phuong_03	773	phường	Phường 03
8868	27289	phuong_16	773	phường	Phường 16
8869	27292	phuong_02	773	phường	Phường 02
8870	27295	phuong_15	773	phường	Phường 15
8871	27298	phuong_01	773	phường	Phường 01
8872	27301	phuong_04	774	phường	Phường 04
8873	27304	phuong_09	774	phường	Phường 09
8874	27307	phuong_03	774	phường	Phường 03
8875	27310	phuong_12	774	phường	Phường 12
8876	27313	phuong_02	774	phường	Phường 02
8877	27316	phuong_08	774	phường	Phường 08
8878	27322	phuong_07	774	phường	Phường 07
8879	27325	phuong_01	774	phường	Phường 01
8880	27328	phuong_11	774	phường	Phường 11
8881	27331	phuong_14	774	phường	Phường 14
8882	27334	phuong_05	774	phường	Phường 05
8883	27337	phuong_06	774	phường	Phường 06
8884	27340	phuong_10	774	phường	Phường 10
8885	27343	phuong_13	774	phường	Phường 13
8886	27346	phuong_14	775	phường	Phường 14
8887	27349	phuong_13	775	phường	Phường 13
8888	27352	phuong_09	775	phường	Phường 09
8889	27355	phuong_06	775	phường	Phường 06
8890	27358	phuong_12	775	phường	Phường 12
8891	27361	phuong_05	775	phường	Phường 05
8892	27364	phuong_11	775	phường	Phường 11
8893	27367	phuong_02	775	phường	Phường 02
8894	27370	phuong_01	775	phường	Phường 01
8895	27373	phuong_04	775	phường	Phường 04
8896	27376	phuong_08	775	phường	Phường 08
8897	27379	phuong_03	775	phường	Phường 03
8898	27382	phuong_07	775	phường	Phường 07
8899	27385	phuong_10	775	phường	Phường 10
8900	27388	phuong_08	776	phường	Phường 08
8901	27391	phuong_02	776	phường	Phường 02
8902	27394	phuong_01	776	phường	Phường 01
8903	27397	phuong_03	776	phường	Phường 03
8904	27400	phuong_11	776	phường	Phường 11
8905	27403	phuong_09	776	phường	Phường 09
8906	27406	phuong_10	776	phường	Phường 10
8907	27409	phuong_04	776	phường	Phường 04
8908	27412	phuong_13	776	phường	Phường 13
8909	27415	phuong_12	776	phường	Phường 12
8910	27418	phuong_05	776	phường	Phường 05
8911	27421	phuong_14	776	phường	Phường 14
8912	27424	phuong_06	776	phường	Phường 06
8913	27427	phuong_15	776	phường	Phường 15
8914	27430	phuong_16	776	phường	Phường 16
8915	27433	phuong_07	776	phường	Phường 07
8916	27436	phuong_binh_hung_hoa	777	phường	Hưng Hòa
8917	27439	phuong_binh_hung_hoa_a	777	phường	Hoà A
8918	27442	phuong_binh_hung_hoa_b	777	phường	Hoà B
8919	27445	phuong_binh_tri_dong	777	phường	Trị Đông
8920	27448	phuong_binh_tri_dong_a	777	phường	Đông A
8921	27451	phuong_binh_tri_dong_b	777	phường	Đông B
8922	27454	phuong_tan_tao	777	phường	Tân Tạo
8923	27457	phuong_tan_tao_a	777	phường	Tạo A
8924	27460	phuong_an_lac	777	phường	An Lạc
8925	27463	phuong_an_lac_a	777	phường	Lạc A
8926	27466	phuong_tan_thuan_dong	778	phường	Thuận Đông
8927	27469	phuong_tan_thuan_tay	778	phường	Thuận Tây
8928	27472	phuong_tan_kieng	778	phường	Tân Kiểng
8929	27475	phuong_tan_hung	778	phường	Tân Hưng
8930	27478	phuong_binh_thuan	778	phường	Bình Thuận
8931	27481	phuong_tan_quy	778	phường	Tân Quy
8932	27484	phuong_phu_thuan	778	phường	Phú Thuận
8933	27487	phuong_tan_phu	778	phường	Tân Phú
8934	27490	phuong_tan_phong	778	phường	Tân Phong
8935	27493	phuong_phu_my	778	phường	Phú Mỹ
8936	27496	thi_tran_cu_chi	783	thị trấn	Củ Chi
8937	27499	xa_phu_my_hung	783	xã	Mỹ Hưng
8938	27502	xa_an_phu	783	xã	An Phú
8939	27505	xa_trung_lap_thuong	783	xã	Lập Thượng
8940	27508	xa_an_nhon_tay	783	xã	Nhơn Tây
8941	27511	xa_nhuan_duc	783	xã	Nhuận Đức
8942	27514	xa_pham_van_coi	783	xã	Văn Cội
8943	27517	xa_phu_hoa_dong	783	xã	Hòa Đông
8944	27520	xa_trung_lap_ha	783	xã	Lập Hạ
8945	27523	xa_trung_an	783	xã	Trung An
8946	27526	xa_phuoc_thanh	783	xã	Phước Thạnh
8947	27529	xa_phuoc_hiep	783	xã	Phước Hiệp
8948	27532	xa_tan_an_hoi	783	xã	An Hội
8949	27535	xa_phuoc_vinh_an	783	xã	Vĩnh An
8950	27538	xa_thai_my	783	xã	Thái Mỹ
8951	27541	xa_tan_thanh_tay	783	xã	Thạnh Tây
8952	27544	xa_hoa_phu	783	xã	Hòa Phú
8953	27547	xa_tan_thanh_dong	783	xã	Thạnh Đông
8954	27550	xa_binh_my	783	xã	Bình Mỹ
8955	27553	xa_tan_phu_trung	783	xã	Phú Trung
8956	27556	xa_tan_thong_hoi	783	xã	Thông Hội
8957	27559	thi_tran_hoc_mon	784	thị trấn	Hóc Môn
8958	27562	xa_tan_hiep	784	xã	Tân Hiệp
8959	27565	xa_nhi_binh	784	xã	Nhị Bình
8960	27568	xa_dong_thanh	784	xã	Đông Thạnh
8961	27571	xa_tan_thoi_nhi	784	xã	Thới Nhì
8962	27574	xa_thoi_tam_thon	784	xã	Tam Thôn
8963	27577	xa_xuan_thoi_son	784	xã	Thới Sơn
8964	27580	xa_tan_xuan	784	xã	Tân Xuân
8965	27583	xa_xuan_thoi_dong	784	xã	Thới Đông
8966	27586	xa_trung_chanh	784	xã	Trung Chánh
8967	27589	xa_xuan_thoi_thuong	784	xã	Thới Thượng
8968	27592	xa_ba_diem	784	xã	Bà Điểm
8969	27595	thi_tran_tan_tuc	785	thị trấn	Tân Túc
8970	27598	xa_pham_van_hai	785	xã	Văn Hai
8971	27601	xa_vinh_loc_a	785	xã	Lộc A
8972	27604	xa_vinh_loc_b	785	xã	Lộc B
8973	27607	xa_binh_loi	785	xã	Bình Lợi
8974	27610	xa_le_minh_xuan	785	xã	Minh Xuân
8975	27613	xa_tan_nhut	785	xã	Tân Nhựt
8976	27616	xa_tan_kien	785	xã	Tân Kiên
8977	27619	xa_binh_hung	785	xã	Bình Hưng
8978	27622	xa_phong_phu	785	xã	Phong Phú
8979	27625	xa_an_phu_tay	785	xã	Phú Tây
8980	27628	xa_hung_long	785	xã	Hưng Long
8981	27631	xa_da_phuoc	785	xã	Đa Phước
8982	27634	xa_tan_quy_tay	785	xã	Quý Tây
8983	27637	xa_binh_chanh	785	xã	Bình Chánh
8984	27640	xa_quy_duc	785	xã	Quy Đức
8985	27643	thi_tran_nha_be	786	thị trấn	Nhà Bè
8986	27646	xa_phuoc_kien	786	xã	Phước Kiển
8987	27649	xa_phuoc_loc	786	xã	Phước Lộc
8988	27652	xa_nhon_duc	786	xã	Nhơn Đức
8989	27655	xa_phu_xuan	786	xã	Phú Xuân
8990	27658	xa_long_thoi	786	xã	Long Thới
8991	27661	xa_hiep_phuoc	786	xã	Hiệp Phước
8992	27664	thi_tran_can_thanh	787	thị trấn	Cần Thạnh
8993	27667	xa_binh_khanh	787	xã	Bình Khánh
8994	27670	xa_tam_thon_hiep	787	xã	Thôn Hiệp
8995	27673	xa_an_thoi_dong	787	xã	Thới Đông
8996	27676	xa_thanh_an	787	xã	Thạnh An
8997	27679	xa_long_hoa	787	xã	Long Hòa
8998	27682	xa_ly_nhon	787	xã	Lý Nhơn
8999	27685	phuong_5	794	phường	Phường 5
9000	27688	phuong_2	794	phường	Phường 2
9001	27691	phuong_4	794	phường	Phường 4
9002	27692	phuong_tan_khanh	794	phường	Tân Khánh
9003	27694	phuong_1	794	phường	Phường 1
9004	27697	phuong_3	794	phường	Phường 3
9005	27698	phuong_7	794	phường	Phường 7
9006	27700	phuong_6	794	phường	Phường 6
9007	27703	xa_huong_tho_phu	794	xã	Thọ Phú
9008	27706	xa_nhon_thanh_trung	794	xã	Thạnh Trung
9009	27709	xa_loi_binh_nhon	794	xã	Bình Nhơn
9010	27712	xa_binh_tam	794	xã	Bình Tâm
9011	27715	phuong_khanh_hau	794	phường	Khánh Hậu
9012	27718	xa_an_vinh_ngai	794	xã	Vĩnh Ngãi
9013	27787	phuong_1	795	phường	Phường 1
9014	27788	phuong_2	795	phường	Phường 2
9015	27790	xa_thanh_tri	795	xã	Thạnh Trị
9016	27793	xa_binh_hiep	795	xã	Bình Hiệp
9017	27799	xa_binh_tan	795	xã	Bình Tân
9018	27805	xa_tuyen_thanh	795	xã	Tuyên Thạnh
9019	27806	phuong_3	795	phường	Phường 3
9020	27817	xa_thanh_hung	795	xã	Thạnh Hưng
9021	27721	thi_tran_tan_hung	796	thị trấn	Tân Hưng
9022	27724	xa_hung_ha	796	xã	Hưng Hà
9023	27727	xa_hung_dien_b	796	xã	Điền B
9024	27730	xa_hung_dien	796	xã	Hưng Điền
9025	27733	xa_thanh_hung	796	xã	Thạnh Hưng
9026	27736	xa_hung_thanh	796	xã	Hưng Thạnh
9027	27739	xa_vinh_thanh	796	xã	Vĩnh Thạnh
9028	27742	xa_vinh_chau_b	796	xã	Châu B
9029	27745	xa_vinh_loi	796	xã	Vĩnh Lợi
9030	27748	xa_vinh_dai	796	xã	Vĩnh Đại
9031	27751	xa_vinh_chau_a	796	xã	Châu A
9032	27754	xa_vinh_buu	796	xã	Vĩnh Bửu
9033	27757	thi_tran_vinh_hung	797	thị trấn	Vĩnh Hưng
9034	27760	xa_hung_dien_a	797	xã	Điền A
9035	27763	xa_khanh_hung	797	xã	Khánh Hưng
9036	27766	xa_thai_tri	797	xã	Thái Trị
9037	27769	xa_vinh_tri	797	xã	Vĩnh Trị
9038	27772	xa_thai_binh_trung	797	xã	Bình Trung
9039	27775	xa_vinh_binh	797	xã	Vĩnh Bình
9040	27778	xa_vinh_thuan	797	xã	Vĩnh Thuận
9041	27781	xa_tuyen_binh	797	xã	Tuyên Bình
9042	27784	xa_tuyen_binh_tay	797	xã	Bình Tây
9043	27796	xa_binh_hoa_tay	798	xã	Hòa Tây
9044	27802	xa_binh_thanh	798	xã	Bình Thạnh
9045	27808	xa_binh_hoa_trung	798	xã	Hòa Trung
9046	27811	xa_binh_hoa_dong	798	xã	Hòa Đông
9047	27814	thi_tran_binh_phong_thanh	798	thị trấn	Phong Thạnh
9048	27820	xa_tan_lap	798	xã	Tân Lập
9049	27823	xa_tan_thanh	798	xã	Tân Thành
9050	27826	thi_tran_tan_thanh	799	thị trấn	Tân Thạnh
9051	27829	xa_bac_hoa	799	xã	Bắc Hòa
9052	27832	xa_hau_thanh_tay	799	xã	Thạnh Tây
9053	27835	xa_nhon_hoa_lap	799	xã	Hòa Lập
9054	27838	xa_tan_lap	799	xã	Tân Lập
9055	27841	xa_hau_thanh_dong	799	xã	Thạnh Đông
9056	27844	xa_nhon_hoa	799	xã	Nhơn Hoà
9057	27847	xa_kien_binh	799	xã	Kiến Bình
9058	27850	xa_tan_thanh	799	xã	Tân Thành
9059	27853	xa_tan_binh	799	xã	Tân Bình
9060	27856	xa_tan_ninh	799	xã	Tân Ninh
9061	27859	xa_nhon_ninh	799	xã	Nhơn Ninh
9062	27862	xa_tan_hoa	799	xã	Tân Hòa
9063	27865	thi_tran_thanh_hoa	800	thị trấn	Thạnh Hóa
9064	27868	xa_tan_hiep	800	xã	Tân Hiệp
9065	27871	xa_thuan_binh	800	xã	Thuận Bình
9066	27874	xa_thanh_phuoc	800	xã	Thạnh Phước
9067	27877	xa_thanh_phu	800	xã	Thạnh Phú
9068	27880	xa_thuan_nghia_hoa	800	xã	Nghĩa Hòa
9069	27883	xa_thuy_dong	800	xã	Thủy Đông
9070	27886	xa_thuy_tay	800	xã	Thủy Tây
9071	27889	xa_tan_tay	800	xã	Tân Tây
9072	27892	xa_tan_dong	800	xã	Tân Đông
9073	27895	xa_thanh_an	800	xã	Thạnh An
9074	27898	thi_tran_dong_thanh	801	thị trấn	Đông Thành
9075	27901	xa_my_quy_dong	801	xã	Quý Đông
9076	27904	xa_my_thanh_bac	801	xã	Thạnh Bắc
9077	27907	xa_my_quy_tay	801	xã	Quý Tây
9078	27910	xa_my_thanh_tay	801	xã	Thạnh Tây
9079	27913	xa_my_thanh_dong	801	xã	Thạnh Đông
9080	27916	xa_binh_thanh	801	xã	Bình Thành
9081	27919	xa_binh_hoa_bac	801	xã	Hòa Bắc
9082	27922	xa_binh_hoa_hung	801	xã	Hòa Hưng
9083	27925	xa_binh_hoa_nam	801	xã	Hòa Nam
9084	27928	xa_my_binh	801	xã	Mỹ Bình
9085	27931	thi_tran_hau_nghia	802	thị trấn	Hậu Nghĩa
9086	27934	thi_tran_hiep_hoa	802	thị trấn	Hiệp Hòa
9087	27937	thi_tran_duc_hoa	802	thị trấn	Đức Hòa
9088	27940	xa_loc_giang	802	xã	Lộc Giang
9089	27943	xa_an_ninh_dong	802	xã	Ninh Đông
9090	27946	xa_an_ninh_tay	802	xã	Ninh Tây
9091	27949	xa_tan_my	802	xã	Tân Mỹ
9092	27952	xa_hiep_hoa	802	xã	Hiệp Hòa
9093	27955	xa_duc_lap_thuong	802	xã	Lập Thượng
9094	27958	xa_duc_lap_ha	802	xã	Lập Hạ
9095	27961	xa_tan_phu	802	xã	Tân Phú
9096	27964	xa_my_hanh_bac	802	xã	Hạnh Bắc
9097	27967	xa_duc_hoa_thuong	802	xã	Hòa Thượng
9098	27970	xa_hoa_khanh_tay	802	xã	Khánh Tây
9099	27973	xa_hoa_khanh_dong	802	xã	Khánh Đông
9100	27976	xa_my_hanh_nam	802	xã	Hạnh Nam
9101	27979	xa_hoa_khanh_nam	802	xã	Khánh Nam
9102	27982	xa_duc_hoa_dong	802	xã	Hòa Đông
9103	27985	xa_duc_hoa_ha	802	xã	Hòa Hạ
9104	27988	xa_huu_thanh	802	xã	Hựu Thạnh
9105	27991	thi_tran_ben_luc	803	thị trấn	Bến Lức
9106	27994	xa_thanh_loi	803	xã	Thạnh Lợi
9107	27997	xa_luong_binh	803	xã	Lương Bình
9108	28000	xa_thanh_hoa	803	xã	Thạnh Hòa
9109	28003	xa_luong_hoa	803	xã	Lương Hòa
9110	28006	xa_tan_hoa	803	xã	Tân Hòa
9111	28009	xa_tan_buu	803	xã	Tân Bửu
9112	28012	xa_an_thanh	803	xã	An Thạnh
9113	28015	xa_binh_duc	803	xã	Bình Đức
9114	28018	xa_my_yen	803	xã	Mỹ Yên
9115	28021	xa_thanh_phu	803	xã	Thanh Phú
9116	28024	xa_long_hiep	803	xã	Long Hiệp
9117	28027	xa_thanh_duc	803	xã	Thạnh Đức
9118	28030	xa_phuoc_loi	803	xã	Phước Lợi
9119	28033	xa_nhut_chanh	803	xã	Nhựt Chánh
9120	28036	thi_tran_thu_thua	804	thị trấn	Thủ Thừa
9121	28039	xa_long_thanh	804	xã	Long Thạnh
9122	28042	xa_tan_thanh	804	xã	Tân Thành
9123	28045	xa_long_thuan	804	xã	Long Thuận
9124	28048	xa_my_lac	804	xã	Mỹ Lạc
9125	28051	xa_my_thanh	804	xã	Mỹ Thạnh
9126	28054	xa_binh_an	804	xã	Bình An
9127	28057	xa_nhi_thanh	804	xã	Nhị Thành
9128	28060	xa_my_an	804	xã	Mỹ An
9129	28063	xa_binh_thanh	804	xã	Bình Thạnh
9130	28066	xa_my_phu	804	xã	Mỹ Phú
9131	28072	xa_tan_long	804	xã	Tân Long
9132	28075	thi_tran_tan_tru	805	thị trấn	Tân Trụ
9133	28078	xa_tan_binh	805	xã	Tân Bình
9134	28084	xa_que_my_thanh	805	xã	Mỹ Thạnh
9135	28087	xa_lac_tan	805	xã	Lạc Tấn
9136	28090	xa_binh_trinh_dong	805	xã	Trinh Đông
9137	28093	xa_tan_phuoc_tay	805	xã	Phước Tây
9138	28096	xa_binh_lang	805	xã	Bình Lãng
9139	28099	xa_binh_tinh	805	xã	Bình Tịnh
9140	28102	xa_duc_tan	805	xã	Đức Tân
9141	28105	xa_nhut_ninh	805	xã	Nhựt Ninh
9142	28108	thi_tran_can_duoc	806	thị trấn	Cần Đước
9143	28111	xa_long_trach	806	xã	Long Trạch
9144	28114	xa_long_khe	806	xã	Long Khê
9145	28117	xa_long_dinh	806	xã	Long Định
9146	28120	xa_phuoc_van	806	xã	Phước Vân
9147	28123	xa_long_hoa	806	xã	Long Hòa
9148	28126	xa_long_cang	806	xã	Long Cang
9149	28129	xa_long_son	806	xã	Long Sơn
9150	28132	xa_tan_trach	806	xã	Tân Trạch
9151	28135	xa_my_le	806	xã	Mỹ Lệ
9152	28138	xa_tan_lan	806	xã	Tân Lân
9153	28141	xa_phuoc_tuy	806	xã	Phước Tuy
9154	28144	xa_long_huu_dong	806	xã	Hựu Đông
9155	28147	xa_tan_an	806	xã	Tân Ân
9156	28150	xa_phuoc_dong	806	xã	Phước Đông
9157	28153	xa_long_huu_tay	806	xã	Hựu Tây
9158	28156	xa_tan_chanh	806	xã	Tân Chánh
9159	28159	thi_tran_can_giuoc	807	thị trấn	Cần Giuộc
9160	28162	xa_phuoc_ly	807	xã	Phước Lý
9161	28165	xa_long_thuong	807	xã	Long Thượng
9162	28168	xa_long_hau	807	xã	Long Hậu
9163	28174	xa_phuoc_hau	807	xã	Phước Hậu
9164	28177	xa_my_loc	807	xã	Mỹ Lộc
9165	28180	xa_phuoc_lai	807	xã	Phước Lại
9166	28183	xa_phuoc_lam	807	xã	Phước Lâm
9167	28189	xa_thuan_thanh	807	xã	Thuận Thành
9168	28192	xa_phuoc_vinh_tay	807	xã	Vĩnh Tây
9169	28195	xa_phuoc_vinh_dong	807	xã	Vĩnh Đông
9170	28198	xa_long_an	807	xã	Long An
9171	28201	xa_long_phung	807	xã	Long Phụng
9172	28204	xa_dong_thanh	807	xã	Đông Thạnh
9173	28207	xa_tan_tap	807	xã	Tân Tập
9174	28210	thi_tran_tam_vu	808	thị trấn	Tầm Vu
9175	28213	xa_binh_quoi	808	xã	Bình Quới
9176	28216	xa_hoa_phu	808	xã	Hòa Phú
9177	28219	xa_phu_ngai_tri	808	xã	Ngãi Trị
9178	28222	xa_vinh_cong	808	xã	Vĩnh Công
9179	28225	xa_thuan_my	808	xã	Thuận Mỹ
9180	28228	xa_hiep_thanh	808	xã	Hiệp Thạnh
9181	28231	xa_phuoc_tan_hung	808	xã	Tân Hưng
9182	28234	xa_thanh_phu_long	808	xã	Phú Long
9183	28237	xa_duong_xuan_hoi	808	xã	Xuân Hội
9184	28240	xa_an_luc_long	808	xã	Lục Long
9185	28243	xa_long_tri	808	xã	Long Trì
9186	28246	xa_thanh_vinh_dong	808	xã	Vĩnh Đông
9187	28249	phuong_5	815	phường	Phường 5
9188	28252	phuong_4	815	phường	Phường 4
9189	28255	phuong_7	815	phường	Phường 7
9190	28258	phuong_3	815	phường	Phường 3
9191	28261	phuong_1	815	phường	Phường 1
9192	28264	phuong_2	815	phường	Phường 2
9193	28267	phuong_8	815	phường	Phường 8
9194	28270	phuong_6	815	phường	Phường 6
9195	28273	phuong_9	815	phường	Phường 9
9196	28276	phuong_10	815	phường	Phường 10
9197	28279	phuong_tan_long	815	phường	Tân Long
9198	28282	xa_dao_thanh	815	xã	Đạo Thạnh
9199	28285	xa_trung_an	815	xã	Trung An
9200	28288	xa_my_phong	815	xã	Mỹ Phong
9201	28291	xa_tan_my_chanh	815	xã	Mỹ Chánh
9202	28567	xa_phuoc_thanh	815	xã	Phước Thạnh
9203	28591	xa_thoi_son	815	xã	Thới Sơn
9204	28294	phuong_3	816	phường	Phường 3
9205	28297	phuong_2	816	phường	Phường 2
9206	28300	phuong_4	816	phường	Phường 4
9207	28303	phuong_1	816	phường	Phường 1
9208	28306	phuong_5	816	phường	Phường 5
9209	28309	xa_long_hung	816	xã	Long Hưng
9210	28312	xa_long_thuan	816	xã	Long Thuận
9211	28315	xa_long_chanh	816	xã	Long Chánh
9212	28318	xa_long_hoa	816	xã	Long Hòa
9213	28708	xa_binh_dong	816	xã	Bình Đông
9214	28717	xa_binh_xuan	816	xã	Bình Xuân
9215	28729	xa_tan_trung	816	xã	Tân Trung
9216	28435	phuong_1	817	phường	Phường 1
9217	28436	phuong_2	817	phường	Phường 2
9218	28437	phuong_3	817	phường	Phường 3
9219	28439	phuong_4	817	phường	Phường 4
9220	28440	phuong_5	817	phường	Phường 5
9221	28447	xa_my_phuoc_tay	817	xã	Phước Tây
9222	28450	xa_my_hanh_dong	817	xã	Hạnh Đông
9223	28453	xa_my_hanh_trung	817	xã	Hạnh Trung
9224	28459	xa_tan_phu	817	xã	Tân Phú
9225	28462	xa_tan_binh	817	xã	Tân Bình
9226	28468	xa_tan_hoi	817	xã	Tân Hội
9227	28474	phuong_nhi_my	817	phường	Nhị Mỹ
9228	28477	xa_nhi_quy	817	xã	Nhị Quý
9229	28480	xa_thanh_hoa	817	xã	Thanh Hòa
9230	28483	xa_phu_quy	817	xã	Phú Quý
9231	28486	xa_long_khanh	817	xã	Long Khánh
9232	28321	thi_tran_my_phuoc	818	thị trấn	Mỹ Phước
9233	28324	xa_tan_hoa_dong	818	xã	Hòa Đông
9234	28327	xa_thanh_tan	818	xã	Thạnh Tân
9235	28330	xa_thanh_my	818	xã	Thạnh Mỹ
9236	28333	xa_thanh_hoa	818	xã	Thạnh Hoà
9237	28336	xa_phu_my	818	xã	Phú Mỹ
9238	28339	xa_tan_hoa_thanh	818	xã	Hòa Thành
9239	28342	xa_hung_thanh	818	xã	Hưng Thạnh
9240	28345	xa_tan_lap_1	818	xã	Tân Lập 1
9241	28348	xa_tan_hoa_tay	818	xã	Hòa Tây
9242	28354	xa_tan_lap_2	818	xã	Tân Lập 2
9243	28357	xa_phuoc_lap	818	xã	Phước Lập
9244	28360	thi_tran_cai_be	819	thị trấn	Cái Bè
9245	28363	xa_hau_my_bac_b	819	xã	Bắc B
9246	28366	xa_hau_my_bac_a	819	xã	Bắc A
9247	28369	xa_my_trung	819	xã	Mỹ Trung
9248	28372	xa_hau_my_trinh	819	xã	Mỹ Trinh
9249	28375	xa_hau_my_phu	819	xã	Mỹ Phú
9250	28378	xa_my_tan	819	xã	Mỹ Tân
9251	28381	xa_my_loi_b	819	xã	Lợi B
9252	28384	xa_thien_trung	819	xã	Thiện Trung
9253	28387	xa_my_hoi	819	xã	Mỹ Hội
9254	28390	xa_an_cu	819	xã	An Cư
9255	28393	xa_hau_thanh	819	xã	Hậu Thành
9256	28396	xa_my_loi_a	819	xã	Lợi A
9257	28399	xa_hoa_khanh	819	xã	Hòa Khánh
9258	28402	xa_thien_tri	819	xã	Thiện Trí
9259	28405	xa_my_duc_dong	819	xã	Đức Đông
9260	28408	xa_my_duc_tay	819	xã	Đức Tây
9261	28411	xa_dong_hoa_hiep	819	xã	Hòa Hiệp
9262	28414	xa_an_thai_dong	819	xã	Thái Đông
9263	28417	xa_tan_hung	819	xã	Tân Hưng
9264	28420	xa_my_luong	819	xã	Mỹ Lương
9265	28423	xa_tan_thanh	819	xã	Tân Thanh
9266	28426	xa_an_thai_trung	819	xã	Thái Trung
9267	28429	xa_an_huu	819	xã	An Hữu
9268	28432	xa_hoa_hung	819	xã	Hòa Hưng
9269	28438	xa_thanh_loc	820	xã	Thạnh Lộc
9270	28441	xa_my_thanh_bac	820	xã	Thành Bắc
9271	28444	xa_phu_cuong	820	xã	Phú Cường
9272	28456	xa_my_thanh_nam	820	xã	Thành Nam
9273	28465	xa_phu_nhuan	820	xã	Phú Nhuận
9274	28471	xa_binh_phu	820	xã	Bình Phú
9275	28489	xa_cam_son	820	xã	Cẩm Sơn
9276	28492	xa_phu_an	820	xã	Phú An
9277	28495	xa_my_long	820	xã	Mỹ Long
9278	28498	xa_long_tien	820	xã	Long Tiên
9279	28501	xa_hiep_duc	820	xã	Hiệp Đức
9280	28504	xa_long_trung	820	xã	Long Trung
9281	28507	xa_hoi_xuan	820	xã	Hội Xuân
9282	28510	xa_tan_phong	820	xã	Tân Phong
9283	28513	xa_tam_binh	820	xã	Tam Bình
9284	28516	xa_ngu_hiep	820	xã	Ngũ Hiệp
9285	28519	thi_tran_tan_hiep	821	thị trấn	Tân Hiệp
9286	28522	xa_tan_hoi_dong	821	xã	Hội Đông
9287	28525	xa_tan_huong	821	xã	Tân Hương
9288	28528	xa_tan_ly_dong	821	xã	Lý Đông
9289	28531	xa_tan_ly_tay	821	xã	Lý Tây
9290	28534	xa_than_cuu_nghia	821	xã	Cửu Nghĩa
9291	28537	xa_tam_hiep	821	xã	Tam Hiệp
9292	28540	xa_diem_hy	821	xã	Điềm Hy
9293	28543	xa_nhi_binh	821	xã	Nhị Bình
9294	28546	xa_duong_diem	821	xã	Dưỡng Điềm
9295	28549	xa_dong_hoa	821	xã	Đông Hòa
9296	28552	xa_long_dinh	821	xã	Long Định
9297	28555	xa_huu_dao	821	xã	Hữu Đạo
9298	28558	xa_long_an	821	xã	Long An
9299	28561	xa_long_hung	821	xã	Long Hưng
9300	28564	xa_binh_trung	821	xã	Bình Trưng
9301	28570	xa_thanh_phu	821	xã	Thạnh Phú
9302	28573	xa_ban_long	821	xã	Bàn Long
9303	28576	xa_vinh_kim	821	xã	Vĩnh Kim
9304	28579	xa_binh_duc	821	xã	Bình Đức
9305	28582	xa_song_thuan	821	xã	Song Thuận
9306	28585	xa_kim_son	821	xã	Kim Sơn
9307	28588	xa_phu_phong	821	xã	Phú Phong
9308	28594	thi_tran_cho_gao	822	thị trấn	Chợ Gạo
9309	28597	xa_trung_hoa	822	xã	Trung Hòa
9310	28600	xa_hoa_tinh	822	xã	Hòa Tịnh
9311	28603	xa_my_tinh_an	822	xã	Tịnh An
9312	28606	xa_tan_binh_thanh	822	xã	Bình Thạnh
9313	28609	xa_phu_kiet	822	xã	Phú Kiết
9314	28612	xa_luong_hoa_lac	822	xã	Hòa Lạc
9315	28615	xa_thanh_binh	822	xã	Thanh Bình
9316	28618	xa_quon_long	822	xã	Quơn Long
9317	28621	xa_binh_phuc_nhut	822	xã	Phục Nhứt
9318	28624	xa_dang_hung_phuoc	822	xã	Hưng Phước
9319	28627	xa_tan_thuan_binh	822	xã	Thuận Bình
9320	28630	xa_song_binh	822	xã	Song Bình
9321	28633	xa_binh_phan	822	xã	Bình Phan
9322	28636	xa_long_binh_dien	822	xã	Bình Điền
9323	28639	xa_an_thanh_thuy	822	xã	Thạnh Thủy
9324	28642	xa_xuan_dong	822	xã	Xuân Đông
9325	28645	xa_hoa_dinh	822	xã	Hòa Định
9326	28648	xa_binh_ninh	822	xã	Bình Ninh
9327	28651	thi_tran_vinh_binh	823	thị trấn	Vĩnh Bình
9328	28654	xa_dong_son	823	xã	Đồng Sơn
9329	28657	xa_binh_phu	823	xã	Bình Phú
9330	28660	xa_dong_thanh	823	xã	Đồng Thạnh
9331	28663	xa_thanh_cong	823	xã	Thành Công
9332	28666	xa_binh_nhi	823	xã	Bình Nhì
9333	28669	xa_yen_luong	823	xã	Yên Luông
9334	28672	xa_thanh_tri	823	xã	Thạnh Trị
9335	28675	xa_thanh_nhut	823	xã	Thạnh Nhựt
9336	28678	xa_long_vinh	823	xã	Long Vĩnh
9337	28681	xa_binh_tan	823	xã	Bình Tân
9338	28684	xa_vinh_huu	823	xã	Vĩnh Hựu
9339	28687	xa_long_binh	823	xã	Long Bình
9340	28702	thi_tran_tan_hoa	824	thị trấn	Tân Hòa
9341	28705	xa_tang_hoa	824	xã	Tăng Hoà
9342	28711	xa_tan_phuoc	824	xã	Tân Phước
9343	28714	xa_gia_thuan	824	xã	Gia Thuận
9344	28720	thi_tran_vam_lang	824	thị trấn	Vàm Láng
9345	28723	xa_tan_tay	824	xã	Tân Tây
9346	28726	xa_kieng_phuoc	824	xã	Kiểng Phước
9347	28732	xa_tan_dong	824	xã	Tân Đông
9348	28735	xa_binh_an	824	xã	Bình Ân
9349	28738	xa_tan_dien	824	xã	Tân Điền
9350	28741	xa_binh_nghi	824	xã	Bình Nghị
9351	28744	xa_phuoc_trung	824	xã	Phước Trung
9352	28747	xa_tan_thanh	824	xã	Tân Thành
9353	28690	xa_tan_thoi	825	xã	Tân Thới
9354	28693	xa_tan_phu	825	xã	Tân Phú
9355	28696	xa_phu_thanh	825	xã	Phú Thạnh
9356	28699	xa_tan_thanh	825	xã	Tân Thạnh
9357	28750	xa_phu_dong	825	xã	Phú Đông
9358	28753	xa_phu_tan	825	xã	Phú Tân
9359	28756	phuong_phu_khuong	829	phường	Phú Khương
9360	28757	phuong_phu_tan	829	phường	Phú Tân
9361	28759	phuong_8	829	phường	Phường 8
9362	28762	phuong_6	829	phường	Phường 6
9363	28765	phuong_4	829	phường	Phường 4
9364	28768	phuong_5	829	phường	Phường 5
9365	28777	phuong_an_hoi	829	phường	An Hội
9366	28780	phuong_7	829	phường	Phường 7
9367	28783	xa_son_dong	829	xã	Sơn Đông
9368	28786	xa_phu_hung	829	xã	Phú Hưng
9369	28789	xa_binh_phu	829	xã	Bình Phú
9370	28792	xa_my_thanh_an	829	xã	Thạnh An
9371	28795	xa_nhon_thanh	829	xã	Nhơn Thạnh
9372	28798	xa_phu_nhuan	829	xã	Phú Nhuận
9373	28801	thi_tran_chau_thanh	831	thị trấn	Châu Thành
9374	28804	xa_tan_thach	831	xã	Tân Thạch
9375	28807	xa_quoi_son	831	xã	Qưới Sơn
9376	28810	xa_an_khanh	831	xã	An Khánh
9377	28813	xa_giao_long	831	xã	Giao Long
9378	28819	xa_phu_tuc	831	xã	Phú Túc
9379	28822	xa_phu_duc	831	xã	Phú Đức
9380	28825	xa_phu_an_hoa	831	xã	An Hòa
9381	28828	xa_an_phuoc	831	xã	An Phước
9382	28831	xa_tam_phuoc	831	xã	Tam Phước
9383	28834	xa_thanh_trieu	831	xã	Thành Triệu
9384	28837	xa_tuong_da	831	xã	Tường Đa
9385	28840	xa_tan_phu	831	xã	Tân Phú
9386	28843	xa_quoi_thanh	831	xã	Quới Thành
9387	28846	xa_phuoc_thanh	831	xã	Phước Thạnh
9388	28849	xa_an_hoa	831	xã	An Hóa
9389	28852	xa_tien_long	831	xã	Tiên Long
9390	28855	xa_an_hiep	831	xã	An Hiệp
9391	28858	xa_huu_dinh	831	xã	Hữu Định
9392	28861	xa_tien_thuy	831	xã	Tiên Thủy
9393	28864	xa_son_hoa	831	xã	Sơn Hòa
9394	28870	thi_tran_cho_lach	832	thị trấn	Chợ Lách
9395	28873	xa_phu_phung	832	xã	Phú Phụng
9396	28876	xa_son_dinh	832	xã	Sơn Định
9397	28879	xa_vinh_binh	832	xã	Vĩnh Bình
9398	28882	xa_hoa_nghia	832	xã	Hòa Nghĩa
9399	28885	xa_long_thoi	832	xã	Long Thới
9400	28888	xa_phu_son	832	xã	Phú Sơn
9401	28891	xa_tan_thieng	832	xã	Tân Thiềng
9402	28894	xa_vinh_thanh	832	xã	Vĩnh Thành
9403	28897	xa_vinh_hoa	832	xã	Vĩnh Hòa
9404	28900	xa_hung_khanh_trung_b	832	xã	Trung B
9405	28903	thi_tran_mo_cay	833	thị trấn	Mỏ Cày
9406	28930	xa_dinh_thuy	833	xã	Định Thủy
9407	28939	xa_da_phuoc_hoi	833	xã	Phước Hội
9408	28940	xa_tan_hoi	833	xã	Tân Hội
9409	28942	xa_phuoc_hiep	833	xã	Phước Hiệp
9410	28945	xa_binh_khanh	833	xã	Bình Khánh
9411	28951	xa_an_thanh	833	xã	An Thạnh
9412	28957	xa_an_dinh	833	xã	An Định
9413	28960	xa_thanh_thoi_b	833	xã	Thới B
9414	28963	xa_tan_trung	833	xã	Tân Trung
9415	28966	xa_an_thoi	833	xã	An Thới
9416	28969	xa_thanh_thoi_a	833	xã	Thới A
9417	28972	xa_minh_duc	833	xã	Minh Đức
9418	28975	xa_ngai_dang	833	xã	Ngãi Đăng
9419	28978	xa_cam_son	833	xã	Cẩm Sơn
9420	28981	xa_huong_my	833	xã	Hương Mỹ
9421	28984	thi_tran_giong_trom	834	thị trấn	Giồng Trôm
9422	28987	xa_phong_nam	834	xã	Phong Nẫm
9423	28993	xa_my_thanh	834	xã	Mỹ Thạnh
9424	28996	xa_chau_hoa	834	xã	Châu Hòa
9425	28999	xa_luong_hoa	834	xã	Lương Hòa
9426	29002	xa_luong_quoi	834	xã	Lương Quới
9427	29005	xa_luong_phu	834	xã	Lương Phú
9428	29008	xa_chau_binh	834	xã	Châu Bình
9429	29011	xa_thuan_dien	834	xã	Thuận Điền
9430	29014	xa_son_phu	834	xã	Sơn Phú
9431	29017	xa_binh_hoa	834	xã	Bình Hoà
9432	29020	xa_phuoc_long	834	xã	Phước Long
9433	29023	xa_hung_phong	834	xã	Hưng Phong
9434	29026	xa_long_my	834	xã	Long Mỹ
9435	29029	xa_tan_hao	834	xã	Tân Hào
9436	29032	xa_binh_thanh	834	xã	Bình Thành
9437	29035	xa_tan_thanh	834	xã	Tân Thanh
9438	29038	xa_tan_loi_thanh	834	xã	Lợi Thạnh
9439	29041	xa_thanh_phu_dong	834	xã	Phú Đông
9440	29044	xa_hung_nhuong	834	xã	Hưng Nhượng
9441	29047	xa_hung_le	834	xã	Hưng Lễ
9442	29050	thi_tran_binh_dai	835	thị trấn	Bình Đại
9443	29053	xa_tam_hiep	835	xã	Tam Hiệp
9444	29056	xa_long_dinh	835	xã	Long Định
9445	29059	xa_long_hoa	835	xã	Long Hòa
9446	29062	xa_phu_thuan	835	xã	Phú Thuận
9447	29065	xa_vang_quoi_tay	835	xã	Quới Tây
9448	29068	xa_vang_quoi_dong	835	xã	Quới Đông
9449	29071	xa_chau_hung	835	xã	Châu Hưng
9450	29074	xa_phu_vang	835	xã	Phú Vang
9451	29077	xa_loc_thuan	835	xã	Lộc Thuận
9452	29080	xa_dinh_trung	835	xã	Định Trung
9453	29083	xa_thoi_lai	835	xã	Thới Lai
9454	29086	xa_binh_thoi	835	xã	Bình Thới
9455	29089	xa_phu_long	835	xã	Phú Long
9456	29092	xa_binh_thang	835	xã	Bình Thắng
9457	29095	xa_thanh_tri	835	xã	Thạnh Trị
9458	29098	xa_dai_hoa_loc	835	xã	Hòa Lộc
9459	29101	xa_thua_duc	835	xã	Thừa Đức
9460	29104	xa_thanh_phuoc	835	xã	Thạnh Phước
9461	29107	xa_thoi_thuan	835	xã	Thới Thuận
9462	29110	thi_tran_ba_tri	836	thị trấn	Ba Tri
9463	29113	xa_tan_my	836	xã	Tân Mỹ
9464	29116	xa_my_hoa	836	xã	Mỹ Hòa
9465	29119	xa_tan_xuan	836	xã	Tân Xuân
9466	29122	xa_my_chanh	836	xã	Mỹ Chánh
9467	29125	xa_bao_thanh	836	xã	Bảo Thạnh
9468	29128	xa_an_phu_trung	836	xã	Phú Trung
9469	29131	xa_my_thanh	836	xã	Mỹ Thạnh
9470	29134	xa_my_nhon	836	xã	Mỹ Nhơn
9471	29137	xa_phuoc_ngai	836	xã	Phước Ngãi
9472	29143	xa_an_ngai_trung	836	xã	Ngãi Trung
9473	29146	xa_phu_le	836	xã	Phú Lễ
9474	29149	xa_an_binh_tay	836	xã	Bình Tây
9475	29152	xa_bao_thuan	836	xã	Bảo Thuận
9476	29155	xa_tan_hung	836	xã	Tân Hưng
9477	29158	xa_an_ngai_tay	836	xã	Ngãi Tây
9478	29161	xa_an_hiep	836	xã	An Hiệp
9479	29164	xa_vinh_hoa	836	xã	Vĩnh Hòa
9480	29167	xa_tan_thuy	836	xã	Tân Thủy
9481	29170	xa_vinh_an	836	xã	Vĩnh An
9482	29173	xa_an_duc	836	xã	An Đức
9483	29176	xa_an_hoa_tay	836	xã	Hòa Tây
9484	29179	xa_an_thuy	836	xã	An Thủy
9485	29182	thi_tran_thanh_phu	837	thị trấn	Thạnh Phú
9486	29185	xa_phu_khanh	837	xã	Phú Khánh
9487	29188	xa_dai_dien	837	xã	Đại Điền
9488	29191	xa_quoi_dien	837	xã	Quới Điền
9489	29194	xa_tan_phong	837	xã	Tân Phong
9490	29197	xa_my_hung	837	xã	Mỹ Hưng
9491	29200	xa_an_thanh	837	xã	An Thạnh
9492	29203	xa_thoi_thanh	837	xã	Thới Thạnh
9493	29206	xa_hoa_loi	837	xã	Hòa Lợi
9494	29209	xa_an_dien	837	xã	An Điền
9495	29212	xa_binh_thanh	837	xã	Bình Thạnh
9496	29215	xa_an_thuan	837	xã	An Thuận
9497	29218	xa_an_quy	837	xã	An Quy
9498	29221	xa_thanh_hai	837	xã	Thạnh Hải
9499	29224	xa_an_nhon	837	xã	An Nhơn
9500	29227	xa_giao_thanh	837	xã	Giao Thạnh
9501	29230	xa_thanh_phong	837	xã	Thạnh Phong
9502	29233	xa_my_an	837	xã	Mỹ An
9503	28889	xa_phu_my	838	xã	Phú Mỹ
9504	28901	xa_hung_khanh_trung_a	838	xã	Trung A
9505	28906	xa_thanh_tan	838	xã	Thanh Tân
9506	28909	xa_thanh_ngai	838	xã	Thạnh Ngãi
9507	28912	xa_tan_phu_tay	838	xã	Phú Tây
9508	28915	xa_phuoc_my_trung	838	xã	Mỹ Trung
9509	28918	xa_tan_thanh_binh	838	xã	Thành Bình
9510	28921	xa_thanh_an	838	xã	Thành An
9511	28924	xa_hoa_loc	838	xã	Hòa Lộc
9512	28927	xa_tan_thanh_tay	838	xã	Thanh Tây
9513	28933	xa_tan_binh	838	xã	Tân Bình
9514	28936	xa_nhuan_phu_tan	838	xã	Phú Tân
9515	28948	xa_khanh_thanh_tan	838	xã	Thạnh Tân
9516	29236	phuong_4	842	phường	Phường 4
9517	29239	phuong_1	842	phường	Phường 1
9518	29242	phuong_3	842	phường	Phường 3
9519	29245	phuong_2	842	phường	Phường 2
9520	29248	phuong_5	842	phường	Phường 5
9521	29251	phuong_6	842	phường	Phường 6
9522	29254	phuong_7	842	phường	Phường 7
9523	29257	phuong_8	842	phường	Phường 8
9524	29260	phuong_9	842	phường	Phường 9
9525	29263	xa_long_duc	842	xã	Long Đức
9526	29266	thi_tran_cang_long	844	thị trấn	Càng Long
9527	29269	xa_my_cam	844	xã	Mỹ Cẩm
9528	29272	xa_an_truong_a	844	xã	Trường A
9529	29275	xa_an_truong	844	xã	An Trường
9530	29278	xa_huyen_hoi	844	xã	Huyền Hội
9531	29281	xa_tan_an	844	xã	Tân An
9532	29284	xa_tan_binh	844	xã	Tân Bình
9533	29287	xa_binh_phu	844	xã	Bình Phú
9534	29290	xa_phuong_thanh	844	xã	Phương Thạnh
9535	29293	xa_dai_phuc	844	xã	Đại Phúc
9536	29296	xa_dai_phuoc	844	xã	Đại Phước
9537	29299	xa_nhi_long_phu	844	xã	Long Phú
9538	29302	xa_nhi_long	844	xã	Nhị Long
9539	29305	xa_duc_my	844	xã	Đức Mỹ
9540	29308	thi_tran_cau_ke	845	thị trấn	Cầu Kè
9541	29311	xa_hoa_an	845	xã	Hòa Ân
9542	29314	xa_chau_dien	845	xã	Châu Điền
9543	29317	xa_an_phu_tan	845	xã	Phú Tân
9544	29320	xa_hoa_tan	845	xã	Hoà Tân
9545	29323	xa_ninh_thoi	845	xã	Ninh Thới
9546	29326	xa_phong_phu	845	xã	Phong Phú
9547	29329	xa_phong_thanh	845	xã	Phong Thạnh
9548	29332	xa_tam_ngai	845	xã	Tam Ngãi
9549	29335	xa_thong_hoa	845	xã	Thông Hòa
9550	29338	xa_thanh_phu	845	xã	Thạnh Phú
9551	29341	thi_tran_tieu_can	846	thị trấn	Tiểu Cần
9552	29344	thi_tran_cau_quan	846	thị trấn	Cầu Quan
9553	29347	xa_phu_can	846	xã	Phú Cần
9554	29350	xa_hieu_tu	846	xã	Hiếu Tử
9555	29353	xa_hieu_trung	846	xã	Hiếu Trung
9556	29356	xa_long_thoi	846	xã	Long Thới
9557	29359	xa_hung_hoa	846	xã	Hùng Hòa
9558	29362	xa_tan_hung	846	xã	Tân Hùng
9559	29365	xa_tap_ngai	846	xã	Tập Ngãi
9560	29368	xa_ngai_hung	846	xã	Ngãi Hùng
9561	29371	xa_tan_hoa	846	xã	Tân Hòa
9562	29374	thi_tran_chau_thanh	847	thị trấn	Châu Thành
9563	29377	xa_da_loc	847	xã	Đa Lộc
9564	29380	xa_my_chanh	847	xã	Mỹ Chánh
9565	29383	xa_thanh_my	847	xã	Thanh Mỹ
9566	29386	xa_luong_hoa_a	847	xã	Hoà A
9567	29389	xa_luong_hoa	847	xã	Lương Hòa
9568	29392	xa_song_loc	847	xã	Song Lộc
9569	29395	xa_nguyet_hoa	847	xã	Nguyệt Hóa
9570	29398	xa_hoa_thuan	847	xã	Hòa Thuận
9571	29401	xa_hoa_loi	847	xã	Hòa Lợi
9572	29404	xa_phuoc_hao	847	xã	Phước Hảo
9573	29407	xa_hung_my	847	xã	Hưng Mỹ
9574	29410	xa_hoa_minh	847	xã	Hòa Minh
9575	29413	xa_long_hoa	847	xã	Long Hòa
9576	29416	thi_tran_cau_ngang	848	thị trấn	Cầu Ngang
9577	29419	thi_tran_my_long	848	thị trấn	Mỹ Long
9578	29422	xa_my_long_bac	848	xã	Long Bắc
9579	29425	xa_my_long_nam	848	xã	Long Nam
9580	29428	xa_my_hoa	848	xã	Mỹ Hòa
9581	29431	xa_vinh_kim	848	xã	Vĩnh Kim
9582	29434	xa_kim_hoa	848	xã	Kim Hòa
9583	29437	xa_hiep_hoa	848	xã	Hiệp Hòa
9584	29440	xa_thuan_hoa	848	xã	Thuận Hòa
9585	29443	xa_long_son	848	xã	Long Sơn
9586	29446	xa_nhi_truong	848	xã	Nhị Trường
9587	29449	xa_truong_tho	848	xã	Trường Thọ
9588	29452	xa_hiep_my_dong	848	xã	Mỹ Đông
9589	29455	xa_hiep_my_tay	848	xã	Mỹ Tây
9590	29458	xa_thanh_hoa_son	848	xã	Hòa Sơn
9591	29461	thi_tran_tra_cu	849	thị trấn	Trà Cú
9592	29462	thi_tran_dinh_an	849	thị trấn	Định An
9593	29464	xa_phuoc_hung	849	xã	Phước Hưng
9594	29467	xa_tap_son	849	xã	Tập Sơn
9595	29470	xa_tan_son	849	xã	Tân Sơn
9596	29473	xa_an_quang_huu	849	xã	Quảng Hữu
9597	29476	xa_luu_nghiep_anh	849	xã	Nghiệp Anh
9598	29479	xa_ngai_xuyen	849	xã	Ngãi Xuyên
9599	29482	xa_kim_son	849	xã	Kim Sơn
9600	29485	xa_thanh_son	849	xã	Thanh Sơn
9601	29488	xa_ham_giang	849	xã	Hàm Giang
9602	29489	xa_ham_tan	849	xã	Hàm Tân
9603	29491	xa_dai_an	849	xã	Đại An
9604	29494	xa_dinh_an	849	xã	Định An
9605	29503	xa_ngoc_bien	849	xã	Ngọc Biên
9606	29506	xa_long_hiep	849	xã	Long Hiệp
9607	29509	xa_tan_hiep	849	xã	Tân Hiệp
9608	29497	xa_don_xuan	850	xã	Đôn Xuân
9609	29500	xa_don_chau	850	xã	Đôn Châu
9610	29513	thi_tran_long_thanh	850	thị trấn	Long Thành
9611	29521	xa_long_khanh	850	xã	Long Khánh
9612	29530	xa_ngu_lac	850	xã	Ngũ Lạc
9613	29533	xa_long_vinh	850	xã	Long Vĩnh
9614	29536	xa_dong_hai	850	xã	Đông Hải
9615	29512	phuong_1	851	phường	Phường 1
9616	29515	xa_long_toan	851	xã	Long Toàn
9617	29516	phuong_2	851	phường	Phường 2
9618	29518	xa_long_huu	851	xã	Long Hữu
9619	29524	xa_dan_thanh	851	xã	Dân Thành
9620	29527	xa_truong_long_hoa	851	xã	Long Hòa
9621	29539	xa_hiep_thanh	851	xã	Hiệp Thạnh
9622	29542	phuong_9	855	phường	Phường 9
9623	29545	phuong_5	855	phường	Phường 5
9624	29548	phuong_1	855	phường	Phường 1
9625	29551	phuong_2	855	phường	Phường 2
9626	29554	phuong_4	855	phường	Phường 4
9627	29557	phuong_3	855	phường	Phường 3
9628	29560	phuong_8	855	phường	Phường 8
9629	29563	phuong_tan_ngai	855	phường	Tân Ngãi
9630	29566	phuong_tan_hoa	855	phường	Tân Hòa
9631	29569	phuong_tan_hoi	855	phường	Tân Hội
9632	29572	phuong_truong_an	855	phường	Trường An
9633	29575	thi_tran_long_ho	857	thị trấn	Long Hồ
9634	29578	xa_dong_phu	857	xã	Đồng Phú
9635	29581	xa_binh_hoa_phuoc	857	xã	Hòa Phước
9636	29584	xa_hoa_ninh	857	xã	Hòa Ninh
9637	29587	xa_an_binh	857	xã	An Bình
9638	29590	xa_thanh_duc	857	xã	Thanh Đức
9639	29593	xa_tan_hanh	857	xã	Tân Hạnh
9640	29596	xa_phuoc_hau	857	xã	Phước Hậu
9641	29599	xa_long_phuoc	857	xã	Long Phước
9642	29602	xa_phu_duc	857	xã	Phú Đức
9643	29605	xa_loc_hoa	857	xã	Lộc Hòa
9644	29608	xa_long_an	857	xã	Long An
9645	29611	xa_phu_quoi	857	xã	Phú Quới
9646	29614	xa_thanh_quoi	857	xã	Thạnh Quới
9647	29617	xa_hoa_phu	857	xã	Hòa Phú
9648	29623	xa_my_an	858	xã	Mỹ An
9649	29626	xa_my_phuoc	858	xã	Mỹ Phước
9650	29629	xa_an_phuoc	858	xã	An Phước
9651	29632	xa_nhon_phu	858	xã	Nhơn Phú
9652	29635	xa_long_my	858	xã	Long Mỹ
9653	29638	xa_hoa_tinh	858	xã	Hòa Tịnh
9654	29641	thi_tran_cai_nhum	858	thị trấn	Cái Nhum
9655	29644	xa_binh_phuoc	858	xã	Bình Phước
9656	29647	xa_chanh_an	858	xã	Chánh An
9657	29650	xa_tan_an_hoi	858	xã	An Hội
9658	29653	xa_tan_long	858	xã	Tân Long
9659	29656	xa_tan_long_hoi	858	xã	Long Hội
9660	29659	thi_tran_vung_liem	859	thị trấn	Vũng Liêm
9661	29662	xa_tan_quoi_trung	859	xã	Quới Trung
9662	29665	xa_quoi_thien	859	xã	Quới Thiện
9663	29668	xa_quoi_an	859	xã	Quới An
9664	29671	xa_trung_chanh	859	xã	Trung Chánh
9665	29674	xa_tan_an_luong	859	xã	An Luông
9666	29677	xa_thanh_binh	859	xã	Thanh Bình
9667	29680	xa_trung_thanh_tay	859	xã	Thành Tây
9668	29683	xa_trung_hiep	859	xã	Trung Hiệp
9669	29686	xa_hieu_phung	859	xã	Hiếu Phụng
9670	29689	xa_trung_thanh_dong	859	xã	Thành Đông
9671	29692	xa_trung_thanh	859	xã	Trung Thành
9672	29695	xa_trung_hieu	859	xã	Trung Hiếu
9673	29698	xa_trung_ngai	859	xã	Trung Ngãi
9674	29701	xa_hieu_thuan	859	xã	Hiếu Thuận
9675	29704	xa_trung_nghia	859	xã	Trung Nghĩa
9676	29707	xa_trung_an	859	xã	Trung An
9677	29710	xa_hieu_nhon	859	xã	Hiếu Nhơn
9678	29713	xa_hieu_thanh	859	xã	Hiếu Thành
9679	29716	xa_hieu_nghia	859	xã	Hiếu Nghĩa
9680	29719	thi_tran_tam_binh	860	thị trấn	Tam Bình
9681	29722	xa_tan_loc	860	xã	Tân Lộc
9682	29725	xa_phu_thinh	860	xã	Phú Thịnh
9683	29728	xa_hau_loc	860	xã	Hậu Lộc
9684	29731	xa_hoa_thanh	860	xã	Hòa Thạnh
9685	29734	xa_hoa_loc	860	xã	Hoà Lộc
9686	29737	xa_phu_loc	860	xã	Phú Lộc
9687	29740	xa_song_phu	860	xã	Song Phú
9688	29743	xa_hoa_hiep	860	xã	Hòa Hiệp
9689	29746	xa_my_loc	860	xã	Mỹ Lộc
9690	29749	xa_tan_phu	860	xã	Tân Phú
9691	29752	xa_long_phu	860	xã	Long Phú
9692	29755	xa_my_thanh_trung	860	xã	Thạnh Trung
9693	29758	xa_tuong_loc	860	xã	Tường Lộc
9694	29761	xa_loan_my	860	xã	Loan Mỹ
9695	29764	xa_ngai_tu	860	xã	Ngãi Tứ
9696	29767	xa_binh_ninh	860	xã	Bình Ninh
9697	29770	phuong_cai_von	861	phường	Cái Vồn
9698	29771	phuong_thanh_phuoc	861	phường	Thành Phước
9699	29806	xa_thuan_an	861	xã	Thuận An
9700	29809	xa_dong_thanh	861	xã	Đông Thạnh
9701	29812	xa_dong_binh	861	xã	Đông Bình
9702	29813	phuong_dong_thuan	861	phường	Đông Thuận
9703	29815	xa_my_hoa	861	xã	Mỹ Hòa
9704	29818	xa_dong_thanh	861	xã	Đông Thành
9705	29821	thi_tran_tra_on	862	thị trấn	Trà Ôn
9706	29824	xa_xuan_hiep	862	xã	Xuân Hiệp
9707	29827	xa_nhon_binh	862	xã	Nhơn Bình
9708	29830	xa_hoa_binh	862	xã	Hòa Bình
9709	29833	xa_thoi_hoa	862	xã	Thới Hòa
9710	29836	xa_tra_con	862	xã	Trà Côn
9711	29839	xa_tan_my	862	xã	Tân Mỹ
9712	29842	xa_huu_thanh	862	xã	Hựu Thành
9713	29845	xa_vinh_xuan	862	xã	Vĩnh Xuân
9714	29848	xa_thuan_thoi	862	xã	Thuận Thới
9715	29851	xa_phu_thanh	862	xã	Phú Thành
9716	29854	xa_thien_my	862	xã	Thiện Mỹ
9717	29857	xa_luc_sy_thanh	862	xã	Sỹ Thành
9718	29860	xa_tich_thien	862	xã	Tích Thiện
9719	29773	xa_tan_hung	863	xã	Tân Hưng
9720	29776	xa_tan_thanh	863	xã	Tân Thành
9721	29779	xa_thanh_trung	863	xã	Thành Trung
9722	29782	xa_tan_an_thanh	863	xã	An Thạnh
9723	29785	xa_tan_luoc	863	xã	Tân Lược
9724	29788	xa_nguyen_van_thanh	863	xã	Văn Thảnh
9725	29791	xa_thanh_loi	863	xã	Thành Lợi
9726	29794	xa_my_thuan	863	xã	Mỹ Thuận
9727	29797	xa_tan_binh	863	xã	Tân Bình
9728	29800	thi_tran_tan_quoi	863	thị trấn	Tân Quới
9729	29863	phuong_11	866	phường	Phường 11
9730	29866	phuong_1	866	phường	Phường 1
9731	29869	phuong_2	866	phường	Phường 2
9732	29872	phuong_4	866	phường	Phường 4
9733	29875	phuong_3	866	phường	Phường 3
9734	29878	phuong_6	866	phường	Phường 6
9735	29881	xa_my_ngai	866	xã	Mỹ Ngãi
9736	29884	xa_my_tan	866	xã	Mỹ Tân
9737	29887	xa_my_tra	866	xã	Mỹ Trà
9738	29888	phuong_my_phu	866	phường	Mỹ Phú
9739	29890	xa_tan_thuan_tay	866	xã	Thuận Tây
9740	29892	phuong_hoa_thuan	866	phường	Hoà Thuận
9741	29893	xa_hoa_an	866	xã	Hòa An
9742	29896	xa_tan_thuan_dong	866	xã	Thuận Đông
9743	29899	xa_tinh_thoi	866	xã	Tịnh Thới
9744	29902	phuong_3	867	phường	Phường 3
9745	29905	phuong_1	867	phường	Phường 1
9746	29908	phuong_4	867	phường	Phường 4
9747	29911	phuong_2	867	phường	Phường 2
9748	29914	xa_tan_khanh_dong	867	xã	Khánh Đông
9749	29917	phuong_tan_quy_dong	867	phường	Quy Đông
9750	29919	phuong_an_hoa	867	phường	An Hoà
9751	29920	xa_tan_quy_tay	867	xã	Quy Tây
9752	29923	xa_tan_phu_dong	867	xã	Phú Đông
9753	29954	phuong_an_loc	868	phường	An Lộc
9754	29955	phuong_an_thanh	868	phường	An Thạnh
9755	29959	xa_binh_thanh	868	xã	Bình Thạnh
9756	29965	xa_tan_hoi	868	xã	Tân Hội
9757	29978	phuong_an_lac	868	phường	An Lạc
9758	29986	phuong_an_binh_b	868	phường	Bình B
9759	29989	phuong_an_binh_a	868	phường	Bình A
9760	29926	thi_tran_sa_rai	869	thị trấn	Sa Rài
9761	29929	xa_tan_ho_co	869	xã	Hộ Cơ
9762	29932	xa_thong_binh	869	xã	Thông Bình
9763	29935	xa_binh_phu	869	xã	Bình Phú
9764	29938	xa_tan_thanh_a	869	xã	Thành A
9765	29941	xa_tan_thanh_b	869	xã	Thành B
9766	29944	xa_tan_phuoc	869	xã	Tân Phước
9767	29947	xa_tan_cong_chi	869	xã	Công Chí
9768	29950	xa_an_phuoc	869	xã	An Phước
9769	29956	xa_thuong_phuoc_1	870	xã	Thường Phước 1
9770	29962	xa_thuong_thoi_hau_a	870	xã	Hậu A
9771	29971	thi_tran_thuong_thoi_tien	870	thị trấn	Thới Tiền
9772	29974	xa_thuong_phuoc_2	870	xã	Thường Phước 2
9773	29977	xa_thuong_lac	870	xã	Thường Lạc
9774	29980	xa_long_khanh_a	870	xã	Khánh A
9775	29983	xa_long_khanh_b	870	xã	Khánh B
9776	29992	xa_long_thuan	870	xã	Long Thuận
9777	29995	xa_phu_thuan_b	870	xã	Thuận B
9778	29998	xa_phu_thuan_a	870	xã	Thuận A
9779	30001	thi_tran_tram_chim	871	thị trấn	Tràm Chim
9780	30004	xa_hoa_binh	871	xã	Hoà Bình
9781	30007	xa_tan_cong_sinh	871	xã	Công Sính
9782	30010	xa_phu_hiep	871	xã	Phú Hiệp
9783	30013	xa_phu_duc	871	xã	Phú Đức
9784	30016	xa_phu_thanh_b	871	xã	Thành B
9785	30019	xa_an_hoa	871	xã	An Hòa
9786	30022	xa_an_long	871	xã	An Long
9787	30025	xa_phu_cuong	871	xã	Phú Cường
9788	30028	xa_phu_ninh	871	xã	Phú Ninh
9789	30031	xa_phu_tho	871	xã	Phú Thọ
9790	30034	xa_phu_thanh_a	871	xã	Thành A
9791	30037	thi_tran_my_an	872	thị trấn	Mỹ An
9792	30040	xa_thanh_loi	872	xã	Thạnh Lợi
9793	30043	xa_hung_thanh	872	xã	Hưng Thạnh
9794	30046	xa_truong_xuan	872	xã	Trường Xuân
9795	30049	xa_tan_kieu	872	xã	Tân Kiều
9796	30052	xa_my_hoa	872	xã	Mỹ Hòa
9797	30055	xa_my_quy	872	xã	Mỹ Quý
9798	30058	xa_my_dong	872	xã	Mỹ Đông
9799	30061	xa_doc_binh_kieu	872	xã	Binh Kiều
9800	30064	xa_my_an	872	xã	Mỹ An
9801	30067	xa_phu_dien	872	xã	Phú Điền
9802	30070	xa_lang_bien	872	xã	Láng Biển
9803	30073	xa_thanh_my	872	xã	Thanh Mỹ
9804	30076	thi_tran_my_tho	873	thị trấn	Mỹ Thọ
9805	30079	xa_gao_giong	873	xã	Gáo Giồng
9806	30082	xa_phuong_thinh	873	xã	Phương Thịnh
9807	30085	xa_ba_sao	873	xã	Ba Sao
9808	30088	xa_phong_my	873	xã	Phong Mỹ
9809	30091	xa_tan_nghia	873	xã	Tân Nghĩa
9810	30094	xa_phuong_tra	873	xã	Phương Trà
9811	30097	xa_nhi_my	873	xã	Nhị Mỹ
9812	30100	xa_my_tho	873	xã	Mỹ Thọ
9813	30103	xa_tan_hoi_trung	873	xã	Hội Trung
9814	30106	xa_an_binh	873	xã	An Bình
9815	30109	xa_my_hoi	873	xã	Mỹ Hội
9816	30112	xa_my_hiep	873	xã	Mỹ Hiệp
9817	30115	xa_my_long	873	xã	Mỹ Long
9818	30118	xa_binh_hang_trung	873	xã	Hàng Trung
9819	30121	xa_my_xuong	873	xã	Mỹ Xương
9820	30124	xa_binh_hang_tay	873	xã	Hàng Tây
9821	30127	xa_binh_thanh	873	xã	Bình Thạnh
9822	30130	thi_tran_thanh_binh	874	thị trấn	Thanh Bình
9823	30133	xa_tan_quoi	874	xã	Tân Quới
9824	30136	xa_tan_hoa	874	xã	Tân Hòa
9825	30139	xa_an_phong	874	xã	An Phong
9826	30142	xa_phu_loi	874	xã	Phú Lợi
9827	30145	xa_tan_my	874	xã	Tân Mỹ
9828	30148	xa_binh_tan	874	xã	Bình Tấn
9829	30151	xa_tan_hue	874	xã	Tân Huề
9830	30154	xa_tan_binh	874	xã	Tân Bình
9831	30157	xa_tan_thanh	874	xã	Tân Thạnh
9832	30160	xa_tan_phu	874	xã	Tân Phú
9833	30163	xa_binh_thanh	874	xã	Bình Thành
9834	30166	xa_tan_long	874	xã	Tân Long
9835	30169	thi_tran_lap_vo	875	thị trấn	Lấp Vò
9836	30172	xa_my_an_hung_a	875	xã	Hưng A
9837	30175	xa_tan_my	875	xã	Tân Mỹ
9838	30178	xa_my_an_hung_b	875	xã	Hưng B
9839	30181	xa_tan_khanh_trung	875	xã	Khánh Trung
9840	30184	xa_long_hung_a	875	xã	Hưng A
9841	30187	xa_vinh_thanh	875	xã	Vĩnh Thạnh
9842	30190	xa_long_hung_b	875	xã	Hưng B
9843	30193	xa_binh_thanh	875	xã	Bình Thành
9844	30196	xa_dinh_an	875	xã	Định An
9845	30199	xa_dinh_yen	875	xã	Định Yên
9846	30202	xa_hoi_an_dong	875	xã	An Đông
9847	30205	xa_binh_thanh_trung	875	xã	Thạnh Trung
9848	30208	thi_tran_lai_vung	876	thị trấn	Lai Vung
9849	30211	xa_tan_duong	876	xã	Tân Dương
9850	30214	xa_hoa_thanh	876	xã	Hòa Thành
9851	30217	xa_long_hau	876	xã	Long Hậu
9852	30220	xa_tan_phuoc	876	xã	Tân Phước
9853	30223	xa_hoa_long	876	xã	Hòa Long
9854	30226	xa_tan_thanh	876	xã	Tân Thành
9855	30229	xa_long_thang	876	xã	Long Thắng
9856	30232	xa_vinh_thoi	876	xã	Vĩnh Thới
9857	30235	xa_tan_hoa	876	xã	Tân Hòa
9858	30238	xa_dinh_hoa	876	xã	Định Hòa
9859	30241	xa_phong_hoa	876	xã	Phong Hòa
9860	30244	thi_tran_cai_tau_ha	877	thị trấn	Tàu Hạ
9861	30247	xa_an_hiep	877	xã	An Hiệp
9862	30250	xa_an_nhon	877	xã	An Nhơn
9863	30253	xa_tan_nhuan_dong	877	xã	Nhuận Đông
9864	30256	xa_tan_binh	877	xã	Tân Bình
9865	30259	xa_tan_phu_trung	877	xã	Phú Trung
9866	30262	xa_phu_long	877	xã	Phú Long
9867	30265	xa_an_phu_thuan	877	xã	Phú Thuận
9868	30268	xa_phu_huu	877	xã	Phú Hựu
9869	30271	xa_an_khanh	877	xã	An Khánh
9870	30274	xa_tan_phu	877	xã	Tân Phú
9871	30277	xa_hoa_tan	877	xã	Hòa Tân
9872	30280	phuong_my_binh	883	phường	Mỹ Bình
9873	30283	phuong_my_long	883	phường	Mỹ Long
9874	30285	phuong_dong_xuyen	883	phường	Đông Xuyên
9875	30286	phuong_my_xuyen	883	phường	Mỹ Xuyên
9876	30289	phuong_binh_duc	883	phường	Bình Đức
9877	30292	phuong_binh_khanh	883	phường	Bình Khánh
9878	30295	phuong_my_phuoc	883	phường	Mỹ Phước
9879	30298	phuong_my_quy	883	phường	Mỹ Quý
9880	30301	phuong_my_thoi	883	phường	Mỹ Thới
9881	30304	phuong_my_thanh	883	phường	Mỹ Thạnh
9882	30307	phuong_my_hoa	883	phường	Mỹ Hòa
9883	30310	xa_my_khanh	883	xã	Mỹ Khánh
9884	30313	xa_my_hoa_hung	883	xã	Hoà Hưng
9885	30316	phuong_chau_phu_b	884	phường	Phú B
9886	30319	phuong_chau_phu_a	884	phường	Phú A
9887	30322	phuong_vinh_my	884	phường	Vĩnh Mỹ
9888	30325	phuong_nui_sam	884	phường	Núi Sam
9889	30328	phuong_vinh_nguon	884	phường	Vĩnh Ngươn
9890	30331	xa_vinh_te	884	xã	Vĩnh Tế
9891	30334	xa_vinh_chau	884	xã	Vĩnh Châu
9892	30337	thi_tran_an_phu	886	thị trấn	An Phú
9893	30340	xa_khanh_an	886	xã	Khánh An
9894	30341	thi_tran_long_binh	886	thị trấn	Long Bình
9895	30343	xa_khanh_binh	886	xã	Khánh Bình
9896	30346	xa_quoc_thai	886	xã	Quốc Thái
9897	30349	xa_nhon_hoi	886	xã	Nhơn Hội
9898	30352	xa_phu_huu	886	xã	Phú Hữu
9899	30355	xa_phu_hoi	886	xã	Phú Hội
9900	30358	xa_phuoc_hung	886	xã	Phước Hưng
9901	30361	xa_vinh_loc	886	xã	Vĩnh Lộc
9902	30364	xa_vinh_hau	886	xã	Vĩnh Hậu
9903	30367	xa_vinh_truong	886	xã	Vĩnh Trường
9904	30370	xa_vinh_hoi_dong	886	xã	Hội Đông
9905	30373	xa_da_phuoc	886	xã	Đa Phước
9906	30376	phuong_long_thanh	887	phường	Long Thạnh
9907	30377	phuong_long_hung	887	phường	Long Hưng
9908	30378	phuong_long_chau	887	phường	Long Châu
9909	30379	xa_phu_loc	887	xã	Phú Lộc
9910	30382	xa_vinh_xuong	887	xã	Vĩnh Xương
9911	30385	xa_vinh_hoa	887	xã	Vĩnh Hòa
9912	30387	xa_tan_thanh	887	xã	Tân Thạnh
9913	30388	xa_tan_an	887	xã	Tân An
9914	30391	xa_long_an	887	xã	Long An
9915	30394	phuong_long_phu	887	phường	Long Phú
9916	30397	xa_chau_phong	887	xã	Châu Phong
9917	30400	xa_phu_vinh	887	xã	Phú Vĩnh
9918	30403	xa_le_chanh	887	xã	Lê Chánh
9919	30412	phuong_long_son	887	phường	Long Sơn
9920	30406	thi_tran_phu_my	888	thị trấn	Phú Mỹ
9921	30409	thi_tran_cho_vam	888	thị trấn	Chợ Vàm
9922	30415	xa_long_hoa	888	xã	Long Hoà
9923	30418	xa_phu_long	888	xã	Phú Long
9924	30421	xa_phu_lam	888	xã	Phú Lâm
9925	30424	xa_phu_hiep	888	xã	Phú Hiệp
9926	30427	xa_phu_thanh	888	xã	Phú Thạnh
9927	30430	xa_hoa_lac	888	xã	Hoà Lạc
9928	30433	xa_phu_thanh	888	xã	Phú Thành
9929	30436	xa_phu_an	888	xã	Phú An
9930	30439	xa_phu_xuan	888	xã	Phú Xuân
9931	30442	xa_hiep_xuong	888	xã	Hiệp Xương
9932	30445	xa_phu_binh	888	xã	Phú Bình
9933	30448	xa_phu_tho	888	xã	Phú Thọ
9934	30451	xa_phu_hung	888	xã	Phú Hưng
9935	30454	xa_binh_thanh_dong	888	xã	Thạnh Đông
9936	30457	xa_tan_hoa	888	xã	Tân Hòa
9937	30460	xa_tan_trung	888	xã	Tân Trung
9938	30463	thi_tran_cai_dau	889	thị trấn	Cái Dầu
9939	30466	xa_khanh_hoa	889	xã	Khánh Hòa
9940	30469	xa_my_duc	889	xã	Mỹ Đức
9941	30472	xa_my_phu	889	xã	Mỹ Phú
9942	30475	xa_o_long_vy	889	xã	Long Vỹ
9943	30478	thi_tran_vinh_thanh_trung	889	thị trấn	Thạnh Trung
9944	30481	xa_thanh_my_tay	889	xã	Mỹ Tây
9945	30484	xa_binh_long	889	xã	Bình Long
9946	30487	xa_binh_my	889	xã	Bình Mỹ
9947	30490	xa_binh_thuy	889	xã	Bình Thủy
9948	30493	xa_dao_huu_canh	889	xã	Hữu Cảnh
9949	30496	xa_binh_phu	889	xã	Bình Phú
9950	30499	xa_binh_chanh	889	xã	Bình Chánh
9951	30502	thi_tran_nha_bang	890	thị trấn	Nhà Bàng
9952	30505	thi_tran_chi_lang	890	thị trấn	Chi Lăng
9953	30508	xa_nui_voi	890	xã	Núi Voi
9954	30511	xa_nhon_hung	890	xã	Nhơn Hưng
9955	30514	xa_an_phu	890	xã	An Phú
9956	30517	xa_thoi_son	890	xã	Thới Sơn
9957	30520	thi_tran_tinh_bien	890	thị trấn	Tịnh Biên
9958	30523	xa_van_giao	890	xã	Văn Giáo
9959	30526	xa_an_cu	890	xã	An Cư
9960	30529	xa_an_nong	890	xã	An Nông
9961	30532	xa_vinh_trung	890	xã	Vĩnh Trung
9962	30535	xa_tan_loi	890	xã	Tân Lợi
9963	30538	xa_an_hao	890	xã	An Hảo
9964	30541	xa_tan_lap	890	xã	Tân Lập
9965	30544	thi_tran_tri_ton	891	thị trấn	Tri Tôn
9966	30547	thi_tran_ba_chuc	891	thị trấn	Ba Chúc
9967	30550	xa_lac_quoi	891	xã	Lạc Quới
9968	30553	xa_le_tri	891	xã	Lê Trì
9969	30556	xa_vinh_gia	891	xã	Vĩnh Gia
9970	30559	xa_vinh_phuoc	891	xã	Vĩnh Phước
9971	30562	xa_chau_lang	891	xã	Châu Lăng
9972	30565	xa_luong_phi	891	xã	Lương Phi
9973	30568	xa_luong_an_tra	891	xã	An Trà
9974	30571	xa_ta_danh	891	xã	Tà Đảnh
9975	30574	xa_nui_to	891	xã	Núi Tô
9976	30577	xa_an_tuc	891	xã	An Tức
9977	30580	thi_tran_co_to	891	thị trấn	Cô Tô
9978	30583	xa_tan_tuyen	891	xã	Tân Tuyến
9979	30586	xa_o_lam	891	xã	Ô Lâm
9980	30589	thi_tran_an_chau	892	thị trấn	An Châu
9981	30592	xa_an_hoa	892	xã	An Hòa
9982	30595	xa_can_dang	892	xã	Cần Đăng
9983	30598	xa_vinh_hanh	892	xã	Vĩnh Hanh
9984	30601	xa_binh_thanh	892	xã	Bình Thạnh
9985	30604	thi_tran_vinh_binh	892	thị trấn	Vĩnh Bình
9986	30607	xa_binh_hoa	892	xã	Bình Hòa
9987	30610	xa_vinh_an	892	xã	Vĩnh An
9988	30613	xa_hoa_binh_thanh	892	xã	Bình Thạnh
9989	30616	xa_vinh_loi	892	xã	Vĩnh Lợi
9990	30619	xa_vinh_nhuan	892	xã	Vĩnh Nhuận
9991	30622	xa_tan_phu	892	xã	Tân Phú
9992	30625	xa_vinh_thanh	892	xã	Vĩnh Thành
9993	30628	thi_tran_cho_moi	893	thị trấn	Chợ Mới
9994	30631	thi_tran_my_luong	893	thị trấn	Mỹ Luông
9995	30634	xa_kien_an	893	xã	Kiến An
9996	30637	xa_my_hoi_dong	893	xã	Hội Đông
9997	30640	xa_long_dien_a	893	xã	Điền A
9998	30643	xa_tan_my	893	xã	Tấn Mỹ
9999	30646	xa_long_dien_b	893	xã	Điền B
10000	30649	xa_kien_thanh	893	xã	Kiến Thành
10001	30652	xa_my_hiep	893	xã	Mỹ Hiệp
10002	30655	xa_my_an	893	xã	Mỹ An
10003	30658	xa_nhon_my	893	xã	Nhơn Mỹ
10004	30661	xa_long_giang	893	xã	Long Giang
10005	30664	xa_long_kien	893	xã	Long Kiến
10006	30667	xa_binh_phuoc_xuan	893	xã	Phước Xuân
10007	30670	xa_an_thanh_trung	893	xã	Thạnh Trung
10008	30673	xa_hoi_an	893	xã	Hội An
10009	30676	xa_hoa_binh	893	xã	Hòa Bình
10010	30679	xa_hoa_an	893	xã	Hòa An
10011	30682	thi_tran_nui_sap	894	thị trấn	Núi Sập
10012	30685	thi_tran_phu_hoa	894	thị trấn	Phú Hoà
10013	30688	thi_tran_oc_eo	894	thị trấn	Óc Eo
10014	30691	xa_tay_phu	894	xã	Tây Phú
10015	30692	xa_an_binh	894	xã	An Bình
10016	30694	xa_vinh_phu	894	xã	Vĩnh Phú
10017	30697	xa_vinh_trach	894	xã	Vĩnh Trạch
10018	30700	xa_phu_thuan	894	xã	Phú Thuận
10019	30703	xa_vinh_chanh	894	xã	Vĩnh Chánh
10020	30706	xa_dinh_my	894	xã	Định Mỹ
10021	30709	xa_dinh_thanh	894	xã	Định Thành
10022	30712	xa_my_phu_dong	894	xã	Phú Đông
10023	30715	xa_vong_dong	894	xã	Vọng Đông
10024	30718	xa_vinh_khanh	894	xã	Vĩnh Khánh
10025	30721	xa_thoai_giang	894	xã	Thoại Giang
10026	30724	xa_binh_thanh	894	xã	Bình Thành
10027	30727	xa_vong_the	894	xã	Vọng Thê
10028	30730	phuong_vinh_thanh_van	899	phường	Thanh Vân
10029	30733	phuong_vinh_thanh	899	phường	Vĩnh Thanh
10030	30736	phuong_vinh_quang	899	phường	Vĩnh Quang
10031	30739	phuong_vinh_hiep	899	phường	Vĩnh Hiệp
10032	30742	phuong_vinh_bao	899	phường	Vĩnh Bảo
10033	30745	phuong_vinh_lac	899	phường	Vĩnh Lạc
10034	30748	phuong_an_hoa	899	phường	An Hòa
10035	30751	phuong_an_binh	899	phường	An Bình
10036	30754	phuong_rach_soi	899	phường	Rạch Sỏi
10037	30757	phuong_vinh_loi	899	phường	Vĩnh Lợi
10038	30760	phuong_vinh_thong	899	phường	Vĩnh Thông
10039	30763	xa_phi_thong	899	xã	Phi Thông
10040	30766	phuong_to_chau	900	phường	Tô Châu
10041	30769	phuong_dong_ho	900	phường	Đông Hồ
10042	30772	phuong_binh_san	900	phường	Bình San
10043	30775	phuong_phao_dai	900	phường	Pháo Đài
10044	30778	phuong_my_duc	900	phường	Mỹ Đức
10045	30781	xa_tien_hai	900	xã	Tiên Hải
10046	30784	xa_thuan_yen	900	xã	Thuận Yên
10047	30787	thi_tran_kien_luong	902	thị trấn	Kiên Lương
10048	30790	xa_kien_binh	902	xã	Kiên Bình
10049	30802	xa_hoa_dien	902	xã	Hòa Điền
10050	30805	xa_duong_hoa	902	xã	Dương Hòa
10051	30808	xa_binh_an	902	xã	Bình An
10052	30809	xa_binh_tri	902	xã	Bình Trị
10053	30811	xa_son_hai	902	xã	Sơn Hải
10054	30814	xa_hon_nghe	902	xã	Hòn Nghệ
10055	30817	thi_tran_hon_dat	903	thị trấn	Hòn Đất
10056	30820	thi_tran_soc_son	903	thị trấn	Sóc Sơn
10057	30823	xa_binh_son	903	xã	Bình Sơn
10058	30826	xa_binh_giang	903	xã	Bình Giang
10059	30828	xa_my_thai	903	xã	Mỹ Thái
10060	30829	xa_nam_thai_son	903	xã	Thái Sơn
10061	30832	xa_my_hiep_son	903	xã	Hiệp Sơn
10062	30835	xa_son_kien	903	xã	Sơn Kiên
10063	30836	xa_son_binh	903	xã	Sơn Bình
10064	30838	xa_my_thuan	903	xã	Mỹ Thuận
10065	30840	xa_linh_huynh	903	xã	Lình Huỳnh
10066	30841	xa_tho_son	903	xã	Thổ Sơn
10067	30844	xa_my_lam	903	xã	Mỹ Lâm
10068	30847	xa_my_phuoc	903	xã	Mỹ Phước
10069	30850	thi_tran_tan_hiep	904	thị trấn	Tân Hiệp
10070	30853	xa_tan_hoi	904	xã	Tân Hội
10071	30856	xa_tan_thanh	904	xã	Tân Thành
10072	30859	xa_tan_hiep_b	904	xã	Hiệp B
10073	30860	xa_tan_hoa	904	xã	Tân Hoà
10074	30862	xa_thanh_dong_b	904	xã	Đông B
10075	30865	xa_thanh_dong	904	xã	Thạnh Đông
10076	30868	xa_tan_hiep_a	904	xã	Hiệp A
10077	30871	xa_tan_an	904	xã	Tân An
10078	30874	xa_thanh_dong_a	904	xã	Đông A
10079	30877	xa_thanh_tri	904	xã	Thạnh Trị
10080	30880	thi_tran_minh_luong	905	thị trấn	Minh Lương
10081	30883	xa_mong_tho_a	905	xã	Thọ A
10082	30886	xa_mong_tho_b	905	xã	Thọ B
10083	30887	xa_mong_tho	905	xã	Mong Thọ
10084	30889	xa_giuc_tuong	905	xã	Giục Tượng
10085	30892	xa_vinh_hoa_hiep	905	xã	Hòa Hiệp
10086	30893	xa_vinh_hoa_phu	905	xã	Hoà Phú
10087	30895	xa_minh_hoa	905	xã	Minh Hòa
10088	30898	xa_binh_an	905	xã	Bình An
10089	30901	xa_thanh_loc	905	xã	Thạnh Lộc
10090	30904	thi_tran_giong_rieng	906	thị trấn	Giồng Riềng
10091	30907	xa_thanh_hung	906	xã	Thạnh Hưng
10092	30910	xa_thanh_phuoc	906	xã	Thạnh Phước
10093	30913	xa_thanh_loc	906	xã	Thạnh Lộc
10094	30916	xa_thanh_hoa	906	xã	Thạnh Hòa
10095	30917	xa_thanh_binh	906	xã	Thạnh Bình
10096	30919	xa_ban_thach	906	xã	Bàn Thạch
10097	30922	xa_ban_tan_dinh	906	xã	Tân Định
10098	30925	xa_ngoc_thanh	906	xã	Ngọc Thành
10099	30928	xa_ngoc_chuc	906	xã	Ngọc Chúc
10100	30931	xa_ngoc_thuan	906	xã	Ngọc Thuận
10101	30934	xa_hoa_hung	906	xã	Hòa Hưng
10102	30937	xa_hoa_loi	906	xã	Hoà Lợi
10103	30940	xa_hoa_an	906	xã	Hoà An
10104	30943	xa_long_thanh	906	xã	Long Thạnh
10105	30946	xa_vinh_thanh	906	xã	Vĩnh Thạnh
10106	30947	xa_vinh_phu	906	xã	Vĩnh Phú
10107	30949	xa_hoa_thuan	906	xã	Hòa Thuận
10108	30950	xa_ngoc_hoa	906	xã	Ngọc Hoà
10109	30952	thi_tran_go_quao	907	thị trấn	Gò Quao
10110	30955	xa_vinh_hoa_hung_bac	907	xã	Hưng Bắc
10111	30958	xa_dinh_hoa	907	xã	Định Hòa
10112	30961	xa_thoi_quan	907	xã	Thới Quản
10113	30964	xa_dinh_an	907	xã	Định An
10114	30967	xa_thuy_lieu	907	xã	Thủy Liễu
10115	30970	xa_vinh_hoa_hung_nam	907	xã	Hưng Nam
10116	30973	xa_vinh_phuoc_a	907	xã	Phước A
10117	30976	xa_vinh_phuoc_b	907	xã	Phước B
10118	30979	xa_vinh_tuy	907	xã	Vĩnh Tuy
10119	30982	xa_vinh_thang	907	xã	Vĩnh Thắng
10120	30985	thi_tran_thu_ba	908	thị trấn	Thứ Ba
10121	30988	xa_tay_yen	908	xã	Tây Yên
10122	30991	xa_tay_yen_a	908	xã	Yên A
10123	30994	xa_nam_yen	908	xã	Nam Yên
10124	30997	xa_hung_yen	908	xã	Hưng Yên
10125	31000	xa_nam_thai	908	xã	Nam Thái
10126	31003	xa_nam_thai_a	908	xã	Thái A
10127	31006	xa_dong_thai	908	xã	Đông Thái
10128	31009	xa_dong_yen	908	xã	Đông Yên
10129	31018	thi_tran_thu_muoi_mot	909	thị trấn	Mười Một
10130	31021	xa_thuan_hoa	909	xã	Thuận Hoà
10131	31024	xa_dong_hoa	909	xã	Đông Hòa
10132	31030	xa_dong_thanh	909	xã	Đông Thạnh
10133	31031	xa_tan_thanh	909	xã	Tân Thạnh
10134	31033	xa_dong_hung	909	xã	Đông Hưng
10135	31036	xa_dong_hung_a	909	xã	Hưng A
10136	31039	xa_dong_hung_b	909	xã	Hưng B
10137	31042	xa_van_khanh	909	xã	Vân Khánh
10138	31045	xa_van_khanh_dong	909	xã	Khánh Đông
10139	31048	xa_van_khanh_tay	909	xã	Khánh Tây
10140	31051	thi_tran_vinh_thuan	910	thị trấn	Vĩnh Thuận
10141	31060	xa_vinh_binh_bac	910	xã	Bình Bắc
10142	31063	xa_vinh_binh_nam	910	xã	Bình Nam
10143	31064	xa_binh_minh	910	xã	Bình Minh
10144	31069	xa_vinh_thuan	910	xã	Vĩnh Thuận
10145	31072	xa_tan_thuan	910	xã	Tân Thuận
10146	31074	xa_phong_dong	910	xã	Phong Đông
10147	31075	xa_vinh_phong	910	xã	Vĩnh Phong
10148	31078	phuong_duong_dong	911	phường	Dương Đông
10149	31081	phuong_an_thoi	911	phường	An Thới
10150	31084	xa_cua_can	911	xã	Cửa Cạn
10151	31087	xa_ganh_dau	911	xã	Gành Dầu
10152	31090	xa_cua_duong	911	xã	Cửa Dương
10153	31093	xa_ham_ninh	911	xã	Hàm Ninh
10154	31096	xa_duong_to	911	xã	Dương Tơ
10155	31102	xa_bai_thom	911	xã	Bãi Thơm
10156	31105	xa_tho_chau	911	xã	Thổ Châu
10157	31108	xa_hon_tre	912	xã	Hòn Tre
10158	31111	xa_lai_son	912	xã	Lại Sơn
10159	31114	xa_an_son	912	xã	An Sơn
10160	31115	xa_nam_du	912	xã	Nam Du
10161	31012	xa_thanh_yen	913	xã	Thạnh Yên
10162	31015	xa_thanh_yen_a	913	xã	Yên A
10163	31027	xa_an_minh_bac	913	xã	Minh Bắc
10164	31054	xa_vinh_hoa	913	xã	Vĩnh Hòa
10165	31057	xa_hoa_chanh	913	xã	Hoà Chánh
10166	31066	xa_minh_thuan	913	xã	Minh Thuận
10167	30791	xa_vinh_phu	914	xã	Vĩnh Phú
10168	30793	xa_vinh_dieu	914	xã	Vĩnh Điều
10169	30796	xa_tan_khanh_hoa	914	xã	Khánh Hòa
10170	30797	xa_phu_loi	914	xã	Phú Lợi
10171	30799	xa_phu_my	914	xã	Phú Mỹ
10172	31117	phuong_cai_khe	916	phường	Cái Khế
10173	31120	phuong_an_hoa	916	phường	An Hòa
10174	31123	phuong_thoi_binh	916	phường	Thới Bình
10175	31126	phuong_an_nghiep	916	phường	An Nghiệp
10176	31129	phuong_an_cu	916	phường	An Cư
10177	31135	phuong_tan_an	916	phường	Tân An
10178	31141	phuong_an_phu	916	phường	An Phú
10179	31144	phuong_xuan_khanh	916	phường	Xuân Khánh
10180	31147	phuong_hung_loi	916	phường	Hưng Lợi
10181	31149	phuong_an_khanh	916	phường	An Khánh
10182	31150	phuong_an_binh	916	phường	An Bình
10183	31153	phuong_chau_van_liem	917	phường	Văn Liêm
10184	31154	phuong_thoi_hoa	917	phường	Thới Hòa
10185	31156	phuong_thoi_long	917	phường	Thới Long
10186	31157	phuong_long_hung	917	phường	Long Hưng
10187	31159	phuong_thoi_an	917	phường	Thới An
10188	31162	phuong_phuoc_thoi	917	phường	Phước Thới
10189	31165	phuong_truong_lac	917	phường	Trường Lạc
10190	31168	phuong_binh_thuy	918	phường	Bình Thủy
10191	31169	phuong_tra_an	918	phường	Trà An
10192	31171	phuong_tra_noc	918	phường	Trà Nóc
10193	31174	phuong_thoi_an_dong	918	phường	An Đông
10194	31177	phuong_an_thoi	918	phường	An Thới
10195	31178	phuong_bui_huu_nghia	918	phường	Hữu Nghĩa
10196	31180	phuong_long_hoa	918	phường	Long Hòa
10197	31183	phuong_long_tuyen	918	phường	Long Tuyền
10198	31186	phuong_le_binh	919	phường	Lê Bình
10199	31189	phuong_hung_phu	919	phường	Hưng Phú
10200	31192	phuong_hung_thanh	919	phường	Hưng Thạnh
10201	31195	phuong_ba_lang	919	phường	Ba Láng
10202	31198	phuong_thuong_thanh	919	phường	Thường Thạnh
10203	31201	phuong_phu_thu	919	phường	Phú Thứ
10204	31204	phuong_tan_phu	919	phường	Tân Phú
10205	31207	phuong_thot_not	923	phường	Thốt Nốt
10206	31210	phuong_thoi_thuan	923	phường	Thới Thuận
10207	31212	phuong_thuan_an	923	phường	Thuận An
10208	31213	phuong_tan_loc	923	phường	Tân Lộc
10209	31216	phuong_trung_nhut	923	phường	Trung Nhứt
10210	31217	phuong_thanh_hoa	923	phường	Thạnh Hoà
10211	31219	phuong_trung_kien	923	phường	Trung Kiên
10212	31227	phuong_tan_hung	923	phường	Tân Hưng
10213	31228	phuong_thuan_hung	923	phường	Thuận Hưng
10214	31211	xa_vinh_binh	924	xã	Vĩnh Bình
10215	31231	thi_tran_thanh_an	924	thị trấn	Thanh An
10216	31232	thi_tran_vinh_thanh	924	thị trấn	Vĩnh Thạnh
10217	31234	xa_thanh_my	924	xã	Thạnh Mỹ
10218	31237	xa_vinh_trinh	924	xã	Vĩnh Trinh
10219	31240	xa_thanh_an	924	xã	Thạnh An
10220	31241	xa_thanh_tien	924	xã	Thạnh Tiến
10221	31243	xa_thanh_thang	924	xã	Thạnh Thắng
10222	31244	xa_thanh_loi	924	xã	Thạnh Lợi
10223	31246	xa_thanh_quoi	924	xã	Thạnh Qưới
10224	31252	xa_thanh_loc	924	xã	Thạnh Lộc
10225	31222	xa_trung_an	925	xã	Trung An
10226	31225	xa_trung_thanh	925	xã	Trung Thạnh
10227	31249	xa_thanh_phu	925	xã	Thạnh Phú
10228	31255	xa_trung_hung	925	xã	Trung Hưng
10229	31261	thi_tran_co_do	925	thị trấn	Cờ Đỏ
10230	31264	xa_thoi_hung	925	xã	Thới Hưng
10231	31273	xa_dong_hiep	925	xã	Đông Hiệp
10232	31274	xa_dong_thang	925	xã	Đông Thắng
10233	31276	xa_thoi_dong	925	xã	Thới Đông
10234	31277	xa_thoi_xuan	925	xã	Thới Xuân
10235	31299	thi_tran_phong_dien	926	thị trấn	Phong Điền
10236	31300	xa_nhon_ai	926	xã	Nhơn Ái
10237	31303	xa_giai_xuan	926	xã	Giai Xuân
10238	31306	xa_tan_thoi	926	xã	Tân Thới
10239	31309	xa_truong_long	926	xã	Trường Long
10240	31312	xa_my_khanh	926	xã	Mỹ Khánh
10241	31315	xa_nhon_nghia	926	xã	Nhơn Nghĩa
10242	31258	thi_tran_thoi_lai	927	thị trấn	Thới Lai
10243	31267	xa_thoi_thanh	927	xã	Thới Thạnh
10244	31268	xa_tan_thanh	927	xã	Tân Thạnh
10245	31270	xa_xuan_thang	927	xã	Xuân Thắng
10246	31279	xa_dong_binh	927	xã	Đông Bình
10247	31282	xa_dong_thuan	927	xã	Đông Thuận
10248	31285	xa_thoi_tan	927	xã	Thới Tân
10249	31286	xa_truong_thang	927	xã	Trường Thắng
10250	31288	xa_dinh_mon	927	xã	Định Môn
10251	31291	xa_truong_thanh	927	xã	Trường Thành
10252	31294	xa_truong_xuan	927	xã	Trường Xuân
10253	31297	xa_truong_xuan_a	927	xã	Xuân A
10254	31298	xa_truong_xuan_b	927	xã	Xuân B
10255	31318	phuong_i	930	phường	Phường I
10256	31321	phuong_iii	930	phường	Phường III
10257	31324	phuong_iv	930	phường	Phường IV
10258	31327	phuong_v	930	phường	Phường V
10259	31330	phuong_vii	930	phường	Phường VII
10260	31333	xa_vi_tan	930	xã	Vị Tân
10261	31336	xa_hoa_luu	930	xã	Hoả Lựu
10262	31338	xa_tan_tien	930	xã	Tân Tiến
10263	31339	xa_hoa_tien	930	xã	Hoả Tiến
10264	31340	phuong_nga_bay	931	phường	Ngã Bảy
10265	31341	phuong_lai_hieu	931	phường	Lái Hiếu
10266	31343	phuong_hiep_thanh	931	phường	Hiệp Thành
10267	31344	phuong_hiep_loi	931	phường	Hiệp Lợi
10268	31411	xa_dai_thanh	931	xã	Đại Thành
10269	31414	xa_tan_thanh	931	xã	Tân Thành
10270	31342	thi_tran_mot_ngan	932	thị trấn	Một Ngàn
10271	31345	xa_tan_hoa	932	xã	Tân Hoà
10272	31346	thi_tran_bay_ngan	932	thị trấn	Bảy Ngàn
10273	31348	xa_truong_long_tay	932	xã	Long Tây
10274	31351	xa_truong_long_a	932	xã	Long A
10275	31357	xa_nhon_nghia_a	932	xã	Nghĩa A
10276	31359	thi_tran_rach_goi	932	thị trấn	Rạch Gòi
10277	31360	xa_thanh_xuan	932	xã	Thạnh Xuân
10278	31362	thi_tran_cai_tac	932	thị trấn	Cái Tắc
10279	31363	xa_tan_phu_thanh	932	xã	Phú Thạnh
10280	31366	thi_tran_nga_sau	933	thị trấn	Ngã Sáu
10281	31369	xa_dong_thanh	933	xã	Đông Thạnh
10282	31375	xa_dong_phu	933	xã	Đông Phú
10283	31378	xa_phu_huu	933	xã	Phú Hữu
10284	31379	xa_phu_tan	933	xã	Phú Tân
10285	31381	thi_tran_mai_dam	933	thị trấn	Mái Dầm
10286	31384	xa_dong_phuoc	933	xã	Đông Phước
10287	31387	xa_dong_phuoc_a	933	xã	Phước A
10288	31393	thi_tran_kinh_cung	934	thị trấn	Kinh Cùng
10289	31396	thi_tran_cay_duong	934	thị trấn	Cây Dương
10290	31399	xa_tan_binh	934	xã	Tân Bình
10291	31402	xa_binh_thanh	934	xã	Bình Thành
10292	31405	xa_thanh_hoa	934	xã	Thạnh Hòa
10293	31408	xa_long_thanh	934	xã	Long Thạnh
10294	31417	xa_phung_hiep	934	xã	Phụng Hiệp
10295	31420	xa_hoa_my	934	xã	Hòa Mỹ
10296	31423	xa_hoa_an	934	xã	Hòa An
10297	31426	xa_phuong_binh	934	xã	Phương Bình
10298	31429	xa_hiep_hung	934	xã	Hiệp Hưng
10299	31432	xa_tan_phuoc_hung	934	xã	Phước Hưng
10300	31433	thi_tran_bung_tau	934	thị trấn	Búng Tàu
10301	31435	xa_phuong_phu	934	xã	Phương Phú
10302	31438	xa_tan_long	934	xã	Tân Long
10303	31441	thi_tran_nang_mau	935	thị trấn	Nàng Mau
10304	31444	xa_vi_trung	935	xã	Vị Trung
10305	31447	xa_vi_thuy	935	xã	Vị Thuỷ
10306	31450	xa_vi_thang	935	xã	Vị Thắng
10307	31453	xa_vinh_thuan_tay	935	xã	Thuận Tây
10308	31456	xa_vinh_trung	935	xã	Vĩnh Trung
10309	31459	xa_vinh_tuong	935	xã	Vĩnh Tường
10310	31462	xa_vi_dong	935	xã	Vị Đông
10311	31465	xa_vi_thanh	935	xã	Vị Thanh
10312	31468	xa_vi_binh	935	xã	Vị Bình
10313	31483	xa_thuan_hung	936	xã	Thuận Hưng
10314	31484	xa_thuan_hoa	936	xã	Thuận Hòa
10315	31486	xa_vinh_thuan_dong	936	xã	Thuận Đông
10316	31489	thi_tran_vinh_vien	936	thị trấn	Vĩnh Viễn
10317	31490	xa_vinh_vien_a	936	xã	Viễn A
10318	31492	xa_luong_tam	936	xã	Lương Tâm
10319	31493	xa_luong_nghia	936	xã	Lương Nghĩa
10320	31495	xa_xa_phien	936	xã	Xà Phiên
10321	31471	phuong_thuan_an	937	phường	Thuận An
10322	31472	phuong_tra_long	937	phường	Trà Lồng
10323	31473	phuong_binh_thanh	937	phường	Bình Thạnh
10324	31474	xa_long_binh	937	xã	Long Bình
10325	31475	phuong_vinh_tuong	937	phường	Vĩnh Tường
10326	31477	xa_long_tri	937	xã	Long Trị
10327	31478	xa_long_tri_a	937	xã	Trị A
10328	31480	xa_long_phu	937	xã	Long Phú
10329	31481	xa_tan_phu	937	xã	Tân Phú
10330	31498	phuong_5	941	phường	Phường 5
10331	31501	phuong_7	941	phường	Phường 7
10332	31504	phuong_8	941	phường	Phường 8
10333	31507	phuong_6	941	phường	Phường 6
10334	31510	phuong_2	941	phường	Phường 2
10335	31513	phuong_1	941	phường	Phường 1
10336	31516	phuong_4	941	phường	Phường 4
10337	31519	phuong_3	941	phường	Phường 3
10338	31522	phuong_9	941	phường	Phường 9
10339	31525	phuong_10	941	phường	Phường 10
10340	31569	thi_tran_chau_thanh	942	thị trấn	Châu Thành
10341	31570	xa_ho_dac_kien	942	xã	Đắc Kiện
10342	31573	xa_phu_tam	942	xã	Phú Tâm
10343	31576	xa_thuan_hoa	942	xã	Thuận Hòa
10344	31582	xa_phu_tan	942	xã	Phú Tân
10345	31585	xa_thien_my	942	xã	Thiện Mỹ
10346	31594	xa_an_hiep	942	xã	An Hiệp
10347	31600	xa_an_ninh	942	xã	An Ninh
10348	31528	thi_tran_ke_sach	943	thị trấn	Kế Sách
10349	31531	thi_tran_an_lac_thon	943	thị trấn	Lạc Thôn
10350	31534	xa_xuan_hoa	943	xã	Xuân Hòa
10351	31537	xa_phong_nam	943	xã	Phong Nẫm
10352	31540	xa_an_lac_tay	943	xã	Lạc Tây
10353	31543	xa_trinh_phu	943	xã	Trinh Phú
10354	31546	xa_ba_trinh	943	xã	Ba Trinh
10355	31549	xa_thoi_an_hoi	943	xã	An Hội
10356	31552	xa_nhon_my	943	xã	Nhơn Mỹ
10357	31555	xa_ke_thanh	943	xã	Kế Thành
10358	31558	xa_ke_an	943	xã	Kế An
10359	31561	xa_dai_hai	943	xã	Đại Hải
10360	31564	xa_an_my	943	xã	An Mỹ
10361	31567	thi_tran_huynh_huu_nghia	944	thị trấn	Hữu Nghĩa
10362	31579	xa_long_hung	944	xã	Long Hưng
10363	31588	xa_hung_phu	944	xã	Hưng Phú
10364	31591	xa_my_huong	944	xã	Mỹ Hương
10365	31597	xa_my_tu	944	xã	Mỹ Tú
10366	31603	xa_my_phuoc	944	xã	Mỹ Phước
10367	31606	xa_thuan_hung	944	xã	Thuận Hưng
10368	31609	xa_my_thuan	944	xã	Mỹ Thuận
10369	31612	xa_phu_my	944	xã	Phú Mỹ
10370	31615	thi_tran_cu_lao_dung	945	thị trấn	Lao Dung
10371	31618	xa_an_thanh_1	945	xã	An Thạnh 1
10372	31621	xa_an_thanh_tay	945	xã	Thạnh Tây
10373	31624	xa_an_thanh_dong	945	xã	Thạnh Đông
10374	31627	xa_dai_an_1	945	xã	Đại Ân 1
10375	31630	xa_an_thanh_2	945	xã	An Thạnh 2
10376	31633	xa_an_thanh_3	945	xã	An Thạnh 3
10377	31636	xa_an_thanh_nam	945	xã	Thạnh Nam
10378	31639	thi_tran_long_phu	946	thị trấn	Long Phú
10379	31642	xa_song_phung	946	xã	Song Phụng
10380	31645	thi_tran_dai_ngai	946	thị trấn	Đại Ngãi
10381	31648	xa_hau_thanh	946	xã	Hậu Thạnh
10382	31651	xa_long_duc	946	xã	Long Đức
10383	31654	xa_truong_khanh	946	xã	Trường Khánh
10384	31657	xa_phu_huu	946	xã	Phú Hữu
10385	31660	xa_tan_hung	946	xã	Tân Hưng
10386	31663	xa_chau_khanh	946	xã	Châu Khánh
10387	31666	xa_tan_thanh	946	xã	Tân Thạnh
10388	31669	xa_long_phu	946	xã	Long Phú
10389	31684	thi_tran_my_xuyen	947	thị trấn	Mỹ Xuyên
10390	31690	xa_dai_tam	947	xã	Đại Tâm
10391	31693	xa_tham_don	947	xã	Tham Đôn
10392	31708	xa_thanh_phu	947	xã	Thạnh Phú
10393	31711	xa_ngoc_dong	947	xã	Ngọc Đông
10394	31714	xa_thanh_quoi	947	xã	Thạnh Quới
10395	31717	xa_hoa_tu_1	947	xã	Hòa Tú 1
10396	31720	xa_gia_hoa_1	947	xã	Gia Hòa 1
10397	31723	xa_ngoc_to	947	xã	Ngọc Tố
10398	31726	xa_gia_hoa_2	947	xã	Gia Hòa 2
10399	31729	xa_hoa_tu_ii	947	xã	Tú II
10400	31732	phuong_1	948	phường	Phường 1
10401	31735	phuong_2	948	phường	Phường 2
10402	31738	xa_vinh_quoi	948	xã	Vĩnh Quới
10403	31741	xa_tan_long	948	xã	Tân Long
10404	31744	xa_long_binh	948	xã	Long Bình
10405	31747	phuong_3	948	phường	Phường 3
10406	31750	xa_my_binh	948	xã	Mỹ Bình
10407	31753	xa_my_quoi	948	xã	Mỹ Quới
10408	31756	thi_tran_phu_loc	949	thị trấn	Phú Lộc
10409	31757	thi_tran_hung_loi	949	thị trấn	Hưng Lợi
10410	31759	xa_lam_tan	949	xã	Lâm Tân
10411	31762	xa_thanh_tan	949	xã	Thạnh Tân
10412	31765	xa_lam_kiet	949	xã	Lâm Kiết
10413	31768	xa_tuan_tuc	949	xã	Tuân Tức
10414	31771	xa_vinh_thanh	949	xã	Vĩnh Thành
10415	31774	xa_thanh_tri	949	xã	Thạnh Trị
10416	31777	xa_vinh_loi	949	xã	Vĩnh Lợi
10417	31780	xa_chau_hung	949	xã	Châu Hưng
10418	31783	phuong_1	950	phường	Phường 1
10419	31786	xa_hoa_dong	950	xã	Hòa Đông
10420	31789	phuong_khanh_hoa	950	phường	Khánh Hòa
10421	31792	xa_vinh_hiep	950	xã	Vĩnh Hiệp
10422	31795	xa_vinh_hai	950	xã	Vĩnh Hải
10423	31798	xa_lac_hoa	950	xã	Lạc Hòa
10424	31801	phuong_2	950	phường	Phường 2
10425	31804	phuong_vinh_phuoc	950	phường	Vĩnh Phước
10426	31807	xa_vinh_tan	950	xã	Vĩnh Tân
10427	31810	xa_lai_hoa	950	xã	Lai Hòa
10428	31672	xa_dai_an_2	951	xã	Đại Ân 2
10429	31673	thi_tran_tran_de	951	thị trấn	Trần Đề
10430	31675	xa_lieu_tu	951	xã	Liêu Tú
10431	31678	xa_lich_hoi_thuong	951	xã	Hội Thượng
10432	31679	thi_tran_lich_hoi_thuong	951	thị trấn	Hội Thượng
10433	31681	xa_trung_binh	951	xã	Trung Bình
10434	31687	xa_tai_van	951	xã	Tài Văn
10435	31696	xa_vien_an	951	xã	Viên An
10436	31699	xa_thanh_thoi_an	951	xã	Thới An
10437	31702	xa_thanh_thoi_thuan	951	xã	Thới Thuận
10438	31705	xa_vien_binh	951	xã	Viên Bình
10439	31813	phuong_2	954	phường	Phường 2
10440	31816	phuong_3	954	phường	Phường 3
10441	31819	phuong_5	954	phường	Phường 5
10442	31822	phuong_7	954	phường	Phường 7
10443	31825	phuong_1	954	phường	Phường 1
10444	31828	phuong_8	954	phường	Phường 8
10445	31831	phuong_nha_mat	954	phường	Nhà Mát
10446	31834	xa_vinh_trach	954	xã	Vĩnh Trạch
10447	31837	xa_vinh_trach_dong	954	xã	Trạch Đông
10448	31840	xa_hiep_thanh	954	xã	Hiệp Thành
10449	31843	thi_tran_ngan_dua	956	thị trấn	Ngan Dừa
10450	31846	xa_ninh_quoi	956	xã	Ninh Quới
10451	31849	xa_ninh_quoi_a	956	xã	Quới A
10452	31852	xa_ninh_hoa	956	xã	Ninh Hòa
10453	31855	xa_loc_ninh	956	xã	Lộc Ninh
10454	31858	xa_vinh_loc	956	xã	Vĩnh Lộc
10455	31861	xa_vinh_loc_a	956	xã	Lộc A
10456	31863	xa_ninh_thanh_loi_a	956	xã	Lợi A
10457	31864	xa_ninh_thanh_loi	956	xã	Thạnh Lợi
10458	31867	thi_tran_phuoc_long	957	thị trấn	Phước Long
10459	31870	xa_vinh_phu_dong	957	xã	Phú Đông
10460	31873	xa_vinh_phu_tay	957	xã	Phú Tây
10461	31876	xa_phuoc_long	957	xã	Phước Long
10462	31879	xa_hung_phu	957	xã	Hưng Phú
10463	31882	xa_vinh_thanh	957	xã	Vĩnh Thanh
10464	31885	xa_phong_thanh_tay_a	957	xã	Tây A
10465	31888	xa_phong_thanh_tay_b	957	xã	Tây B
10466	31894	xa_vinh_hung	958	xã	Vĩnh Hưng
10467	31897	xa_vinh_hung_a	958	xã	Hưng A
10468	31900	thi_tran_chau_hung	958	thị trấn	Châu Hưng
10469	31903	xa_chau_hung_a	958	xã	Hưng A
10470	31906	xa_hung_thanh	958	xã	Hưng Thành
10471	31909	xa_hung_hoi	958	xã	Hưng Hội
10472	31912	xa_chau_thoi	958	xã	Châu Thới
10473	31921	xa_long_thanh	958	xã	Long Thạnh
10474	31942	phuong_1	959	phường	Phường 1
10475	31945	phuong_ho_phong	959	phường	Hộ Phòng
10476	31948	xa_phong_thanh_dong	959	xã	Thạnh Đông
10477	31951	phuong_lang_tron	959	phường	Láng Tròn
10478	31954	xa_phong_tan	959	xã	Phong Tân
10479	31957	xa_tan_phong	959	xã	Tân Phong
10480	31960	xa_phong_thanh	959	xã	Phong Thạnh
10481	31963	xa_phong_thanh_a	959	xã	Thạnh A
10482	31966	xa_phong_thanh_tay	959	xã	Thạnh Tây
10483	31969	xa_tan_thanh	959	xã	Tân Thạnh
10484	31972	thi_tran_ganh_hao	960	thị trấn	Gành Hào
10485	31975	xa_long_dien_dong	960	xã	Điền Đông
10486	31978	xa_long_dien_dong_a	960	xã	Đông A
10487	31981	xa_long_dien	960	xã	Long Điền
10488	31984	xa_long_dien_tay	960	xã	Điền Tây
10489	31985	xa_dien_hai	960	xã	Điền Hải
10490	31987	xa_an_trach	960	xã	An Trạch
10491	31988	xa_an_trach_a	960	xã	Trạch A
10492	31990	xa_an_phuc	960	xã	An Phúc
10493	31993	xa_dinh_thanh	960	xã	Định Thành
10494	31996	xa_dinh_thanh_a	960	xã	Thành A
10495	31891	thi_tran_hoa_binh	961	thị trấn	Hòa Bình
10496	31915	xa_minh_dieu	961	xã	Minh Diệu
10497	31918	xa_vinh_binh	961	xã	Vĩnh Bình
10498	31924	xa_vinh_my_b	961	xã	Mỹ B
10499	31927	xa_vinh_hau	961	xã	Vĩnh Hậu
10500	31930	xa_vinh_hau_a	961	xã	Hậu A
10501	31933	xa_vinh_my_a	961	xã	Mỹ A
10502	31936	xa_vinh_thinh	961	xã	Vĩnh Thịnh
10503	31999	phuong_9	964	phường	Phường 9
10504	32002	phuong_4	964	phường	Phường 4
10505	32005	phuong_1	964	phường	Phường 1
10506	32008	phuong_5	964	phường	Phường 5
10507	32011	phuong_2	964	phường	Phường 2
10508	32014	phuong_8	964	phường	Phường 8
10509	32017	phuong_6	964	phường	Phường 6
10510	32020	phuong_7	964	phường	Phường 7
10511	32022	phuong_tan_xuyen	964	phường	Tân Xuyên
10512	32023	xa_an_xuyen	964	xã	An Xuyên
10513	32025	phuong_tan_thanh	964	phường	Tân Thành
10514	32026	xa_tan_thanh	964	xã	Tân Thành
10515	32029	xa_tac_van	964	xã	Tắc Vân
10516	32032	xa_ly_van_lam	964	xã	Văn Lâm
10517	32035	xa_dinh_binh	964	xã	Định Bình
10518	32038	xa_hoa_thanh	964	xã	Hòa Thành
10519	32041	xa_hoa_tan	964	xã	Hòa Tân
10520	32044	thi_tran_u_minh	966	thị trấn	U Minh
10521	32047	xa_khanh_hoa	966	xã	Khánh Hòa
10522	32048	xa_khanh_thuan	966	xã	Khánh Thuận
10523	32050	xa_khanh_tien	966	xã	Khánh Tiến
10524	32053	xa_nguyen_phich	966	xã	Nguyễn Phích
10525	32056	xa_khanh_lam	966	xã	Khánh Lâm
10526	32059	xa_khanh_an	966	xã	Khánh An
10527	32062	xa_khanh_hoi	966	xã	Khánh Hội
10528	32065	thi_tran_thoi_binh	967	thị trấn	Thới Bình
10529	32068	xa_bien_bach	967	xã	Biển Bạch
10530	32069	xa_tan_bang	967	xã	Tân Bằng
10531	32071	xa_tri_phai	967	xã	Trí Phải
10532	32072	xa_tri_luc	967	xã	Trí Lực
10533	32074	xa_bien_bach_dong	967	xã	Bạch Đông
10534	32077	xa_thoi_binh	967	xã	Thới Bình
10535	32080	xa_tan_phu	967	xã	Tân Phú
10536	32083	xa_tan_loc_bac	967	xã	Lộc Bắc
10537	32086	xa_tan_loc	967	xã	Tân Lộc
10538	32089	xa_tan_loc_dong	967	xã	Lộc Đông
10539	32092	xa_ho_thi_ky	967	xã	Thị Kỷ
10540	32095	thi_tran_tran_van_thoi	968	thị trấn	Văn Thời
10541	32098	thi_tran_song_doc	968	thị trấn	Sông Đốc
10542	32101	xa_khanh_binh_tay_bac	968	xã	Tây Bắc
10543	32104	xa_khanh_binh_tay	968	xã	Bình Tây
10544	32107	xa_tran_hoi	968	xã	Trần Hợi
10545	32108	xa_khanh_loc	968	xã	Khánh Lộc
10546	32110	xa_khanh_binh	968	xã	Khánh Bình
10547	32113	xa_khanh_hung	968	xã	Khánh Hưng
10548	32116	xa_khanh_binh_dong	968	xã	Bình Đông
10549	32119	xa_khanh_hai	968	xã	Khánh Hải
10550	32122	xa_loi_an	968	xã	Lợi An
10551	32124	xa_phong_dien	968	xã	Phong Điền
10552	32125	xa_phong_lac	968	xã	Phong Lạc
10553	32128	thi_tran_cai_nuoc	969	thị trấn	Cái Nước
10554	32130	xa_thanh_phu	969	xã	Thạnh Phú
10555	32131	xa_luong_the_tran	969	xã	Thế Trân
10556	32134	xa_phu_hung	969	xã	Phú Hưng
10557	32137	xa_tan_hung	969	xã	Tân Hưng
10558	32140	xa_hung_my	969	xã	Hưng Mỹ
10559	32141	xa_hoa_my	969	xã	Hoà Mỹ
10560	32142	xa_dong_hung	969	xã	Đông Hưng
10561	32143	xa_dong_thoi	969	xã	Đông Thới
10562	32146	xa_tan_hung_dong	969	xã	Hưng Đông
10563	32149	xa_tran_thoi	969	xã	Trần Thới
10564	32152	thi_tran_dam_doi	970	thị trấn	Đầm Dơi
10565	32155	xa_ta_an_khuong	970	xã	An Khương
10566	32158	xa_ta_an_khuong_dong	970	xã	Khương Đông
10567	32161	xa_tran_phan	970	xã	Trần Phán
10568	32162	xa_tan_trung	970	xã	Tân Trung
10569	32164	xa_tan_duc	970	xã	Tân Đức
10570	32167	xa_tan_thuan	970	xã	Tân Thuận
10571	32170	xa_ta_an_khuong_nam	970	xã	Khương Nam
10572	32173	xa_tan_duyet	970	xã	Tân Duyệt
10573	32174	xa_tan_dan	970	xã	Tân Dân
10574	32176	xa_tan_tien	970	xã	Tân Tiến
10575	32179	xa_quach_pham_bac	970	xã	Phẩm Bắc
10576	32182	xa_quach_pham	970	xã	Quách Phẩm
10577	32185	xa_thanh_tung	970	xã	Thanh Tùng
10578	32186	xa_ngoc_chanh	970	xã	Ngọc Chánh
10579	32188	xa_nguyen_huan	970	xã	Nguyễn Huân
10580	32191	thi_tran_nam_can	971	thị trấn	Năm Căn
10581	32194	xa_ham_rong	971	xã	Hàm Rồng
10582	32197	xa_hiep_tung	971	xã	Hiệp Tùng
10583	32200	xa_dat_moi	971	xã	Đất Mới
10584	32201	xa_lam_hai	971	xã	Lâm Hải
10585	32203	xa_hang_vinh	971	xã	Hàng Vịnh
10586	32206	xa_tam_giang	971	xã	Tam Giang
10587	32209	xa_tam_giang_dong	971	xã	Giang Đông
10588	32212	thi_tran_cai_doi_vam	972	thị trấn	Đôi Vàm
10589	32214	xa_phu_thuan	972	xã	Phú Thuận
10590	32215	xa_phu_my	972	xã	Phú Mỹ
10591	32218	xa_phu_tan	972	xã	Phú Tân
10592	32221	xa_tan_hai	972	xã	Tân Hải
10593	32224	xa_viet_thang	972	xã	Việt Thắng
10594	32227	xa_tan_hung_tay	972	xã	Hưng Tây
10595	32228	xa_rach_cheo	972	xã	Rạch Chèo
10596	32230	xa_nguyen_viet_khai	972	xã	Việt Khái
10597	32233	xa_tam_giang_tay	973	xã	Giang Tây
10598	32236	xa_tan_an_tay	973	xã	Ân Tây
10599	32239	xa_vien_an_dong	973	xã	An Đông
10600	32242	xa_vien_an	973	xã	Viên An
10601	32244	thi_tran_rach_goc	973	thị trấn	Rạch Gốc
10602	32245	xa_tan_an	973	xã	Tân Ân
10603	32248	xa_dat_mui	973	xã	Đất Mũi
\.


--
-- Name: about_us_about_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.about_us_about_id_seq', 1, true);


--
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_address_id_seq', 1, true);


--
-- Name: banner_banner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banner_banner_id_seq', 3, true);


--
-- Name: blog_blog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blog_blog_id_seq', 2, true);


--
-- Name: contacts_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_contacts_id_seq', 1, false);


--
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 4, true);


--
-- Name: districts_districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.districts_districts_id_seq', 705, true);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 45, true);


--
-- Name: history_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.history_history_id_seq', 71, true);


--
-- Name: image_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_image_id_seq', 25, true);


--
-- Name: navigation_nav_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.navigation_nav_id_seq', 21, true);


--
-- Name: post_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_post_id_seq', 5, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_id_seq', 7, true);


--
-- Name: provinces_provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provinces_provinces_id_seq', 63, true);


--
-- Name: recruit_recruit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recruit_recruit_id_seq', 4, true);


--
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_role_id_seq', 3, true);


--
-- Name: sliders_slider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sliders_slider_id_seq', 2, true);


--
-- Name: typical_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.typical_customer_id_seq', 7, true);


--
-- Name: typical_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.typical_image_id_seq', 5, true);


--
-- Name: typical_number_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.typical_number_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: wards_wards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wards_wards_id_seq', 10603, true);


--
-- Name: about_us about_us_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.about_us
    ADD CONSTRAINT about_us_pkey PRIMARY KEY (about_id);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);


--
-- Name: banner banner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banner
    ADD CONSTRAINT banner_pkey PRIMARY KEY (banner_id);


--
-- Name: blog blog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog
    ADD CONSTRAINT blog_pkey PRIMARY KEY (blog_id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (contacts_id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: customer_product customer_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_product
    ADD CONSTRAINT customer_product_pkey PRIMARY KEY (customer_id, product_id);


--
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (districts_id);


--
-- Name: history history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_pkey PRIMARY KEY (history_id);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (image_id);


--
-- Name: navigation navigation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigation
    ADD CONSTRAINT navigation_pkey PRIMARY KEY (nav_id);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (post_id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (provinces_id);


--
-- Name: recruit recruit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruit
    ADD CONSTRAINT recruit_pkey PRIMARY KEY (recruit_id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- Name: sliders sliders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sliders
    ADD CONSTRAINT sliders_pkey PRIMARY KEY (slider_id);


--
-- Name: typical_customer typical_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typical_customer
    ADD CONSTRAINT typical_customer_pkey PRIMARY KEY (id);


--
-- Name: typical_image typical_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typical_image
    ADD CONSTRAINT typical_image_pkey PRIMARY KEY (id);


--
-- Name: typical_number typical_number_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typical_number
    ADD CONSTRAINT typical_number_pkey PRIMARY KEY (id);


--
-- Name: users uk6dotkott2kjsp8vw4d0m25fb7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);


--
-- Name: users ukr43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT ukr43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wards wards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wards
    ADD CONSTRAINT wards_pkey PRIMARY KEY (wards_id);


--
-- Name: about_address fk8iaomqc6f1ibvwx7wxcry348i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.about_address
    ADD CONSTRAINT fk8iaomqc6f1ibvwx7wxcry348i FOREIGN KEY (about_id) REFERENCES public.about_us(about_id);


--
-- Name: customer_product fk8l04qpcphqsemdfr89i05piww; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_product
    ADD CONSTRAINT fk8l04qpcphqsemdfr89i05piww FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: customer_product fkamw6m4xtfpjuhf4we62chd94d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_product
    ADD CONSTRAINT fkamw6m4xtfpjuhf4we62chd94d FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- Name: blog fkeh12tt593aj2kqpwf2m3vet9j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog
    ADD CONSTRAINT fkeh12tt593aj2kqpwf2m3vet9j FOREIGN KEY (image_id) REFERENCES public.image(image_id);


--
-- Name: typical_image fkg4xuw8njug90fof17e95ecool; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typical_image
    ADD CONSTRAINT fkg4xuw8njug90fof17e95ecool FOREIGN KEY (image_id) REFERENCES public.image(image_id);


--
-- Name: user_roles fkhfh9dx7w3ubf1co1vdev94g3f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: about_address fkhiq2p7agy70dbc8er7pvcddpv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.about_address
    ADD CONSTRAINT fkhiq2p7agy70dbc8er7pvcddpv FOREIGN KEY (address_id) REFERENCES public.address(address_id);


--
-- Name: recruit fkhkcd38l4n6y3k2fpv0km7mi4b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruit
    ADD CONSTRAINT fkhkcd38l4n6y3k2fpv0km7mi4b FOREIGN KEY (image_id) REFERENCES public.image(image_id);


--
-- Name: typical_customer fkoqdxrgsaetv3ugegvvgmwi6xo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typical_customer
    ADD CONSTRAINT fkoqdxrgsaetv3ugegvvgmwi6xo FOREIGN KEY (image_id) REFERENCES public.image(image_id);


--
-- Name: post fkqbitxio9e3gwkkkhjhtntf16v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT fkqbitxio9e3gwkkkhjhtntf16v FOREIGN KEY (image_id) REFERENCES public.image(image_id);


--
-- Name: user_roles fkrhfovtciq1l558cw6udg0h0d3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkrhfovtciq1l558cw6udg0h0d3 FOREIGN KEY (role_id) REFERENCES public.role(role_id);


--
-- Name: product fkrokxgp5vv29eql2qo7f2f68jb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fkrokxgp5vv29eql2qo7f2f68jb FOREIGN KEY (banner_id) REFERENCES public.banner(banner_id);


--
-- Name: product fksouy49035ik9r5ojgslbv3i3u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fksouy49035ik9r5ojgslbv3i3u FOREIGN KEY (image_id) REFERENCES public.image(image_id);


--
-- Name: customer fkt120ltfsxdsesrfcg8vcest4i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT fkt120ltfsxdsesrfcg8vcest4i FOREIGN KEY (banner_id) REFERENCES public.banner(banner_id);


--
-- PostgreSQL database dump complete
--

