
--1
 SELECT
	name ,
	database_id,
	create_date
FROM
	sys.databases
	--2

--3
 SELECT
	st.object_id,
	st.name,
	ss.name,
	st.type,
	st.type_desc,
	st.create_date,
	st.modify_date
FROM
	sys.tables as st
LEFT JOIN sys.schemas ss on
	st.schema_id = ss.schema_id;

	--4
SELECT COLUMN_NAME,DATA_TYPE,COLLATION_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='Sales.Customers'; --belum

	--5
	--6
	--7
	--8
	--9
	--10

--11
 SELECT
	total_physical_memory_kb as TotalRam,
	available_physical_memory_kb as Total_Available_RAM,
	total_page_file_kb as Total_Page_File_Gb,
	available_page_file_kb as Available_Page_File,
	system_memory_state_desc as RAM_Availability_Status
FROM
	sys.dm_os_sys_memory;