# Spud Videos

Spud Videos is an engine for managing and embedding Youtube / Vimeo videos, designed for use with [Spud][spud] and [Spud CMS][spud_cms].


## Installation/Usage

1. In your Gemfile add the following

    gem 'spud_videos'

2. Run bundle install
3. Copy in database migrations to your new rails project

    bundle exec rake railties:install:migrations
    rake db:migrate

4. Run a rails server instance and point your browser to /spud/admin

## Configuration

Spud Videos accepts the following configuration options:

```ruby
Spud::Banners.configure do |config|
  config.base_layout = "application"
  config.enable_videos_route = true
  config.default_dimensions = [560,315]
end
```

## Adding a Video
Videos are added in the Spud admin. When adding a video, you can specify wether the video is hosted on youtube or vimeo.
It is also possible to specify a name and description for the video which can be rendered on the /videos url. In many cases,
it may be unnecessary to have the videos route. Spud Videos makes it easy to embed videos into spud_cms pages by using liquid tags.

## Helpers
Videos provides a helper method for rendering these embedded videos:

```ruby
spud_video(set_or_identifier, options)
```

Example:

```ruby
spud_video(:promotional, {:width => 500, :height => 300})
```

## Liquid

Spud Videos comes with its own custom [Liquid][liquid] tag. For now the liquid tag only supports rendering the standard html as generated by the `spud_video`. Will support more advanced options in the future.

Usage:

```erb
  <%= raw Liquid::Template.parse("{% video Promotion width=500 height=300 %}").render %>
```


Testing
-----------------

Spud uses RSpec for testing. Get the tests running with a few short commands:

1. Create and migrate the databases:

    rake db:create
    rake db:migrate

2. Load the schema in to the test database:

    rake app:db:test:prepare

3. Run the tests with RSpec

    rspec spec

After the tests have completed the current code coverage stats is available by opening ```/coverage/index.html``` in a browser.

[spud]:https://github.com/spud-rails/spud_core_admin
[spud_cms]:https://github.com/spud-rails/spud_cms
[liquid]:https://github.com/Shopify/liquid
