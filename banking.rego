package banking

default allow = false

allow {
    input.user_id == data.banking.accounts[_].user_id
    data.banking.accounts[_].balance > 0
}