CREATE TABLE CRAWLER.SEQUENCE (
  SEQ_NAME VARCHAR(200),
  SEQ_COUNT  INTEGER,
  PRIMARY KEY (SEQ_NAME)
);

UPDATE CRAWLER.SEQUENCE SET SEQ_COUNT = 0;

DROP table CRAWLER.VI_CRAWLER_TRIGGER;

CREATE TABLE CRAWLER.VI_CRAWLER_TRIGGER (
  ID INTEGER NOT NULL,
  TRIGGER_NAME VARCHAR(20) NOT NULL,
  DESCRIPTION VARCHAR(50) NOT NULL,
  PATH VARCHAR(500) NOT NULL, -- absolute path
  STATUS VARCHAR(20) NOT NULL, -- NOT STARTED, COMPLETE, IN PROGRESS
  PROCESSING_TIME INTEGER,
  CREATED_BY VARCHAR(50) NOT NULL,
  CREATED_TS TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  UPDATED_BY VARCHAR(50),
  UPDATED_TS TIMESTAMP,
  PRIMARY KEY (ID)
);
ALTER TABLE CRAWLER.VI_CRAWLER_TRIGGER ADD CONSTRAINT VI_CRAWLER_TRIGGER_UK1 UNIQUE (TRIGGER_NAME);