# Penguin

Penguin is a tool for creating web-based presentations using your preferred preprocessors.

## Command line interface

`penguin new NAME` to generate a new project.
`penguin` from inside a project directory to start the server.

## Configuration

All the files you will work with in creating your presentation use the basename "deck." Defaults are set for you when generating a new project with `penguin new`. For the HTML, CSS, and JS files, the file extensions should match whichever preprocessors you're using for the given type. The generator uses Haml, Sass, and CoffeeScript by default, but you can use any libraries you like.

* `deck.rb` is the configuration file. Require any HTML template engine and CSS/JS preprocessors you want here. Call `set :template_engine, :engine_name_here` to tell Penguin which library to use for generating your HTML.

* `deck.haml` is your presentation HTML.

* `deck.sass` is your presentation stylesheet.

* `deck.coffee` is your presentation JavaScript.

## Presentation format

Your presentation deck is plain HTML. Each slide is denoted by a top-level element with a class of `slide`.

## License

Penguin is available under the included MIT license. See `LICENSE` for details.
