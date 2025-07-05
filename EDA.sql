-- EXPLORATORY DATA ANALYSIS

select * from
layoffs_staging2;

select max(total_laid_off),max(percentage_laid_off)
from layoffs_staging2;

select min(`date`),max(`date`)
from layoffs_staging2;

select * from 
layoffs_staging2
where percentage_laid_off=1
order by funds_raised_millions desc;

select company, sum(total_laid_off) as total
from layoffs_staging2
group by company
order by total desc;

select industry, sum(total_laid_off) as total
from layoffs_staging2
group by industry
order by total desc;

select country, sum(total_laid_off) as total
from layoffs_staging2
group by country
order by total desc;

select `date`, sum(total_laid_off) as total
from layoffs_staging2
group by `date`
order by 1 desc;

select YEAR(`date`), sum(total_laid_off) as total
from layoffs_staging2
group by YEAR(`date`)
order by 1 desc;

select stage, sum(total_laid_off) as total
from layoffs_staging2
group by stage
order by total desc;

with rolling_total as
(
SELECT substring(`date`,1,7) as month, sum(total_laid_off) as total
FROM layoffs_staging2
where substring(`date`,1,7) is not null
group by month
order by 1 asc
)

select `month`,total,sum(total) over(order by `month`) as rollingtotal
from rolling_total;


select company,YEAR(`date`), SUM(total_laid_off)
from layoffs_staging2
group by company,year(`date`)
ORDER BY 3 DESC;


WITH Company_Year(company,years,total_laid_off) AS
(
select company,YEAR(`date`), SUM(total_laid_off)
from layoffs_staging2
group by company,year(`date`)
),company_year_rank as
(

select *,dense_rank() over(partition by years order by total_laid_off desc) as ranking
from Company_year
where years is not null
)
select * from company_year_rank
where ranking<=5;

