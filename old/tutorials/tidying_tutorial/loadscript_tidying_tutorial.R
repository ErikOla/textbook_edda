
if(!require(purrr)) {
	install.packages("purrr")
}
library(purrr)

pkgs <- c("gapminder","dplyr","tidyr","babynames","nycflights13")


load_pkgs <- function(pkg) {
	if(!require(pkg, character.only = T)) {
		install.packages(pkg)
	}
	library(pkg, character.only = T)
	
}

walk(pkgs, load_pkgs)


set.seed(123)
countries_population <- gapminder %>% filter(year == 2007) %>% select(country, pop) %>% sample_frac(0.8)
countries_lifeExp <- gapminder %>% filter(year == 2007) %>% select(country, lifeExp) %>% sample_frac(0.6)

population_europe <- gapminder %>% filter(continent == "Europe", year == 2007) %>% select(country, pop)
population_africa<- gapminder %>% filter(continent == "Africa", year == 2007) %>% select(country, pop)
information_africa <- gapminder %>% filter(continent == "Africa", year == 2007) %>% select(country, pop, lifeExp)


data(flights)
flights
data(airlines)
airlines
data(weather)
weather

set.seed(123)
students <- tibble(first_name = babynames::babynames %>% sample_n(10) %>% pull(name),
				   last_name = babynames::babynames %>% sample_n(10) %>% pull(name))

set.seed(456)
tibble(first_name = babynames::babynames %>% sample_n(10) %>% pull(name),
	   last_name = babynames::babynames %>% sample_n(10) %>% pull(name)) %>%
	unite(col = name, first_name, last_name, sep = " ") -> students_2

gapminder %>%
	select(country, year, pop, continent) %>%
	spread(year, pop) -> yearly_population

data(who) 
who

rm("pkgs","load_pkgs")
