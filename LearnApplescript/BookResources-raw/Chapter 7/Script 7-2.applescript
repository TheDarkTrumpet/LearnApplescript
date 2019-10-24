set the_email_address to "info@store.apple.com"
set the_offset to offset of "@" in the_email_address
set the_domain to text (the_offset + 1) thru -1 of the_email_address


