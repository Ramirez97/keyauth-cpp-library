include(FetchContent)
FetchContent_Declare(
    http_request
    GIT_REPOSITORY https://github.com/elnormous/HTTPRequest.git
    GIT_PROGRESS TRUE
) 
message("http_request")
FetchContent_MakeAvailable(http_request)