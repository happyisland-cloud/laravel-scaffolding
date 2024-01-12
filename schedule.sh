#!/bin/bash
docker compose exec app sh -c "php artisan schedule:run >> /dev/null 2>&1"