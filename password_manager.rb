USER_EMAIL = 'email@mail.com'
USER_PASSWORD = '1234'
PASSWORD_VAULT = {}

def welcome_message
  puts 'Welcome to Password Manager'
end

def promp_user_email
  puts 'Please Sign In to continue'
  print 'Enter email: '
  gets.chomp
end

def verify_user_email(email)
  if email != USER_EMAIL
    puts 'Invalid email'
    exit
  end
end

def promp_user_password
  puts 'Enter password: '
  gets.chomp
end

def verify_user_password(password)
  if password != USER_PASSWORD
    puts 'Invalid password'
    exit
  end
end

def greet_user(user_email)
  puts "Hello, #{user_email}"
  puts 'What would you like to do?'
end

def menu_options
  puts 'Menu:'
  puts '1. Add new credentials'
  puts '2. Retrieve an existing services credentials'
  puts '3. Exit'
end

def get_user_menu_selection
  gets.chomp
end

def handle_user_selection(selection)
  case selection
  when '1'
    new_service = set_new_service_name
    set_username_for(new_service)
    set_password_for(new_service)
    credentials = retrieve_service_credentials_for(new_service)
    display_service_credentials(credentials, new_service)
  when '2'
    requested_service_name = retrieve_service_name
    credentials = retrieve_service_credentials_for(requested_service_name)
    display_service_credentials(credentials, requested_service_name)
  else
    puts 'Exiting the program, Goodbye'
    exit
  end
end

def set_new_service_name
  puts 'Enter the name of the service: '
  new_service = gets.downcase!.chomp
  PASSWORD_VAULT[new_service.to_sym] = {}
  new_service
end

def set_username_for(service)
  puts 'Please enter the username for this service: '
  new_service_username = gets.chomp
  PASSWORD_VAULT[service.to_sym][:username] = new_service_username
end

def set_password_for(service)
  puts 'Enter the password for this new service: '
  new_service_password = gets.chomp
  PASSWORD_VAULT[service.to_sym][:password] = new_service_password
end

def retrieve_service_name
  puts 'Please enter the name of the service you wish to access credentials for: '
  gets.chomp
end

def retrieve_service_credentials_for(service)
  PASSWORD_VAULT[service.to_sym]
end

def display_service_credentials(credentials, service)
  puts "Here are the credentials for #{service}:"
  credentials.each do |key, val|
    puts "#{key}: #{val}"
  end
end

welcome_message
user_email = promp_user_email
verify_user_email(user_email)
password = promp_user_password
verify_user_password(password)
greet_user(user_email)

loop do
  menu_options
  selection = get_user_menu_selection
  handle_user_selection(selection)
end
