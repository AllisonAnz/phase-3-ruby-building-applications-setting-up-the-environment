# Setting up an Application Environment
# Recognize common Ruby application conventions
# Understand how to set up a bin file to run a Ruby application
# Understand how to set up an environment file to load things when a Ruby application starts

# So far we have been using ruby followed by a relative path to a Ruby file
# But in more complex apps, which file should be run to ensure all necessary files are required?
# There are two common conventions 
# Using a "run" file and setting up the environment in environement.rn 

# Using a Run File 
# Running an app is its own process and deserves its own file 
# That way we have a single place to start the application eery time 

# A run file has already been created in this example bin/run 
#!/usr/bin/env ruby

require_relative '../lib/garden'
require_relative '../lib/plant'

lawn = Garden.new(name: 'Front Lawn')

basil = Plant.new(name: 'Basil')
basil.garden = lawn

cucumber = Plant.new(name: 'Cucumber')
cucumber.garden = lawn

p lawn.plants 

# With the run file set up, we can run ruby bin/run and see the run file in action. Let's step through this file briefly.