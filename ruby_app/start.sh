#!/bin/bash

sleep 30
rails db:migrate
rails db:create
rails db:seed
rails server -p 3000 -b 0.0.0.0
