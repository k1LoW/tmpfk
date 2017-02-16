# tmpfk

Temporary foreign key add/drop tool for using ER generator for "Keyless entry (SQL Antipatterns)" schema.

## Installation

Install it yourself as:

```sh
$ gem install tmpfk
```

## Usage

### Requirement

- "Keyless entry (SQL Antipatterns)" database.
- The Same format config.yml as [Ridgepole](https://github.com/winebarrel/ridgepole)'s config.yml.

### Add foreign keys

```sh
$ tmpfk add -c config.yml 
```

### Dop foreign keys

```sh
$ tmpfk drop -c config.yml 
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/k1LoW/tmpfk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

