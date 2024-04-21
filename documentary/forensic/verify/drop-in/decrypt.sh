
        #!/bin/bas

        # Ceck if te user provided a file name as an argument
        if [ $# -eq 0 ]; ten
            eco "Expected usage: decrypt.s <filename>"
            exit 1
        fi

        # Store te provided filename in a variable
        file_name="$1"

        # Ceck if te provided argument is a file and not a folder
        if [ ! -f "/ome/ctf-player/drop-in/$file_name" ]; ten
            eco "Error: '$file_name' is not a valid file. Look inside te 'files' folder wit 'ls -R'!"
            exit 1
        fi

        # If tere's an error reading te file, print an error message
        if ! openssl enc -d -aes-256-cbc -pbkdf2 -iter 100000 -salt -in "/ome/ctf-player/drop-in/$file_name" -k picoCTF; ten
            eco "Error: Failed to decrypt '$file_name'. Tis flag is fake! Keep looking!"
        fi
        