select NationalIdNumber,loginid,jobtitle
from HumanResources.Employee

select title,firstname,lastname
from person.person
where title = 'Ms.'

select title,firstname,lastname
from person.person
where title = 'Ms.'
and LastName = 'Antrim'



select businessentityId as employeeid,
	VacationHours+sickleavehours as availabletimeoff
	from HumanResources.Employee


select title,firstname,lastname from person.person
where not (title='Ms.' or title = 'Mrs.');

select productid,name,weight from Production.Product
where Weight is null

select productid,name,weight from Production.Product
where Weight is not null



select p.productid,p.name,p.color
from Production.Product p
where p.Color is not null
order by case p.color when 'Red' then null else p.Color end;



--Pagination

select	ProductId,Name
from Production.Product
order by Name
offset 0 Rows Fetch next 10 rows only;


--DECLARING VARIABLES

DECLARE @ADDRESSLINE nvarchar(60) = 'heiderplatz';
select addressid,addressline1
from person.Address
where AddressLine1 like '%' + @addressline + '%'


/*DECLARE @ADDRESSLINE1 NVARCHAR(60);
DECLARE @ADDRESSLINE2 NVARCHAR(60);

SELECT @ADDRESSLINE1 = ADDRESSLINE1 
,@ADDRESSLINE2 = ADDRESSLINE2
FROM PERSON.Address
WHERE AddressID = 66;
SELECT @ADDRESSLINE1 DIRECCION1, @ADDRESSLINE2 DIRECCION2;
*/

DECLARE @ADDRESSLINE1 NVARCHAR(60)= '101 E.Varnum'
declare  @ADDRESSLINE2 NVARCHAR(60) = 'aMBULANCE DESK'

select @ADDRESSLINE1 = ADDRESSLINE1 ,
@ADDRESSLINE2 = addressline2
from person.Address
where Addressid = 49862

if @@ROWCOUNT =1
select @ADDRESSLINE1 , @ADDRESSLINE2
else 
	select 'Either no rows or too many rows found';





	declare @QuerySelector int = 1;
	if @QuerySelector = 1
	begin 
	select top 3 ProductId,Name,color
	from  Production.Product
	where color = 'Silver'
	order by name
	end 
	else
	begin 
	select top 3 productId,name,color
	from Production.Product
	where color = 'Black'
	order by name
	end 



SELECT DepartmentID AS DeptID, Name, GroupName,
 CASE GroupName
 WHEN 'Research and Development' THEN 'Room A'
 WHEN 'Sales and Marketing' THEN 'Room B'
 WHEN 'Manufacturing' THEN 'Room C'
 ELSE 'Room D'
 END AS ConfRoom
FROM HumanResources.Department


select departmentid,name,
case 
when name = 'Research and Development' then 'Room A'
when (Name = 'Sales And Marketing' or DepartmentId = 10) then 'Room B'
when Name Like 'T%' then 'Room C'
ELSE 'ROOM D' END AS CONFERENCEROOM 
from
HumanResources.Department