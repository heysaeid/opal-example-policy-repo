package account_service

default allow_create_account = false

allow_create_account {
    input.customer_age >= 18
    
    count(input.customer_name) > 2
    count(input.customer_name) <= 50
    
    count(input.customer_national_code) == 10
    
    input.initial_balance >= 0
    input.initial_balance <= 1000000000
    
    input.account_type == "saving" 
    or input.account_type == "checking" 
    or input.account_type == "business"
}

max_accounts_per_person = 3

allow_create_account {
    count([account | account = input.existing_accounts[_]; account.customer_national_code == input.customer_national_code]) < max_accounts_per_person
}

default allow_get_account_details = false

allow_get_account_details {
    count(input.account_id) > 0
    
    input.is_authenticated == true
}

default allow_account_for_location = false

allow_account_for_location {
    contains(["Tehran", "Isfahan", "Mashhad"], input.customer_province)
}