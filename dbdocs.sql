PGDMP                 
    
    z            dbdocs    15.1    15.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    dbdocs    DATABASE     �   CREATE DATABASE dbdocs WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE dbdocs;
                postgres    false            �            1259    16421    clidocs    TABLE     x   CREATE TABLE public.clidocs (
    company_name character varying(255),
    client_id integer,
    document_id bigint
);
    DROP TABLE public.clidocs;
       public         heap    postgres    false            �            1259    16415    clients    TABLE       CREATE TABLE public.clients (
    cliid integer NOT NULL,
    clifname character varying(25) NOT NULL,
    clilname character varying(50) NOT NULL,
    cliuser character varying(50) NOT NULL,
    cliemail character varying(255),
    cliepass character varying(20) NOT NULL
);
    DROP TABLE public.clients;
       public         heap    postgres    false            �            1259    16414    clients_cliid_seq    SEQUENCE     �   CREATE SEQUENCE public.clients_cliid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.clients_cliid_seq;
       public          postgres    false    217                       0    0    clients_cliid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.clients_cliid_seq OWNED BY public.clients.cliid;
          public          postgres    false    216            �            1259    16407 	   documents    TABLE       CREATE TABLE public.documents (
    docid bigint NOT NULL,
    doctitle character varying(255) NOT NULL,
    docpgcnt smallint,
    docdate date,
    doctype character varying(3),
    docproctime double precision,
    CONSTRAINT documents_docpgcnt_check CHECK ((docpgcnt > 0))
);
    DROP TABLE public.documents;
       public         heap    postgres    false            �            1259    16406    documents_docid_seq    SEQUENCE     |   CREATE SEQUENCE public.documents_docid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.documents_docid_seq;
       public          postgres    false    215                       0    0    documents_docid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.documents_docid_seq OWNED BY public.documents.docid;
          public          postgres    false    214            o           2604    16418    clients cliid    DEFAULT     n   ALTER TABLE ONLY public.clients ALTER COLUMN cliid SET DEFAULT nextval('public.clients_cliid_seq'::regclass);
 <   ALTER TABLE public.clients ALTER COLUMN cliid DROP DEFAULT;
       public          postgres    false    217    216    217            n           2604    16410    documents docid    DEFAULT     r   ALTER TABLE ONLY public.documents ALTER COLUMN docid SET DEFAULT nextval('public.documents_docid_seq'::regclass);
 >   ALTER TABLE public.documents ALTER COLUMN docid DROP DEFAULT;
       public          postgres    false    215    214    215            	          0    16421    clidocs 
   TABLE DATA           G   COPY public.clidocs (company_name, client_id, document_id) FROM stdin;
    public          postgres    false    218   8                 0    16415    clients 
   TABLE DATA           Y   COPY public.clients (cliid, clifname, clilname, cliuser, cliemail, cliepass) FROM stdin;
    public          postgres    false    217   U                 0    16407 	   documents 
   TABLE DATA           ]   COPY public.documents (docid, doctitle, docpgcnt, docdate, doctype, docproctime) FROM stdin;
    public          postgres    false    215   r                  0    0    clients_cliid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.clients_cliid_seq', 1, false);
          public          postgres    false    216                       0    0    documents_docid_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.documents_docid_seq', 1, false);
          public          postgres    false    214            t           2606    16420    clients clients_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (cliid);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            postgres    false    217            r           2606    16413    documents documents_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (docid);
 B   ALTER TABLE ONLY public.documents DROP CONSTRAINT documents_pkey;
       public            postgres    false    215            u           2606    16424    clidocs fk_client_id    FK CONSTRAINT     z   ALTER TABLE ONLY public.clidocs
    ADD CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES public.clients(cliid);
 >   ALTER TABLE ONLY public.clidocs DROP CONSTRAINT fk_client_id;
       public          postgres    false    218    217    3188            v           2606    16429    clidocs fk_document_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.clidocs
    ADD CONSTRAINT fk_document_id FOREIGN KEY (document_id) REFERENCES public.documents(docid);
 @   ALTER TABLE ONLY public.clidocs DROP CONSTRAINT fk_document_id;
       public          postgres    false    215    3186    218            	      x������ � �            x������ � �            x������ � �     