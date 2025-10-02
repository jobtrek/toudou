# 1. Try to create a todo with a missing required field ('title')
POST http://localhost:3000/todos
Content-Type: application/json
{
    "content": "This should fail"
}
HTTP 400

# 2. Try to get a non-existent todo (PostgREST returns 200 with an empty array)
GET http://localhost:3000/todos?id=eq.999999
HTTP 200
[Asserts]
jsonpath "$" count == 0

# 3. Try to create an association with a non-existent todo_id (foreign key violation)
POST http://localhost:3000/categories_todos
Content-Type: application/json
{
    "todo_id": 999999,
    "category_id": 1
}
HTTP 409
[Asserts]
# Asserts the error message is related to a foreign key constraint
body contains "violates foreign key constraint"
