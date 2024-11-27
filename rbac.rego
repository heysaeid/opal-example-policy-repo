package app.rbac

# By default, deny requests
default allow = false

allow {
    input.action == "write"
}

allow {
    
    input.action == "read"
    input.resource == "/permissions"
}