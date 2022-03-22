# Globalize::Migration

This gem replaces the built in Rails migration templates to make your migrations play nice with the i18n 
[Globalize](https://github.com/globalize/globalize) gem.

This gem replaces the create table migration within Rails. The primary difference is that it create two tables. The 
first table is like the table normally found in a Rails migration, but without any of the field of type `string` and 
type `text`. The second table stores your translations (those string and text fields) and the name is prepended with 
`_translations`. 

Consider the following examples for the command: `rails generate model recipe title:string tag_line:string directions:text featured_on:date rating:integer `

The default Rails migration would look like this:

```ruby
class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :tag_line
      t.text :directions
      t.date :featured_on
      t.integer :rating
      t.timestamps
    end
  end
end
```
The Globalize-Migration gem will create the following:

```ruby
class CreateRecipes < ActiveRecord::Migration[6.1]
  # Created by the globalize-migration gem
  def change
    create_table :recipes do |t|
      t.timestamps
      t.date :featured_on
      t.integer :rating
    end

    create_table :recipe_translations do |t|
      t.timestamps
      t.integer :recipe_id
      t.string :locale
      t.string :title
      t.string :tag_line
      t.text :directions
    end
  end
end
```
Globalize expects your tables to be setup like these. Notice it keeps fields without translatable data like 
integers, dates, and etc. in the original `recipes` table. However the string and text fields with data that can change 
by locale are in the `recipe_translations`. In my experience this gets your translatable and non-translatable data 
organized properly 98% of the time. _Like all migrations, I recommend reviewing the file before running `rails db:migrate`._

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'globalize-migration', '1.0.0'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install globalize-migration

## Usage

Simply create migrations as you normally would, Rails will use this migration template instead of the default one that 
comes with Rails.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Webstop/globalize-migration. This project is 
intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the 
[code of conduct](https://github.com/Webstop/globalize-migration/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Globalize::Migration project's codebases, issue trackers, chat rooms and mailing lists is
expected to follow the [code of conduct](https://github.com/Webstop/globalize-migration/blob/master/CODE_OF_CONDUCT.md).

## Notes

Sponsored by [Webstop](https://github.com/Webstop), authored by [Greg Hemphill](https://github.com/Hemphill).
