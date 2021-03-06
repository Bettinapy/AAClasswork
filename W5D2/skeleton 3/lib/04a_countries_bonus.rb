# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
  SELECT
    name
  FROM
    countries
  WHERE
    gdp > (
      SELECT
        MAX(gdp)
      FROM
        countries
      WHERE
        continent = 'Europe'
    )
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
    SELECT 
      continent,name, area
    FROM
      countries                          
    WHERE area IN 
    (SELECT
      max_area
      FROM (
      SELECT 
        continent, MAX(area) as max_area
      FROM
        countries
      GROUP BY continent
    )sub_q
    )


  SQL
end
# SELECT continent, name, area
#     FROM (
#     SELECT continent, name, area, RANK() OVER (Partition by continent Order by area DESC) rank_area
#     FROM countries)sub_q
#     WHERE rank_area = 1
# ASIA          area         row_num
#      China     98 mill        1
#      Korea      30 mil        2

# Europe
#     UK         50             1

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
  SELECT 
    c1.name, c1.continent
  FROM
    countries c1
  WHERE
    population > 3*
    (
      SELECT
        MAX(c2.population)
      FROM
        countries c2
      WHERE
        c2.continent = c1.continent
      AND
        c2.name != c1.name         
    )


  SQL
end
