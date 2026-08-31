library(tidyverse)
library(readr)
rating_data<- read_csv(file.choose())
rating_data
glimpse(rating_data)
cleaned_rating_data<- rating_data %>% distinct() %>%
  mutate(
    userId = as.integer(userId),
    movieId = as.integer(movieId),
    rating = as.numeric(rating)
  ) %>% filter(userId > 0 & movieId > 0 & rating > 0.00 )
cleaned_rating_data

genome_data<- read_csv(file.choose())
genome_data
glimpse(genome_data)

cleaned_genome_data <- genome_data %>% distinct() %>% 
  mutate(
    movieId = as.integer(movieId),
    tagId = as.integer(tagId),
    relevance = as.numeric(relevance)
  ) %>% filter(movieId > 0 & tagId > 0  & relevance > 0.00 ) %>%
  group_by(movieId) %>%
  summarise(
    Total_Tags = n(),
    .groups = 'drop'
  ) 
cleaned_genome_data
join_report <- cleaned_rating_data %>%
  inner_join(cleaned_genome_data,by='movieId')
join_report
final_report<- join_report %>% distinct() %>%
  select(userId,movieId,rating,Total_Tags)
final_report
write.csv(final_report,
          'New_dataset_movielens_25M_data_joining_pipeline_data.csv',
         row.names = FALSE )
getwd()
