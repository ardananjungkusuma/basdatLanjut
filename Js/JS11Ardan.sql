
--1
SELECT
	name ,
	database_id,
	create_date
	
FROM
     sys.databases

--2

--3

--4

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