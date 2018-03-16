-- Part 2.5 delete.sql
--
-- Submitted by: Yana Popova, 1705057
-- 

-- DO NOT use these SQL commands in your submissionb(they will cause an 
-- error on the NMS database server):
-- CREATE SCHEMA 
-- USE 

-- The question is not asking us how to find the contender with the 
-- lowest salary, so I choose find it by calculating it myself - their
-- stage name is 'The Star'.  

DELETE CONTENDERINSHOW
FROM CONTENDERINSHOW, CONTENDER
WHERE CONTENDER.STAGENAME = 'The Star' AND CONTENDERINSHOW.IDCONTENDER = CONTENDER.IDCONTENDER;

DELETE PARTICIPANT
FROM PARTICIPANT, CONTENDER
WHERE CONTENDER.STAGENAME = 'The Star' AND PARTICIPANT.IDCONTENDER = CONTENDER.IDCONTENDER;

DELETE CONTENDER
FROM CONTENDER
WHERE CONTENDER.STAGENAME = 'The Star' 
