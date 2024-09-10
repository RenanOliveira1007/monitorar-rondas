PGDMP  	            	        |            banco_vgbel    16.1    16.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16469    banco_vgbel    DATABASE     �   CREATE DATABASE banco_vgbel WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE banco_vgbel;
                postgres    false            L           1247    16636    bairro_enum    TYPE     z   CREATE TYPE public.bairro_enum AS ENUM (
    'Ruínas',
    'Vila Peruíbe',
    'Parque Turístico',
    'São José'
);
    DROP TYPE public.bairro_enum;
       public          postgres    false            �            1255    24602    inserir_vigilante()    FUNCTION     �   CREATE FUNCTION public.inserir_vigilante() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO vgb_vigilantes (nome, cpf, turno)
    VALUES (NEW.nome, NEW.cpf, NEW.turno);
    RETURN NEW;
END;
$$;
 *   DROP FUNCTION public.inserir_vigilante();
       public          postgres    false            �            1259    16675 
   vgb_rondas    TABLE     1  CREATE TABLE public.vgb_rondas (
    id integer NOT NULL,
    vigilante_id integer,
    horario_inicio time without time zone NOT NULL,
    horario_fim time without time zone NOT NULL,
    concluida boolean DEFAULT false,
    bairro character varying(255),
    observacoes text,
    data_registro date
);
    DROP TABLE public.vgb_rondas;
       public         heap    postgres    false            �            1259    16674    vgb_rondas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vgb_rondas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.vgb_rondas_id_seq;
       public          postgres    false    218            �           0    0    vgb_rondas_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.vgb_rondas_id_seq OWNED BY public.vgb_rondas.id;
          public          postgres    false    217            �            1259    16668    vgb_vigilantes    TABLE     �   CREATE TABLE public.vgb_vigilantes (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    turno character varying(50) NOT NULL,
    cpf character varying(14)
);
 "   DROP TABLE public.vgb_vigilantes;
       public         heap    postgres    false            �            1259    16667    vgb_vigilantes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vgb_vigilantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.vgb_vigilantes_id_seq;
       public          postgres    false    216            �           0    0    vgb_vigilantes_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.vgb_vigilantes_id_seq OWNED BY public.vgb_vigilantes.id;
          public          postgres    false    215            $           2604    16678    vgb_rondas id    DEFAULT     n   ALTER TABLE ONLY public.vgb_rondas ALTER COLUMN id SET DEFAULT nextval('public.vgb_rondas_id_seq'::regclass);
 <   ALTER TABLE public.vgb_rondas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            #           2604    16671    vgb_vigilantes id    DEFAULT     v   ALTER TABLE ONLY public.vgb_vigilantes ALTER COLUMN id SET DEFAULT nextval('public.vgb_vigilantes_id_seq'::regclass);
 @   ALTER TABLE public.vgb_vigilantes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �          0    16675 
   vgb_rondas 
   TABLE DATA           �   COPY public.vgb_rondas (id, vigilante_id, horario_inicio, horario_fim, concluida, bairro, observacoes, data_registro) FROM stdin;
    public          postgres    false    218          �          0    16668    vgb_vigilantes 
   TABLE DATA           >   COPY public.vgb_vigilantes (id, nome, turno, cpf) FROM stdin;
    public          postgres    false    216           �           0    0    vgb_rondas_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.vgb_rondas_id_seq', 22, true);
          public          postgres    false    217            �           0    0    vgb_vigilantes_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.vgb_vigilantes_id_seq', 25, true);
          public          postgres    false    215            )           2606    16681    vgb_rondas vgb_rondas_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.vgb_rondas
    ADD CONSTRAINT vgb_rondas_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.vgb_rondas DROP CONSTRAINT vgb_rondas_pkey;
       public            postgres    false    218            '           2606    16673 "   vgb_vigilantes vgb_vigilantes_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.vgb_vigilantes
    ADD CONSTRAINT vgb_vigilantes_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.vgb_vigilantes DROP CONSTRAINT vgb_vigilantes_pkey;
       public            postgres    false    216            *           2606    24584 '   vgb_rondas vgb_rondas_vigilante_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vgb_rondas
    ADD CONSTRAINT vgb_rondas_vigilante_id_fkey FOREIGN KEY (vigilante_id) REFERENCES public.vgb_vigilantes(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.vgb_rondas DROP CONSTRAINT vgb_rondas_vigilante_id_fkey;
       public          postgres    false    218    4647    216            �   �   x���Mn�0���S ٦����+����&��6f�uXs�\�R�RU�����~Lv��Y�|g1D/�A�����SV�tS�1��P��� ؊C���j=�������φ�!Xm���j������K���<E�k���ٹ��ɾ{Y=t�cG�嵢��)�Ǹu��uo���;�q�7�!\qH��oy�iv�#m�s��Ų��)�N)�@      �   �   x�=ͱ�0@��7E�ɾ��� 4��Ɛ(r�l����� �!A��>�:�|�Ҍi��K�q�I��^��t�5�)<�4g�s\���$�[:K�f@���1�U�Vi�����Ǿǎ=�Quȩi��R���c]�w��7����8x�z�+��
1�     