# Simple backend application 
![build + tests](https://travis-ci.org/13LD/photography-backend.svg?branch=master)
[![Coverage Status](https://coveralls.io/repos/github/13LD/photography-backend/badge.svg?branch=master)](https://coveralls.io/github/13LD/photography-backend?branch=master)
[![Code Climate](https://codeclimate.com/github/codeclimate/codeclimate/badges/gpa.svg)](https://codeclimate.com/github/13LD/photography-backend)

##### TODO
- [x] fix api concerns
- [x] swagger concerns
- [x] user concerns
## Benefits of token-based authentication
#### There are several benefits to using such approach:

#### Cross-domain / CORS
- Cookies and CORS don't mix well across different domains. A token-based approach allows you to make AJAX calls to any server, on any domain because you use an HTTP header to transmit the user information.
#### Stateless
- Tokens are stateless. There is no need to keep a session store, since the token is a self-contained entity that stores all the user information in it.
#### Decoupling
- You are no longer tied to a particular authentication scheme. Tokens may be generated anywhere, so the API can be called from anywhere with a single authenticated command rather than multiple authenticated calls.
#### Mobile ready
- Cookies are a problem when it comes to storing user information on native mobile applications. Adopting a token-based approach simplifies this saving process significantly.
#### CSRF (Cross Site Request Forgery)
- Because the application does not rely on cookies for authentication, it is invulnerable cross site request attacks.
#### Performance
- In terms of server-side load, a network roundtrip (e.g. finding a session on database) is likely to take more time than calculating an HMACSHA256 code to validate a token and parsing its contents, making token-based authentication faster than the traditional alternative.
## List of gems 

```ruby
### Gems for JWT auth
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# JWT gem will make encoding and decoding of HMACSHA256 tokens available in the Rails application
gem 'jwt'

# A simple, standardized way to build and use Service Objects (aka Commands) in Ruby
gem 'simple_command'

# Docs for entities
gem 'swagger-blocks'


# Upload files from Ruby applications
gem 'carrierwave', '~> 0.10.0'
gem 'mini_magick', '~> 4.3'
###
 
```
