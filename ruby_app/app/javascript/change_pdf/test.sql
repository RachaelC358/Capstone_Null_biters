PGDMP                     	    z           docsdb    14.5    14.5     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16394    docsdb    DATABASE     j   CREATE DATABASE docsdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE docsdb;
                postgres    false            ?            1259    16396 	   documents    TABLE     ?   CREATE TABLE public.documents (
    docid bigint NOT NULL,
    doctitle character varying(255) NOT NULL,
    docdate date,
    docclass integer NOT NULL,
    doctype character varying(3),
    CONSTRAINT documents_docclass_check CHECK ((docclass >= 0))
);
    DROP TABLE public.documents;
       public         heap    postgres    false            ?            1259    16395    documents_docid_seq    SEQUENCE     |   CREATE SEQUENCE public.documents_docid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.documents_docid_seq;
       public          postgres    false    210            ?           0    0    documents_docid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.documents_docid_seq OWNED BY public.documents.docid;
          public          postgres    false    209            \           2604    16399    documents docid    DEFAULT     r   ALTER TABLE ONLY public.documents ALTER COLUMN docid SET DEFAULT nextval('public.documents_docid_seq'::regclass);
 >   ALTER TABLE public.documents ALTER COLUMN docid DROP DEFAULT;
       public          postgres    false    209    210    210            ?          0    16396 	   documents 
   TABLE DATA           P   COPY public.documents (docid, doctitle, docdate, docclass, doctype) FROM stdin;
    public          postgres    false    210   .       ?           0    0    documents_docid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.documents_docid_seq', 2, true);
          public          postgres    false    209            _           2606    16402    documents documents_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (docid);
 B   ALTER TABLE ONLY public.documents DROP CONSTRAINT documents_pkey;
       public            postgres    false    210            ?      x?????? ? ?     