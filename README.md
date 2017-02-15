# tmpfk

Temporary foreign key setting tool for using ER generator for "Keyless entry (SQL Antipatterns)" schema.

## Installation

install it yourself as:

```sh
$ gem install specific_install
$ gem specific_install https://github.com/k1LoW/tmpfk.git 
```

## Usage

Use the same config.yml as [Ridgepole](https://github.com/winebarrel/ridgepole) config.yml.

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

