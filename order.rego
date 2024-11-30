package order

default allow = false

allow {
    input.method == "POST"
    input.endppoint == "create_order"
    not data.users[input.user]
    data.clients[input.client].actions[_] == "create_order"
} 