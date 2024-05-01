import sys
import logging
 
sys.path.insert(0, '/var/www/miniWebApp/webapp')
 
# Import and run the Flask app
from web.views import app as application
