require 'pry'

@names = [
    { name: "John", number: 8010000000, email: "john@gmail.com" },
    { name: "Nate", number: 8014139540, email: "nswiftnswift@gmail.com" },
    { name: "Spencer", number: 8014530000, email: "yungpreciousspenc123catsforever@gmail.com" },
    { name: "Niko", number: 8010009999, email: "nikodyer44@gmail.com" }
]

def menu
    puts "Choose One"
    puts "1) View Contacts"
    puts "2) Create a Contact"
    puts "3) Delete a Contact"
    puts "4) Edit a Contact"
    puts "5) Exit"
end

def user_selection
    choice = gets.to_i
    case choice
    when 1
        view_contacts
    when 2
        create_contact
    when 3 
        delete_contacts
    when 4
        edit_contacts
    when 5 
        puts "Goodbye!"
        Exit
    else
        puts "Invalid Choice Try Again"
    end

    user_selection
end

def view_contacts
    @names.each_with_index do |name, index|
        puts "#{index + 1}) #{name[:name]}, #{name[:number]}, #{name[:email]}"
    end
    menu
end

def create_contact
    p "Create a Contact"
    puts "Enter a name"
    new_name = gets.to_s.strip
    puts "Enter a number"
    new_number = gets.to_i
    puts "Enter an email"
    new_email = gets.to_s.strip
    new_contact = { name: new_name, number: new_number, email: new_email }
    @names << new_contact
    menu
end



def delete_contacts 
    puts "Delete a contact"
    display_contacts
    choice = gets.to_i
    if choice > 0 && choice <= @names.length
        view_contacts
        name = @names.delete_at(choice - 1)
    end
    user_selection
end

def display_contacts
    @names.each_with_index do |name, index|
        puts "#{index + 1}) #{name[:name]}, #{name[:number]}, #{name[:email]}"
    end
end


def edit_contacts
    puts "Which contact would you like to change?"
    display_contacts
    names = @names
    choice = gets.to_i
    if choice > 0 && choice <= names.length
        rename_contact(choice)
    end  
end

def rename_contact(choice)
    new_contact = {}
    puts "New Name?"
    new_contact[:name] = gets.strip.to_sym
    puts "New Name is #{new_contact[:name]}"
    puts "New Number?"
    new_contact[:number] = gets.strip.to_sym
    puts "New Number is #{new_contact[:number]}"
    puts "New Email?"
    new_contact[:email] = gets.strip.to_sym
    puts "New Email is #{new_contact[:email]}"
    puts "Contact updated to #{new_contact}"
    @names[choice - 1] = new_contact 
    menu
end

menu
user_selection