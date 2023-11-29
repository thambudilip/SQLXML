-- Create a table with an XMLType column

DROP TABLE BOOKS;

CREATE TABLE BOOKS
(
    BOOK_NAME NVARCHAR2(200),
    AUTHOR VARCHAR2(50),
    ADDITONAL_INFO XMLTYPE
);


INSERT INTO BOOKS VALUES('DISCOVERY OF INDIA','JAWAHARLAL NEHRU',
    XMLTYPE('<ADDTIONALINFO>
    <PUBLICATIONS> NATIONAL HERALD </PUBLICATIONS>
    <PUBLISHED_YEAR> 1946 </PUBLISHED_YEAR>
    <ABOUT> THE CULTURE OF INDIA </ABOUT>
    <PAGES> 254 </PAGES>
    </ADDTIONALINFO>'
    ));

DELETE FROM BOOKS WHERE AUTHOR = 'JAWAHARLAL NEHRU';

SELECT * FROM BOOKS;

SELECT * FROM USER_TABLES WHERE TABLE_NAME = 'BOOKS';

SELECT BOOK_NAME,AUTHOR ADDITONAL_INFO.extract('/bookinfo/genre/text()').getStringVal() AS genre
FROM books WHERE AUTHOR = 'JAWAHARLAL NEHRU' ;

SELECT
    BOOK_NAME,
    AUTHOR,
    ADDITONAL_INFO.extract('/ADDTIONALINFO/GENRE/text()').getStringVal() AS genre
FROM
    books
WHERE
    AUTHOR = 'JAWAHARLAL NEHRU';


SELECT ADDITONAL_INFO FROM BOOKS; /* only for a viewing purpose . we can't see the entire information of xml file columns, we have to extract it into a column in  a select 
statement, but it is working in oracle 12C and above versions , lower versions are not supported */