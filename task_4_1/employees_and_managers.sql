select a.Name Employee
from Employee a
    join Employee b
where a.ManagerId = b.Id
    and a.Salary > b.Salary