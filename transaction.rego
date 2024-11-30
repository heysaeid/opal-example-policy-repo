package transaction_service

default allow_transaction = false

allow_transaction {
    input.account_exists == true
    
    input.is_authenticated == true
}

allow_transaction {
    input.amount > 1000
    input.amount <= 500000000
}

allow_deposit {
    contains(["saving", "checking", "business"], input.account_type)
    
    input.daily_deposit_count < 10
}

allow_withdraw {
    input.balance >= input.amount
    
    contains(["saving", "checking"], input.account_type)
    
    input.daily_withdraw_count < 5
    
    (input.balance - input.amount) >= 10000
}

allow_transaction {
    input.current_hour >= 8
    input.current_hour <= 22
}

default is_suspicious_transaction = false

is_suspicious_transaction {
    input.amount > 100000000
    
    input.transactions_in_short_time > 5
}