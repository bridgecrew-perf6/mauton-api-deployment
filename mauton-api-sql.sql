
-- public.tb_user definition

-- Drop table

-- DROP TABLE public.tb_user;

CREATE TABLE public.tb_user (
	user_id serial NOT NULL,
	email text NOT NULL,
	"password" bpchar(64) NOT NULL,
	user_name text NOT NULL,
	user_path text NOT NULL,
	created_date timestamp NOT NULL,
	created_by text NOT NULL,
	last_updated_date timestamp NOT NULL,
	last_updated_by text NOT NULL,
	user_role varchar(30) NOT NULL,
	CONSTRAINT tb_user_email_key UNIQUE (email),
	CONSTRAINT tb_user_pkey PRIMARY KEY (user_id),
	CONSTRAINT tb_user_user_name_key UNIQUE (user_name),
	CONSTRAINT tb_user_user_path_key UNIQUE (user_path)
);

-- public.tb_tag definition

-- Drop table

-- DROP TABLE public.tb_tag;

CREATE TABLE public.tb_tag (
	tag_id serial NOT NULL,
	tag_name text NOT NULL,
	seq int4 NOT NULL,
	created_date timestamp NOT NULL,
	created_by text NOT NULL,
	last_updated_date timestamp NOT NULL,
	last_updated_by text NOT NULL,
	user_id int4 NULL,
	CONSTRAINT tb_tag_pkey PRIMARY KEY (tag_id),
	CONSTRAINT uq_tag_name_user_id UNIQUE (tag_name, user_id)
);


-- public.tb_tag foreign keys

ALTER TABLE public.tb_tag ADD CONSTRAINT fk_tag_user_id FOREIGN KEY (user_id) REFERENCES tb_user(user_id);

-- public.tb_menu definition

-- Drop table

-- DROP TABLE public.tb_menu;

CREATE TABLE public.tb_menu (
	menu_id serial NOT NULL,
	parent_menu_id int4 NULL,
	menu_level int4 NOT NULL,
	menu_name text NOT NULL,
	seq int2 NOT NULL DEFAULT 1,
	created_date timestamp NOT NULL,
	created_by text NOT NULL,
	last_updated_date timestamp NOT NULL,
	last_updated_by text NOT NULL,
	menu_path text NULL,
	user_id int4 NOT NULL,
	CONSTRAINT tb_menu_pkey PRIMARY KEY (menu_id),
	CONSTRAINT uq_menu_user UNIQUE (menu_name, parent_menu_id, menu_level, user_id)
);


-- public.tb_menu foreign keys

ALTER TABLE public.tb_menu ADD CONSTRAINT fk_menu_id FOREIGN KEY (parent_menu_id) REFERENCES tb_menu(menu_id);
ALTER TABLE public.tb_menu ADD CONSTRAINT fk_menu_user_id FOREIGN KEY (user_id) REFERENCES tb_user(user_id);

-- public.tb_blog_category definition

-- Drop table

-- DROP TABLE public.tb_blog_category;

CREATE TABLE public.tb_blog_category (
	blog_category_id serial NOT NULL,
	blog_category_name text NOT NULL,
	blog_category_desc text NULL,
	seq int4 NOT NULL,
	created_date timestamp NOT NULL,
	created_by text NOT NULL,
	last_updated_date timestamp NOT NULL,
	last_updated_by text NOT NULL,
	user_id int4 NOT NULL,
	CONSTRAINT tb_blog_category_pkey PRIMARY KEY (blog_category_id),
	CONSTRAINT uq_category_name_user_id UNIQUE (blog_category_name, user_id)
);


-- public.tb_blog_category foreign keys

ALTER TABLE public.tb_blog_category ADD CONSTRAINT fk_category_user_id FOREIGN KEY (user_id) REFERENCES tb_user(user_id);

-- public.tb_blog definition

-- Drop table

-- DROP TABLE public.tb_blog;

CREATE TABLE public.tb_blog (
	blog_id serial NOT NULL,
	menu_id int4 NOT NULL,
	blog_category_id int4 NOT NULL,
	blog_title text NOT NULL,
	blog_content text NULL,
	seq int4 NOT NULL,
	created_date timestamp NOT NULL,
	created_by text NOT NULL,
	last_updated_date timestamp NOT NULL,
	last_updated_by text NOT NULL,
	user_id int4 NOT NULL,
	CONSTRAINT tb_blog_pkey PRIMARY KEY (blog_id)
);


-- public.tb_blog foreign keys

ALTER TABLE public.tb_blog ADD CONSTRAINT fk_blog_category FOREIGN KEY (blog_category_id) REFERENCES tb_blog_category(blog_category_id);
ALTER TABLE public.tb_blog ADD CONSTRAINT fk_blog_user_id FOREIGN KEY (user_id) REFERENCES tb_user(user_id);
ALTER TABLE public.tb_blog ADD CONSTRAINT fk_menu FOREIGN KEY (menu_id) REFERENCES tb_menu(menu_id);

-- public.tb_blog_tag_link definition

-- Drop table

-- DROP TABLE public.tb_blog_tag_link;

CREATE TABLE public.tb_blog_tag_link (
	blog_tag_link_id serial NOT NULL,
	blog_id int4 NULL,
	tag_id int4 NULL,
	created_date timestamp NOT NULL,
	created_by text NOT NULL,
	last_updated_date timestamp NOT NULL,
	last_updated_by text NOT NULL,
	CONSTRAINT tb_blog_tag_link_pkey PRIMARY KEY (blog_tag_link_id)
);


-- public.tb_blog_tag_link foreign keys

ALTER TABLE public.tb_blog_tag_link ADD CONSTRAINT fk_blog FOREIGN KEY (blog_id) REFERENCES tb_blog(blog_id);
ALTER TABLE public.tb_blog_tag_link ADD CONSTRAINT fk_tag FOREIGN KEY (tag_id) REFERENCES tb_tag(tag_id);
