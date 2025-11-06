#!/bin/sh

set -e

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for PostgreSQL..."
    while ! nc -z $SQL_HOST $SQL_PORT; do
        sleep 0.1
done

    echo "PostgreSQL is ready"
fi

# Run database migrations
echo "Running database migrations..."
python manage.py migrate --noinput

# Collect static files (if not already done during build)
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Create superuser if it doesn't exist
if [ "$DJANGO_SUPERUSER_USERNAME" ]
then
    echo "Creating superuser..."
    python manage.py createsuperuser \
        --noinput \
        --username $DJANGO_SUPERUSER_USERNAME \
        --email $DJANGO_SUPERUSER_EMAIL 2>/dev/null || \
    echo "Superuser already exists or could not be created."
fi

exec "$@"
