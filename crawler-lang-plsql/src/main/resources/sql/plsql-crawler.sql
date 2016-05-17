-- ********************** Tables for Crawler of Database and PL/SQL ********************

DROP TABLE CRAWLER.VI_DB_CRAWLER_TYPE_INFO;
DROP TABLE CRAWLER.VI_DB_CRAWLER_KEY;
DROP TABLE CRAWLER.VI_DB_CRAWLER_INDEX_INFO;
DROP TABLE CRAWLER.VI_DB_CRAWLER_COLUMNS;
DROP TABLE CRAWLER.VI_DB_CRAWLER_TABLES;
DROP TABLE CRAWLER.VI_DB_CRAWLER_SCHEMAS;
DROP TABLE CRAWLER.VI_DB_CRAWLER_DATABASES;

CREATE TABLE CRAWLER.VI_DB_CRAWLER_DATABASES (
  ID INTEGER NOT NULL,
  NAME VARCHAR(100) NOT NULL,
  PRODUCT_NAME VARCHAR(100),
  PRODUCT_VERSION VARCHAR(1000),
  DESCRIPTION CLOB,
  TRIGGER_ID INTEGER NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE CRAWLER.VI_DB_CRAWLER_SCHEMAS (
  ID INTEGER NOT NULL,
  DB_ID INTEGER NOT NULL,
  NAME VARCHAR(100) NOT NULL,
  DESCRIPTION CLOB,
  TRIGGER_ID INTEGER NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE CRAWLER.VI_DB_CRAWLER_TABLES (
  ID INTEGER NOT NULL,
  SCHEMA_ID INTEGER NOT NULL,
  NAME VARCHAR(100) NOT NULL,
  DESCRIPTION CLOB,
  TRIGGER_ID INTEGER NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE CRAWLER.VI_DB_CRAWLER_COLUMNS (
  ID INTEGER NOT NULL,
  TABLE_NAME VARCHAR(100) NOT NULL,
  NAME VARCHAR(100) NOT NULL,
  REMARKS CLOB,
  DATA_TYPE INTEGER,
  TYPE_NAME VARCHAR(100),
  COLUMN_SIZE INTEGER,
  NULLABLE VARCHAR(10),
  COLUMN_DEF VARCHAR(100),
  CHAR_OCTET_LENGTH INTEGER,
  ORDINAL_POSITION INTEGER,
  IS_AUTOINCREMENT VARCHAR(10),
  IS_GENERATEDCOLUMN  VARCHAR(10),
  TRIGGER_ID INTEGER NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE CRAWLER.VI_DB_CRAWLER_KEY (
  ID INTEGER NOT NULL,
  KEY_NAME VARCHAR(100) NOT NULL,
  KEY_TYPE VARCHAR(100),
  COLUMN_NAME VARCHAR(100),
  KEY_SEQ INTEGER,
  REFERENCING_COLUMN_NAME VARCHAR(100),
  UPDATE_RULE VARCHAR(50),
  DELETE_RULE VARCHAR(50),
  DEFERRABILITY VARCHAR(50),
  TRIGGER_ID INTEGER NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE CRAWLER.VI_DB_CRAWLER_TYPE_INFO (
  ID INTEGER NOT NULL,
  DATA_TYPE INTEGER,
  TYPE_NAME VARCHAR(100),
  PRECISION  INTEGER,
  CREATE_PARAMS VARCHAR(100),
  NULLABLE VARCHAR(10),
  CASE_SENSITIVE  VARCHAR(10),
  SEARCHABLE VARCHAR(10),
  AUTO_INCREMENT VARCHAR(10),
  TRIGGER_ID INTEGER NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE CRAWLER.VI_DB_CRAWLER_INDEX_INFO (
  ID INTEGER NOT NULL,
  TABLE_NAME VARCHAR(100) NOT NULL,
  NON_UNIQUE  VARCHAR(10),
  INDEX_QUALIFIER VARCHAR(100),
  INDEX_NAME VARCHAR(100),
  INDEX_TYPE VARCHAR(10),
  ORDINAL_POSITION INTEGER,
  COLUMN_NAME VARCHAR(100),
  ASC_OR_DESC VARCHAR(10),
  CARDINALITY  INTEGER,
  PAGES INTEGER,
  FILTER_CONDITION  VARCHAR(1000),
  TRIGGER_ID INTEGER NOT NULL,
  PRIMARY KEY (ID)
);

--ALTER TABLE CRAWLER.VI_DB_CRAWLER_INDEX_INFO ADD CONSTRAINT VI_DB_CRAWLER_INDEX_INFO_FK1 FOREIGN KEY (COLUMN_NAME)  REFERENCES CRAWLER.VI_DB_CRAWLER_COLUMNS(NAME);
--ALTER TABLE CRAWLER.VI_DB_CRAWLER_INDEX_INFO ADD CONSTRAINT VI_DB_CRAWLER_INDEX_INFO_FK2 FOREIGN KEY (TABLE_NAME)  REFERENCES CRAWLER.VI_DB_CRAWLER_TABLES(NAME);
--ALTER TABLE CRAWLER.VI_DB_CRAWLER_KEY ADD CONSTRAINT VI_DB_CRAWLER_KEY_FK1 FOREIGN KEY (COLUMN_NAME)  REFERENCES CRAWLER.VI_DB_CRAWLER_COLUMNS(NAME);
--ALTER TABLE CRAWLER.VI_DB_CRAWLER_COLUMNS ADD CONSTRAINT VI_DB_CRAWLER_COLUMNS_FK1 FOREIGN KEY (TABLE_NAME)  REFERENCES CRAWLER.VI_DB_CRAWLER_TABLES(NAME);
ALTER TABLE CRAWLER.VI_DB_CRAWLER_TABLES ADD CONSTRAINT VI_DB_CRAWLER_TABLES_FK1 FOREIGN KEY (SCHEMA_ID)  REFERENCES CRAWLER.VI_DB_CRAWLER_SCHEMAS(ID);
ALTER TABLE CRAWLER.VI_DB_CRAWLER_SCHEMAS ADD CONSTRAINT VI_DB_CRAWLER_SCHEMAS_FK1 FOREIGN KEY (DB_ID)  REFERENCES CRAWLER.VI_DB_CRAWLER_DATABASES(ID);


