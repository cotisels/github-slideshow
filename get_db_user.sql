set pagesize 0
set echo off
set feedback off 
set pause off
set linesize 40
set heading off
set trimspool on
set verify OFF
set serveroutput on

WHENEVER SQLERROR EXIT 1

select owner from (
select distinct owner,created
from all_objects 
where owner in (select owner from all_tables where table_name = 'APPLICATION') order by created ) 
where rownum=1;

exit
