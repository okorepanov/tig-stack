# README

## Rake tasks for load testing
1. `bundle exec rake load:creation[CREATE_COUNT]` - pass `CREATE_COUNT` to specify number of random Posts to be created. Additionally one fake Posts will be created for search purposes.
2. `bundle exec rake load:persistence` - update all Posts with random attributes
3. `bundle exec rake load:deletion` - delete all Posts
4. `bundle exec rake load:match_all_search` - ES search with `match_all: {}` query
5. `bundle exec rake load:keyword_search[QUERY]` - ES search with specified `QUERY`

## Monitoring screenshots
### Application load using rake tasks (creation, persistence, deletion and ES search)
![Rake tasks load](github/assets/rake_tasks_load.png)

### Mongo
![Mongo monitoring](github/assets/mongo_stasts.png)

### Elasticsearch
![ES monitoring 1](github/assets/es_stats_1.png)
![ES monitoring 2](github/assets/es_stats_2.png)
