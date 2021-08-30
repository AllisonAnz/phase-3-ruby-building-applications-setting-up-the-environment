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

# The Shebank Line 
# The very first line of bin/run can be broadly ignored for our purpose 
# The shebang is used to nidicate what interpreter whould be used to read the code in this file 
# On unix with proper configs, this file can run without having to write ruby before it in the command line 

# Notice that the file doesn't have the .rb extention. 
# This file is desined to be an executable and the lack of file extension indicates this 
# Some funner files will still have the .rb extention 

# Using an Environment File 
# When we run our app, we load the two files in lib, if we wanted to add a third class in a new file 
# once created we'd have to add a third require_relative 

# WIth more complex apps, there may be multiple places where we need to laod the same application 
# For example, if we added tests to this application, 
# we would load files like lib/garden.rb and lib/plant.rb into our test files

# This means we would need a second set of require_relative statemtns somewhere in the tests. 

# The common sulution to this is to create one file that has all the require_relative statemtns 
# Then in the run file, we just require THAT file. 
# If we added more classses, we only need to modify a single file and any place in 
#our application requiring that file will automatically receive the updates 

# In Ruby framwork like Rails, this file is called envirionment.rb 
# and is located in the config foler. 
