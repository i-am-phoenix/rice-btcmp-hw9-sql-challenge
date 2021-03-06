# rice-btcmp-hw9-sql-challenge
## Project Objective

Research available employees' data of a fictional corporation from the 1980s and 1990s. All that remain of the database of employees from that period are six CSV files. PostgreSQL was used to design tables to hold data from the CSV files, import the CSVs into a SQL database, and answer a number of questions about the data.

## Instructions

#### Data Modeling

Inspect the CSVs and sketch out an ERD of the tables. Feel free to use a tool like http://www.quickdatabasediagrams.com.

#### Data Engineering

- Use the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.

  - For the primary keys check to see if the column is unique, otherwise create a [composite key](https://en.wikipedia.org/wiki/Compound_key). Which takes to primary keys in order to uniquely identify a row.
  - Be sure to create tables in the correct order to handle foreign keys.

- Import each CSV file into the corresponding SQL table. **Note** be sure to import the data in the same order that the tables were created and account for the headers when importing to avoid errors.

  (SQL schemata is set up using code in [schemata.sql](schemata.sql))

#### Data Analysis

Using the complete database, do the following:

1. List the following details of each employee: employee number, last name, first name, sex, and salary.

2. List first name, last name, and hire date for employees who were hired in 1986.

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

4. List the department of each employee with the following information: employee number, last name, first name, and department name.

5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

   (SQL code is listed in [queries.sql](queries.sql))

#### Bonus (Optional)

- Import the SQL database into Pandas. using SQLAlchemy.

- Create a histogram to visualize the most common salary ranges for employees.

- Create a bar chart of average salary by title.

  (Python code is in  [data_exploration_and_bonus.ipynb](data_exploration_and_bonus.ipynb))

### Input data:

Input data consists of 6 *.csv files containing related data for the study. These tables are related to each other as is shown in the ERD below:

<img src="figures\erd_final.png" style="zoom:130%;" align="center"/>
