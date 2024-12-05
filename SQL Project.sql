use bank_analysis;

select * from Masterdata;

-- KPI 1  year wise loan amount 
select issue_d as years,concat(round(sum(loan_amnt)/10000000,2),'Cr') as Loan_amount from masterdata group by issue_d ;

-- KPI 2 Grade and subgrade wise revolution balance
select Grade,sub_grade,concat(round(sum(revol_bal)/10000000,2), 'Cr') as revolution_balance from Masterdata group by Grade,sub_grade order by grade asc;

-- KPI 3 Verification Status by Total Payment 
select verification_status,concat(round(sum(total_pymnt)/10000000,2), 'Cr') as Total_payment from Masterdata group by verification_status;

-- KPI 4 State and Month Wise Loan Status 
SELECT addr_state AS state,IssueDateMonth AS month,loan_status,COUNT(loan_status) AS loan_count FROM masterdata GROUP BY addr_state,IssueDateMonth,loan_status ORDER BY addr_state,IssueDateMonth,loan_status limit 35;

SELECT addr_state AS state,COUNT(loan_status) AS loan_count FROM masterdata GROUP BY addr_state ORDER BY addr_state limit 35;

SELECT IssueDateMonth AS month, COUNT(loan_status) AS loan_count FROM masterdata GROUP BY IssueDateMonth ORDER BY IssueDateMonth;

-- KPI 5 Home ownership Vs Last Payment Stats
SELECT last_pymnt_d,home_ownership,COUNT(*) AS loan_count FROM Masterdata GROUP BY home_ownership, last_pymnt_d ORDER BY home_ownership, last_pymnt_d;


