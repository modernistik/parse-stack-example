# Parse Server with Ruby Rack Example
This is a sample application to showcase using the ruby [Parse-Stack](https://github.com/modernistik/parse-stack) gem with [Parse-Server](https://github.com/ParsePlatform/parse-server).

## Getting Started
Make sure you have your API keys for your Parse-Server handy. To get started, clone this repo and run the bundle command.

    $ bundle install
    $ rake setup

Edit the `config/parse.rb` file so that it is configured with your Parse-Server API keys. You may optionally use a `.env` file that will be loaded into your `ENV`.

```
# in .env
PARSE_APP_ID=<YOUR_APP_ID>
PARSE_API_KEY=<YOUR_API_ID>
PARSE_MASTER_KEY=<YOUR_MASTER_KEY>
PARSE_SERVER_URL=http://localhost:1337/parse
# Below is the accessible URL for this Rack server
# When running locally, it is localhost:3000
HOOKS_URL=<http://localhost:3000/>
```

### Upgrade Your Schema
We have added some sample models and webhooks in this example application for you to play around. **We recommend you run this example with an new Parse application.**

    $ rake parse:upgrade

The above should create and update the classes that are defined in the `models` directory with your Parse-Server and upgrade your database schema.

## Playground
Now you are ready to go! Try running the `rake console` command and perform a few queries.

    $ rake console

```ruby
    franky = Artist.first_or_create({name: "Frank Sinatra"})
    franky.save

    song = Song.first_or_create(name: "Fly Me to the Moon")
    song.released = 1964
    song.genres = ['jazz','big band']
    song.artist = franky
    song.save

    Song.count :released.before => 1965
    Song.first :artist => franky
```


## Run Webhooks Server
You can have this rack application handle incoming Parse webhooks based on what you have defined in the `webhooks` folder. Make sure you already have a Parse-Server running. To start this server use:

```bash
    # Register webhooks
    $ rake parse:webhooks:register
    # Start the server
    $ rake start
```

This will start the rack server and begin handling requests from your Parse-Server. You can automatically have Parse-Stack register your defined webhooks with your Parse-Server with the task `rake parse:webhooks:register` after you have defined a valid `HOOKS_URL` environment variable.
