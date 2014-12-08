# Ruboty::HelpQuery

An Ruboty Handler + Actions to show all help commands that match &lt;query&gt;.

[Ruboty](https://github.com/r7kamura/ruboty) is Chat bot framework. Ruby + Bot = Ruboty

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-help_query'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruboty-help_query


## Commands

|Command|Pattern|Description|
|:--|:--|:--|
|help|/help *(?&lt;query&gt;.*)\z/|Show all help commands that match &lt;query&gt;.|

## Usage
### help
* Show all help commands that match &lt;query&gt;.

~~~
>ruboty help ping
>ruboty /ping\\z/i       - Return PONG to PING
>
>ruboty help .*p.*
>ruboty /help( me)?\\z/i - Show this help message
>ruboty /ping\\z/i       - Return PONG to PING
~~~

## ENV

|Name|Description|
|:--|:--|
|--|--|

## Dependency

|Name|Description|
|:--|:--|
|--|--|

## Contributing

1. Fork it ( https://github.com/tbpgr/ruboty-help_query/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
