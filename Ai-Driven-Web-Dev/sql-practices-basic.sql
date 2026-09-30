{
    "type": "MySQLNotebook",
    "version": "1.0",
    "caption": "DB Notebook",
    "content": "\\about\n\nCREATE DATABASE db;\nCREATE TABLE db.Employees (\n\n    EmployeeID INT PRIMARY KEY,\n    FirstName VARCHAR(50),\n    LastName VARCHAR(50),\n    Department VARCHAR(50),\n    Salary DECIMAL(10, 2)\n\n);\nINSERT INTO db.Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES\n\n(1, 'John', 'Doe', 'HR', 55000.00),\n(2, 'Jane', 'Smith', 'IT', 75000.00),\n(3, 'Emily', 'Jones', 'Finance', 65000.00),\n(4, 'Michael', 'Brown', 'IT', 80000.00),\n(5, 'Sarah', 'Davis', 'HR', 60000.00),\n(6, 'David', 'Wilson', 'Finance', 70000.00),\n(7, 'Laura', 'Garcia', 'IT', 72000.00),\n(8, 'Robert', 'Miller', 'HR', 58000.00),\n(9, 'Sophia', 'Martinez', 'Finance', 67000.00),\n(10, 'James', 'Anderson', 'IT', 81000.00);\nSELECT * from db.employees limit 5;\n\nCREATE TABLE db.Customers (\nCustomerID int primary key,\nCustomerName VARCHAR(50),\nCountry VARCHAR(50)\n);\nINSERT INTO db.Customers (CustomerID, CustomerName, Country)\nVALUES\n(1, 'Alice', 'USA'),\n(2, 'Bob', 'UK'),\n(3, 'Charlie', 'Canada'),\n(4, 'David', 'USA'),\n(5, 'Eve', 'Australia');\n-- Create the Orders table\nCREATE TABLE db.Orders(\nOrderID INT PRIMARY KEY,\nCustomerID INT,\nOrderDate DATE,\nProductID INT,\nFOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)\n);\nINSERT INTO db.Orders (OrderID, CustomerID, OrderDate, ProductID)\nVALUES\n(101, 1, '2024-08-01', 1001),\n(102, 1, '2024-08-03', 1002),\n(103, 2, '2024-08-04', 1001),\n(104, 3, '2024-08-05', 1003),\n(105, 5, '2024-08-06', 1004);\nCREATE TABLE db.Products (\nProductID INT PRIMARY KEY,\nProductName VARCHAR(50),\nPrice DECIMAL(10, 2)\n);\nINSERT INTO db.Products (ProductID, ProductName, Price)\nVALUES\n(1001, 'Laptop', 1000),\n(1002, 'Smartphone', 700),\n(1003, 'Tablet', 500),\n(1004, 'Headphones', 200),\n(1005, 'Smartwatch', 300);\nSELECT * from db.products limit 3;\nSELECT * from db.customers limit 4;\nSELECT * FROM db.Employees;\n\n-- 2. How do you select only the FirstName and LastName columns from the Employees table?\nSELECT firstname,lastname from db.Employees limit 2;\n\n-- 3. How do you find all employees who work in the 'IT' department?\nSELECT * from db.employees LIMIT 2;\nSELECT firstname,lastname, Department from db.employees\nwhere Department = 'it'\norder by FirstName asc;\n;\n-- 4. How do you select employees with a salary greater than 70000?\nselect * from db.employees\nwhere Salary>70000\nORDER BY Salary DESC;\n\n-- 5. How do you sort the results by the last name in ascending order?   \nselect * from db.products;\nSELECT * from db.products\nORDER BY ProductName asc;\n-- 6. How do you select distinct departments from the Employees table?   \nselect DISTINCT department from db.employees;\n-- 7. How do you count the number of employees in each department?   \nSELECT EmployeeID, FirstName, COUNT(FirstName) \nFROM db.employees \nGROUP BY EmployeeID, FirstName;\n-- 8. How do you find the maximum salary in the Employees table?   \nselect firstname, max(salary)\nfrom  db.employees\ngroup by firstname\n;\n-- 9. How do you find the average salary of employees in the 'Finance' department?   \nSELECT firstname, AVG(salary) as avgsalary\nFROM db.employees\nGROUP by firstname\nORDER BY avgsalary DESC;\n-- 9. How do you find the average salary of employees in the 'Finance' department?   \nSELECT firstname,department, AVG(salary) as avgsalary\nFROM db.employees\nWHERE department = 'finance'\nGROUP by firstname;\n-- 10. How do you select employees whose name starts with 'M'?   \nSELECT * from db.employees\nwhere FirstName like 'M%';\n-- 11. How do you select employees who work in the 'IT' department and have a salary greater than 75000?\nSELECT firstname, salary, Department FROM db.employees\nWHERE department = 'it' and salary > 75000;\n-- 12. How do you find employees who work in the 'HR' department or have a salary less than 60000?\nSELECT firstname, salary, Department FROM db.employees\nWHERE department = 'HR' and salary < 60000;\n-- 13. How do you select employees who do not work in the 'Finance' department?\nSELECT firstname,department from db.employees\nWHERE Department !='Finance'\nORDER BY  department;\n-- 14. How do you find employees whose salary is between 60000 and 70000 and who work in the 'Finance' department?\nSELECT FirstName, salary, department from db.employees\nWHERE Department = 'finance' and Salary BETWEEN 60000 and 70000;\n\n\n-- 15. How do you find the employees who work in the 'IT' department and do not have a salary greater than 80000?\nSELECT FirstName, salary, department from db.employees\nWHERE Department = 'it' and Salary <= 80000;\n-- 16. How do you find employees who work in the 'HR' or 'Finance' departments and have a salary greater than 65000?\nSELECT FirstName, salary, department from db.employees\nWHERE Department = ('it' or 'hr') and Salary >= 65000;\n-- 17. How do you select employees whose last name starts with 'D' and do not work in the 'HR' department?\nselect lastname from db.employees\nWHERE lastname like 'D%' and Department <> 'hr';\n-- 18. How do you find employees who do not work in the 'IT' department and have a salary greater than 70000?\nSELECT firstname from db.employees\nWHERE Department not in ('it') and Salary > 70000;\nSELECT* from employees;\n-- 19. How do you select employees who do not work in the 'IT' department and either have a salary greater than 75000 or have the first name 'Subena'?\nSELECT firstname, salary from db.employees\nWHERE Department not in ('it') and (salary > 7500 or firstname ='subena');\n\n-- 20. How do you find employees who do not work in the 'HR' or 'IT' department?\nSELECT firstname, department from db.employees\nwhere Department not in ('hr' , 'it');\n-- 21. Write a SQL query to find the names of customers who have placed an order.\nSELECT * FROM customers;\nselect customername, orderid  from customers\njoin orders on customers.customerid = orders.customerid;\n-- 22. Find the list of customers who have not placed any orders.\nselect * from db.employees;\n-- employees টেবিল থেকে এমন কর্মীদের নাম (firstname) ও বেতন (salary) বের করুন, যাদের বেতন কোম্পানির গড় বেতনের (Average Salary) চেয়ে বেশি।\nSELECT firstname,salary from db.employees;\nselect firstname, salary from db.employees\nwhere salary > (select AVG(salary) from db.employees)\nORDER BY salary DESC;\n\nSELECT AVG(salary) from db.employees;\n-- employees টেবিল থেকে সবচেয়ে কম বেতন পাওয়া কর্মচারীর নাম (firstname) এবং বেতন বের করুন।\nselect * from db.employees limit 2;\nselect firstname, salary from db.employees\nwhere salary = (select MIN(salary) from db.employees)\nORDER BY salary DESC;\nSELECT  min(salary) from db.employees;\n-- প্রশ্ন ৩: customers টেবিল থেকে এমন কাস্টমারদের নাম (customer_name) বের করুন, যারা কমপক্ষে একটি অর্ডার করেছে (অর্থাৎ যাদের customer_id orders টেবিলে আছে)।\nSELECT * from db.orders limit 2;\nselect * from db.customers;\nSELECT customername, customerid from db.customers\nWHERE customerid in (select customerid from db.orders);\nSELECT * from db.orders;\n-- Question 4: Retrieve the customer_name of customers who have never placed any order (i.e., their customer_id does not exist in the orders table).\nSELECT customername, customerid from db.customers\nWHERE CustomerID not in(select CustomerID from db.orders);\n-- Find the firstname and salary of employees whose salary is higher than the average salary of the 'HR' department.\nSELECT firstname,salary from db.employees\nWHERE Salary > (select  AVG(salary) from db.employees  where  department = 'hr');\nSELECT * from db.employees;\nSELECT avg(salary) from db.employees;\nSELECT * FROM db.employees LIMIT 2;\nSELECT firstname from db.employees LIMIT 3;\nSELECT firstname,department,salary,\nROW_NUMBER() OVER (partition BY department ORDER BY salary desc) as ro_no\nfrom db.employees;\n-- Write a SQL query to rank all employees across the entire company based on their salary from highest to lowest. Display firstname, department, salary, and the generated rank as salary_rank\n\nSELECT firstname,department,salary,\nRANK() OVER (ORDER BY salary desc) as ranking\nFROM db.employees;\nSELECT firstname,department,salary,\nRANK() OVER (ORDER BY salary desc) as ranking,\nDENSE_RANK() OVER (ORDER BY salary desc) as dens_ranking\nFROM db.employees;\nSELECT * FROM db.employees limit 1;\nDESCRIBE db.employees;\nSELECT COUNT(employeeid) FROM db.employees;\nINSERT INTO db.Employees (EmployeeID, FirstName, LastName, Department, Salary)\nVALUES \n    (11, 'Rahim', 'Uddin', 'HR', 75000),\n    (12, 'Sumona', 'Khan', 'HR', 75000),\n    (13, 'Tanvir', 'Ahmed', 'IT', 60000),\n    (14, 'Karim', 'Chowdhury', 'IT', 60000),\n    (15, 'Ayesha', 'Siddiqua', 'IT', 60000),\n    (16, 'Farhan', 'Hossain', 'Sales', 50000),\n    (17, 'Nusrat', 'Jahan', 'Sales', 45000);\nSELECT * from db.employees;\nSELECT firstname,department,salary,\nRANK() OVER (ORDER BY salary desc) as ranking,\nDENSE_RANK() OVER (ORDER BY salary desc) as dens_ranking\nFROM db.employees;\nSELECT * from db.employees limit 3;\nSELECT Department,salary,\nLAG(salary,1,0) OVER(order by department ) as salary\nfrom db.employees;\nSELECT Department,salary,\nLEAD(salary) OVER(order by department ) as salary\nfrom db.employees;",
    "options": {
        "tabSize": 4,
        "indentSize": 4,
        "insertSpaces": true,
        "defaultEOL": "LF",
        "trimAutoWhitespace": true
    },
    "viewState": {
        "cursorState": [
            {
                "inSelectionMode": false,
                "selectionStart": {
                    "lineNumber": 217,
                    "column": 19
                },
                "position": {
                    "lineNumber": 217,
                    "column": 19
                }
            }
        ],
        "viewState": {
            "scrollLeft": 0,
            "firstPosition": {
                "lineNumber": 212,
                "column": 1
            },
            "firstPositionDeltaTop": 27
        },
        "contributionsState": {
            "editor.contrib.folding": {},
            "editor.contrib.wordHighlighter": false
        }
    },
    "contexts": [
        {
            "state": {
                "start": 1,
                "end": 1,
                "language": "mysql",
                "result": {
                    "type": "text",
                    "text": [
                        {
                            "type": 2,
                            "content": "Welcome to the MySQL Shell - DB Notebook.\n\nPress Ctrl+Enter to execute the code block.\n\nExecute \\sql to switch to SQL, \\js to JavaScript and \\ts to TypeScript mode.\nExecute \\help or \\? for help;Welcome to the MySQL Shell - DB Notebook.\n\nPress Ctrl+Enter to execute the code block.\n\nExecute \\sql to switch to SQL, \\js to JavaScript and \\ts to TypeScript mode.\nExecute \\help or \\? for help;",
                            "language": "ansi"
                        }
                    ]
                },
                "currentHeight": 28,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 6
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 2,
                "end": 3,
                "language": "mysql",
                "result": {
                    "type": "text",
                    "text": [
                        {
                            "type": 2,
                            "index": 0,
                            "resultId": "75cab604-3c22-469d-f9fd-9ef8e42e7514",
                            "content": "OK, 1 row affected in 15.059ms"
                        }
                    ]
                },
                "currentHeight": 28,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 20
                        },
                        "contentStart": 1,
                        "state": 0
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 4,
                "end": 12,
                "language": "mysql",
                "result": {
                    "type": "text",
                    "text": [
                        {
                            "type": 2,
                            "index": 0,
                            "resultId": "77f97e70-53c3-47ee-dbb5-8b2cd975adb8",
                            "content": "OK, 0 records retrieved in 74.776ms"
                        }
                    ]
                },
                "currentHeight": 28,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 171
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 13,
                "end": 24,
                "language": "mysql",
                "result": {
                    "type": "text",
                    "text": [
                        {
                            "type": 2,
                            "index": 0,
                            "resultId": "8b8620d3-faa4-4b7b-f15e-620ec7a51d03",
                            "content": "OK, 10 rows affected in 31.597ms"
                        }
                    ]
                },
                "currentHeight": 28,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 501
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 25,
                "end": 25,
                "language": "mysql",
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 35
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 26,
                "end": 31,
                "language": "mysql",
                "result": {
                    "type": "text",
                    "text": [
                        {
                            "type": 2,
                            "index": 0,
                            "resultId": "7c367131-063f-419d-c0c1-956eaceb9399",
                            "content": "OK, 0 records retrieved in 77.652ms"
                        }
                    ]
                },
                "currentHeight": 28,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 105
                        },
                        "contentStart": 1,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 105,
                            "length": 0
                        },
                        "contentStart": 104,
                        "state": 3
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 32,
                "end": 38,
                "language": "mysql",
                "result": {
                    "type": "text",
                    "text": [
                        {
                            "type": 2,
                            "index": 0,
                            "resultId": "f2986070-d178-4662-c0aa-43822274e3f1",
                            "content": "OK, 5 rows affected in 32.401ms"
                        }
                    ]
                },
                "currentHeight": 28,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 178
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 39,
                "end": 46,
                "language": "mysql",
                "result": {
                    "type": "text",
                    "text": [
                        {
                            "type": 2,
                            "index": 0,
                            "resultId": "2ba00c92-a1b2-43e4-8dcc-b7f2022c2482",
                            "content": "OK, 0 records retrieved in 104.342ms"
                        }
                    ]
                },
                "currentHeight": 28,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 183
                        },
                        "contentStart": 27,
                        "state": 0
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 47,
                "end": 53,
                "language": "mysql",
                "result": {
                    "type": "text",
                    "text": [
                        {
                            "type": 2,
                            "index": 0,
                            "resultId": "a9950bba-dd2a-4ec0-e415-27c5749b6633",
                            "content": "OK, 5 rows affected in 10.751ms"
                        }
                    ]
                },
                "currentHeight": 28,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 222
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 54,
                "end": 58,
                "language": "mysql",
                "result": {
                    "type": "text",
                    "text": [
                        {
                            "type": 2,
                            "index": 0,
                            "resultId": "4fba98d2-c67f-4d1f-e181-458f2373ef99",
                            "content": "OK, 0 records retrieved in 74.407ms"
                        }
                    ]
                },
                "currentHeight": 28,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 102
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 59,
                "end": 65,
                "language": "mysql",
                "result": {
                    "type": "text",
                    "text": [
                        {
                            "type": 2,
                            "index": 0,
                            "resultId": "e9a25c29-3839-4577-ac20-81169948aebe",
                            "content": "OK, 5 rows affected in 36.367ms"
                        }
                    ]
                },
                "currentHeight": 28,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 190
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 66,
                "end": 66,
                "language": "mysql",
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 34
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 67,
                "end": 67,
                "language": "mysql",
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 35
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 68,
                "end": 68,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "c83259ce-00c2-4c05-8dfe-be0371bd4d64"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 27
                        },
                        "contentStart": 0,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 27,
                            "length": 4
                        },
                        "contentStart": 26,
                        "state": 3
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "c83259ce-00c2-4c05-8dfe-be0371bd4d64",
                    "rows": [
                        {
                            "0": 1,
                            "1": "John",
                            "2": "Doe",
                            "3": "HR",
                            "4": "55000.00"
                        },
                        {
                            "0": 2,
                            "1": "Jane",
                            "2": "Smith",
                            "3": "IT",
                            "4": "75000.00"
                        },
                        {
                            "0": 3,
                            "1": "Emily",
                            "2": "Jones",
                            "3": "Finance",
                            "4": "65000.00"
                        },
                        {
                            "0": 4,
                            "1": "Michael",
                            "2": "Brown",
                            "3": "IT",
                            "4": "80000.00"
                        },
                        {
                            "0": 5,
                            "1": "Sarah",
                            "2": "Davis",
                            "3": "HR",
                            "4": "60000.00"
                        },
                        {
                            "0": 6,
                            "1": "David",
                            "2": "Wilson",
                            "3": "Finance",
                            "4": "70000.00"
                        },
                        {
                            "0": 7,
                            "1": "Laura",
                            "2": "Garcia",
                            "3": "IT",
                            "4": "72000.00"
                        },
                        {
                            "0": 8,
                            "1": "Robert",
                            "2": "Miller",
                            "3": "HR",
                            "4": "58000.00"
                        },
                        {
                            "0": 9,
                            "1": "Sophia",
                            "2": "Martinez",
                            "3": "Finance",
                            "4": "67000.00"
                        },
                        {
                            "0": 10,
                            "1": "James",
                            "2": "Anderson",
                            "3": "IT",
                            "4": "81000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "EmployeeID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "FirstName",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "LastName",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Department",
                            "field": "3",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Salary",
                            "field": "4",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 10 records retrieved in 1.956ms"
                    },
                    "totalRowCount": 10,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "/* \n1.How do you select all columns from the Employees table?\n2. How do you select only the FirstName and LastName columns from the Employees table?\n3. How do you find all employees who work in the 'IT' department?\n4. How do you select employees with a salary greater than 70000?\n5. How do you sort the results by the last name in ascending order?   \n6. How do you select distinct departments from the Employees table?   \n7. How do you count the number of employees in each department?   \n8. How do you find the maximum salary in the Employees table?   \n9. How do you find the average salary of employees in the 'Finance' department?   \n10. How do you select employees whose name starts with 'M'?   \n11. How do you select employees who work in the 'IT' department and have a salary greater than 75000?\n12. How do you find employees who work in the 'HR' department or have a salary less than 60000?\n13. How do you select employees who do not work in the 'Finance' department?\n14. How do you find employees whose salary is between 60000 and 70000 and who work in the 'Finance' department?\n15. How do you find the employees who work in the 'IT' department and do not have a salary greater than 80000?\n16. How do you find employees who work in the 'HR' or 'Finance' departments and have a salary greater than 65000?\n17. How do you select employees whose last name starts with 'D' and do not work in the 'HR' department?\n18. How do you find employees who do not work in the 'IT' department and have a salary greater than 70000?\n19. How do you select employees who do not work in the 'IT' department and either have a salary greater than 75000 or have the first name 'Subena'?\n20. How do you find employees who do not work in the 'HR' or 'IT' department?\n21. Write a SQL query to find the names of customers who have placed an order.\n22. Find the list of customers who have not placed any orders.\n23. ist all orders along with the product name and price.\n24. Find the names of customers and their orders, including customers who have not placed any order.\n25. Retrieve a list of products that have never been ordered.\n26. Find the total number of orders placed by each customer.\n27. Display the customers, the products they have ordered, and the order date. Include customers who have not placed any orders.\n28. Identify pairs of customers who live in the same country.\n29. Find the customer who has spent the most on their orders.\n30. Find customers who have ordered more than one type of product.\n31. List all the products and their corresponding orders using a RIGHT JOIN, including products that have not been ordered.\n32. Find the name of customers who have ordered a product priced above $500.\n33. Find customers who have ordered the same product more than once. \n*/\nSELECT * FROM db.Employees",
                    "updatable": true,
                    "fullTableName": "db.Employees"
                }
            ]
        },
        {
            "state": {
                "start": 70,
                "end": 70,
                "language": "mysql",
                "result": {
                    "type": "text",
                    "text": [
                        {
                            "type": 2,
                            "index": 0,
                            "resultId": "d4b83448-ddd9-4811-9770-0484fffe21c5",
                            "content": "OK, 0 records retrieved in 0.887ms"
                        }
                    ]
                },
                "currentHeight": 28,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 89
                        },
                        "contentStart": 0,
                        "state": 1
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 71,
                "end": 71,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "07ba1bc4-bb7c-4dd6-b0db-ef755476ac9d"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 52
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "07ba1bc4-bb7c-4dd6-b0db-ef755476ac9d",
                    "rows": [
                        {
                            "0": "John",
                            "1": "Doe"
                        },
                        {
                            "0": "Jane",
                            "1": "Smith"
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "lastname",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 2 records retrieved in 0.594ms"
                    },
                    "totalRowCount": 2,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT firstname,lastname from db.Employees limit 2",
                    "updatable": false,
                    "fullTableName": "db.Employees"
                }
            ]
        },
        {
            "state": {
                "start": 73,
                "end": 74,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "8d449ca2-ba87-4daf-d530-479cb5cfe07b"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 104
                        },
                        "contentStart": 69,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "8d449ca2-ba87-4daf-d530-479cb5cfe07b",
                    "rows": [
                        {
                            "0": 1,
                            "1": "John",
                            "2": "Doe",
                            "3": "HR",
                            "4": "55000.00"
                        },
                        {
                            "0": 2,
                            "1": "Jane",
                            "2": "Smith",
                            "3": "IT",
                            "4": "75000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "EmployeeID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "FirstName",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "LastName",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Department",
                            "field": "3",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Salary",
                            "field": "4",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 2 records retrieved in 0.686ms"
                    },
                    "totalRowCount": 2,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 3. How do you find all employees who work in the 'IT' department?\nSELECT * from db.employees LIMIT 2",
                    "updatable": true,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 75,
                "end": 78,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "5eedb7e4-ec12-4514-bfb2-c708688b012e"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 103
                        },
                        "contentStart": 0,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 103,
                            "length": 2
                        },
                        "contentStart": 103,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "5eedb7e4-ec12-4514-bfb2-c708688b012e",
                    "rows": [
                        {
                            "0": "James",
                            "1": "Anderson",
                            "2": "IT"
                        },
                        {
                            "0": "Jane",
                            "1": "Smith",
                            "2": "IT"
                        },
                        {
                            "0": "Laura",
                            "1": "Garcia",
                            "2": "IT"
                        },
                        {
                            "0": "Michael",
                            "1": "Brown",
                            "2": "IT"
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "lastname",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Department",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 4 records retrieved in 0.85ms"
                    },
                    "totalRowCount": 4,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT firstname,lastname, Department from db.employees\nwhere Department = 'it'\norder by FirstName asc",
                    "updatable": false,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 79,
                "end": 83,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "06b55465-3409-4984-efb3-5734271ace1e"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 135
                        },
                        "contentStart": 68,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 135,
                            "length": 1
                        },
                        "contentStart": 134,
                        "state": 3
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "06b55465-3409-4984-efb3-5734271ace1e",
                    "rows": [
                        {
                            "0": 10,
                            "1": "James",
                            "2": "Anderson",
                            "3": "IT",
                            "4": "81000.00"
                        },
                        {
                            "0": 4,
                            "1": "Michael",
                            "2": "Brown",
                            "3": "IT",
                            "4": "80000.00"
                        },
                        {
                            "0": 2,
                            "1": "Jane",
                            "2": "Smith",
                            "3": "IT",
                            "4": "75000.00"
                        },
                        {
                            "0": 7,
                            "1": "Laura",
                            "2": "Garcia",
                            "3": "IT",
                            "4": "72000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "EmployeeID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "FirstName",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "LastName",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Department",
                            "field": "3",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Salary",
                            "field": "4",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 4 records retrieved in 0.952ms"
                    },
                    "totalRowCount": 4,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 4. How do you select employees with a salary greater than 70000?\nselect * from db.employees\nwhere Salary>70000\nORDER BY Salary DESC",
                    "updatable": true,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 84,
                "end": 85,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "339d9ba9-1072-4588-bbd7-e036c678e901"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 100
                        },
                        "contentStart": 74,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "339d9ba9-1072-4588-bbd7-e036c678e901",
                    "rows": [
                        {
                            "0": 1001,
                            "1": "Laptop",
                            "2": "1000.00"
                        },
                        {
                            "0": 1002,
                            "1": "Smartphone",
                            "2": "700.00"
                        },
                        {
                            "0": 1003,
                            "1": "Tablet",
                            "2": "500.00"
                        },
                        {
                            "0": 1004,
                            "1": "Headphones",
                            "2": "200.00"
                        },
                        {
                            "0": 1005,
                            "1": "Smartwatch",
                            "2": "300.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "ProductID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "ProductName",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Price",
                            "field": "2",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 5 records retrieved in 0.874ms"
                    },
                    "totalRowCount": 5,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 5. How do you sort the results by the last name in ascending order?   \nselect * from db.products",
                    "updatable": true,
                    "fullTableName": "db.products"
                }
            ]
        },
        {
            "state": {
                "start": 86,
                "end": 87,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "86edc779-c927-4017-e9d8-77fad1a2bae1"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 51
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "86edc779-c927-4017-e9d8-77fad1a2bae1",
                    "rows": [
                        {
                            "0": 1004,
                            "1": "Headphones",
                            "2": "200.00"
                        },
                        {
                            "0": 1001,
                            "1": "Laptop",
                            "2": "1000.00"
                        },
                        {
                            "0": 1002,
                            "1": "Smartphone",
                            "2": "700.00"
                        },
                        {
                            "0": 1005,
                            "1": "Smartwatch",
                            "2": "300.00"
                        },
                        {
                            "0": 1003,
                            "1": "Tablet",
                            "2": "500.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "ProductID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "ProductName",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Price",
                            "field": "2",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 5 records retrieved in 0.837ms"
                    },
                    "totalRowCount": 5,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT * from db.products\nORDER BY ProductName asc",
                    "updatable": true,
                    "fullTableName": "db.products"
                }
            ]
        },
        {
            "state": {
                "start": 88,
                "end": 89,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "e0426bee-53f6-4552-bc80-0dd5c663a46d"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 119
                        },
                        "contentStart": 74,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 119,
                            "length": 0
                        },
                        "contentStart": 118,
                        "state": 3
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "e0426bee-53f6-4552-bc80-0dd5c663a46d",
                    "rows": [
                        {
                            "0": "HR"
                        },
                        {
                            "0": "IT"
                        },
                        {
                            "0": "Finance"
                        }
                    ],
                    "columns": [
                        {
                            "title": "department",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 3 records retrieved in 0.6ms"
                    },
                    "totalRowCount": 3,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 6. How do you select distinct departments from the Employees table?   \nselect DISTINCT department from db.employees",
                    "updatable": false,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 90,
                "end": 93,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "400e05a9-4f64-4573-f0a8-ef394c28decd"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 168
                        },
                        "contentStart": 70,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "400e05a9-4f64-4573-f0a8-ef394c28decd",
                    "rows": [
                        {
                            "0": 1,
                            "1": "John",
                            "2": 1
                        },
                        {
                            "0": 2,
                            "1": "Jane",
                            "2": 1
                        },
                        {
                            "0": 3,
                            "1": "Emily",
                            "2": 1
                        },
                        {
                            "0": 4,
                            "1": "Michael",
                            "2": 1
                        },
                        {
                            "0": 5,
                            "1": "Sarah",
                            "2": 1
                        },
                        {
                            "0": 6,
                            "1": "David",
                            "2": 1
                        },
                        {
                            "0": 7,
                            "1": "Laura",
                            "2": 1
                        },
                        {
                            "0": 8,
                            "1": "Robert",
                            "2": 1
                        },
                        {
                            "0": 9,
                            "1": "Sophia",
                            "2": 1
                        },
                        {
                            "0": 10,
                            "1": "James",
                            "2": 1
                        }
                    ],
                    "columns": [
                        {
                            "title": "EmployeeID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "FirstName",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "COUNT(FirstName)",
                            "field": "2",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 10 records retrieved in 0.748ms"
                    },
                    "totalRowCount": 10,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 7. How do you count the number of employees in each department?   \nSELECT EmployeeID, FirstName, COUNT(FirstName) \nFROM db.employees \nGROUP BY EmployeeID, FirstName",
                    "updatable": false,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 94,
                "end": 98,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "42650dd7-bdd4-4b84-ac86-0122327feb4e"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 137
                        },
                        "contentStart": 68,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "42650dd7-bdd4-4b84-ac86-0122327feb4e",
                    "rows": [
                        {
                            "0": "John",
                            "1": "55000.00"
                        },
                        {
                            "0": "Jane",
                            "1": "75000.00"
                        },
                        {
                            "0": "Emily",
                            "1": "65000.00"
                        },
                        {
                            "0": "Michael",
                            "1": "80000.00"
                        },
                        {
                            "0": "Sarah",
                            "1": "60000.00"
                        },
                        {
                            "0": "David",
                            "1": "70000.00"
                        },
                        {
                            "0": "Laura",
                            "1": "72000.00"
                        },
                        {
                            "0": "Robert",
                            "1": "58000.00"
                        },
                        {
                            "0": "Sophia",
                            "1": "67000.00"
                        },
                        {
                            "0": "James",
                            "1": "81000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "max(salary)",
                            "field": "1",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 10 records retrieved in 0.671ms"
                    },
                    "totalRowCount": 10,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 8. How do you find the maximum salary in the Employees table?   \nselect firstname, max(salary)\nfrom  db.employees\ngroup by firstname\n",
                    "updatable": false,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 99,
                "end": 103,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "975c28b0-7543-4020-c467-bca5ddde89b9"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 190
                        },
                        "contentStart": 86,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "975c28b0-7543-4020-c467-bca5ddde89b9",
                    "rows": [
                        {
                            "0": "James",
                            "1": "81000.000000"
                        },
                        {
                            "0": "Michael",
                            "1": "80000.000000"
                        },
                        {
                            "0": "Jane",
                            "1": "75000.000000"
                        },
                        {
                            "0": "Laura",
                            "1": "72000.000000"
                        },
                        {
                            "0": "David",
                            "1": "70000.000000"
                        },
                        {
                            "0": "Sophia",
                            "1": "67000.000000"
                        },
                        {
                            "0": "Emily",
                            "1": "65000.000000"
                        },
                        {
                            "0": "Sarah",
                            "1": "60000.000000"
                        },
                        {
                            "0": "Robert",
                            "1": "58000.000000"
                        },
                        {
                            "0": "John",
                            "1": "55000.000000"
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "avgsalary",
                            "field": "1",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 10 records retrieved in 1.518ms"
                    },
                    "totalRowCount": 10,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 9. How do you find the average salary of employees in the 'Finance' department?   \nSELECT firstname, AVG(salary) as avgsalary\nFROM db.employees\nGROUP by firstname\nORDER BY avgsalary DESC",
                    "updatable": false,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 104,
                "end": 108,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "57884e74-0386-46c9-c6f3-d8091f8a956c"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 206
                        },
                        "contentStart": 86,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "57884e74-0386-46c9-c6f3-d8091f8a956c",
                    "rows": [
                        {
                            "0": "Emily",
                            "1": "Finance",
                            "2": "65000.000000"
                        },
                        {
                            "0": "David",
                            "1": "Finance",
                            "2": "70000.000000"
                        },
                        {
                            "0": "Sophia",
                            "1": "Finance",
                            "2": "67000.000000"
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "department",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "avgsalary",
                            "field": "2",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 3 records retrieved in 0.988ms"
                    },
                    "totalRowCount": 3,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 9. How do you find the average salary of employees in the 'Finance' department?   \nSELECT firstname,department, AVG(salary) as avgsalary\nFROM db.employees\nWHERE department = 'finance'\nGROUP by firstname",
                    "updatable": false,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 109,
                "end": 111,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "2faeaa5a-ad09-46dd-d709-0db08550cd42"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 119
                        },
                        "contentStart": 66,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "2faeaa5a-ad09-46dd-d709-0db08550cd42",
                    "rows": [
                        {
                            "0": 4,
                            "1": "Michael",
                            "2": "Brown",
                            "3": "IT",
                            "4": "80000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "EmployeeID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "FirstName",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "LastName",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Department",
                            "field": "3",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Salary",
                            "field": "4",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 1 record retrieved in 0.798ms"
                    },
                    "totalRowCount": 1,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 10. How do you select employees whose name starts with 'M'?   \nSELECT * from db.employees\nwhere FirstName like 'M%'",
                    "updatable": true,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 112,
                "end": 114,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "fe57e9ce-8612-4374-a47f-8260fb39e93e"
                    ]
                },
                "currentHeight": 122.21875,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 203
                        },
                        "contentStart": 105,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 203,
                            "length": 0
                        },
                        "contentStart": 202,
                        "state": 3
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "fe57e9ce-8612-4374-a47f-8260fb39e93e",
                    "rows": [
                        {
                            "0": "Michael",
                            "1": "80000.00",
                            "2": "IT"
                        },
                        {
                            "0": "James",
                            "1": "81000.00",
                            "2": "IT"
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "salary",
                            "field": "1",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Department",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 2 records retrieved in 0.983ms"
                    },
                    "totalRowCount": 2,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 11. How do you select employees who work in the 'IT' department and have a salary greater than 75000?\nSELECT firstname, salary, Department FROM db.employees\nWHERE department = 'it' and salary > 75000",
                    "updatable": false,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 115,
                "end": 117,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "49ef0e57-f447-440c-ae4d-d6b6a7b19fd3"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 197
                        },
                        "contentStart": 99,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "49ef0e57-f447-440c-ae4d-d6b6a7b19fd3",
                    "rows": [
                        {
                            "0": "John",
                            "1": "55000.00",
                            "2": "HR"
                        },
                        {
                            "0": "Robert",
                            "1": "58000.00",
                            "2": "HR"
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "salary",
                            "field": "1",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Department",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 2 records retrieved in 1.445ms"
                    },
                    "totalRowCount": 2,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 12. How do you find employees who work in the 'HR' department or have a salary less than 60000?\nSELECT firstname, salary, Department FROM db.employees\nWHERE department = 'HR' and salary < 60000",
                    "updatable": false,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 118,
                "end": 121,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "98e71226-111d-480b-f361-eed77933e5f4"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 176
                        },
                        "contentStart": 80,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "98e71226-111d-480b-f361-eed77933e5f4",
                    "rows": [
                        {
                            "0": "John",
                            "1": "HR"
                        },
                        {
                            "0": "Sarah",
                            "1": "HR"
                        },
                        {
                            "0": "Robert",
                            "1": "HR"
                        },
                        {
                            "0": "Jane",
                            "1": "IT"
                        },
                        {
                            "0": "Michael",
                            "1": "IT"
                        },
                        {
                            "0": "Laura",
                            "1": "IT"
                        },
                        {
                            "0": "James",
                            "1": "IT"
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "department",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 7 records retrieved in 0.661ms"
                    },
                    "totalRowCount": 7,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 13. How do you select employees who do not work in the 'Finance' department?\nSELECT firstname,department from db.employees\nWHERE Department !='Finance'\nORDER BY  department",
                    "updatable": false,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 122,
                "end": 126,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "f4baacb5-450e-4f5e-9753-edcaa81b8a31"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 234
                        },
                        "contentStart": 115,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 234,
                            "length": 2
                        },
                        "contentStart": 233,
                        "state": 3
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "f4baacb5-450e-4f5e-9753-edcaa81b8a31",
                    "rows": [
                        {
                            "0": "Emily",
                            "1": "65000.00",
                            "2": "Finance"
                        },
                        {
                            "0": "David",
                            "1": "70000.00",
                            "2": "Finance"
                        },
                        {
                            "0": "Sophia",
                            "1": "67000.00",
                            "2": "Finance"
                        }
                    ],
                    "columns": [
                        {
                            "title": "FirstName",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "salary",
                            "field": "1",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "department",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 3 records retrieved in 1.204ms"
                    },
                    "totalRowCount": 3,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 14. How do you find employees whose salary is between 60000 and 70000 and who work in the 'Finance' department?\nSELECT FirstName, salary, department from db.employees\nWHERE Department = 'finance' and Salary BETWEEN 60000 and 70000",
                    "updatable": false,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 127,
                "end": 129,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "a3e31316-2569-4131-c50e-cffbe74e5e78"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 213
                        },
                        "contentStart": 114,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "a3e31316-2569-4131-c50e-cffbe74e5e78",
                    "rows": [
                        {
                            "0": "Jane",
                            "1": "75000.00",
                            "2": "IT"
                        },
                        {
                            "0": "Michael",
                            "1": "80000.00",
                            "2": "IT"
                        },
                        {
                            "0": "Laura",
                            "1": "72000.00",
                            "2": "IT"
                        }
                    ],
                    "columns": [
                        {
                            "title": "FirstName",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "salary",
                            "field": "1",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "department",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 3 records retrieved in 0.683ms"
                    },
                    "totalRowCount": 3,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 15. How do you find the employees who work in the 'IT' department and do not have a salary greater than 80000?\nSELECT FirstName, salary, department from db.employees\nWHERE Department = 'it' and Salary <= 80000",
                    "updatable": false,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 130,
                "end": 132,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "8af3bbbb-10be-4bd6-8a94-a91ca6053a4b"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 226
                        },
                        "contentStart": 117,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "8af3bbbb-10be-4bd6-8a94-a91ca6053a4b",
                    "rows": [
                        {
                            "0": "Jane",
                            "1": "75000.00",
                            "2": "IT"
                        },
                        {
                            "0": "Emily",
                            "1": "65000.00",
                            "2": "Finance"
                        },
                        {
                            "0": "Michael",
                            "1": "80000.00",
                            "2": "IT"
                        },
                        {
                            "0": "David",
                            "1": "70000.00",
                            "2": "Finance"
                        },
                        {
                            "0": "Laura",
                            "1": "72000.00",
                            "2": "IT"
                        },
                        {
                            "0": "Sophia",
                            "1": "67000.00",
                            "2": "Finance"
                        },
                        {
                            "0": "James",
                            "1": "81000.00",
                            "2": "IT"
                        }
                    ],
                    "columns": [
                        {
                            "title": "FirstName",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "salary",
                            "field": "1",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "department",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 7 records retrieved in 1.664ms"
                    },
                    "totalRowCount": 7,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 16. How do you find employees who work in the 'HR' or 'Finance' departments and have a salary greater than 65000?\nSELECT FirstName, salary, department from db.employees\nWHERE Department = ('it' or 'hr') and Salary >= 65000",
                    "updatable": false,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 133,
                "end": 135,
                "language": "mysql",
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 189
                        },
                        "contentStart": 107,
                        "state": 0
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 136,
                "end": 138,
                "language": "mysql",
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 195
                        },
                        "contentStart": 110,
                        "state": 0
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 139,
                "end": 139,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "6099b99c-cc90-444c-8ebb-442c77711b14"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 23
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "6099b99c-cc90-444c-8ebb-442c77711b14",
                    "rows": [
                        {
                            "0": 1,
                            "1": "John",
                            "2": "Doe",
                            "3": "HR",
                            "4": "55000.00"
                        },
                        {
                            "0": 2,
                            "1": "Jane",
                            "2": "Smith",
                            "3": "IT",
                            "4": "75000.00"
                        },
                        {
                            "0": 3,
                            "1": "Emily",
                            "2": "Jones",
                            "3": "Finance",
                            "4": "65000.00"
                        },
                        {
                            "0": 4,
                            "1": "Michael",
                            "2": "Brown",
                            "3": "IT",
                            "4": "80000.00"
                        },
                        {
                            "0": 5,
                            "1": "Sarah",
                            "2": "Davis",
                            "3": "HR",
                            "4": "60000.00"
                        },
                        {
                            "0": 6,
                            "1": "David",
                            "2": "Wilson",
                            "3": "Finance",
                            "4": "70000.00"
                        },
                        {
                            "0": 7,
                            "1": "Laura",
                            "2": "Garcia",
                            "3": "IT",
                            "4": "72000.00"
                        },
                        {
                            "0": 8,
                            "1": "Robert",
                            "2": "Miller",
                            "3": "HR",
                            "4": "58000.00"
                        },
                        {
                            "0": 9,
                            "1": "Sophia",
                            "2": "Martinez",
                            "3": "Finance",
                            "4": "67000.00"
                        },
                        {
                            "0": 10,
                            "1": "James",
                            "2": "Anderson",
                            "3": "IT",
                            "4": "81000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "EmployeeID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "FirstName",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "LastName",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Department",
                            "field": "3",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Salary",
                            "field": "4",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 10 records retrieved in 0.763ms"
                    },
                    "totalRowCount": 10,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT* from employees",
                    "updatable": true,
                    "fullTableName": "employees"
                }
            ]
        },
        {
            "state": {
                "start": 140,
                "end": 143,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "1ea2fe42-aec4-410b-80da-0ed61a05c243"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 268
                        },
                        "contentStart": 151,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 268,
                            "length": 1
                        },
                        "contentStart": 267,
                        "state": 3
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "1ea2fe42-aec4-410b-80da-0ed61a05c243",
                    "rows": [
                        {
                            "0": "John",
                            "1": "55000.00"
                        },
                        {
                            "0": "Emily",
                            "1": "65000.00"
                        },
                        {
                            "0": "Sarah",
                            "1": "60000.00"
                        },
                        {
                            "0": "David",
                            "1": "70000.00"
                        },
                        {
                            "0": "Robert",
                            "1": "58000.00"
                        },
                        {
                            "0": "Sophia",
                            "1": "67000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "salary",
                            "field": "1",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 6 records retrieved in 0.881ms"
                    },
                    "totalRowCount": 6,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 19. How do you select employees who do not work in the 'IT' department and either have a salary greater than 75000 or have the first name 'Subena'?\nSELECT firstname, salary from db.employees\nWHERE Department not in ('it') and (salary > 7500 or firstname ='subena')",
                    "updatable": false,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 144,
                "end": 146,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "bec8c509-19f1-40a8-bee6-966464d0e847"
                    ]
                },
                "currentHeight": 148.859375,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 166
                        },
                        "contentStart": 81,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "bec8c509-19f1-40a8-bee6-966464d0e847",
                    "rows": [
                        {
                            "0": "Emily",
                            "1": "Finance"
                        },
                        {
                            "0": "David",
                            "1": "Finance"
                        },
                        {
                            "0": "Sophia",
                            "1": "Finance"
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "department",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 3 records retrieved in 0.911ms"
                    },
                    "totalRowCount": 3,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 20. How do you find employees who do not work in the 'HR' or 'IT' department?\nSELECT firstname, department from db.employees\nwhere Department not in ('hr' , 'it')",
                    "updatable": false,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 147,
                "end": 148,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "3f8b82a3-ce45-44d1-a70b-9003b4e8047d"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 106
                        },
                        "contentStart": 82,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "3f8b82a3-ce45-44d1-a70b-9003b4e8047d",
                    "rows": [
                        {
                            "0": 1,
                            "1": "Alice",
                            "2": "USA"
                        },
                        {
                            "0": 2,
                            "1": "Bob",
                            "2": "UK"
                        },
                        {
                            "0": 3,
                            "1": "Charlie",
                            "2": "Canada"
                        },
                        {
                            "0": 4,
                            "1": "David",
                            "2": "USA"
                        },
                        {
                            "0": 5,
                            "1": "Eve",
                            "2": "Australia"
                        }
                    ],
                    "columns": [
                        {
                            "title": "CustomerID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "CustomerName",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Country",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 5 records retrieved in 3.657ms"
                    },
                    "totalRowCount": 5,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 21. Write a SQL query to find the names of customers who have placed an order.\nSELECT * FROM customers",
                    "updatable": true,
                    "fullTableName": "customers"
                }
            ]
        },
        {
            "state": {
                "start": 149,
                "end": 150,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "d59ad664-4a1a-41eb-b034-e60f7580760d"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 101
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "d59ad664-4a1a-41eb-b034-e60f7580760d",
                    "rows": [
                        {
                            "0": "Alice",
                            "1": 101
                        },
                        {
                            "0": "Alice",
                            "1": 102
                        },
                        {
                            "0": "Bob",
                            "1": 103
                        },
                        {
                            "0": "Charlie",
                            "1": 104
                        },
                        {
                            "0": "Eve",
                            "1": 105
                        }
                    ],
                    "columns": [
                        {
                            "title": "customername",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "orderid",
                            "field": "1",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 5 records retrieved in 0.738ms"
                    },
                    "totalRowCount": 5,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "select customername, orderid  from customers\njoin orders on customers.customerid = orders.customerid",
                    "updatable": false,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 151,
                "end": 152,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "4fa61035-3da9-462c-d3d5-569c2eb7193a"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 93
                        },
                        "contentStart": 66,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "4fa61035-3da9-462c-d3d5-569c2eb7193a",
                    "rows": [
                        {
                            "0": 1,
                            "1": "John",
                            "2": "Doe",
                            "3": "HR",
                            "4": "55000.00"
                        },
                        {
                            "0": 2,
                            "1": "Jane",
                            "2": "Smith",
                            "3": "IT",
                            "4": "75000.00"
                        },
                        {
                            "0": 3,
                            "1": "Emily",
                            "2": "Jones",
                            "3": "Finance",
                            "4": "65000.00"
                        },
                        {
                            "0": 4,
                            "1": "Michael",
                            "2": "Brown",
                            "3": "IT",
                            "4": "80000.00"
                        },
                        {
                            "0": 5,
                            "1": "Sarah",
                            "2": "Davis",
                            "3": "HR",
                            "4": "60000.00"
                        },
                        {
                            "0": 6,
                            "1": "David",
                            "2": "Wilson",
                            "3": "Finance",
                            "4": "70000.00"
                        },
                        {
                            "0": 7,
                            "1": "Laura",
                            "2": "Garcia",
                            "3": "IT",
                            "4": "72000.00"
                        },
                        {
                            "0": 8,
                            "1": "Robert",
                            "2": "Miller",
                            "3": "HR",
                            "4": "58000.00"
                        },
                        {
                            "0": 9,
                            "1": "Sophia",
                            "2": "Martinez",
                            "3": "Finance",
                            "4": "67000.00"
                        },
                        {
                            "0": 10,
                            "1": "James",
                            "2": "Anderson",
                            "3": "IT",
                            "4": "81000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "EmployeeID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "FirstName",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "LastName",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Department",
                            "field": "3",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Salary",
                            "field": "4",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 10 records retrieved in 2.687ms"
                    },
                    "totalRowCount": 10,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- 22. Find the list of customers who have not placed any orders.\nselect * from db.employees",
                    "updatable": true,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 153,
                "end": 154,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "438fc9fb-3b37-4b2a-bda9-7ea8dc823c8a"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 180
                        },
                        "contentStart": 138,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "438fc9fb-3b37-4b2a-bda9-7ea8dc823c8a",
                    "rows": [
                        {
                            "0": "John",
                            "1": "55000.00"
                        },
                        {
                            "0": "Jane",
                            "1": "75000.00"
                        },
                        {
                            "0": "Emily",
                            "1": "65000.00"
                        },
                        {
                            "0": "Michael",
                            "1": "80000.00"
                        },
                        {
                            "0": "Sarah",
                            "1": "60000.00"
                        },
                        {
                            "0": "David",
                            "1": "70000.00"
                        },
                        {
                            "0": "Laura",
                            "1": "72000.00"
                        },
                        {
                            "0": "Robert",
                            "1": "58000.00"
                        },
                        {
                            "0": "Sophia",
                            "1": "67000.00"
                        },
                        {
                            "0": "James",
                            "1": "81000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "salary",
                            "field": "1",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 10 records retrieved in 0.589ms"
                    },
                    "totalRowCount": 10,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- employees টেবিল থেকে এমন কর্মীদের নাম (firstname) ও বেতন (salary) বের করুন, যাদের বেতন কোম্পানির গড় বেতনের (Average Salary) চেয়ে বেশি।\nSELECT firstname,salary from db.employees",
                    "updatable": false,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 155,
                "end": 158,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "52516df1-1a65-4f69-9a54-17e9b8d77628"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 118
                        },
                        "contentStart": 0,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 118,
                            "length": 1
                        },
                        "contentStart": 117,
                        "state": 3
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "52516df1-1a65-4f69-9a54-17e9b8d77628",
                    "rows": [
                        {
                            "0": "James",
                            "1": "81000.00"
                        },
                        {
                            "0": "Michael",
                            "1": "80000.00"
                        },
                        {
                            "0": "Jane",
                            "1": "75000.00"
                        },
                        {
                            "0": "Laura",
                            "1": "72000.00"
                        },
                        {
                            "0": "David",
                            "1": "70000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "salary",
                            "field": "1",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 5 records retrieved in 1.322ms"
                    },
                    "totalRowCount": 5,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "select firstname, salary from db.employees\nwhere salary > (select AVG(salary) from db.employees)\nORDER BY salary DESC",
                    "updatable": true,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 159,
                "end": 159,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "9fc680c8-0f69-480e-b91a-061469ec2cec"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 37
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "9fc680c8-0f69-480e-b91a-061469ec2cec",
                    "rows": [
                        {
                            "0": "68300.000000"
                        }
                    ],
                    "columns": [
                        {
                            "title": "AVG(salary)",
                            "field": "0",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 1 record retrieved in 0.59ms"
                    },
                    "totalRowCount": 1,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT AVG(salary) from db.employees",
                    "updatable": false,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 160,
                "end": 161,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "6d3167e3-ee7e-4f05-9c96-e398de077f66"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 125
                        },
                        "contentStart": 90,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "6d3167e3-ee7e-4f05-9c96-e398de077f66",
                    "rows": [
                        {
                            "0": 1,
                            "1": "John",
                            "2": "Doe",
                            "3": "HR",
                            "4": "55000.00"
                        },
                        {
                            "0": 2,
                            "1": "Jane",
                            "2": "Smith",
                            "3": "IT",
                            "4": "75000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "EmployeeID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "FirstName",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "LastName",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Department",
                            "field": "3",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Salary",
                            "field": "4",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 2 records retrieved in 0.961ms"
                    },
                    "totalRowCount": 2,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- employees টেবিল থেকে সবচেয়ে কম বেতন পাওয়া কর্মচারীর নাম (firstname) এবং বেতন বের করুন।\nselect * from db.employees limit 2",
                    "updatable": true,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 162,
                "end": 164,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "b643f6ed-39ac-4606-ec98-a16381af3cb9"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 118
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "b643f6ed-39ac-4606-ec98-a16381af3cb9",
                    "rows": [
                        {
                            "0": "John",
                            "1": "55000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "salary",
                            "field": "1",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 1 record retrieved in 0.93ms"
                    },
                    "totalRowCount": 1,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "select firstname, salary from db.employees\nwhere salary = (select MIN(salary) from db.employees)\nORDER BY salary DESC",
                    "updatable": true,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 165,
                "end": 165,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "9558396f-037b-4f1d-e5c0-d2610edc1b61"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 38
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "9558396f-037b-4f1d-e5c0-d2610edc1b61",
                    "rows": [
                        {
                            "0": "55000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "min(salary)",
                            "field": "0",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 1 record retrieved in 0.639ms"
                    },
                    "totalRowCount": 1,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT  min(salary) from db.employees",
                    "updatable": false,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 166,
                "end": 167,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "42910cef-cfe9-4e4d-d061-0b0c2bb0c25e"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 189
                        },
                        "contentStart": 157,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "42910cef-cfe9-4e4d-d061-0b0c2bb0c25e",
                    "rows": [
                        {
                            "0": 101,
                            "1": 1,
                            "2": "2024-08-01",
                            "3": 1001
                        },
                        {
                            "0": 102,
                            "1": 1,
                            "2": "2024-08-03",
                            "3": 1002
                        }
                    ],
                    "columns": [
                        {
                            "title": "OrderID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "CustomerID",
                            "field": "1",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "OrderDate",
                            "field": "2",
                            "dataType": {
                                "type": 27,
                                "needsQuotes": true
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "ProductID",
                            "field": "3",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 2 records retrieved in 2.59ms"
                    },
                    "totalRowCount": 2,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- প্রশ্ন ৩: customers টেবিল থেকে এমন কাস্টমারদের নাম (customer_name) বের করুন, যারা কমপক্ষে একটি অর্ডার করেছে (অর্থাৎ যাদের customer_id orders টেবিলে আছে)।\nSELECT * from db.orders limit 2",
                    "updatable": true,
                    "fullTableName": "db.orders"
                }
            ]
        },
        {
            "state": {
                "start": 168,
                "end": 168,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "53e25433-504e-4fe5-8039-2354a51d9471"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 27
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "53e25433-504e-4fe5-8039-2354a51d9471",
                    "rows": [
                        {
                            "0": 1,
                            "1": "Alice",
                            "2": "USA"
                        },
                        {
                            "0": 2,
                            "1": "Bob",
                            "2": "UK"
                        },
                        {
                            "0": 3,
                            "1": "Charlie",
                            "2": "Canada"
                        },
                        {
                            "0": 4,
                            "1": "David",
                            "2": "USA"
                        },
                        {
                            "0": 5,
                            "1": "Eve",
                            "2": "Australia"
                        }
                    ],
                    "columns": [
                        {
                            "title": "CustomerID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "CustomerName",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Country",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 5 records retrieved in 3.087ms"
                    },
                    "totalRowCount": 5,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "select * from db.customers",
                    "updatable": true,
                    "fullTableName": "db.customers"
                }
            ]
        },
        {
            "state": {
                "start": 169,
                "end": 170,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "071e01ff-7c21-4dfe-f8ec-910ac59fec15"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 105
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "071e01ff-7c21-4dfe-f8ec-910ac59fec15",
                    "rows": [
                        {
                            "0": "Alice",
                            "1": 1
                        },
                        {
                            "0": "Bob",
                            "1": 2
                        },
                        {
                            "0": "Charlie",
                            "1": 3
                        },
                        {
                            "0": "Eve",
                            "1": 5
                        }
                    ],
                    "columns": [
                        {
                            "title": "customername",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "customerid",
                            "field": "1",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 4 records retrieved in 1.314ms"
                    },
                    "totalRowCount": 4,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT customername, customerid from db.customers\nWHERE customerid in (select customerid from db.orders)",
                    "updatable": true,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 171,
                "end": 171,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "e9cf028f-155a-4bee-ce39-d7dd48a1f7db"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 24
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "e9cf028f-155a-4bee-ce39-d7dd48a1f7db",
                    "rows": [
                        {
                            "0": 101,
                            "1": 1,
                            "2": "2024-08-01",
                            "3": 1001
                        },
                        {
                            "0": 102,
                            "1": 1,
                            "2": "2024-08-03",
                            "3": 1002
                        },
                        {
                            "0": 103,
                            "1": 2,
                            "2": "2024-08-04",
                            "3": 1001
                        },
                        {
                            "0": 104,
                            "1": 3,
                            "2": "2024-08-05",
                            "3": 1003
                        },
                        {
                            "0": 105,
                            "1": 5,
                            "2": "2024-08-06",
                            "3": 1004
                        }
                    ],
                    "columns": [
                        {
                            "title": "OrderID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "CustomerID",
                            "field": "1",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "OrderDate",
                            "field": "2",
                            "dataType": {
                                "type": 27,
                                "needsQuotes": true
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "ProductID",
                            "field": "3",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 5 records retrieved in 1.195ms"
                    },
                    "totalRowCount": 5,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT * from db.orders",
                    "updatable": true,
                    "fullTableName": "db.orders"
                }
            ]
        },
        {
            "state": {
                "start": 172,
                "end": 174,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "6030dfa4-909b-4f89-cc9c-58f4b9223b5e"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 257
                        },
                        "contentStart": 149,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "6030dfa4-909b-4f89-cc9c-58f4b9223b5e",
                    "rows": [
                        {
                            "0": "David",
                            "1": 4
                        }
                    ],
                    "columns": [
                        {
                            "title": "customername",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "customerid",
                            "field": "1",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 1 record retrieved in 1.173ms"
                    },
                    "totalRowCount": 1,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- Question 4: Retrieve the customer_name of customers who have never placed any order (i.e., their customer_id does not exist in the orders table).\nSELECT customername, customerid from db.customers\nWHERE CustomerID not in(select CustomerID from db.orders)",
                    "updatable": true,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 175,
                "end": 177,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "ec38be66-0d65-438a-8002-59fdfb069550"
                    ]
                },
                "currentHeight": 308.640625,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 240
                        },
                        "contentStart": 117,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "ec38be66-0d65-438a-8002-59fdfb069550",
                    "rows": [
                        {
                            "0": "Jane",
                            "1": "75000.00"
                        },
                        {
                            "0": "Emily",
                            "1": "65000.00"
                        },
                        {
                            "0": "Michael",
                            "1": "80000.00"
                        },
                        {
                            "0": "Sarah",
                            "1": "60000.00"
                        },
                        {
                            "0": "David",
                            "1": "70000.00"
                        },
                        {
                            "0": "Laura",
                            "1": "72000.00"
                        },
                        {
                            "0": "Robert",
                            "1": "58000.00"
                        },
                        {
                            "0": "Sophia",
                            "1": "67000.00"
                        },
                        {
                            "0": "James",
                            "1": "81000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "salary",
                            "field": "1",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 9 records retrieved in 1.171ms"
                    },
                    "totalRowCount": 9,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "-- Find the firstname and salary of employees whose salary is higher than the average salary of the 'HR' department.\nSELECT firstname,salary from db.employees\nWHERE Salary > (select  AVG(salary) from db.employees  where  department = 'hr')",
                    "updatable": true,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 178,
                "end": 178,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "159b7a20-ddb1-4f6b-cf87-b194cefde1b1"
                    ]
                },
                "currentHeight": 335.28125,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 27
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "159b7a20-ddb1-4f6b-cf87-b194cefde1b1",
                    "rows": [
                        {
                            "0": 1,
                            "1": "John",
                            "2": "Doe",
                            "3": "HR",
                            "4": "55000.00"
                        },
                        {
                            "0": 2,
                            "1": "Jane",
                            "2": "Smith",
                            "3": "IT",
                            "4": "75000.00"
                        },
                        {
                            "0": 3,
                            "1": "Emily",
                            "2": "Jones",
                            "3": "Finance",
                            "4": "65000.00"
                        },
                        {
                            "0": 4,
                            "1": "Michael",
                            "2": "Brown",
                            "3": "IT",
                            "4": "80000.00"
                        },
                        {
                            "0": 5,
                            "1": "Sarah",
                            "2": "Davis",
                            "3": "HR",
                            "4": "60000.00"
                        },
                        {
                            "0": 6,
                            "1": "David",
                            "2": "Wilson",
                            "3": "Finance",
                            "4": "70000.00"
                        },
                        {
                            "0": 7,
                            "1": "Laura",
                            "2": "Garcia",
                            "3": "IT",
                            "4": "72000.00"
                        },
                        {
                            "0": 8,
                            "1": "Robert",
                            "2": "Miller",
                            "3": "HR",
                            "4": "58000.00"
                        },
                        {
                            "0": 9,
                            "1": "Sophia",
                            "2": "Martinez",
                            "3": "Finance",
                            "4": "67000.00"
                        },
                        {
                            "0": 10,
                            "1": "James",
                            "2": "Anderson",
                            "3": "IT",
                            "4": "81000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "EmployeeID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "FirstName",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "LastName",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Department",
                            "field": "3",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Salary",
                            "field": "4",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 10 records retrieved in 0.872ms"
                    },
                    "totalRowCount": 10,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT * from db.employees",
                    "updatable": true,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 179,
                "end": 179,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "ac0d53c9-2d11-4dd1-82f8-0f2a72cdf8c0"
                    ]
                },
                "currentHeight": 95.59375,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 37
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "ac0d53c9-2d11-4dd1-82f8-0f2a72cdf8c0",
                    "rows": [
                        {
                            "0": "68300.000000"
                        }
                    ],
                    "columns": [
                        {
                            "title": "avg(salary)",
                            "field": "0",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 1 record retrieved in 0.766ms"
                    },
                    "totalRowCount": 1,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT avg(salary) from db.employees",
                    "updatable": false,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 180,
                "end": 180,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "61f25732-d3a0-4590-a9f1-37d83b227c54"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 35
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "61f25732-d3a0-4590-a9f1-37d83b227c54",
                    "rows": [
                        {
                            "0": 1,
                            "1": "John",
                            "2": "Doe",
                            "3": "HR",
                            "4": "55000.00"
                        },
                        {
                            "0": 2,
                            "1": "Jane",
                            "2": "Smith",
                            "3": "IT",
                            "4": "75000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "EmployeeID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "FirstName",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "LastName",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Department",
                            "field": "3",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Salary",
                            "field": "4",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 2 records retrieved in 2.051ms"
                    },
                    "totalRowCount": 2,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT * FROM db.employees LIMIT 2",
                    "updatable": true,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 181,
                "end": 181,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "9f3e33c9-34df-469a-8f1c-29800cae738e"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 43
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "9f3e33c9-34df-469a-8f1c-29800cae738e",
                    "rows": [
                        {
                            "0": "John"
                        },
                        {
                            "0": "Jane"
                        },
                        {
                            "0": "Emily"
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 3 records retrieved in 1.745ms"
                    },
                    "totalRowCount": 3,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT firstname from db.employees LIMIT 3",
                    "updatable": false,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 182,
                "end": 184,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "4b53b001-2e3a-4ecd-f569-a01385ce1daa"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 128
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "4b53b001-2e3a-4ecd-f569-a01385ce1daa",
                    "rows": [
                        {
                            "0": "David",
                            "1": "Finance",
                            "2": "70000.00",
                            "3": 1
                        },
                        {
                            "0": "Sophia",
                            "1": "Finance",
                            "2": "67000.00",
                            "3": 2
                        },
                        {
                            "0": "Emily",
                            "1": "Finance",
                            "2": "65000.00",
                            "3": 3
                        },
                        {
                            "0": "Sarah",
                            "1": "HR",
                            "2": "60000.00",
                            "3": 1
                        },
                        {
                            "0": "Robert",
                            "1": "HR",
                            "2": "58000.00",
                            "3": 2
                        },
                        {
                            "0": "John",
                            "1": "HR",
                            "2": "55000.00",
                            "3": 3
                        },
                        {
                            "0": "James",
                            "1": "IT",
                            "2": "81000.00",
                            "3": 1
                        },
                        {
                            "0": "Michael",
                            "1": "IT",
                            "2": "80000.00",
                            "3": 2
                        },
                        {
                            "0": "Jane",
                            "1": "IT",
                            "2": "75000.00",
                            "3": 3
                        },
                        {
                            "0": "Laura",
                            "1": "IT",
                            "2": "72000.00",
                            "3": 4
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "department",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "salary",
                            "field": "2",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "ro_no",
                            "field": "3",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 10 records retrieved in 2.828ms"
                    },
                    "totalRowCount": 10,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT firstname,department,salary,\nROW_NUMBER() OVER (partition BY department ORDER BY salary desc) as ro_no\nfrom db.employees",
                    "updatable": false,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 185,
                "end": 186,
                "language": "mysql",
                "result": {
                    "type": "text",
                    "text": [
                        {
                            "type": 2,
                            "index": 0,
                            "resultId": "328a01b2-1a3b-4db3-f6d6-1672e3dd2bfc",
                            "content": "OK, 0 records retrieved in 0.564ms"
                        }
                    ]
                },
                "currentHeight": 28,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 192
                        },
                        "contentStart": -1,
                        "state": 3
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 187,
                "end": 189,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "316bbd46-0fde-4892-8f0a-0186ceb9d51c"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 100
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "316bbd46-0fde-4892-8f0a-0186ceb9d51c",
                    "rows": [
                        {
                            "0": "James",
                            "1": "IT",
                            "2": "81000.00",
                            "3": 1
                        },
                        {
                            "0": "Michael",
                            "1": "IT",
                            "2": "80000.00",
                            "3": 2
                        },
                        {
                            "0": "Jane",
                            "1": "IT",
                            "2": "75000.00",
                            "3": 3
                        },
                        {
                            "0": "Laura",
                            "1": "IT",
                            "2": "72000.00",
                            "3": 4
                        },
                        {
                            "0": "David",
                            "1": "Finance",
                            "2": "70000.00",
                            "3": 5
                        },
                        {
                            "0": "Sophia",
                            "1": "Finance",
                            "2": "67000.00",
                            "3": 6
                        },
                        {
                            "0": "Emily",
                            "1": "Finance",
                            "2": "65000.00",
                            "3": 7
                        },
                        {
                            "0": "Sarah",
                            "1": "HR",
                            "2": "60000.00",
                            "3": 8
                        },
                        {
                            "0": "Robert",
                            "1": "HR",
                            "2": "58000.00",
                            "3": 9
                        },
                        {
                            "0": "John",
                            "1": "HR",
                            "2": "55000.00",
                            "3": 10
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "department",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "salary",
                            "field": "2",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "ranking",
                            "field": "3",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 10 records retrieved in 0.799ms"
                    },
                    "totalRowCount": 10,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT firstname,department,salary,\nRANK() OVER ( ORDER BY salary desc) as ranking\nFROM db.employees",
                    "updatable": false,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 190,
                "end": 193,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "872abebf-7e7c-454d-85d2-a790fbccfbfa"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 158
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "872abebf-7e7c-454d-85d2-a790fbccfbfa",
                    "rows": [
                        {
                            "0": "James",
                            "1": "IT",
                            "2": "81000.00",
                            "3": 1,
                            "4": 1
                        },
                        {
                            "0": "Michael",
                            "1": "IT",
                            "2": "80000.00",
                            "3": 2,
                            "4": 2
                        },
                        {
                            "0": "Jane",
                            "1": "IT",
                            "2": "75000.00",
                            "3": 3,
                            "4": 3
                        },
                        {
                            "0": "Laura",
                            "1": "IT",
                            "2": "72000.00",
                            "3": 4,
                            "4": 4
                        },
                        {
                            "0": "David",
                            "1": "Finance",
                            "2": "70000.00",
                            "3": 5,
                            "4": 5
                        },
                        {
                            "0": "Sophia",
                            "1": "Finance",
                            "2": "67000.00",
                            "3": 6,
                            "4": 6
                        },
                        {
                            "0": "Emily",
                            "1": "Finance",
                            "2": "65000.00",
                            "3": 7,
                            "4": 7
                        },
                        {
                            "0": "Sarah",
                            "1": "HR",
                            "2": "60000.00",
                            "3": 8,
                            "4": 8
                        },
                        {
                            "0": "Robert",
                            "1": "HR",
                            "2": "58000.00",
                            "3": 9,
                            "4": 9
                        },
                        {
                            "0": "John",
                            "1": "HR",
                            "2": "55000.00",
                            "3": 10,
                            "4": 10
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "department",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "salary",
                            "field": "2",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "ranking",
                            "field": "3",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "dens_ranking",
                            "field": "4",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 10 records retrieved in 1.14ms"
                    },
                    "totalRowCount": 10,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT firstname,department,salary,\nRANK() OVER (ORDER BY salary desc) as ranking,\nDENSE_RANK() OVER (ORDER BY salary desc) as dens_ranking\nFROM db.employees",
                    "updatable": false,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 194,
                "end": 194,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "3b39ef20-7555-42dd-e7ed-82e12b7e775e"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 35
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "3b39ef20-7555-42dd-e7ed-82e12b7e775e",
                    "rows": [
                        {
                            "0": 1,
                            "1": "John",
                            "2": "Doe",
                            "3": "HR",
                            "4": "55000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "EmployeeID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "FirstName",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "LastName",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Department",
                            "field": "3",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Salary",
                            "field": "4",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 1 record retrieved in 1.988ms"
                    },
                    "totalRowCount": 1,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT * FROM db.employees limit 1",
                    "updatable": true,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 195,
                "end": 195,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "4dfcb5c1-138b-4cb0-d3d4-42bdbaf1b471"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 22
                        },
                        "contentStart": 1,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "4dfcb5c1-138b-4cb0-d3d4-42bdbaf1b471",
                    "rows": [
                        {
                            "0": "EmployeeID",
                            "1": "int",
                            "2": "NO",
                            "3": "PRI",
                            "4": null,
                            "5": ""
                        },
                        {
                            "0": "FirstName",
                            "1": "varchar(50)",
                            "2": "YES",
                            "3": "",
                            "4": null,
                            "5": ""
                        },
                        {
                            "0": "LastName",
                            "1": "varchar(50)",
                            "2": "YES",
                            "3": "",
                            "4": null,
                            "5": ""
                        },
                        {
                            "0": "Department",
                            "1": "varchar(50)",
                            "2": "YES",
                            "3": "",
                            "4": null,
                            "5": ""
                        },
                        {
                            "0": "Salary",
                            "1": "decimal(10,2)",
                            "2": "YES",
                            "3": "",
                            "4": null,
                            "5": ""
                        }
                    ],
                    "columns": [
                        {
                            "title": "Field",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Type",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Null",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Key",
                            "field": "3",
                            "dataType": {
                                "type": 43,
                                "needsQuotes": true
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Default",
                            "field": "4",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "Extra",
                            "field": "5",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 5 records retrieved in 3.148ms"
                    },
                    "totalRowCount": 5,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "DESCRIBE db.employees",
                    "updatable": false
                }
            ]
        },
        {
            "state": {
                "start": 196,
                "end": 196,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "ba9c07de-4ba2-4cbb-dd70-088a3fffc00b"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 43
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "ba9c07de-4ba2-4cbb-dd70-088a3fffc00b",
                    "rows": [
                        {
                            "0": 10
                        }
                    ],
                    "columns": [
                        {
                            "title": "COUNT(employeeid)",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 1 record retrieved in 23.412ms"
                    },
                    "totalRowCount": 1,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT COUNT(employeeid) FROM db.employees",
                    "updatable": false,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 197,
                "end": 205,
                "language": "mysql",
                "result": {
                    "type": "text",
                    "text": [
                        {
                            "type": 2,
                            "index": 0,
                            "resultId": "615077bc-5c67-406c-9062-2cb9d6c368c6",
                            "content": "OK, 7 rows affected in 46.486ms"
                        }
                    ]
                },
                "currentHeight": 28,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 392
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 206,
                "end": 206,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "9d14c16e-89d5-4c05-f4d6-0ec7ae12b978"
                    ]
                },
                "currentHeight": 351.984375,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 27
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "9d14c16e-89d5-4c05-f4d6-0ec7ae12b978",
                    "rows": [
                        {
                            "0": 1,
                            "1": "John",
                            "2": "Doe",
                            "3": "HR",
                            "4": "55000.00"
                        },
                        {
                            "0": 2,
                            "1": "Jane",
                            "2": "Smith",
                            "3": "IT",
                            "4": "75000.00"
                        },
                        {
                            "0": 3,
                            "1": "Emily",
                            "2": "Jones",
                            "3": "Finance",
                            "4": "65000.00"
                        },
                        {
                            "0": 4,
                            "1": "Michael",
                            "2": "Brown",
                            "3": "IT",
                            "4": "80000.00"
                        },
                        {
                            "0": 5,
                            "1": "Sarah",
                            "2": "Davis",
                            "3": "HR",
                            "4": "60000.00"
                        },
                        {
                            "0": 6,
                            "1": "David",
                            "2": "Wilson",
                            "3": "Finance",
                            "4": "70000.00"
                        },
                        {
                            "0": 7,
                            "1": "Laura",
                            "2": "Garcia",
                            "3": "IT",
                            "4": "72000.00"
                        },
                        {
                            "0": 8,
                            "1": "Robert",
                            "2": "Miller",
                            "3": "HR",
                            "4": "58000.00"
                        },
                        {
                            "0": 9,
                            "1": "Sophia",
                            "2": "Martinez",
                            "3": "Finance",
                            "4": "67000.00"
                        },
                        {
                            "0": 10,
                            "1": "James",
                            "2": "Anderson",
                            "3": "IT",
                            "4": "81000.00"
                        },
                        {
                            "0": 11,
                            "1": "Rahim",
                            "2": "Uddin",
                            "3": "HR",
                            "4": "75000.00"
                        },
                        {
                            "0": 12,
                            "1": "Sumona",
                            "2": "Khan",
                            "3": "HR",
                            "4": "75000.00"
                        },
                        {
                            "0": 13,
                            "1": "Tanvir",
                            "2": "Ahmed",
                            "3": "IT",
                            "4": "60000.00"
                        },
                        {
                            "0": 14,
                            "1": "Karim",
                            "2": "Chowdhury",
                            "3": "IT",
                            "4": "60000.00"
                        },
                        {
                            "0": 15,
                            "1": "Ayesha",
                            "2": "Siddiqua",
                            "3": "IT",
                            "4": "60000.00"
                        },
                        {
                            "0": 16,
                            "1": "Farhan",
                            "2": "Hossain",
                            "3": "Sales",
                            "4": "50000.00"
                        },
                        {
                            "0": 17,
                            "1": "Nusrat",
                            "2": "Jahan",
                            "3": "Sales",
                            "4": "45000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "EmployeeID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "FirstName",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "LastName",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Department",
                            "field": "3",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Salary",
                            "field": "4",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 17 records retrieved in 0.934ms"
                    },
                    "totalRowCount": 17,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT * from db.employees",
                    "updatable": true,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 207,
                "end": 210,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "fb0d7e90-a4a8-47e1-83df-cad7ef45ebba"
                    ]
                },
                "currentHeight": 351.984375,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 158
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "fb0d7e90-a4a8-47e1-83df-cad7ef45ebba",
                    "rows": [
                        {
                            "0": "James",
                            "1": "IT",
                            "2": "81000.00",
                            "3": 1,
                            "4": 1
                        },
                        {
                            "0": "Michael",
                            "1": "IT",
                            "2": "80000.00",
                            "3": 2,
                            "4": 2
                        },
                        {
                            "0": "Jane",
                            "1": "IT",
                            "2": "75000.00",
                            "3": 3,
                            "4": 3
                        },
                        {
                            "0": "Rahim",
                            "1": "HR",
                            "2": "75000.00",
                            "3": 3,
                            "4": 3
                        },
                        {
                            "0": "Sumona",
                            "1": "HR",
                            "2": "75000.00",
                            "3": 3,
                            "4": 3
                        },
                        {
                            "0": "Laura",
                            "1": "IT",
                            "2": "72000.00",
                            "3": 6,
                            "4": 4
                        },
                        {
                            "0": "David",
                            "1": "Finance",
                            "2": "70000.00",
                            "3": 7,
                            "4": 5
                        },
                        {
                            "0": "Sophia",
                            "1": "Finance",
                            "2": "67000.00",
                            "3": 8,
                            "4": 6
                        },
                        {
                            "0": "Emily",
                            "1": "Finance",
                            "2": "65000.00",
                            "3": 9,
                            "4": 7
                        },
                        {
                            "0": "Sarah",
                            "1": "HR",
                            "2": "60000.00",
                            "3": 10,
                            "4": 8
                        },
                        {
                            "0": "Tanvir",
                            "1": "IT",
                            "2": "60000.00",
                            "3": 10,
                            "4": 8
                        },
                        {
                            "0": "Karim",
                            "1": "IT",
                            "2": "60000.00",
                            "3": 10,
                            "4": 8
                        },
                        {
                            "0": "Ayesha",
                            "1": "IT",
                            "2": "60000.00",
                            "3": 10,
                            "4": 8
                        },
                        {
                            "0": "Robert",
                            "1": "HR",
                            "2": "58000.00",
                            "3": 14,
                            "4": 9
                        },
                        {
                            "0": "John",
                            "1": "HR",
                            "2": "55000.00",
                            "3": 15,
                            "4": 10
                        },
                        {
                            "0": "Farhan",
                            "1": "Sales",
                            "2": "50000.00",
                            "3": 16,
                            "4": 11
                        },
                        {
                            "0": "Nusrat",
                            "1": "Sales",
                            "2": "45000.00",
                            "3": 17,
                            "4": 12
                        }
                    ],
                    "columns": [
                        {
                            "title": "firstname",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "department",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "salary",
                            "field": "2",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "ranking",
                            "field": "3",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "dens_ranking",
                            "field": "4",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 17 records retrieved in 3.494ms"
                    },
                    "totalRowCount": 17,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT firstname,department,salary,\nRANK() OVER (ORDER BY salary desc) as ranking,\nDENSE_RANK() OVER (ORDER BY salary desc) as dens_ranking\nFROM db.employees",
                    "updatable": false,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 211,
                "end": 211,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "9d063e15-0967-4819-a4c8-3555cbc5f11a"
                    ]
                },
                "currentHeight": 148.859375,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 35
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "9d063e15-0967-4819-a4c8-3555cbc5f11a",
                    "rows": [
                        {
                            "0": 1,
                            "1": "John",
                            "2": "Doe",
                            "3": "HR",
                            "4": "55000.00"
                        },
                        {
                            "0": 2,
                            "1": "Jane",
                            "2": "Smith",
                            "3": "IT",
                            "4": "75000.00"
                        },
                        {
                            "0": 3,
                            "1": "Emily",
                            "2": "Jones",
                            "3": "Finance",
                            "4": "65000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "EmployeeID",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": true,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "FirstName",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "LastName",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Department",
                            "field": "3",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        },
                        {
                            "title": "Salary",
                            "field": "4",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": true,
                            "autoIncrement": false,
                            "default": null
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 3 records retrieved in 3.93ms"
                    },
                    "totalRowCount": 3,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT * from db.employees limit 3",
                    "updatable": true,
                    "fullTableName": "db.employees"
                }
            ]
        },
        {
            "state": {
                "start": 212,
                "end": 214,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "682ccb94-78ba-45ef-9cd2-e55ad36be2ee"
                    ]
                },
                "currentHeight": 351.984375,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 97
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": [
                {
                    "tabId": "52dc48c0-9a47-443f-9743-ab316e1f7dd2",
                    "resultId": "682ccb94-78ba-45ef-9cd2-e55ad36be2ee",
                    "rows": [
                        {
                            "0": "Finance",
                            "1": "65000.00",
                            "2": "0.00"
                        },
                        {
                            "0": "Finance",
                            "1": "70000.00",
                            "2": "65000.00"
                        },
                        {
                            "0": "Finance",
                            "1": "67000.00",
                            "2": "70000.00"
                        },
                        {
                            "0": "HR",
                            "1": "55000.00",
                            "2": "67000.00"
                        },
                        {
                            "0": "HR",
                            "1": "60000.00",
                            "2": "55000.00"
                        },
                        {
                            "0": "HR",
                            "1": "58000.00",
                            "2": "60000.00"
                        },
                        {
                            "0": "HR",
                            "1": "75000.00",
                            "2": "58000.00"
                        },
                        {
                            "0": "HR",
                            "1": "75000.00",
                            "2": "75000.00"
                        },
                        {
                            "0": "IT",
                            "1": "75000.00",
                            "2": "75000.00"
                        },
                        {
                            "0": "IT",
                            "1": "80000.00",
                            "2": "75000.00"
                        },
                        {
                            "0": "IT",
                            "1": "72000.00",
                            "2": "80000.00"
                        },
                        {
                            "0": "IT",
                            "1": "81000.00",
                            "2": "72000.00"
                        },
                        {
                            "0": "IT",
                            "1": "60000.00",
                            "2": "81000.00"
                        },
                        {
                            "0": "IT",
                            "1": "60000.00",
                            "2": "60000.00"
                        },
                        {
                            "0": "IT",
                            "1": "60000.00",
                            "2": "60000.00"
                        },
                        {
                            "0": "Sales",
                            "1": "50000.00",
                            "2": "60000.00"
                        },
                        {
                            "0": "Sales",
                            "1": "45000.00",
                            "2": "50000.00"
                        }
                    ],
                    "columns": [
                        {
                            "title": "Department",
                            "field": "0",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "salary",
                            "field": "1",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "salary",
                            "field": "2",
                            "dataType": {
                                "type": 10,
                                "flags": [
                                    "UNSIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 65,
                                "numericScale": 30,
                                "parameterFormatType": "TwoOrOneOrZero",
                                "synonyms": [
                                    "FIXED",
                                    "NUMERIC",
                                    "DEC"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 17 records retrieved in 3.58ms"
                    },
                    "totalRowCount": 17,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 0,
                    "sql": "SELECT Department,salary,\nLAG(salary,1,0) OVER(order by department ) as salary\nfrom db.employees",
                    "updatable": false,
                    "fullTableName": ""
                }
            ]
        },
        {
            "state": {
                "start": 215,
                "end": 217,
                "language": "mysql",
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 94
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": []
        }
    ]
}