UPDATED:

Made the following changes based on instructor feedback:
-renamed split_message_backward, split_message, shift_message_backward and
shift_message so that the names are more descriptive of what the method
is doing.
-fixed indentation in shift_letters_backwards
-removed instance variable @hash from Enigma class and replaced it with a
local variable
-fixed tests for encrypting and decrypting that were hard coded to yesterday's
date
-found a better method than a case statement for the fill_in_zeroes method
-changed the Offset last_four from an instance variable to a local one
-deleted the shift_test class, since there was no longer a Shift class

Functionality: 3
Both encrypt and decrypt methods are implemented, tested and passing the tests.
The command line interface is working for encrypt and decrypt.

OOP: 3
Project has 5 classes and one module.  Enigma class is responsible for encrypt
and decrypt methods. Encryption and Decryption classes perform the actual work
of converting the message to encrypted/decrypted format.  Shift module used for
functionality shared between Encryption and Decryption classes.  Offset class
calculates offset; Key class calculates key values.  All classes are under 100
lines.  Only one method is over 7 lines long.

TDD: 3 Tests are written for all methods.  Coverage shows 100% coverage.

Version Control: 3
100 commits and 11 pull requests.
