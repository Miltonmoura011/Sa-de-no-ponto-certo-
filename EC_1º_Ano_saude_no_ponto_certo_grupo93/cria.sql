CREATE TABLE class_hospitais21 (
    idclass   NUMBER(3) NOT NULL,
    sa_depadm NUMBER,
    depadm    VARCHAR2(255 CHAR),
    sa_tipo   NUMBER,
    tipo      VARCHAR2(255 CHAR),
    sa_classe NUMBER NOT NULL,
    classe    VARCHAR2(255 CHAR)
);

ALTER TABLE class_hospitais21 ADD CHECK ( idclass BETWEEN 1 AND 999 );

ALTER TABLE class_hospitais21 ADD CONSTRAINT class_hospitais21_pk PRIMARY KEY ( idclass );

CREATE TABLE dadossaude21 (
    id              NUMBER(10) NOT NULL,
    coord_e         NUMBER,
    coord_n         NUMBER,
    setcens         NUMBER,
    areap           NUMBER,
    coddist         NUMBER(10) NOT NULL,
    distrito        VARCHAR2(255 CHAR),
    codsubpref      NUMBER(10),
    subpref         VARCHAR2(255 CHAR),
    regiao5         VARCHAR2(255 CHAR),
    regiao8         VARCHAR2(255 CHAR),
    estabelecimento VARCHAR2(255 CHAR),
    endereco        VARCHAR2(255 CHAR),
    bairro          VARCHAR2(255 CHAR),
    telefone        NUMBER(10),
    cep             NUMBER(10),
    cnes            NUMBER(10),
    sa_depadm       NUMBER(10) NOT NULL,
    depadm          VARCHAR2(255 CHAR),
    sa_tipo         NUMBER(10),
    tipo            VARCHAR2(255 CHAR),
    sa_classe       NUMBER(10),
    classe          VARCHAR2(255 CHAR),
    leitos          VARCHAR2(255 CHAR)
);

CREATE UNIQUE INDEX milton.sys_c008959 ON
    dadossaude21 (
        id
    ASC );

ALTER TABLE dadossaude21 ADD CONSTRAINT dadossaude21_pk PRIMARY KEY ( id );

CREATE TABLE fato_hospitais (
    hopitaisid                INTEGER NOT NULL,
    departamentosa            NUMBER(10),
    depa_adm                  NUMBER(10),
    dadossaude21_id           NUMBER(10) NOT NULL,
    hospitais21_id            NUMBER(10) NOT NULL,
    class_hospitais21_idclass NUMBER(3) NOT NULL
);

ALTER TABLE fato_hospitais ADD CHECK ( class_hospitais21_idclass BETWEEN 1 AND 999 );

ALTER TABLE fato_hospitais ADD CONSTRAINT fato_hospitais_pk PRIMARY KEY ( hopitaisid );

CREATE TABLE hospitais21 (
    id       NUMBER(10) NOT NULL,
    cod_dist NUMBER(10) NOT NULL,
    distrito VARCHAR2(100 CHAR),
    estab_sa NUMBER(10)
);

CREATE UNIQUE INDEX milton.sys_c008962 ON
    hospitais21 (
        id
    ASC );

ALTER TABLE hospitais21 ADD CONSTRAINT hospitais21_pk PRIMARY KEY ( id );

ALTER TABLE fato_hospitais
    ADD CONSTRAINT fato_class_hospitais21_sk FOREIGN KEY ( class_hospitais21_idclass )
        REFERENCES class_hospitais21 ( idclass );

ALTER TABLE fato_hospitais
    ADD CONSTRAINT fato_dadossaude21_sk FOREIGN KEY ( dadossaude21_id )
        REFERENCES dadossaude21 ( id );

ALTER TABLE fato_hospitais
    ADD CONSTRAINT fato_hospitais21_sk FOREIGN KEY ( hospitais21_id )
        REFERENCES hospitais21 ( id );