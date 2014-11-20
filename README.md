# Coveralls::Cobertura
[![Build Status](https://travis-ci.org/scotdalton/coveralls-cobertura.svg)](https://travis-ci.org/scotdalton/coveralls-cobertura)

Convert [Cobertura](https://github.com/cobertura/cobertura) XML to
[Coveralls](https://coveralls.io/) source files payload.


## Installation
If you're using `bundler`, place the following in your Gemfile:
```ruby
gem 'coveralls-cobertura', '~> 1.0.0'
```
Otherwise, just install the gem:
```shell
gem install coveralls-cobertura
```

## Usage
```ruby
# Leverage the coveralls gem
require 'coveralls'
# Include this gem
require 'coveralls-cobertura'
# Coveralls endpoint that we want to send coverage data to
JOBS_ENDPOINT = 'jobs'
# Assumes you already have a payload
existing_source_files = payload[:source_files]
# Cobertura XML file
filename = 'path/to/cobertura.xml'
# Create a Converter instance
converter = Coveralls::Cobertura::Converter.new(filename)
# Convert to Coveralls
cobertura_source_files = converter.convert
# Merge in the Cobertura generated source files
payload[:source_files] = existing_source_files.merge(cobertura_source_files)
Coveralls::API.post_json(JOBS_ENDPOINT, payload)
```
