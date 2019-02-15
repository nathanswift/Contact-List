@names = ["Doug The Head", "Frankie Four-Fingers", "Turkish", "Tommy the Tit"]

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
        create_contacts
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
        puts "#{index + 1}) #{name}"
    end
    menu
end

def create_contacts
    puts "Create a contact"
    new_contact = gets.to_s
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
        puts "#{index + 1}) #{name}"
    end
end

def edit_contacts
    display_contacts
    choice = gets.to_i
    if choice > 0 && choice <= @names.length
        view_contacts
        gets @names.to_s.replace( @names )
    end
end
    

menu
user_selection

