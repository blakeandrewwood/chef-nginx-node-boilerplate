# Chef config with Node App

## Requires

ChefDK
Docker

# Local Setup

`cd cookbooks/demo`
`berks install`
`kitchen converge default-ubuntu-1404`

Go to `http://localhost/` to see the Express Node App.


# Chef

## Data bags

* users
  * app.json

## Files

* default
  * express
    * package.json.conf
    * server.conf
  * nginx
    * nginx.conf

## Templates

* default
  * init.d
    * nodejs-service.erb
  * nginx
    * sites-enabled
      * express.erb

