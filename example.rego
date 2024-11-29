package example

default allow = false

allow {
    input.method == "GET"
    input.path == "/api/resource"
    log_count()
}

log_count() {
    count := count + 1 
}