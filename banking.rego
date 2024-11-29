package app.banking

count := 0
default allow = false

allow {
    count := count + 1
    input.user_id == data.banking.accounts[_].user_id
    data.banking.accounts[_].balance > 0
}

query_count[count]