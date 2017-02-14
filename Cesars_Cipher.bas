'Ceasars Cipher
'Solution for an idea from the app “Idea bag 2“
'
'init variables
txt$ = "" 'contains the userstring
ceasar$ = ""  'contains the (en)crypted string
crypt$ = "" 'contains the user-decision en- or decrypt
offset = 0 'contains the user-defined shift-level
alphabet$ = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " 'contains the basis-alphabet, you can add numbers or country-special letters, too
alphabet_ceasar$ = "" 'contains the alphabet after user choice for level-shifting
'
'asking the user to encrypt or to decrypt 
Do
  Input "Would you like to (E)ncrypt or to (D)ecrypt?", crypt$
loop until upper$(crypt$) = "E" or upper$(crypt$) = "D"
'
'asking the user for the shift-level
do 
  Input "Please type in the shift-level for crypting", offset
loop until offset > 1 and offset < len(alphabet$)
'
'building the shifted alphabet
alphabet_ceasar$ = mid$(alphabet$, offset) + left$(alphabet$, offset - 1)
'
'asking the user for an input
Input "Please type a word or a phrase ...", txt$
'
'algorythm to en- or decrypt each letter
for f = 1 to len(txt$)
  if upper$(crypt$) = "E" then 
    ceasar$ = ceasar$ + mid$(alphabet_ceasar$, instr(alphabet$, mid$(txt$, f , 1), 1), 1)
  elseif upper$(crypt$) = "D" then
    ceasar$ = ceasar$ + mid$(alphabet$, instr(alphabet_ceasar$, mid$(txt$, f , 1), 1), 1)
  endif
next f
'
'output the new, en- or decrypted text
print txt$ + " = " + ceasar$
