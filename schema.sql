-- schema.sql
-- Author: Yana Popova
-- DO NOT use these SQL commands:
-- CREATE SCHEMA 
-- USE 

-- All of my schemas have key constraints - primary keys shouldn't be null
-- Assigning a replacement coach - a constraint which can't be enforced
CREATE TABLE COACH(
    IDCOACH VARCHAR(10) NOT NULL,
    NAME VARCHAR(15) NOT NULL,
    SURNAME VARCHAR(15) NOT NULL,
    DOB DATE NOT NULL,
    PHONE VARCHAR(15) NOT NULL,
    DAILYSALARY DOUBLE NOT NULL,
    GENDER VARCHAR(6) NOT NULL,
    PRIMARY KEY (IDCOACH)
);

-- Two contenders should not have the same stage name-it should be unique
-- Each contender should have at least one participant - we cannot use assertions
-- so this constraint must be left unchecked
CREATE TABLE CONTENDER( 
    IDCONTENDER VARCHAR(10) NOT NULL, 
    STAGENAME VARCHAR(20) NOT NULL,
    TYPE VARCHAR(10) NOT NULL,
    IDCOACH VARCHAR(10) NOT NULL,
    PRIMARY KEY (IDCONTENDER),
    UNIQUE(STAGENAME),
  
    FOREIGN KEY (IDCOACH)
        References COACH(IDCOACH)
        ON DELETE RESTRICT  
        ON UPDATE CASCADE   
);

CREATE TABLE PARTICIPANT(
    IDPARTICIPANT VARCHAR(10) NOT NULL,
    NAME VARCHAR(15) NOT NULL,
    SURNAME VARCHAR(15) NOT NULL,
    DOB DATE NOT NULL,
    PHONE VARCHAR(15) NOT NULL,
    DAILYSALARY DOUBLE NOT NULL,
    GENDER VARCHAR(6) NOT NULL,
    IDCONTENDER VARCHAR(10) NOT NULL,
    PRIMARY KEY (IDPARTICIPANT),

    FOREIGN KEY (IDCONTENDER)
        References CONTENDER(IDCONTENDER)
        ON DELETE RESTRICT   
        ON UPDATE CASCADE    
);

CREATE TABLE TVSHOW(
    IDSHOW VARCHAR(10) NOT NULL,
    DATESHOW DATE NOT NULL,
    STARTTIME TIME NOT NULL,
    ENDTIME TIME NOT NULL,
    LOACTION VARCHAR(50) NOT NULL,
    PRIMARY KEY(IDSHOW)
);

CREATE TABLE COACHINSHOW(
    IDCOACH VARCHAR(10) NOT NULL,
    IDSHOW VARCHAR(10) NOT NULL,
    PRIMARY KEY (IDCOACH, IDSHOW),

    FOREIGN KEY (IDCOACH)
        References COACH(IDCOACH)
        ON DELETE RESTRICT   
        ON UPDATE CASCADE,    

    FOREIGN KEY (IDSHOW)
        References TVSHOW(IDSHOW)
        ON DELETE RESTRICT   
        ON UPDATE CASCADE    
);

CREATE TABLE CONTENDERINSHOW(
    IDCONTENDER VARCHAR(10) NOT NULL,
    IDSHOW VARCHAR(10) NOT NULL,
    PRIMARY KEY (IDCONTENDER, IDSHOW),

    FOREIGN KEY (IDCONTENDER)
        References CONTENDER(IDCONTENDER)
        ON DELETE RESTRICT   
        ON UPDATE CASCADE,    

    FOREIGN KEY (IDSHOW)
        References TVSHOW(IDSHOW)
        ON DELETE RESTRICT   
        ON UPDATE CASCADE    
);  
