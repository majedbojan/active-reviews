# Active Review
  Active Review is a simple rails app that shows a review of a movie

## Target audience
This application is intended for:

- **Movie Enthusiasts:** Individuals looking to browse and read reviews of various movies.
- **Developers:** Those interested in understanding a basic implementation of a review system in Rails.
- **Learning Enthusiasts:** Students or beginners learning Rails development and database interactions.


# Developer Guide

## Dependencies
- Ruby ruby-3.3.2
- PostgreSQL
- Node


### Setup

To start development, clone the project

```powershell
$ git clone git@github.com:majedbojan/active-reviews.git
$ cd active-reviews
```

Then run

```powershell
bundle install
```
### DB

```powershell
$ rails db:create && rails db:migrate
```

### Seed

```powershell
rake import:movies
```

### Branches

Note: `main` is the primary branch for production-ready code


### Environemtens

- `development`: Development environment
- `test`: Used for unit test
- `production`: End user environment.


### Test cases

```powershell
bundle exec rspec spec/

# Output
Finished in 0.29337 seconds (files took 0.78219 seconds to load)
37 examples, 0 failures, 2 pending
```


## Database Schema

### Movies Table

| Column            | Type    | Constraints           |
|-------------------|---------|------------------------|
| id                | bigint  | not null, primary key  |
| actor             | string  | not null               |
| country           | string  | not null               |
| description       | text    | not null               |
| director          | string  | not null               |
| filming_location  | string  | not null               |
| name              | string  | not null               |
| year              | integer | not null               |
| created_at        | datetime| not null               |
| updated_at        | datetime| not null               |

## Reviews Table

| Column     | Type    | Constraints           |
|------------|---------|------------------------|
| id         | bigint  | not null, primary key  |
| review     | text    | not null               |
| stars      | integer | not null               |
| user       | string  | not null               |
| created_at | datetime| not null               |
| updated_at | datetime| not null               |
| movie_id   | bigint  | not null, foreign key  |

## Relationships

- **Movies** has many **Reviews**.
- **Reviews** belongs to **Movies**.

