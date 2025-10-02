# 1. Create a new todo and capture its ID
POST http://localhost:3000/todos
Content-Type: application/json
Prefer: return=representation
{
    "title": "Write API tests",
    "content": "Use Hurl to test the PostgREST API"
}
HTTP 201
[Asserts]
jsonpath "$[0].id" exists
jsonpath "$[0].title" == "Write API tests"
[Captures]
todoId: jsonpath "$[0].id"

# 2. Get the newly created todo by its captured ID
GET http://localhost:3000/todos?id=eq.{{todoId}}
HTTP 200
[Asserts]
jsonpath "$" count == 1
jsonpath "$[0].id" == {{todoId}}

# 3. Delete the todo to clean up
DELETE http://localhost:3000/todos?id=eq.{{todoId}}
HTTP 204
