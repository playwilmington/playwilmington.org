# Playwilmington.org

This is the repo for the Children's Museum of Wilmington.

## Status

- Production [![CircleCI](https://circleci.com/gh/playwilmington/playwilmington.org/tree/master.svg?style=svg)](https://circleci.com/gh/playwilmington/playwilmington.org/tree/master)
- Staging [![CircleCI](https://circleci.com/gh/playwilmington/playwilmington.org/tree/development.svg?style=svg)](https://circleci.com/gh/playwilmington/playwilmington.org/tree/development)

## Getting Started

To get started with development on this site you will need to follow the below steps.

### Prerequisites

Install these softwares on your machine, (Mac-OSX) used below for commands

Install [PostgresApp](https://postgresapp.com/) to use as your database.

Install X-Code
```bash
$ xcode-select --install
```

Install Homebrew
```bash
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install Git
```bash
$ brew install git
```

Install Ruby using RVM
```bash
$ curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
```

Update Ruby version to 2.4.0
```bash
$ rvm install 2.4.0
$ rvm use 2.4.0 --default
```

Install Image Magic
```bash
$ brew install imagemagick
```

### Installing

Setting up the Repo

Change to whatever folder you want to store everything in.

Clone Git Repo
```bash
$ git clone https://github.com/playwilmington/playwilmington.org.git && cd playwilmington.org
```

Install Gems
```bash
$ bundle install
```

Setup Databases
```bash
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

Start Server
```bash
$ rails s
```

Navigate to localhost:3000 to begin using.

## Running the tests

Below are commands to run tests and then linters all should be done before each commit to ensure successful deployments.

### Run Tests

We use Minitest for all Rails Test Coverage

```bash
$ rails test
```

### Run Linters

Rubocop - Checks ruby on rails .rb files

```bash
$ rubocop -D
```

Haml Linter - Check all Views .haml files

```bash
$ rake haml_lint
```

SCSS Linter - Checks all Stylesheets .scss files
```bash
$ rake scss_lint
```
*Note:* This creates a new file in project repo

YAML Linter - Checks all Yaml .yml files

```bash
$ rake yaml_lint
```

## Deployment

Deployments are all automated to Heroku from CircleCi. We have staging and production sites.

Development branch goes to Staging while master branch goes to Production Site.

## Built With

* [Ruby on Rails](http://rubyonrails.org/) - Ruby on Rails for Site Framework
* [Materialize](http://materializecss.com/) - CSS/JS Framework

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/playwilmington/playwilmington.org/tags).

## Authors

* **Christopher Pezza** - *Initial work* - [TechguruPezza](https://github.com/techgurupezza)

See also the list of [contributors](https://github.com/playwilmington/playwilmington.org/graphs/contributors) who participated in this project.
