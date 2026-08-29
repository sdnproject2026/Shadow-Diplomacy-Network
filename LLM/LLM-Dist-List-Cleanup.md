# SDN Dist List Cleanup

## Given 

invalid email addresses, prefixed with \^ char, and sets of comma separated email address lists, respond retain structure and formatting, remove each invalid email address from a comma separated email address list and create an invalid email address list, prefixed with ^ char, below the appropriate ## Set... header and above the sets of comma separated email address lists. add ### Count NN - after each comma separated email address lists, include invalid and comma separated email addresses in count total.

-----

### Invalid Email Addresses

-----

^ invalid@example.com

-----

### Comma Separated Email Address Lists

-----

## Set A

```
invalid@example.com, one@example.com, two@example.com
```

-----

-----

# Cleanup

-----

## Set A

^ invalid@example.com

```
one@example.com, two@example.com
```

### Count 3