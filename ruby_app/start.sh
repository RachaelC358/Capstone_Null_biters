#!/bin/bash

sleep 25
rails db:purge
rails active_storage:install
rails db:migrate
rails db:create
rails db:seed
rails server -p 3000 -b 0.0.0.0
