select Department.Name as "Department",
    Employee.Name as "Employee",
    Employee.Salary as "Salary"
from Employee
    join Department on Department.Id = Employee.DepartmentId
where (Employee.DepartmentId, Salary) in (
        select DepartmentId,
            max(Salary)
        from Employee
        group by DepartmentId
    )