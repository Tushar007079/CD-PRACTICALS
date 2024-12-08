import keyword

def is_valid_identifier(identifier): 
    if keyword.iskeyword(identifier): 
        return False
    
    if not (identifier[0].isalpha() or identifier[0] == '_'): 
        return False
    
    for char in identifier[1:]: 
        if not (char.isalnum() or char == '_'): 
            return False
    
    return True

identifier = input("Enter an identifier: ") 
if is_valid_identifier(identifier): 
    print(f"'{identifier}' is a valid identifier.") 
else: 
    print(f"'{identifier}' is not a valid identifier.")
