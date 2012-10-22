# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Routevision::Application.initialize!

Time::DATE_FORMATS[:short] = "%I:%M %p"
