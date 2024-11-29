package app.rbac

default allow = false

# Account Owner
allow {
    #input.account_id == data.banking.accounts[_].account_id
    input.user_id == data.banking.accounts[_].user_id
}

allow {
    input.user_id == "u1"
}