
#!/bin/bash

# This below 4 lines will check that  figlet a options which is used basically for banner is there or not if it's there then it will tell you to install it
# but majorly it will be there. so As psychomong I suggest you to install to use this script or by nano pass.sh you can remove this lines till when i gave 
#options for GENERATE PASSWORD FUNCTION , THIS IS NOT AI GENERATED TEXT so please avoid my grammer mistakes


# Check if figlet is installed

# Figlet is for banner please use this code with sudo bash only not to do execute command.

# Check if figlet is installed
if ! command -v figlet &> /dev/null; then
  echo "Figlet is not installed. Please install it to use this script."
  exit 1
fi

# Create the "Psychomong" banner
figlet "Psychomong"


#  FOR creating
# Now the main part of our bash script which is how to generate the password so as in all language we use the function, in this also we have the function
#for the same  so This function says that The length of the local password is denoted by $1 and Including special symbole in options $2
# SO LET'S BEGIN PSYCHOMONG PEOPLE

generate_password() {
  local password_length="$1"
  local include_special_chars="$2"

  # Whatever the characters to use in the password should be written over here. like if you want to make it personalised then you can do that over here.
  # like just change this string with the string or the words you want in your password which I will not prefer obviously
  local password_chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  if [ "$include_special_chars" = "y" ]; then
    password_chars+="!@#$%^&*()-_+=<>?|"
  fi

  # start the password variable
  local password=""

  # so Now let's generate the password
  for ((i = 0; i < password_length; i++)); do
    # Like we are using list so we will tell the script to do according to it's own mood that should work. I mean according to function
    local random_index=$((RANDOM % ${#password_chars}))

    # RANDOM LIKE LITRELLY RANDOM
    password="${password}${password_chars:$random_index:1}"
  done

  echo "$password"
}

# Ask you user for password length
read -p "#####[*]#####Enter the desired password length#####[*]#####: " password_length

#  here i add function that check that user is saying number only , if not will say write number
if ! [[ $password_length =~ ^[0-9]+$ ]]; then
  echo "Please enter a valid positive NUMBER for the password length."
  exit 1
fi

# Ask if the user wants to include special characters
read -p "Include special characters (Yes/no)? " include_special
include_special="${include_special,,}" # Convert to lowercase

# Generate the password
generated_password=$(generate_password "$password_length" "$include_special")

# Create a file with the generated password
password_file="psychomong_password.psychomong"
echo "Generated password: $generated_password" > "$password_file"

# Display a confirmation message
echo "The password has been saved to $password_file."
