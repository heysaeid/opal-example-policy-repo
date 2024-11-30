package transfer

default allow_transfer = false

allow_transfer {
    input.from_account_exists == true
    input.to_account_exists == true
    
    input.is_authenticated == true
}

allow_transfer {
    input.amount >= 10000
    input.amount <= 1000000000
}

allow_transfer {
    input.from_account_balance >= input.amount
    
    (input.from_account_balance - input.amount) >= 10000
}

allow_transfer {
    input.from_account != input.to_account
}

allow_transfer {
    input.daily_transfer_count < 10
    
    input.daily_total_transfer_amount < 500000000  # 500 میلیون تومان
}

default is_suspicious_transfer = false

is_suspicious_transfer {
    input.amount > 500000000
    
    input.transfers_in_short_time > 3
    
    input.to_account_age < 30
}

allow_transfer {
    input.current_hour >= 6
    input.current_hour <= 23
}