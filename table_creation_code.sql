DROP TABLE employees;

CREATE TABLE "employees" (
    "emp_no" integer NOT NULL,
    "emp_title" varchar(10) NOT NULL,
	"birth_date" varchar(10) NOT NULL,
	"first_name" varchar(30) NOT NULL,
	"last_name" varchar(30) NOT NULL,
	"sex" varchar(1) NOT NULL,
	"hire_date" varchar(10) NOT NULL,
	CONSTRAINT "pk_employees" PRIMARY KEY (
		"emp_no"
     )
);

DROP TABLE departments;

CREATE TABLE "departments" (
    "dept_no" VARCHAR(10) NOT NULL,
    "dept_name" VARCHAR(30) NOT NULL,
	CONSTRAINT "pk_departments" PRIMARY KEY (
	"dept_no"
     )
);

DROP TABLE titles;

CREATE TABLE "titles" (
    "title_id" VARCHAR(10) NOT NULL,
    "title" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
	)
);

DROP TABLE dept_emp;

CREATE TABLE "dept_emp" (
    "emp_no" integer NOT NULL,
    "dept_no" VARCHAR(10) NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
	)
);

DROP TABLE dept_manager;

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(10) NOT NULL,
    "emp_no" integer NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
	)
);

DROP TABLE salaries;

CREATE TABLE "salaries" (
    "emp_no" integer NOT NULL,
    "salary" integer NOT NULL,
    CONSTRAINT "pl_salaties" PRIMARY KEY (
        "emp_no"
	)
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_title_id" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");