_This is now in Read only mode as the backend of https://movies.nathanjms.co.uk is using [my Laravel API](https://github.com/Nathanjms/nathanjms-api). I have also realised that this codebase is potentially open to SQL Injection, so should not be used without updating the queries to be [Parameterized Queries](https://node-postgres.com/features/queries#parameterized-query)._

## Backend to my [website](https://movies.nathanjms.co.uk). 

### Features include:

A logged in user (via Firebase) with permissions (given manually by me currently) can access the Movies section, where they can:
- Add movies to watch
- Mark movies as watched
- See list of movies on watchlist and movies that have been watched
- See top IMDB Movies (Removed for now)
- Random movie selector (Now implemented!)

Backend is hosted on Heroku, and the front end on Github Pages
