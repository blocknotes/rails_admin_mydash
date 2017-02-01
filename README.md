# RailsAdminMydash [![Gem Version](https://badge.fury.io/rb/rails_admin_mydash.svg)](https://badge.fury.io/rb/rails_admin_mydash)

A rails_admin alternative dashboard. It overrides the default dashboard component.

Features:

- show the last 3 records for each model (useful to reach the last items easily)

- show optionally admin notices (to show informations to the users)

- show auditing / history table if enabled

- hid breadcrump and nav tabs on the dashboard

- disable counters progress bars (minor performance improvement)

## Installation

- Add the gem to Gemfile (**after** rails_admin gem): `gem 'rails_admin_mydash'`

- Execute `bundle`

## Admin notices

- Create and apply a migration:

`rails g migration CreateAdminNotices message:string published:boolean`

- Create a model AdminNotice

- Enable the option in rails_admin config:

```ruby
# In config.actions block:
dashboard do
  admin_notices 'AdminNotice'
end
```

- Add some messages: `AdminNotice.new( message: 'Just a test', published: true ).save`

## Options

- *admin_notices* [String]: model to use to show admin messages

- *last_records* [Integer]: number of records to show per model

- *models* [String array]: list of models to show (es. `['Category', 'Post', 'Tag']`)

## Notes

- For each record to show a *name* field or method is used

## Preview

![preview](preview.jpg)

## Contributors

- [Mattia Roccoberton](http://blocknot.es) - creator, maintainer
