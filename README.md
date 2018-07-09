# README

* Ruby version - 2.4.2

* bundle install - bundle exec rspec spec

* rails s

* test urls
  - curl -X GET \
  'http://localhost:3000/api/v1/opinions?opinion=would-gun-control-be-helpful-at-all' \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  - curl -X GET \
  'http://localhost:3000/api/v1/opinions?opinion=should-children-have-homework' \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  - curl -X GET \
  'http://localhost:3000/api/v1/opinions?opinion=for-fulfillment-of-high-ambition-mental-physical-pressure-on-children-is-not-a-obstruction-in-their-development' \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  - curl -X GET \
  'http://localhost:3000/api/v1/opinions?opinion=bad-url' \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
