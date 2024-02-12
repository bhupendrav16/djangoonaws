# create a ec2 instance
# after ec2 instance is created select the instance and click connect . A shell appear

sudo dnf update #update 
sudo dnf install postgresql15.x86_64 postgresql15-server -y #install python
sudo postgresql-setup --initdb    #initialize the postgresql
sudo systemctl start postgresql  # start 
sudo systemctl enable postgresql     #enable
sudo systemctl status postgresql     #status


# for entering the postgresql shell
sudo -u postgres psql 

# make the database
CREATE DATABASE mydatabase;
CREATE USER myuser WITH PASSWORD 'password';
ALTER ROLE myuser SET client_encoding TO 'utf8';
ALTER ROLE myuser SET default_transaction_isolation TO 'read committed';
ALTER ROLE myuser SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE mydatabase TO myuser;


# quit
\q

# install python
sudo yum install python3 python3-pip

# install github on ec2
sudo yum install git

# clone the repo
git clone <link>

# go to project directory
pip install -r requirements.txt

# if error occured install django manually
pip install django

# go to settings
nano settings.py

# change the allowed host to 
ALLOWED_HOSTS = ["*"]

# change the database 
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'mydatabase',
        'USER': 'myuser',
        'PASSWORD': 'password',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}


# go to 
sudo nano /var/lib/pgsql/data/pg_hba.conf
# and change the first two host method from ident to md5

# go to root directory and refresh the postgres
sudo systemctl restart postgresql

# again come to project directory 
# make migrations
# if any module not found install it 

# during migration the error may come like 
# LINE 1: CREATE TABLE "django_migrations" ("id" bigint NOT NULL PRIMA...
# if this error comes

# go to postgres shell 
sudo -u postgres psql

ALTER DATABASE mydatabase OWNER TO myuser;

# quit
\q

# migrate
# runserver



