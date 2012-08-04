## Mail Sandbox Web

[![Build Status](https://secure.travis-ci.org/kaize/mail_sandbox_web.png)](http://travis-ci.org/kaize/mail_sandbox_web)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/kaize/mail_sandbox_web)

Mail Sandbox Web is a fake SMTP server for development teams to test, view and share emails
sent from the development and staging environments without spamming real customers.

![home](http://puu.sh/6Ax08.png)
![mail](http://puu.sh/6AxuF.png)

## Install

#### Clone repository

``` bash
$ git clone git@github.com:kaize/mail_sandbox_web.git
```

#### Prepare DB and configs

``` bash
$ cd mail_sandbox_web
$ bundle exec rake sandbox:setup
$ bundle exec rake db:drop db:create db:migrate
```

#### Run application

``` bash
$ bundle exec rake sandbox:start
```

After it should start web server and smtp server.

#### Stop application

``` bash
$ bundle exec rake sandbox:stop
```

## Configuration

### Authorization

__config/secret_keys.yml__ содержит ключи для приложение авторизации в Facebook и Github

    facebook:
        app_id: '1234567890qwert'
        app_secret: '1234567890qwertyuidfghjcvbndfghr'
    github:
        app_id: '12345678rtyudfghvbg4'
        app_secret: '123456789rtyufghfrghcvbnfghcvbfdgdfcvdfc'

### SMTP server

__сonfig/mail_sandbox.yml__ содержит настройки smtp сервера

    http_observe?: true
    http_observe_url: 'http://localhost/api/mail_messages'
    listen: '0.0.0.0'
    log_level: debug

http_observe_url - в качестве хоста необходимо указать адрес, по которому доступен web интерфейс.

## Usage

- Создать приложение в веб интерфейсе.
- Для Rails приложений получить готовый конфиг оптравки писем по smtp и добавить его в __config/environments/staging.rb__ .
- Для других приложений настроить отправку писем по настройкам включая PLAIN авторизацию.
