# Cronut acceptance widget

## Description

This cronut acceptance widget is embeded in sites around the world as an iFrame. It's been hugefully successful but lately many users have wanted to use their own cronuts and donuts URL instead of the default ones used in the checkbox label.

The task is to allow cronuts_url and/or donuts_url query string parameters. If either are included in the widget URL (this page), the default link it represents should be overwritten with the value supplied.

For example, if I supplied http://localhost:3000?cronuts_url=https://google.com then the cronuts link in the label below would lead to https://google.com instead of https://upload.wikimedia.org/wikipedia/commons/8/8b/April_2016_Cronut%C2%AE_2_Burnt_Vanilla_Caramel_-_photo_by_Dominique_Ansel_Bakery.jpg and the donuts link would remain unchanged from its default.

## Run

```ruby
  $ bundle
  $ bin/rails s
```

## RSpec

```ruby
  $ rspec
```

## Rubocop

```ruby
  $ rubocop app/
  $ rubocop spec/
```
