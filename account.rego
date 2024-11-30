package account

default allow = false

allow {
    is_role(user.id, "editor")
}

is_role(user_id, role) {
    role in data.result.users[user_id].roles
}

allow {
    user := input.user
    permission := "create_account"
    user_has_permission(user, permission)
}

allow {
    user := input.user
    permission := "view_account"
    user_has_permission(user, permission)
}

user_has_permission(user, permission) {
    user.id == data.users[user.id]
    #role_has_permission(user.role, permission)
}

role_has_permission("admin", _) {
    true
}

role_has_permission("editor", permission) {
    permission == "view_account" 
	permission == "create_account"
}

role_has_permission("viewer", "view_account") {
    true
}