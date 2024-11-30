package payment

default confirm_payment_allow = false

confirm_payment_allow {
    input.method == "POST"
    input.endpoint == "confirm_payment"
    not data.users[input.user]
    data.clients[input.client].actions[_] == "confirm_payment"
}

default cancel_payment_allow = false

cancel_payment_allow {
    input.method == "POST"
    input.endpoint == "cancel_payment"
    not data.users[input.user]
    data.clients[input.client].actions[_] == "cancel_payment"
}