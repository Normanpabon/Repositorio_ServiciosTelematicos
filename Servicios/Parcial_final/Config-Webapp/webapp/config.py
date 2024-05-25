class Config:
    #MYSQL_HOST = '192.168.2.160'
    MYSQL_HOST = '127.0.0.1'
    MYSQL_USER = 'flaskAdmin'
    MYSQL_PASSWORD = '1234567'
    MYSQL_DB = 'myflaskapp'
    SQLALCHEMY_DATABASE_URI = f'mysql://{MYSQL_USER}:{MYSQL_PASSWORD}@{MYSQL_HOST}/{MYSQL_DB}'

