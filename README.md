# rails-url-shortener

A monolithic URL shortener built with Ruby on Rails. Users can create short links, view analytics, and manage their links.

## Requirements

- Submit a url to a form on the homepage.
- Url is saved to the database and a unique short code is generated.
- The url can be visited by going to `http://localhost:3000/:short_code`.
- These hits are tracked and displayed on the link's show page to get how many views per day the link has.